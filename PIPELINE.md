# Probar el pipeline de producción

Guía para verificar que el proyecto funciona de punta a punta **sin reentrenar**: instalación, checkpoints, dataset y CLI `garimpo`.

Corrida de referencia: **`v2_bloques_tuned`** (split por bloques + normalización propia del dataset).

---

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

Mínimo para el CLI por defecto: **`resnet50_best.pt`**.

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

Desde la raíz del repo, con el entorno activado y `resnet50_best.pt` en su sitio.

### Evaluar en test (modelo de producción)

```bash
garimpo evaluate --split test
```

Salida esperada (JSON): `macro_f1` ≈ **0.794**, `model_name`: `resnet50`.

### Evaluar en val

```bash
garimpo evaluate --split val
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
| Checkpoints | Existe al menos `resnet50_best.pt` |
| Dataset | La ruta de chips responde y hay PNGs |
| `evaluate --split test` | JSON con `macro_f1` ~0.79 y sin error de archivo |
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

Si quieres regenerar checkpoints desde cero, ejecuta en orden los notebooks:

1. `06_split_bloques.ipynb`
2. `03b_normalizacion_chips.ipynb`
3. `07c_train_bloques_tuned.ipynb`
4. `08c_eval_bloques_tuned.ipynb`

Detalle en [`README.md`](README.md) y [`docs/architecture.md`](docs/architecture.md).

---

## 8. Demo en vivo (presentación)

Para que el profesor elija un chip del dataset y lo clasifiques en clase:

**Opción A — Notebook (recomendada, se ve la imagen y el resultado):**

1. Abrir `notebooks/09_demo_inferencia_vivo.ipynb` en Jupyter.
2. Kernel: el mismo venv donde hiciste `pip install -e conf/`.
3. Ejecutar celdas 1 y 3 una vez (setup).
4. En la celda **2**, cambiar `IMAGE_PATH` al PNG que elija el profesor.
5. Ejecutar celdas 3–4: muestra el chip y la predicción.

**Opción B — Terminal (más rápida, sin gráfico):**

```bash
garimpo predict-image "data/01_raw/dataset_amazonia_garimpo_binario/com_garimpo/NOMBRE.png"
```

Devuelve JSON con `label_name` y `prob_com_garimpo`.
