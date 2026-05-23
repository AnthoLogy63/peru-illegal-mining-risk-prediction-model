# Detección de Riesgo de Minería Ilegal en Perú usando IA y Datos Satelitales

Proyecto de Data Science y análisis geoespacial enfocado en identificar zonas con alto riesgo de minería ilegal en Perú mediante inteligencia artificial, datos satelitales y fuentes oficiales ambientales.

El proyecto utiliza información de deforestación, cobertura forestal, concesiones mineras, accesibilidad territorial y alertas tempranas para construir modelos predictivos de riesgo geográfico.

# Tecnologías
Actualmente el proyecto utiliza herramientas base del ecosistema de Data Science en Python.

## Base
- Python
- Jupyter Notebook
- Pandas
- NumPy
- Matplotlib

## Machine Learning
- Scikit-learn

## Geoespacial
- GeoPandas
- Rasterio

# Estructura del Proyecto

```text
mi-proyecto-ml/
│
├── README.md
├── pyproject.toml
├── .gitignore
├── conf/
├── data/
├── notebooks/
├── src/
├── reports/
└── docs/
```

La documentación detallada sobre arquitectura, estructura interna y organización del proyecto se encuentra en:

```text
docs/architecture.md
```

# Instalación

## 1. Clonar repositorio

```bash
git clone <URL_DEL_REPOSITORIO>
cd mi-proyecto-ml
```

## 2. Crear entorno virtual

### Windows

```bash
python -m venv venv
venv\Scripts\activate
```

### Linux / Mac

```bash
python3 -m venv venv
source venv/bin/activate
```

## 3. Instalar dependencias

```bash
pip install .
```

# Ejecución

## Abrir notebooks

```bash
jupyter notebook
```

## Ejecutar pipeline de features

```bash
python src/pipelines/feature_pipeline.py
```

## Ejecutar entrenamiento

```bash
python src/pipelines/training_pipeline.py
```

## Ejecutar inferencia

```bash
python src/pipelines/inference_pipeline.py
```

# Datos Utilizados

El proyecto integra datasets provenientes de:

- MINAM
- Geobosques
- INGEMMET
- SERNANP
- INEI
- Sentinel-1
- Sentinel-2
- NICFI
- Landsat

# Estado del Proyecto

🚧 En desarrollo.

# Documentación

La documentación técnica, reportes y análisis del proyecto se encuentran en:

```text
docs/
reports/
```

# Autor

- Ajra Huacso Jeans Anthony
- Paul
- Fernando
- Alexandra
- Luis

Proyecto académico y de investigación orientado a análisis geoespacial, monitoreo ambiental y Machine Learning aplicado a minería ilegal en Perú.