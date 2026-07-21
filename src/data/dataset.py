"""Dataset y DataLoaders para chips de garimpo (128×128 RGB)."""

from __future__ import annotations

from pathlib import Path

import pandas as pd
import torch
from PIL import Image
from torch.utils.data import DataLoader, Dataset
from torchvision import transforms

# Normalización ImageNet (transfer learning con timm)
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


def get_transforms(split: str) -> transforms.Compose:
    """Transforms por split. Augmentation solo en train."""
    normalize = transforms.Normalize(mean=IMAGENET_MEAN, std=IMAGENET_STD)

    if split == "train":
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
    data_dir: Path,
    batch_size: int = 32,
    num_workers: int = 0,
) -> dict[str, DataLoader]:
    """
    Crea DataLoaders para train, val y test desde data/05_model_input/.

    Returns
    -------
    dict con claves 'train', 'val', 'test'
    """
    chips_dir = data_dir / "01_raw" / "dataset_amazonia_garimpo_binario"
    model_input = data_dir / "05_model_input"

    loaders: dict[str, DataLoader] = {}
    for split in ("train", "val", "test"):
        manifest_path = model_input / f"manifest_{split}.csv"
        manifest = load_manifest(manifest_path)
        dataset = GarimpoDataset(
            manifest=manifest,
            chips_dir=chips_dir,
            transform=get_transforms(split),
        )
        loaders[split] = DataLoader(
            dataset,
            batch_size=batch_size,
            shuffle=(split == "train"),
            num_workers=num_workers,
            pin_memory=torch.cuda.is_available(),
        )

    return loaders
