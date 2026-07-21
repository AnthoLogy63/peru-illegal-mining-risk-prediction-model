"""Entrenamiento de modelos de clasificación con timm."""

from __future__ import annotations

import json
import time
from pathlib import Path

import timm
import torch
import torch.nn as nn
from torch.utils.data import DataLoader
from tqdm.auto import tqdm

from src.utils.metrics import compute_metrics

IMAGE_SIZE = 128


def create_model(
    model_name: str,
    num_classes: int = 2,
    img_size: int = IMAGE_SIZE,
    pretrained: bool = True,
) -> nn.Module:
    """Crea modelo timm con soporte para input 128×128."""
    kwargs: dict = {
        "pretrained": pretrained,
        "num_classes": num_classes,
    }
    # ViT, Swin y EfficientNet aceptan img_size explícito
    if any(k in model_name for k in ("vit", "swin", "efficientnet")):
        kwargs["img_size"] = img_size

    try:
        return timm.create_model(model_name, **kwargs)
    except TypeError:
        kwargs.pop("img_size", None)
        return timm.create_model(model_name, **kwargs)


def _run_epoch(
    model: nn.Module,
    loader: DataLoader,
    criterion: nn.Module,
    device: torch.device,
    optimizer: torch.optim.Optimizer | None = None,
) -> tuple[float, dict]:
    is_train = optimizer is not None
    model.train() if is_train else model.eval()

    total_loss = 0.0
    all_preds: list[int] = []
    all_labels: list[int] = []

    context = torch.enable_grad() if is_train else torch.no_grad()
    with context:
        for images, labels in tqdm(loader, leave=False, desc="train" if is_train else "eval"):
            images = images.to(device)
            labels = labels.to(device)

            outputs = model(images)
            loss = criterion(outputs, labels)

            if is_train:
                optimizer.zero_grad()
                loss.backward()
                optimizer.step()

            total_loss += loss.item() * labels.size(0)
            preds = outputs.argmax(dim=1)
            all_preds.extend(preds.cpu().tolist())
            all_labels.extend(labels.cpu().tolist())

    avg_loss = total_loss / len(loader.dataset)
    metrics = compute_metrics(all_labels, all_preds)
    return avg_loss, metrics


def train_model(
    model_name: str,
    train_loader: DataLoader,
    val_loader: DataLoader,
    save_dir: Path,
    device: torch.device,
    max_epochs: int = 20,
    patience: int = 4,
    lr: float = 1e-4,
    img_size: int = IMAGE_SIZE,
) -> dict:
    """
    Entrena un modelo con early stopping sobre val macro F1.

    Guarda el mejor checkpoint en save_dir/{model_name}_best.pt
    y el historial en save_dir/{model_name}_history.json
    """
    save_dir = Path(save_dir)
    save_dir.mkdir(parents=True, exist_ok=True)

    model = create_model(model_name, img_size=img_size).to(device)
    criterion = nn.CrossEntropyLoss()
    optimizer = torch.optim.Adam(model.parameters(), lr=lr)

    history: dict = {"train": [], "val": []}
    best_f1 = -1.0
    best_epoch = 0
    epochs_no_improve = 0

    ckpt_path = save_dir / f"{model_name}_best.pt"
    history_path = save_dir / f"{model_name}_history.json"

    print(f"Entrenando {model_name} en {device}")
    print(f"Train: {len(train_loader.dataset):,} | Val: {len(val_loader.dataset):,}")

    for epoch in range(1, max_epochs + 1):
        t0 = time.time()
        train_loss, train_metrics = _run_epoch(
            model, train_loader, criterion, device, optimizer
        )
        val_loss, val_metrics = _run_epoch(model, val_loader, criterion, device)

        elapsed = time.time() - t0
        record = {
            "epoch": epoch,
            "loss": train_loss,
            **train_metrics,
            "time_s": round(elapsed, 1),
        }
        val_record = {
            "epoch": epoch,
            "loss": val_loss,
            **val_metrics,
        }
        history["train"].append(record)
        history["val"].append(val_record)

        print(
            f"Epoch {epoch:02d}/{max_epochs} | "
            f"train loss {train_loss:.4f} acc {train_metrics['accuracy']:.3f} | "
            f"val loss {val_loss:.4f} acc {val_metrics['accuracy']:.3f} "
            f"F1 {val_metrics['macro_f1']:.3f} "
            f"(com recall {val_metrics['recall_com_garimpo']:.3f}) | "
            f"{elapsed:.0f}s"
        )

        if val_metrics["macro_f1"] > best_f1:
            best_f1 = val_metrics["macro_f1"]
            best_epoch = epoch
            epochs_no_improve = 0
            torch.save(
                {
                    "model_name": model_name,
                    "epoch": epoch,
                    "model_state_dict": model.state_dict(),
                    "val_metrics": val_metrics,
                    "img_size": img_size,
                },
                ckpt_path,
            )
            print(f"  → Mejor modelo guardado (macro F1 = {best_f1:.4f})")
        else:
            epochs_no_improve += 1
            if epochs_no_improve >= patience:
                print(f"Early stopping en epoch {epoch} (sin mejora en {patience} epochs)")
                break

    summary = {
        "model_name": model_name,
        "best_epoch": best_epoch,
        "best_val_macro_f1": best_f1,
        "checkpoint": str(ckpt_path),
        "history": history,
    }
    with open(history_path, "w", encoding="utf-8") as f:
        json.dump(summary, f, indent=2)

    print(f"\nListo. Mejor epoch: {best_epoch} | val macro F1: {best_f1:.4f}")
    print(f"Checkpoint: {ckpt_path}")
    return summary
