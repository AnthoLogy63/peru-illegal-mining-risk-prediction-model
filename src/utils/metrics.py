"""Métricas de clasificación."""

from __future__ import annotations

import numpy as np
from sklearn.metrics import (
    accuracy_score,
    f1_score,
    precision_recall_fscore_support,
)


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
