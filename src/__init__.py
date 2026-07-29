"""Pipeline de clasificación de garimpo — modelo de producción ResNet-50 (v2_bloques_tuned)."""

from src.config import (
    DEFAULT_CHECKPOINT,
    DEFAULT_MODEL,
    DEFAULT_THRESHOLD,
    MANIFEST_DIR,
    MODELS_DIR,
    RUN_NAME,
)

__all__ = [
    "DEFAULT_CHECKPOINT",
    "DEFAULT_MODEL",
    "DEFAULT_THRESHOLD",
    "MANIFEST_DIR",
    "MODELS_DIR",
    "RUN_NAME",
]
