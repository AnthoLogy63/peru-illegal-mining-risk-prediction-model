"""Métricas de clasificación."""

from __future__ import annotations

import numpy as np
from sklearn.metrics import (
    accuracy_score,
    f1_score,
    precision_recall_fscore_support,
)


def compute_metrics_at_threshold(
    y_true: list[int] | np.ndarray,
    y_prob: list[float] | np.ndarray,
    threshold: float,
) -> dict:
    """Métricas binarias aplicando un umbral sobre P(com_garimpo)."""
    y_pred = (np.asarray(y_prob) >= threshold).astype(int)
    return compute_metrics(y_true, y_pred)


def find_optimal_threshold(
    y_true: list[int] | np.ndarray,
    y_prob: list[float] | np.ndarray,
    thresholds: np.ndarray | None = None,
) -> tuple[float, float]:
    """Umbral que maximiza macro F1 en el conjunto dado."""
    if thresholds is None:
        thresholds = np.round(np.arange(0.05, 0.96, 0.01), 2)

    best_threshold = 0.5
    best_f1 = -1.0
    for threshold in thresholds:
        f1 = compute_metrics_at_threshold(y_true, y_prob, float(threshold))["macro_f1"]
        if f1 > best_f1:
            best_f1 = f1
            best_threshold = float(threshold)

    return best_threshold, best_f1


def compute_metrics(y_true: list[int] | np.ndarray, y_pred: list[int] | np.ndarray) -> dict:
    """Calcula métricas para clasificación binaria."""
    y_true = np.asarray(y_true)
    y_pred = np.asarray(y_pred)

    precision, recall, f1, _ = precision_recall_fscore_support(
        y_true, y_pred, average=None, labels=[0, 1], zero_division=0
    )
    macro_f1 = f1_score(y_true, y_pred, average="macro", zero_division=0)

    return {
        "accuracy": float(accuracy_score(y_true, y_pred)),
        "macro_f1": float(macro_f1),
        "f1_sem_garimpo": float(f1[0]),
        "f1_com_garimpo": float(f1[1]),
        "recall_com_garimpo": float(recall[1]),
        "precision_com_garimpo": float(precision[1]),
    }
