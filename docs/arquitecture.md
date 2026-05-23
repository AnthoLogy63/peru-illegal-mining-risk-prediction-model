# Arquitectura del Proyecto

Este documento describe la estructura y organización del proyecto de detección de riesgo de minería ilegal en Perú utilizando Data Science, Machine Learning y análisis geoespacial.

# Estructura General

```text
Project/
│
├── README.md
├── pyproject.toml
├── .gitignore
│
├── conf/
│   └── config.yaml
│
├── data/
│   ├── 01_raw/
│   ├── 02_intermediate/
│   ├── 03_primary/
│   ├── 04_feature/
│   ├── 05_model_input/
│   ├── 06_models/
│   ├── 07_model_output/
│   └── 08_reporting/
│
├── notebooks/
│   ├── 01_eda.ipynb
│   ├── 02_preprocessing.ipynb
│   ├── 03_feature_engineering.ipynb
│   ├── 04_modeling.ipynb
│   └── 05_evaluation.ipynb
│
├── src/
│   ├── data/
│   ├── features/
│   ├── models/
│   ├── pipelines/
│   ├── visualization/
│   └── utils/
│
├── reports/
│   ├── figures/
│   └── final_report.md
│
└── docs/
    └── architecture.md
```

# Organización de Carpetas

## `conf/`

Contiene archivos de configuración global del proyecto.

### `config.yaml`

Archivo central para parámetros configurables como:
- rutas
- variables globales
- parámetros de modelos
- configuraciones de pipelines

# Estructura de Datos

La carpeta `data/` sigue una arquitectura por capas para mantener trazabilidad y reproducibilidad.

## `01_raw/`

Contiene datos originales descargados desde fuentes oficiales o satelitales.

Reglas:
- no modificar archivos manualmente
- mantener copia original
- usar como fuente base del pipeline

## `02_intermediate/`

Datos parcialmente procesados:
- limpieza básica
- tipado
- normalización inicial
- validaciones

## `03_primary/`

Tablas consolidadas del dominio geoespacial.

Ejemplos:
- cobertura forestal
- alertas de deforestación
- concesiones mineras
- capas geográficas

## `04_feature/`

Features generadas para Machine Learning.

Ejemplos:
- distancia a carreteras
- cercanía a ríos
- densidad de alertas
- pérdida de cobertura forestal

## `05_model_input/`

Datasets finales para entrenamiento:
- X_train
- X_test
- y_train
- y_test

## `06_models/`

Modelos serializados entrenados.

Ejemplos:
- `.pkl`
- `.joblib`

## `07_model_output/`

Predicciones generadas por los modelos.

Ejemplos:
- índices de riesgo
- probabilidades
- clasificaciones geográficas

## `08_reporting/`

Resultados finales del proyecto:
- métricas
- tablas
- reportes
- visualizaciones

# Notebooks

La carpeta `notebooks/` está orientada a exploración y experimentación.

## `01_eda.ipynb`

Análisis exploratorio inicial:
- distribución de variables
- valores faltantes
- correlaciones
- análisis geoespacial preliminar

## `02_preprocessing.ipynb`

Pruebas y validación del preprocessing.

## `03_feature_engineering.ipynb`

Exploración y generación de features.

## `04_modeling.ipynb`

Experimentación y entrenamiento de modelos.

## `05_evaluation.ipynb`

Evaluación de desempeño y análisis de resultados.

# Código Fuente

La carpeta `src/` contiene el código principal reutilizable del proyecto.

# `src/data/`

Módulos relacionados al procesamiento de datos.

## `load_data.py`

Carga datasets desde múltiples fuentes.

## `validate_data.py`

Validación de calidad y consistencia.

## `preprocess.py`

Transformaciones y limpieza.

# `src/features/`

Módulos de feature engineering.

## `build_features.py`

Construcción de variables derivadas.

## `feature_selection.py`

Selección de variables relevantes.

# `src/models/`

Lógica relacionada a Machine Learning.

## `train.py`

Entrenamiento de modelos.

## `predict.py`

Generación de predicciones.

## `evaluate.py`

Cálculo de métricas y evaluación.

## `explain.py`

Interpretabilidad y análisis del modelo.

# `src/pipelines/`

Orquestación completa del flujo ML.

## `feature_pipeline.py`

Pipeline:
```text
raw data → preprocessing → feature engineering
```

## `training_pipeline.py`

Pipeline:
```text
features → entrenamiento → evaluación → guardar modelo
```

## `inference_pipeline.py`

Pipeline:
```text
nuevos datos → predicción → exportación de resultados
```

# `src/visualization/`

Funciones para gráficos y visualizaciones.

## `plots.py`

Visualizaciones estadísticas y geoespaciales.

# `src/utils/`

Funciones auxiliares reutilizables.

## `helpers.py`

Funciones generales de apoyo.

## `metrics.py`

Funciones personalizadas para métricas.

# Reports

La carpeta `reports/` almacena resultados finales:
- gráficos
- métricas
- tablas
- reportes técnicos

# Flujo General del Proyecto

```text
Datos crudos
    ↓
Preprocesamiento
    ↓
Feature Engineering
    ↓
Model Input
    ↓
Entrenamiento
    ↓
Evaluación
    ↓
Predicción
    ↓
Reportes
```

# Filosofía del Proyecto

El proyecto sigue una separación clara entre:
- exploración (`notebooks/`)
- lógica reutilizable (`src/`)
- datos procesados (`data/`)
- resultados (`reports/`)

Esto permite:
- reproducibilidad
- escalabilidad
- organización
- trazabilidad
- automatización futura