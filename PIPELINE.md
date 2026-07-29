# Pipeline de garimpo

Corrida de referencia: **`v2_bloques_tuned`** (split por bloques + normalización propia del dataset).

---

## Ejecutar todo el pipeline (un comando)

Desde la raíz del repo, con el venv activado y el dataset en `data/01_raw/`:

```bash
python main.py
```

Orden automático:

1. **split** — notebook `06_split_bloques.ipynb` (si faltan manifiestos)
2. **normalize** — notebook `03b_normalizacion_chips.ipynb` (si falta `normalization_constants.json`)
3. **train** — entrena 4 modelos con `src/models/train.py`
4. **evaluate** — evalúa todos los `.pt` en test y guarda CSV

Opciones útiles:

```bash
python main.py --force              # rehacer todo aunque existan salidas
python main.py --step train         # solo entrenar
python main.py --skip-train         # split + norm + eval (checkpoints ya copiados)
python main.py --skip-split --skip-normalize --skip-train   # solo evaluar
```

El entrenamiento requiere **GPU** y tarda horas. Los pasos split/normalize también pueden tardar (03b recorre el train set).

---

## Probar inferencia (checkpoints ya entrenados)

Guía para verificar instalación, checkpoints copiados y CLI `garimpo` **sin reentrenar**.

## 1. Instalación

```bash
cd IA
python -m venv .venv

# Windows
.venv\Scripts\activate
# Linux / Mac
source .venv/bin/activate

pip install -e conf/
```

Comprobar que el CLI está disponible:

```bash
garimpo --help
```

---

## 2. Checkpoints

Copia los 4 modelos en:

`data/06_models/v2_bloques_tuned/`

Ver lista exacta de archivos en [`data/06_models/v2_bloques_tuned/README.md`](data/06_models/v2_bloques_tuned/README.md).

Mínimo para inferencia rápida: **`resnet50_best.pt`**. Para la comparativa completa del paper: **los 4 `.pt`**.

Comprobar que existen:

```bash
# Windows (PowerShell)
Get-ChildItem data/06_models/v2_bloques_tuned/*_best.pt

# Linux / Mac
ls data/06_models/v2_bloques_tuned/*_best.pt
```

Deberías ver 4 archivos si copiaste toda la corrida.

---

## 3. Dataset y manifiestos

El pipeline asume:

| Recurso | Ruta |
|---------|------|
| Chips PNG | `data/01_raw/dataset_amazonia_garimpo_binario/` |
| Manifiesto test | `data/05_model_input/v2_bloques/manifest_test.csv` |
| Manifiesto val | `data/05_model_input/v2_bloques/manifest_val.csv` |
| Normalización | `data/08_reporting/normalization_constants.json` |

Los manifiestos y la normalización **sí están en el repo**. Los chips PNG suelen ser locales (también gitignored).

Si falta la carpeta de chips, descarga el dataset **Amazonia Garimpo Binario** y colócalo en `data/01_raw/`.

---

## 4. Comandos de prueba

Desde la raíz del repo, con el entorno activado y **los 4 `.pt`** en su sitio.

### Evaluar los 4 modelos en test (comparativa del estudio)

```bash
garimpo evaluate-all --split test
```

Salida: JSON con las cuatro arquitecturas ordenadas por `test_macro_f1`. ResNet-50 ≈ **0.794**.

### Evaluar solo ResNet-50 (producción)

```bash
garimpo evaluate --split test
```

### Evaluar en val (los 4)

```bash
garimpo evaluate-all --split val
```

### Calibrar umbral y evaluar test

```bash
garimpo calibrate
```

### Clasificar un chip suelto

```bash
garimpo predict-image data/01_raw/dataset_amazonia_garimpo_binario/<algún_chip>.png
```

### Predecir todo el manifest de test

```bash
garimpo predict-manifest data/05_model_input/v2_bloques/manifest_test.csv -o preds_test.csv
```

### Probar otro checkpoint (opcional)

```bash
garimpo evaluate --split test --checkpoint data/06_models/v2_bloques_tuned/swin_tiny_patch4_window7_224_best.pt
```

Equivalente sin entry point: `python -m src.cli <comando>`.

---

## 5. Criterios de éxito

| Paso | OK si… |
|------|--------|
| Instalación | `garimpo --help` muestra subcomandos |
| Checkpoints | Existen los **4** `.pt` en `v2_bloques_tuned/` |
| Dataset | La ruta de chips responde y hay PNGs |
| `evaluate-all --split test` | JSON con 4 modelos, ResNet macro F1 ~0.79 |
| `predict-manifest` | Genera `preds_test.csv` con columnas de predicción |

Métricas de referencia (test, corrida final): ver `data/08_reporting/v2_bloques_tuned/test_results_summary_v2_bloques_tuned.csv`.

---

## 6. Problemas frecuentes

**`FileNotFoundError` en checkpoint**  
→ Copiar `.pt` según [`data/06_models/v2_bloques_tuned/README.md`](data/06_models/v2_bloques_tuned/README.md).

**`No se encontró la carpeta de chips`**  
→ Colocar el dataset en `data/01_raw/dataset_amazonia_garimpo_binario/`.

**`garimpo` no reconocido**  
→ Activar el venv y ejecutar `pip install -e conf/` de nuevo.

**CUDA / CPU**  
→ El CLI usa GPU si PyTorch la detecta; en CPU también funciona, más lento.

---

## 7. Reproducir entrenamiento completo (opcional)

```bash
python main.py
```

O notebook por notebook — ver [`README.md`](README.md) y [`docs/architecture.md`](docs/architecture.md).
