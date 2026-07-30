"""Rutas y defaults del pipeline (v2_bloques_tuned, comparativa de 4 arquitecturas)."""

from __future__ import annotations

from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parents[1]
DATA_DIR = PROJECT_ROOT / "data"

# Split espacial validado (06_split_bloques)
SPLIT_NAME = "v2_bloques"
MANIFEST_DIR = DATA_DIR / "05_model_input" / SPLIT_NAME

# Corrida final con normalización propia del dataset
RUN_NAME = "v2_bloques_tuned"
MODELS_DIR = DATA_DIR / "06_models" / RUN_NAME
REPORT_DIR = DATA_DIR / "08_reporting" / RUN_NAME

NORM_JSON = DATA_DIR / "08_reporting" / "normalization_constants.json"

CHIPS_DIR_CANDIDATES = (
    DATA_DIR / "01_raw" / "dataset_amazonia_garimpo_binario",
    DATA_DIR
    / "Dataset"
    / "datasets"
    / "amazonia_garimpo"
    / "dataset_amazonia_garimpo_binario",
)

# Las 4 arquitecturas del estudio (siempre entrenar / evaluar / comparar las cuatro)
TRAINING_MODELS = (
    "efficientnet_b0",
    "resnet50",
    "swin_tiny_patch4_window7_224",
    "vit_tiny_patch16_224",
)

# Mejor en test (v2_bloques_tuned) — default solo para inferencia puntual
DEFAULT_MODEL = "resnet50"
DEFAULT_CHECKPOINT = MODELS_DIR / f"{DEFAULT_MODEL}_best.pt"
DEFAULT_THRESHOLD = 0.5  # 0.54 en val no mejora test para ResNet

IMAGE_SIZE = 128
BATCH_SIZE = 32


def resolve_chips_dir(data_dir: Path | None = None) -> Path:
    """Devuelve la carpeta de chips PNG existente en disco."""
    base = data_dir or DATA_DIR
    candidates = (
        base / "01_raw" / "dataset_amazonia_garimpo_binario",
        base
        / "Dataset"
        / "datasets"
        / "amazonia_garimpo"
        / "dataset_amazonia_garimpo_binario",
    )
    for path in candidates:
        if path.exists():
            return path
    tried = "\n  ".join(str(p) for p in candidates)
    raise FileNotFoundError(f"No se encontró la carpeta de chips. Probadas:\n  {tried}")
