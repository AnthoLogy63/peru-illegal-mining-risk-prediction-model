"""Orquestación del pipeline completo (split → norm → train → eval)."""

from __future__ import annotations

import subprocess
import sys
from datetime import datetime
from pathlib import Path

import pandas as pd
import torch

from src.config import (
    DEFAULT_THRESHOLD,
    MANIFEST_DIR,
    MODELS_DIR,
    NORM_JSON,
    PROJECT_ROOT,
    REPORT_DIR,
    RUN_NAME,
    TRAINING_MODELS,
    resolve_chips_dir,
)
from src.data.dataset import create_dataloaders
from src.models.train import train_model
from src.utils.helpers import get_device, set_seed

NOTEBOOKS_DIR = PROJECT_ROOT / "notebooks"

NOTEBOOK_SPLIT = "06_split_bloques.ipynb"
NOTEBOOK_NORMALIZE = "03b_normalizacion_chips.ipynb"

BATCH_SIZE = 32
NUM_WORKERS = 0  # estable en Windows; subir a 4 en Linux si hace falta
MAX_EPOCHS = 30
PATIENCE = 7
LR_CNN = 1e-4
LR_TRANSFORMER = 3e-5
SEED = 42

MODELS = (
    {"name": "efficientnet_b0", "label": "EfficientNet-B0", "lr": LR_CNN},
    {"name": "resnet50", "label": "ResNet-50", "lr": LR_CNN},
    {"name": "swin_tiny_patch4_window7_224", "label": "Swin-T", "lr": LR_TRANSFORMER},
    {"name": "vit_tiny_patch16_224", "label": "ViT-tiny", "lr": LR_TRANSFORMER},
)
assert tuple(m["name"] for m in MODELS) == TRAINING_MODELS


def _header(title: str) -> None:
    print("\n" + "=" * 60)
    print(title)
    print("=" * 60)


def manifests_ready() -> bool:
    return all((MANIFEST_DIR / f"manifest_{s}.csv").exists() for s in ("train", "val", "test"))


def normalization_ready() -> bool:
    return NORM_JSON.exists()


def checkpoints_ready() -> bool:
    return all((MODELS_DIR / f"{name}_best.pt").exists() for name in TRAINING_MODELS)


def evaluation_ready() -> bool:
    return (REPORT_DIR / f"test_results_summary_{RUN_NAME}.csv").exists()


def execute_notebook(filename: str) -> None:
    """Ejecuta un notebook de notebooks/ (paths relativos ../data)."""
    nb_path = NOTEBOOKS_DIR / filename
    if not nb_path.exists():
        raise FileNotFoundError(f"Notebook no encontrado: {nb_path}")

    _header(f"Notebook: {filename}")
    cmd = [
        sys.executable,
        "-m",
        "jupyter",
        "nbconvert",
        "--execute",
        "--ExecutePreprocessor.timeout=-1",
        "--to",
        "notebook",
        "--output",
        f"_run_{filename}",
        str(nb_path.name),
    ]
    subprocess.run(cmd, cwd=NOTEBOOKS_DIR, check=True)
    tmp = NOTEBOOKS_DIR / f"_run_{filename}"
    if tmp.exists():
        tmp.unlink()


def run_split(*, force: bool = False) -> None:
    if manifests_ready() and not force:
        print("[skip] Split por bloques — manifiestos ya existen")
        return
    execute_notebook(NOTEBOOK_SPLIT)
    if not manifests_ready():
        raise RuntimeError("El split no generó los manifiestos esperados en 05_model_input/v2_bloques/")


def run_normalize(*, force: bool = False) -> None:
    if normalization_ready() and not force:
        print("[skip] Normalización — normalization_constants.json ya existe")
        return
    if not manifests_ready():
        raise RuntimeError("Faltan manifiestos. Ejecuta primero el paso split.")
    execute_notebook(NOTEBOOK_NORMALIZE)
    if not normalization_ready():
        raise RuntimeError("No se generó data/08_reporting/normalization_constants.json")


def run_train(*, force: bool = False) -> None:
    if not manifests_ready():
        raise RuntimeError("Faltan manifiestos (paso split).")
    if not normalization_ready():
        raise RuntimeError("Falta normalization_constants.json (paso normalize).")

    resolve_chips_dir()
    MODELS_DIR.mkdir(parents=True, exist_ok=True)
    REPORT_DIR.mkdir(parents=True, exist_ok=True)

    set_seed(SEED)
    device = get_device()
    loaders = create_dataloaders(batch_size=BATCH_SIZE, num_workers=NUM_WORKERS)

    _header(f"Entrenamiento — corrida {RUN_NAME} | device {device}")

    for i, cfg in enumerate(MODELS, start=1):
        name = cfg["name"]
        ckpt = MODELS_DIR / f"{name}_best.pt"
        if ckpt.exists() and not force:
            print(f"[skip] [{i}/{len(MODELS)}] {cfg['label']} — checkpoint existente")
            continue

        print(f"\n>>> [{i}/{len(MODELS)}] {cfg['label']} ({name})")
        train_model(
            model_name=name,
            train_loader=loaders["train"],
            val_loader=loaders["val"],
            save_dir=MODELS_DIR,
            device=device,
            max_epochs=MAX_EPOCHS,
            patience=PATIENCE,
            lr=cfg["lr"],
            norm="dataset",
        )

        if torch.cuda.is_available():
            torch.cuda.empty_cache()


def run_evaluate(*, force: bool = False) -> pd.DataFrame:
    summary_csv = REPORT_DIR / f"test_results_summary_{RUN_NAME}.csv"
    if summary_csv.exists() and not force:
        print(f"[skip] Evaluación — {summary_csv.name} ya existe")
        return pd.read_csv(summary_csv)

    from src.models.evaluate import evaluate_all_models

    device = get_device()
    REPORT_DIR.mkdir(parents=True, exist_ok=True)

    _header(f"Evaluación en test — {len(TRAINING_MODELS)} modelos")

    rows = evaluate_all_models(split="test", device=device)
    df = pd.DataFrame(rows)

    log_lines = [
        f"EVALUACIÓN EN TEST ({RUN_NAME})",
        f"Fecha: {datetime.now():%Y-%m-%d %H:%M}",
        f"Device: {device}",
        "",
    ]
    for row in rows:
        log_lines += [
            f"MODELO: {row['model']} ({row['checkpoint']})",
            f"  test macro F1: {row['test_macro_f1']:.4f}",
            f"  test accuracy: {row['test_accuracy']:.4f}",
            "",
        ]

    df.to_csv(summary_csv, index=False)
    summary_txt = REPORT_DIR / f"test_results_{RUN_NAME}.txt"
    summary_txt.write_text("\n".join(log_lines), encoding="utf-8")

    best = df.iloc[0]
    print(f"\nMejor en test: {best['model']} | macro F1 = {best['test_macro_f1']:.4f}")
    print(f"Guardado: {summary_csv}")
    return df


def run_full_pipeline(
    *,
    force: bool = False,
    skip_split: bool = False,
    skip_normalize: bool = False,
    skip_train: bool = False,
    skip_evaluate: bool = False,
) -> None:
    """Ejecuta el pipeline final v2_bloques_tuned de punta a punta."""
    _header(f"Pipeline completo — {RUN_NAME}")
    print(f"Proyecto: {PROJECT_ROOT}")

    if not skip_split:
        run_split(force=force)
    if not skip_normalize:
        run_normalize(force=force)
    if not skip_train:
        run_train(force=force)
    if not skip_evaluate:
        run_evaluate(force=force)

    print("\nPipeline finalizado.")
