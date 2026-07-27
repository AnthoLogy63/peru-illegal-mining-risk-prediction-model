# Sección 3: Fundamentos Teóricos
<!-- BibTeX keys: Mdpicom2076341712, shahComparingInceptionV32023, naushadDeepTransferLearning2021, rainioEvaluationMetricsStatistical2024, richardsonReceiverOperatingCharacteristic2024, adegunReviewDeepLearning2023 -->

## 3. Fundamentos Teóricos

### 3.1 Conceptos y Teoría

<!-- PÁRRAFO 1: Inteligencia Artificial -->
La Inteligencia Artificial (IA) es la disciplina que estudia el diseño de sistemas capaces de percibir su entorno y tomar decisiones autónomas para alcanzar objetivos predefinidos (Russell & Norvig, 2021). La IA abarca un amplio espectro de enfoques, desde sistemas basados en reglas explícitas hasta modelos que aprenden patrones directamente de los datos. El aprendizaje automático (Machine Learning, ML) es la rama de la IA que permite a un sistema mejorar su desempeño en una tarea a partir de la experiencia, sin ser explícitamente programado para cada caso (Bishop, 2006). El ML se clasifica en tres paradigmas principales: aprendizaje supervisado, no supervisado y por refuerzo.

<!-- PÁRRAFO 2: Aprendizaje Supervisado y Clasificación Binaria -->
El aprendizaje supervisado entrena un modelo con pares de datos etiquetados (entrada X, salida Y) para que aprenda una función de mapeo $f: X \to Y$ (Bishop, 2006). En la clasificación binaria, el modelo predice una de dos clases posibles: en este trabajo, presencia (1) o ausencia (0) de garimpo. La función de pérdida binaria cross-entropy cuantifica el error entre la predicción del modelo y la etiqueta real durante el entrenamiento. El modelo minimiza esta función mediante el algoritmo de descenso de gradiente estocástico (SGD) a lo largo de múltiples épocas de entrenamiento.

<!-- PÁRRAFO 3: Visión Computacional -->
La Visión Computacional es la rama de la IA que permite a los sistemas interpretar y comprender información visual proveniente del mundo real. Sus aplicaciones incluyen clasificación de imágenes, detección de objetos, segmentación semántica y reconocimiento de patrones en imágenes satelitales. El procesamiento de imágenes satelitales multiespectrales requiere técnicas específicas de Visión Computacional capaces de manejar múltiples canales de información simultáneamente (Aggarwal, 2018). La combinación de Visión Computacional con el Deep Learning ha revolucionado la capacidad de los sistemas automáticos para analizar imágenes complejas a escala.

<!-- PÁRRAFO 4: Redes Neuronales Convolucionales (CNN) -->
Las Redes Neuronales Convolucionales (CNN) son arquitecturas de aprendizaje profundo especialmente diseñadas para procesar datos con estructura de cuadrícula, como imágenes (Aggarwal, 2018). Una CNN aplica filtros convolucionales aprendibles que extraen jerarquías de características visuales: bordes y texturas en las capas superficiales, y patrones semánticos complejos en las capas más profundas. El proceso de convolución preserva las relaciones espaciales locales de la imagen, lo que lo hace ideal para imágenes satelitales donde la posición relativa de los píxeles importa. La operación de pooling reduce la dimensionalidad espacial, controlando el sobreajuste y haciendo al modelo invariante a pequeñas traslaciones.

<!-- PÁRRAFO 5: ResNet y Conexiones Residuales -->
El problema del desvanecimiento del gradiente (vanishing gradient) limita el entrenamiento de redes neuronales profundas con decenas de capas [@Mdpicom2076341712]. ResNet (Residual Network) resolvió este problema mediante conexiones de salto (skip connections) que permiten que el gradiente fluya directamente desde capas de salida hasta capas de entrada sin degradarse. Formalmente, si $H(x)$ es la función objetivo de una capa, la red aprende el residuo $F(x) = H(x) - x$, lo que simplifica matemáticamente el proceso de optimización. ResNet50, la variante de 50 capas utilizada en este trabajo, alcanza alta exactitud en tareas de clasificación de imágenes con menor costo computacional que arquitecturas anteriores más profundas.

<!-- PÁRRAFO 6: VGG16 como línea base comparativa -->
VGG16 es una arquitectura CNN desarrollada por el Visual Geometry Group de Oxford, compuesta por 16 capas con pesos aprendibles, caracterizada por su diseño uniforme de bloques de convolución con filtros 3×3 [@shahComparingInceptionV32023]. Su arquitectura simple y regular la convierte en un punto de referencia estándar para comparar el rendimiento de redes más modernas. En la comparación empírica de Inception V3, VGG16, VGG19, CNN base y ResNet50 sobre un dataset de detección de enfermedades en arroz, ResNet50 alcanzó 99.75% de exactitud y 99.50% de precisión, superando a VGG16 en todas las métricas [@shahComparingInceptionV32023]. En este trabajo, VGG16 se emplea como arquitectura de referencia para cuantificar la mejora que aporta ResNet50 con Transfer Learning.

<!-- PÁRRAFO 7: Transfer Learning -->
El Transfer Learning es un paradigma de aprendizaje automático que reutiliza pesos pre-entrenados en una tarea de origen (generalmente ImageNet, con 1.2 millones de imágenes) y los transfiere a una tarea de destino distinta mediante fine-tuning [@naushadDeepTransferLearning2021]. Esta estrategia reduce el tiempo de entrenamiento, el requerimiento de datos etiquetados y el costo computacional, siendo ideal para dominios con datos escasos como la teledetección amazónica. Naushad et al. aplicaron Transfer Learning con VGG16 y Wide Residual Networks sobre el dataset EuroSAT de imágenes Sentinel-2, alcanzando 99.17% de exactitud en clasificación de uso y cobertura del suelo [@naushadDeepTransferLearning2021]. En este trabajo, ResNet50 pre-entrenada en ImageNet es fine-tuned sobre las 111,584 imágenes del dataset Amazonia Garimpo Binario.

<!-- PÁRRAFO 8: Métricas de Evaluación -->
La evaluación del desempeño de un clasificador binario requiere un conjunto de métricas complementarias derivadas de la matriz de confusión [@rainioEvaluationMetricsStatistical2024]. La matriz de confusión organiza los resultados en cuatro categorías: Verdaderos Positivos (VP), Verdaderos Negativos (VN), Falsos Positivos (FP) y Falsos Negativos (FN). La Exactitud (Accuracy = (VP+VN)/(VP+VN+FP+FN)) mide la proporción global de predicciones correctas. La Precisión (Precision = VP/(VP+FP)) mide qué fracción de las alertas de garimpo son correctas, mientras que el Recall (Sensitivity = VP/(VP+FN)) mide qué fracción del garimpo real es detectada. Se prioriza el análisis del Recall porque mide las minas reales que se escaparon (falsos negativos), mientras que la Precision mide las falsas alarmas que traducen recursos gastados (falsos positivos). El F1-score, media armónica de precisión y recall, balancea ambas métricas en un único indicador.

<!-- PÁRRAFO 8b: Curva ROC y AUC -->
La Curva ROC (Receiver Operating Characteristic) grafica la Tasa de Verdaderos Positivos (Recall) contra la Tasa de Falsos Positivos a diferentes umbrales de decisión [@richardsonReceiverOperatingCharacteristic2024]. El Área Bajo la Curva (AUC-ROC) condensa el comportamiento del clasificador en un único escalar entre 0.5 (aleatorio) y 1.0 (perfecto). El conjunto de datos presenta una distribución perfectamente balanceada (50.22% vs 49.78%), lo que garantiza un entrenamiento sin sesgos. Se empleará la métrica AUC-ROC para evaluar la capacidad de discriminación del modelo a través de distintos umbrales de decisión $\tau \in [0, 1]$ e identificar el punto óptimo para priorizar la sensibilidad (Recall).

---

### 3.2 Herramientas y Tecnologías

<!-- PÁRRAFO HT1: Python y librerías de datos -->
Python 3.14 es el lenguaje de programación estándar para el análisis de datos científicos y el desarrollo de modelos de aprendizaje automático [@balaniukMiningTailingsDam2020]. Jupyter Notebook proporciona un entorno interactivo que facilita la exploración iterativa de datos y la documentación integrada del análisis. NumPy y Pandas se utilizan en este trabajo para la carga, inspección y preprocesamiento del archivo `manifesto_chips.csv` que contiene las 111,584 rutas de imágenes y sus etiquetas binarias. La combinación de estas herramientas conforma el ecosistema estándar para la estructuración y limpieza de matrices de datos en proyectos de ciencia de datos aplicada.

<!-- PÁRRAFO HT2: Librerías de IA y preprocesamiento -->
El preprocesamiento de imágenes satelitales, la escala de píxeles y la partición estratificada en conjuntos independientes de entrenamiento, validación y prueba se implementan con las API de Keras y Scikit-learn [@adegunReviewDeepLearning2023]. TensorFlow/Keras provee las API de alto nivel para la construcción, compilación y entrenamiento del modelo ResNet50 con Transfer Learning sobre el dataset de garimpo. Scikit-learn complementa el pipeline con herramientas para la partición estratificada, la generación de la matriz de confusión y el cálculo de la curva ROC. La portabilidad del entorno sobre Google Colab permite reproducir todos los experimentos sin dependencia de hardware local especializado.

---

### 3.3 Dataset

<!-- PÁRRAFO DS: Dataset Amazonia Garimpo Binario -->
El conjunto de datos utilizado en este trabajo es el "Dataset Amazonia Garimpo Binario", elaborado por Grupioni (2024) y disponible públicamente en la plataforma Kaggle [^1]. El dataset contiene 111,584 recortes satelitales de 128×128 píxeles en formato PNG, organizados en el archivo `manifesto_chips.csv`. La variable de entrada X corresponde a la columna `png_path`, que almacena la ruta relativa a cada imagen. La variable objetivo Y es `label_int`, donde el valor 1 indica presencia de garimpo (`com_garimpo`) y el valor 0 indica ausencia (`sem_garimpo`).

[^1]: Grupioni, L. (2024). *Dataset Amazonia Garimpo Binario*. Kaggle. https://www.kaggle.com/datasets/leogrupioni/amazonia-garimpo-binario

#### Análisis Exploratorio de Datos (EDA)

**Tabla 1. Distribución exacta de clases en el dataset**

| Clase | Etiqueta (`label_int`) | Cantidad de imágenes | Proporción |
|---|---|---|---|
| Sin garimpo (`sem_garimpo`) | 0 | 56,043 | 50.22% |
| Con garimpo (`com_garimpo`) | 1 | 55,541 | 49.78% |
| **Total** | — | **111,584** | **100.00%** |

**Tabla 2. Descripción de las columnas del archivo `manifesto_chips.csv`**

| Columna | Tipo | Rol | Descripción |
|---|---|---|---|
| `png_path` | string | Variable X (entrada) | Ruta relativa al archivo PNG de la imagen satelital |
| `label_int` | entero (0 o 1) | Variable Y (objetivo) | 0 = sin garimpo, 1 = con garimpo |
| `label_str` | string | Referencia legible | `sem_garimpo` o `com_garimpo` |

**Tabla 3. Características técnicas de las imágenes**

| Característica | Valor |
|---|---|
| Resolución por imagen | 128 × 128 píxeles |
| Formato | PNG (RGB) |
| Fuente satelital | Imágenes ópticas de la Amazonía |
| Etiquetado | Binario (garimpo / no garimpo) |
| Total de imágenes | 111,584 |

El conjunto de datos presenta una distribución perfectamente balanceada (50.22% vs 49.78%), lo que garantiza un entrenamiento sin sesgos hacia ninguna de las dos clases. Se empleará la métrica AUC-ROC para evaluar la capacidad de discriminación del modelo a través de distintos umbrales de decisión $\tau \in [0, 1]$ e identificar el punto óptimo para priorizar la sensibilidad (*Recall*).
