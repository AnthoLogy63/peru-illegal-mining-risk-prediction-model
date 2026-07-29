#!/usr/bin/env python3
"""
Punto de entrada único del pipeline de garimpo.

Ejecuta en orden: split -> normalizacion -> entrenamiento -> evaluacion.

Uso:
    python main.py                  # todo (omite pasos ya hechos)
    python main.py --force          # reejecutar todo
    python main.py --step train     # solo un paso
    python main.py --skip-train     # prep + eval (si ya hay .pt)
"""

from __future__ import annotations

import argparse
import subprocess
import sys

from src.pipeline import (
    run_evaluate,
    run_full_pipeline,
    run_normalize,
    run_split,
    run_train,
)


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Pipeline completo v2_bloques_tuned (split -> norm -> train -> eval)",
    )
    parser.add_argument(
        "--force",
        action="store_true",
        help="Reejecutar aunque ya existan salidas",
    )
    parser.add_argument(
        "--step",
        choices=("split", "normalize", "train", "evaluate"),
        help="Ejecutar solo un paso",
    )
    parser.add_argument("--skip-split", action="store_true")
    parser.add_argument("--skip-normalize", action="store_true")
    parser.add_argument("--skip-train", action="store_true")
    parser.add_argument("--skip-evaluate", action="store_true")
    return parser


def main() -> int:
    args = build_parser().parse_args()

    try:
        if args.step == "split":
            run_split(force=args.force)
        elif args.step == "normalize":
            run_normalize(force=args.force)
        elif args.step == "train":
            run_train(force=args.force)
        elif args.step == "evaluate":
            run_evaluate(force=args.force)
        else:
            run_full_pipeline(
                force=args.force,
                skip_split=args.skip_split,
                skip_normalize=args.skip_normalize,
                skip_train=args.skip_train,
                skip_evaluate=args.skip_evaluate,
            )
    except (FileNotFoundError, RuntimeError, subprocess.CalledProcessError) as exc:
        # subprocess only if step uses notebooks
        print(f"\nError: {exc}", file=sys.stderr)
        return 1

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
