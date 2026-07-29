"""CLI para evaluar, comparar los 4 modelos e inferir (v2_bloques_tuned)."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

from src.config import DEFAULT_CHECKPOINT, DEFAULT_THRESHOLD
from src.models.evaluate import (
    calibrate_threshold,
    evaluate_all_models,
    evaluate_production_model,
)
from src.models.predict import predict_image, predict_manifest
from src.utils.helpers import get_device


def _cmd_evaluate(args: argparse.Namespace) -> None:
    result = evaluate_production_model(
        split=args.split,
        checkpoint_path=args.checkpoint,
        threshold=args.threshold,
    )
    keys = (
        "model_name",
        "checkpoint",
        "threshold",
        "accuracy",
        "macro_f1",
        "precision_com_garimpo",
        "recall_com_garimpo",
    )
    summary = {k: result[k] for k in keys if k in result}
    print(json.dumps(summary, indent=2, ensure_ascii=False))


def _cmd_calibrate(args: argparse.Namespace) -> None:
    from src.data.dataset import create_loader

    device = get_device()
    val_loader = create_loader("val", batch_size=args.batch_size, shuffle=False)
    test_loader = create_loader("test", batch_size=args.batch_size, shuffle=False)
    result = calibrate_threshold(
        args.checkpoint,
        val_loader,
        test_loader=test_loader,
        device=device,
    )
    print(json.dumps(result, indent=2, ensure_ascii=False, default=str))


def _cmd_predict_image(args: argparse.Namespace) -> None:
    result = predict_image(
        args.image,
        checkpoint_path=args.checkpoint,
        threshold=args.threshold,
    )
    print(json.dumps(result, indent=2, ensure_ascii=False))


def _cmd_predict_manifest(args: argparse.Namespace) -> None:
    df = predict_manifest(
        args.manifest,
        chips_dir=args.chips_dir,
        checkpoint_path=args.checkpoint,
        threshold=args.threshold,
    )
    if args.output:
        out = Path(args.output)
        out.parent.mkdir(parents=True, exist_ok=True)
        df.to_csv(out, index=False)
        print(f"Guardado: {out} ({len(df):,} filas)")
    else:
        print(df.head())


def _cmd_evaluate_all(args: argparse.Namespace) -> None:
    results = evaluate_all_models(
        split=args.split,
        threshold=args.threshold,
    )
    print(json.dumps(results, indent=2, ensure_ascii=False))


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Garimpo — 4 arquitecturas v2_bloques_tuned (comparativa + inferencia)",
    )
    parser.add_argument(
        "--checkpoint",
        type=Path,
        default=DEFAULT_CHECKPOINT,
        help="Ruta al .pt (default: ResNet-50 v2_bloques_tuned)",
    )
    parser.add_argument(
        "--threshold",
        type=float,
        default=DEFAULT_THRESHOLD,
        help="Umbral P(com_garimpo) (default: 0.5)",
    )

    sub = parser.add_subparsers(dest="command", required=True)

    p_eval_all = sub.add_parser(
        "evaluate-all",
        help="Evaluar las 4 arquitecturas en val o test (comparativa del estudio)",
    )
    p_eval_all.add_argument("--split", choices=("val", "test"), default="test")
    p_eval_all.set_defaults(func=_cmd_evaluate_all)

    p_eval = sub.add_parser(
        "evaluate",
        help="Evaluar un checkpoint (default: ResNet-50 producción)",
    )
    p_eval.add_argument("--split", choices=("val", "test"), default="test")
    p_eval.set_defaults(func=_cmd_evaluate)

    p_cal = sub.add_parser("calibrate", help="Calibrar umbral en val y evaluar test")
    p_cal.add_argument("--batch-size", type=int, default=32)
    p_cal.set_defaults(func=_cmd_calibrate)

    p_img = sub.add_parser("predict-image", help="Clasificar un chip PNG")
    p_img.add_argument("image", type=Path)
    p_img.set_defaults(func=_cmd_predict_image)

    p_man = sub.add_parser("predict-manifest", help="Predecir un manifest CSV")
    p_man.add_argument("manifest", type=Path)
    p_man.add_argument("--chips-dir", type=Path, default=None)
    p_man.add_argument("-o", "--output", type=Path, default=None)
    p_man.set_defaults(func=_cmd_predict_manifest)

    return parser


def main() -> None:
    parser = build_parser()
    args = parser.parse_args()
    args.func(args)


if __name__ == "__main__":
    main()
