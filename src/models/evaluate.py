"""Carga de checkpoints, inferencia y evaluación en val/test."""

from __future__ import annotations

from pathlib import Path

import numpy as np
import torch
import torch.nn as nn
from torch.utils.data import DataLoader

from src.config import DEFAULT_CHECKPOINT, DEFAULT_THRESHOLD
from src.models.train import create_model
from src.utils.helpers import get_device
from src.utils.metrics import compute_metrics, compute_metrics_at_threshold, find_optimal_threshold


def load_checkpoint(
    checkpoint_path: Path | str,
    device: torch.device | None = None,
) -> tuple[nn.Module, dict]:
    """Carga modelo y metadatos desde un .pt guardado por train_model."""
    path = Path(checkpoint_path)
    device = device or get_device()

    ckpt = torch.load(path, map_location=device, weights_only=False)
    model_name = ckpt["model_name"]
    img_size = ckpt.get("img_size", 128)

    model = create_model(model_name, img_size=img_size, pretrained=False).to(device)
    model.load_state_dict(ckpt["model_state_dict"])
    model.eval()
    return model, ckpt


@torch.no_grad()
def infer_probabilities(
    model: nn.Module,
    loader: DataLoader,
    device: torch.device | None = None,
) -> tuple[np.ndarray, np.ndarray]:
    """Devuelve etiquetas reales y P(com_garimpo) para cada muestra del loader."""
    device = device or get_device()
    model.eval()

    y_true: list[int] = []
    y_prob: list[float] = []

    for images, labels in loader:
        images = images.to(device)
        probs = torch.softmax(model(images), dim=1)[:, 1]
        y_prob.extend(probs.cpu().tolist())
        y_true.extend(labels.tolist())

    return np.asarray(y_true), np.asarray(y_prob)


@torch.no_grad()
def infer_checkpoint(
    checkpoint_path: Path | str,
    loader: DataLoader,
    device: torch.device | None = None,
) -> dict:
    """Carga checkpoint e infiere probabilidades sobre un DataLoader."""
    device = device or get_device()
    model, ckpt = load_checkpoint(checkpoint_path, device=device)
    y_true, y_prob = infer_probabilities(model, loader, device=device)

    return {
        "model_name": ckpt["model_name"],
        "train_best_epoch": ckpt.get("epoch"),
        "checkpoint": str(checkpoint_path),
        "y_true": y_true,
        "y_prob": y_prob,
    }


def evaluate_at_threshold(
    y_true: np.ndarray,
    y_prob: np.ndarray,
    threshold: float = DEFAULT_THRESHOLD,
) -> dict:
    """Métricas binarias con umbral explícito."""
    return compute_metrics_at_threshold(y_true, y_prob, threshold)


def evaluate_checkpoint(
    checkpoint_path: Path | str,
    loader: DataLoader,
    threshold: float = DEFAULT_THRESHOLD,
    device: torch.device | None = None,
) -> dict:
    """Evalúa un checkpoint sobre un split (val o test)."""
    inf = infer_checkpoint(checkpoint_path, loader, device=device)
    metrics = evaluate_at_threshold(inf["y_true"], inf["y_prob"], threshold)
    return {
        **inf,
        "threshold": threshold,
        **metrics,
    }


def calibrate_threshold(
    checkpoint_path: Path | str,
    val_loader: DataLoader,
    test_loader: DataLoader | None = None,
    thresholds: np.ndarray | None = None,
    device: torch.device | None = None,
) -> dict:
    """
    Busca el umbral que maximiza macro F1 en val y opcionalmente evalúa en test.
    """
    device = device or get_device()
    val_inf = infer_checkpoint(checkpoint_path, val_loader, device=device)
    optimal_threshold, val_f1 = find_optimal_threshold(
        val_inf["y_true"], val_inf["y_prob"], thresholds=thresholds
    )

    result = {
        "model_name": val_inf["model_name"],
        "checkpoint": str(checkpoint_path),
        "optimal_threshold": optimal_threshold,
        "val_macro_f1_at_optimal": val_f1,
        "val_metrics_at_0_5": evaluate_at_threshold(
            val_inf["y_true"], val_inf["y_prob"], 0.5
        ),
        "val_metrics_at_optimal": evaluate_at_threshold(
            val_inf["y_true"], val_inf["y_prob"], optimal_threshold
        ),
    }

    if test_loader is not None:
        test_inf = infer_checkpoint(checkpoint_path, test_loader, device=device)
        result["test_metrics_at_0_5"] = evaluate_at_threshold(
            test_inf["y_true"], test_inf["y_prob"], 0.5
        )
        result["test_metrics_at_optimal"] = evaluate_at_threshold(
            test_inf["y_true"], test_inf["y_prob"], optimal_threshold
        )

    return result


def evaluate_production_model(
    split: str = "test",
    checkpoint_path: Path | str | None = None,
    threshold: float = DEFAULT_THRESHOLD,
    batch_size: int = 32,
    device: torch.device | None = None,
) -> dict:
    """Atajo: evalúa el ResNet-50 de producción sobre val o test."""
    from src.data.dataset import create_loader

    path = Path(checkpoint_path) if checkpoint_path is not None else DEFAULT_CHECKPOINT
    if not path.exists():
        raise FileNotFoundError(f"Checkpoint no encontrado: {path}")

    loader = create_loader(split, batch_size=batch_size, shuffle=False)
    return evaluate_checkpoint(path, loader, threshold=threshold, device=device)
