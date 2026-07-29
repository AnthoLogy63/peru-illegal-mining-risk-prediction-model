"""Dataset y DataLoaders para chips de garimpo (128×128 RGB)."""

from __future__ import annotations

import json
from pathlib import Path

import pandas as pd
import torch
from PIL import Image
from torch.utils.data import DataLoader, Dataset
from torchvision import transforms

from src.config import (
    DATA_DIR,
    MANIFEST_DIR,
    NORM_JSON,
    resolve_chips_dir,
)

# Normalización ImageNet (legacy / comparación v1)
IMAGENET_MEAN = (0.485, 0.456, 0.406)
IMAGENET_STD = (0.229, 0.224, 0.225)

IMAGE_SIZE = 128
LABEL_MAP = {"sem_garimpo": 0, "com_garimpo": 1}


class GarimpoDataset(Dataset):
    """Carga chips PNG desde un manifest CSV."""

    def __init__(
        self,
        manifest: pd.DataFrame,
        chips_dir: Path,
        transform: transforms.Compose | None = None,
    ) -> None:
        self.manifest = manifest.reset_index(drop=True)
        self.chips_dir = Path(chips_dir)
        self.transform = transform

    def __len__(self) -> int:
        return len(self.manifest)

    def __getitem__(self, idx: int) -> tuple[torch.Tensor, torch.Tensor]:
        row = self.manifest.iloc[idx]
        image_path = self.chips_dir / row["png_path"]

        with Image.open(image_path) as img:
            image = img.convert("RGB")

        if self.transform is not None:
            image = self.transform(image)

        label = int(row["label_int"])
        return image, torch.tensor(label, dtype=torch.long)


def load_normalization_constants(
    norm_json: Path | None = None,
) -> tuple[tuple[float, float, float], tuple[float, float, float]]:
    """Carga DATASET_MEAN/STD desde normalization_constants.json."""
    path = Path(norm_json or NORM_JSON)
    if not path.exists():
        raise FileNotFoundError(
            f"No se encontró {path}. Ejecuta 03b_normalizacion_chips.ipynb."
        )
    data = json.loads(path.read_text(encoding="utf-8"))
    mean = tuple(float(x) for x in data["DATASET_MEAN"])
    std = tuple(float(x) for x in data["DATASET_STD"])
    return mean, std


def get_transforms(
    split: str,
    *,
    norm: str = "dataset",
    mean: tuple[float, float, float] | None = None,
    std: tuple[float, float, float] | None = None,
    augment: bool = True,
) -> transforms.Compose:
    """
    Transforms por split.

    norm: ``"dataset"`` (producción, v2_bloques_tuned) o ``"imagenet"`` (legacy v1/v2).
    """
    if norm == "dataset":
        if mean is None or std is None:
            mean, std = load_normalization_constants()
    elif norm == "imagenet":
        mean = mean or IMAGENET_MEAN
        std = std or IMAGENET_STD
    else:
        raise ValueError(f"norm desconocido: {norm!r}. Usa 'dataset' o 'imagenet'.")

    normalize = transforms.Normalize(mean=mean, std=std)

    if split == "train" and augment:
        return transforms.Compose(
            [
                transforms.RandomHorizontalFlip(p=0.5),
                transforms.RandomVerticalFlip(p=0.5),
                transforms.RandomRotation(degrees=90),
                transforms.ColorJitter(
                    brightness=0.2,
                    contrast=0.2,
                    saturation=0.1,
                    hue=0.05,
                ),
                transforms.ToTensor(),
                normalize,
            ]
        )

    return transforms.Compose(
        [
            transforms.ToTensor(),
            normalize,
        ]
    )


def load_manifest(manifest_path: Path) -> pd.DataFrame:
    return pd.read_csv(manifest_path)


def create_dataloaders(
    data_dir: Path | None = None,
    batch_size: int = 32,
    num_workers: int = 0,
    *,
    manifest_dir: Path | None = None,
    chips_dir: Path | None = None,
    norm: str = "dataset",
    splits: tuple[str, ...] = ("train", "val", "test"),
) -> dict[str, DataLoader]:
    """
    Crea DataLoaders para los splits indicados.

    Por defecto usa manifiestos ``v2_bloques`` y normalización del dataset
    (corrida final v2_bloques_tuned).
    """
    base = Path(data_dir) if data_dir is not None else DATA_DIR
    manifest_root = Path(manifest_dir) if manifest_dir is not None else MANIFEST_DIR
    chips_root = Path(chips_dir) if chips_dir is not None else resolve_chips_dir(base)

    loaders: dict[str, DataLoader] = {}
    for split in splits:
        manifest_path = manifest_root / f"manifest_{split}.csv"
        manifest = load_manifest(manifest_path)
        dataset = GarimpoDataset(
            manifest=manifest,
            chips_dir=chips_root,
            transform=get_transforms(split, norm=norm),
        )
        loaders[split] = DataLoader(
            dataset,
            batch_size=batch_size,
            shuffle=(split == "train"),
            num_workers=num_workers,
            pin_memory=True,
            persistent_workers=(num_workers > 0),
        )

    return loaders


def create_loader(
    split: str,
    *,
    data_dir: Path | None = None,
    manifest_dir: Path | None = None,
    chips_dir: Path | None = None,
    batch_size: int = 32,
    num_workers: int = 0,
    norm: str = "dataset",
    shuffle: bool | None = None,
) -> DataLoader:
    """DataLoader de un solo split (eval/inferencia)."""
    base = Path(data_dir) if data_dir is not None else DATA_DIR
    manifest_root = Path(manifest_dir) if manifest_dir is not None else MANIFEST_DIR
    chips_root = Path(chips_dir) if chips_dir is not None else resolve_chips_dir(base)

    manifest = load_manifest(manifest_root / f"manifest_{split}.csv")
    dataset = GarimpoDataset(
        manifest=manifest,
        chips_dir=chips_root,
        transform=get_transforms(split, norm=norm, augment=False),
    )
    if shuffle is None:
        shuffle = split == "train"

    return DataLoader(
        dataset,
        batch_size=batch_size,
        shuffle=shuffle,
        num_workers=num_workers,
        pin_memory=True,
    )
