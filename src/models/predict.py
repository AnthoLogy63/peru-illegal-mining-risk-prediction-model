"""Inferencia sobre chips individuales o lotes (modelo de producción)."""

from __future__ import annotations

from pathlib import Path

import pandas as pd
import torch
from PIL import Image

from src.config import DEFAULT_CHECKPOINT, DEFAULT_MODEL, DEFAULT_THRESHOLD, resolve_chips_dir
from src.data.dataset import get_transforms
from src.models.evaluate import load_checkpoint
from src.utils.helpers import get_device

LABEL_NAMES = {0: "sem_garimpo", 1: "com_garimpo"}


def _preprocess_image(image_path: Path, device: torch.device) -> torch.Tensor:
    transform = get_transforms("val", norm="dataset", augment=False)
    with Image.open(image_path) as img:
        tensor = transform(img.convert("RGB"))
    return tensor.unsqueeze(0).to(device)


@torch.no_grad()
def predict_image(
    image_path: Path | str,
    checkpoint_path: Path | str | None = None,
    threshold: float = DEFAULT_THRESHOLD,
    device: torch.device | None = None,
) -> dict:
    """
    Clasifica un chip PNG.

    Returns
    -------
    dict con prob_com_garimpo, label_int, label_name, threshold
    """
    device = device or get_device()
    ckpt_path = Path(checkpoint_path) if checkpoint_path is not None else DEFAULT_CHECKPOINT
    model, ckpt = load_checkpoint(ckpt_path, device=device)

    tensor = _preprocess_image(Path(image_path), device)
    probs = torch.softmax(model(tensor), dim=1)[0]
    prob_com = float(probs[1].item())
    label_int = int(prob_com >= threshold)

    return {
        "model_name": ckpt.get("model_name", DEFAULT_MODEL),
        "checkpoint": str(ckpt_path),
        "image_path": str(image_path),
        "prob_com_garimpo": prob_com,
        "prob_sem_garimpo": float(probs[0].item()),
        "label_int": label_int,
        "label_name": LABEL_NAMES[label_int],
        "threshold": threshold,
    }


@torch.no_grad()
def predict_manifest(
    manifest_path: Path | str,
    chips_dir: Path | str | None = None,
    checkpoint_path: Path | str | None = None,
    threshold: float = DEFAULT_THRESHOLD,
    device: torch.device | None = None,
) -> pd.DataFrame:
    """
    Predice sobre todas las filas de un manifest CSV.

    Añade columnas: prob_com_garimpo, pred_label_int, pred_label_name.
    """
    device = device or get_device()
    ckpt_path = Path(checkpoint_path) if checkpoint_path is not None else DEFAULT_CHECKPOINT
    model, _ = load_checkpoint(ckpt_path, device=device)
    transform = get_transforms("val", norm="dataset", augment=False)

    manifest = pd.read_csv(manifest_path)
    chips_root = Path(chips_dir) if chips_dir is not None else resolve_chips_dir()

    probs: list[float] = []
    for png_path in manifest["png_path"]:
        image_path = chips_root / png_path
        with Image.open(image_path) as img:
            tensor = transform(img.convert("RGB")).unsqueeze(0).to(device)
        prob_com = float(torch.softmax(model(tensor), dim=1)[0, 1].item())
        probs.append(prob_com)

    out = manifest.copy()
    out["prob_com_garimpo"] = probs
    out["pred_label_int"] = (out["prob_com_garimpo"] >= threshold).astype(int)
    out["pred_label_name"] = out["pred_label_int"].map(LABEL_NAMES)
    return out


def predict_production_test(
    checkpoint_path: Path | str | None = None,
    threshold: float = DEFAULT_THRESHOLD,
    output_csv: Path | str | None = None,
) -> pd.DataFrame:
    """Atajo: predice sobre manifest_test del split v2_bloques."""
    from src.config import MANIFEST_DIR

    manifest_path = MANIFEST_DIR / "manifest_test.csv"
    df = predict_manifest(
        manifest_path,
        checkpoint_path=checkpoint_path,
        threshold=threshold,
    )
    if output_csv is not None:
        Path(output_csv).parent.mkdir(parents=True, exist_ok=True)
        df.to_csv(output_csv, index=False)
    return df
