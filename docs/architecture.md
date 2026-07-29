# Arquitectura del Proyecto

Clasificación binaria de minería ilegal (garimpo) en la Amazonía mediante Transfer Learning
con imágenes satelitales 128×128. Stack: **Python 3.10+**, **PyTorch**, **timm**, **Jupyter**.

Modelo de producción: **ResNet-50**, corrida `v2_bloques_tuned`, split espacial por bloques
(`v2_bloques`), normalización medida sobre train.

---

## Estructura general

```text
IA/
├── README.md
├── main.py                      # pipeline completo: python main.py
├── conf/pyproject.toml          # dependencias y CLI garimpo
├── .gitignore
│
├── data/
│   ├── 01_raw/                  # dataset PNG + manifesto_chips.csv
│   ├── 02_intermediate/         # splits y validación espacial (v1)
│   ├── 05_model_input/          # manifiestos train/val/test
│   │   └── v2_bloques/          # split final por bloques
│   ├── 06_models/               # checkpoints .pt (gitignored)
│   │   └── v2_bloques_tuned/    # modelo de producción
│   └── 08_reporting/            # métricas, CSV, JSON por corrida
│       ├── v2_bloques/
│       └── v2_bloques_tuned/
│
├── notebooks/                   # experimentación y pipeline reproducible
├── src/                         # código reutilizable
├── reports/figures/             # figuras exportadas
├── paper/                       # artículo IEEE (Typst)
├── docs/                        # documentación
└── plantilla/                   # plantilla LaTeX alternativa
```

---

## Capas de datos (`data/`)

| Carpeta | Contenido real | Estado |
|---------|----------------|--------|
| `01_raw/` | Chips PNG del dataset Amazonia Garimpo Binario (~111k) y `manifesto_chips.csv` | Activa |
| `02_intermediate/` | `split_summary.csv`, `manifest_with_split.csv`, mapas de split v1 | Legacy |
| `05_model_input/` | Manifiestos v1 en raíz; manifiestos **v2_bloques/** para la corrida final | Activa |
| `06_models/` | Checkpoints PyTorch (`{modelo}_best.pt`). Subcarpeta `v2_bloques_tuned/` | Gitignored |
| `08_reporting/` | Resultados por corrida: v1, tuned, scratch, **v2_bloques**, **v2_bloques_tuned**, normalización | Activa |

Las predicciones del CLI se escriben donde indique el usuario (`-o`); no hay carpeta fija de salida en `data/`.

---

## Notebooks (flujo actual)

### Preparación y diagnóstico
| Notebook | Función |
|----------|---------|
| `01_eda_dataset.ipynb` | EDA del dataset |
| `02_preprocessing.ipynb` | Preprocesamiento inicial |
| `02b_validacion_espacial.ipynb` | Validación de solapamiento espacial |
| `03_feature_engineering.ipynb` | Exploración de features |
| `03b_normalizacion_chips.ipynb` | Estadísticas de normalización → `normalization_constants.json` |

### Entrenamiento v1 (legacy, split por ráster)
| Notebook | Función |
|----------|---------|
| `04_training_models.ipynb` | 4 arquitecturas, original |
| `04c_training_models_tuned.ipynb` | 4 arquitecturas, norm ImageNet ajustada |
| `04b_training_models_scratch.ipynb` | Entrenamiento desde cero |
| `04_train_*.ipynb` | Entrenamiento individual por arquitectura |
| `05_evaluation.ipynb` | Evaluación v1 |

### Pipeline final (split por bloques)
| Notebook | Función |
|----------|---------|
| `06_split_bloques.ipynb` | Split espacial v2 → manifiestos en `05_model_input/v2_bloques/` |
| `07_train_bloques.ipynb` | Entrenamiento 4 modelos, norm ImageNet |
| `08_eval_bloques.ipynb` | Evaluación test v2 |
| `07c_train_bloques_tuned.ipynb` | Entrenamiento 4 modelos, **norm propia** |
| `08c_eval_bloques_tuned.ipynb` | Evaluación test v2 tuned (**corrida final**) |

---

## Código fuente (`src/`)

```text
src/
├── config.py              # rutas, modelo y checkpoint por defecto
├── cli.py                 # evaluate | predict-image | predict-manifest | calibrate
├── data/
│   └── dataset.py         # GarimpoDataset, transforms, dataloaders
├── models/
│   ├── train.py           # create_model, train_model (timm)
│   ├── evaluate.py        # inferencia y evaluación
│   └── predict.py         # predicción por imagen o manifest
└── utils/
    ├── helpers.py         # device, seed
    └── metrics.py         # accuracy, F1, umbral óptimo
```

### Uso rápido

Tras `pip install -e conf/`:

```bash
garimpo evaluate --split test
garimpo predict-image path/to/chip.png
garimpo predict-manifest data/05_model_input/v2_bloques/manifest_test.csv -o preds.csv
garimpo calibrate
```

Equivalente sin entry point:

```bash
python -m src.cli evaluate --split test
```

Requiere `data/06_models/v2_bloques_tuned/resnet50_best.pt` en disco.

---

## Reportes

| Carpeta | Contenido |
|---------|-----------|
| `reports/figures/` | Curvas, matrices de confusión, mapas de split (~53 PNG) |

---

## Flujo del pipeline final

```text
python main.py
    │
    ├─ split      → 06_split_bloques.ipynb → 05_model_input/v2_bloques/
    ├─ normalize  → 03b → 08_reporting/normalization_constants.json
    ├─ train      → src/models/train.py → 06_models/v2_bloques_tuned/
    └─ evaluate   → src/models/evaluate.py → 08_reporting/v2_bloques_tuned/

Inferencia: garimpo evaluate | predict-image | ...
```

---

## Corridas y modelo ganador

| Corrida | Split | Normalización | Mejor test F1 |
|---------|-------|---------------|---------------|
| v1 | Por ráster | ImageNet | ~0.81 (test desbalanceado) |
| v2_bloques | Por bloques | ImageNet | 0.7897 (Swin-T) |
| **v2_bloques_tuned** | Por bloques | **Dataset propia** | **0.7938 (ResNet-50)** |

---

## Filosofía

- **Notebooks**: exploración, entrenamiento y evaluación reproducible por corrida.
- **`src/`**: lógica reutilizable para inferencia y entrenamiento futuro.
- **`data/`**: trazabilidad por capas; cada corrida tiene subcarpeta en `08_reporting/`.
- **`reports/`**: figuras exportadas desde notebooks y evaluaciones.
