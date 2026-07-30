# Clasificación de minería ilegal (garimpo) en la Amazonía

Proyecto de clasificación binaria de imágenes satelitales para detectar minería aluvial ilegal (*garimpo*) en la cuenca amazónica. Entrena y **compara cuatro CNNs** (ResNet-50, EfficientNet-B0, Swin-T, ViT-tiny) con Transfer Learning sobre el dataset **Amazonia Garimpo Binario** (chips 128×128 RGB). El análisis experimental es siempre sobre **las cuatro arquitecturas**; ResNet-50 es además el **modelo de producción** (mejor macro F1 en test de la corrida final).

**Corrida final:** `v2_bloques_tuned` — test macro F1 ResNet-50 ≈ **0.794** (tabla completa de los 4 modelos abajo).

Documentación de arquitectura: [`docs/architecture.md`](docs/architecture.md). Historial del modelado para el paper: [`HISTORIAL.md`](HISTORIAL.md).

---

## Stack

| Área | Herramientas |
|------|--------------|
| Deep Learning | PyTorch, torchvision, timm |
| Datos | Pandas, NumPy, Pillow |
| Métricas | scikit-learn |
| Notebooks | Jupyter |
| Visualización | Matplotlib, Seaborn |
| Geoespacial (EDA) | GeoPandas, OpenCV |

---

## Estructura

```text
IA/
├── main.py                   # pipeline completo: python main.py
├── conf/pyproject.toml       # dependencias
├── data/
│   ├── 01_raw/               # chips PNG + manifesto
│   ├── 05_model_input/v2_bloques/   # manifiestos del split final
│   ├── 06_models/v2_bloques_tuned/  # checkpoints .pt (gitignored)
│   └── 08_reporting/         # métricas por corrida
├── notebooks/                # pipeline reproducible
├── src/                      # dataset, train, eval, predict, CLI
├── reports/figures/          # figuras exportadas
├── paper/                    # artículo (Typst)
└── docs/
```

---

## Instalación

```bash
git clone <URL_DEL_REPOSITORIO>
cd IA

python -m venv .venv
# Windows
.venv\Scripts\activate
# Linux / Mac
source .venv/bin/activate

pip install -e conf/
```

Requiere Python ≥ 3.10. Para entrenamiento con GPU, instalar PyTorch con soporte CUDA según [pytorch.org](https://pytorch.org).

---

## Pipeline final (reproducir resultados)

**Un solo comando** (desde la raíz, con venv activado):

```bash
python main.py
```

Ejecuta en orden: split por bloques → normalización → entrenamiento (4 modelos) → evaluación en test.  
Omite pasos cuyas salidas ya existen. Para forzar todo de nuevo: `python main.py --force`.

Pasos individuales: `python main.py --step split|normalize|train|evaluate`

Equivalente manual con notebooks:

| Paso | Notebook | Salida |
|------|----------|--------|
| 1 | `06_split_bloques.ipynb` | Manifiestos en `data/05_model_input/v2_bloques/` |
| 2 | `03b_normalizacion_chips.ipynb` | `data/08_reporting/normalization_constants.json` |
| 3 | `07c_train_bloques_tuned.ipynb` | Checkpoints en `data/06_models/v2_bloques_tuned/` |
| 4 | `08c_eval_bloques_tuned.ipynb` | Métricas test en `data/08_reporting/v2_bloques_tuned/` |

Los notebooks `07`/`08` (norm ImageNet) y `04_*`/`05_*` (split v1) se conservan como referencia histórica.

---

## Inferencia y prueba del pipeline

Los checkpoints `.pt` no están en git. Copia **los 4 modelos** en `data/06_models/v2_bloques_tuned/` — ver [`data/06_models/v2_bloques_tuned/README.md`](data/06_models/v2_bloques_tuned/README.md).

Guía paso a paso: [`PIPELINE.md`](PIPELINE.md). Demo en vivo con los 4 modelos sobre una imagen: `notebooks/09_demo_inferencia_vivo.ipynb`.

**CLI** — comparativa de las 4 arquitecturas vs. un solo modelo:

```bash
garimpo evaluate-all --split test    # los 4 modelos (análisis principal)
garimpo evaluate --split test        # solo ResNet-50 (producción)
garimpo predict-image ruta/al/chip.png
garimpo predict-manifest data/05_model_input/v2_bloques/manifest_test.csv -o preds.csv
garimpo calibrate
```

Equivalente: `python -m src.cli <comando>` (p. ej. `python -m src.cli evaluate-all --split test`).

---

## Dataset

- **Amazonia Garimpo Binario** — ~111,584 chips 128×128, clases `com_garimpo` / `sem_garimpo`
- Ubicación local: `data/01_raw/dataset_amazonia_garimpo_binario/`
- Split final: espacial por bloques (~50/50 en train, val y test)

---

## Resultados clave (v2_bloques_tuned, test)

| Modelo | Test macro F1 |
|--------|---------------|
| **ResNet-50** | **0.7938** |
| ViT-tiny | 0.7750 |
| EfficientNet-B0 | 0.7666 |
| Swin-T | 0.7667 |

Detalle en `data/08_reporting/v2_bloques_tuned/test_results_summary_v2_bloques_tuned.csv`.

---

## Autores

- Jeans Anthony Ajra Huacso
- Paul Andree Cari Lipe
- Fernando Miguel Garambel Marín
- Luis Guillermo Luque Condori
- Alexandra Raquel Quispe Arratea

Proyecto académico — Universidad Nacional de San Agustín (UNSA).
