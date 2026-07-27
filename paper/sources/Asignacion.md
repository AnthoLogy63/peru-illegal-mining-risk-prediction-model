# DOCUMENTO MAESTRO DE ASIGNACIÓN Y ESPECIFICACIONES DE REDACCIÓN (TIF)
**Archivo:** `sources/Asignacion.md`
**Objetivo:** Este documento dicta la rúbrica rígida consolidada a partir de las exigencias del Dr. Yasiel Pérez Vera para el Trabajo Integrador Final (TIF). Especifica la estructura de las 8 secciones, las reglas de redacción estrófica y la gestión de referencias.

---

## 📌 1. REGLAS GENERALES Y ESTILO DE REDACCIÓN
- **Formato y Extensión:** Formato de artículo científico IEEE a dos columnas. La extensión total debe ser estrictamente de **15 a 18 páginas**.
- **Tono de Redacción:** Oraciones enunciativas y cortas. Queda estrictamente prohibido el uso de expresiones de duda o condicionales (ej. "podría", "quizás", "se sugiere que"). Afirmar con seguridad empírica.
- **Exigencia Bibliográfica:**
  - Total de referencias: Entre **40 a 60 referencias** en total.
  - Antigüedad: **Últimos 5 años** (2021-2026).
  - Indexación e Identificador: Provenientes de revistas/conferencias indexadas en **Scopus** y con **DOI** obligatorio.
  - Gestión: Zotero o Mendeley exportado en formato `.bib` (BibTeX) en `sources/references.bib`.

---

## 📌 2. ESTRUCTURA SECCIÓN POR SECCIÓN

### METADATOS INICIALES
- **Título:** Breve, formal, de no más de 15 a 20 palabras.
- **Autores:** Nombres, afiliación (UNSA) y correos institucionales.
- **Resumen (Abstract):** Entre 200 y 250 palabras (bilingüe español/inglés).
- **Palabras Clave (Keywords):** Entre 1 y 5 términos controlados.

---

### SECCIÓN 1: INTRODUCCIÓN
- **Longitud:** Exactamente entre **8 a 10 párrafos**.
- **Volumen por párrafo:** Cada párrafo DEBE tener **más de 3 oraciones**.
- **Citas:** Inyectar de **9 a 12 referencias bibliográficas**.
- **Estructura Narrativa (De lo general a lo particular):**
  - *Párrafos 1 al 3:* Contaminación ambiental global y destrucción de ecosistemas.
  - *Párrafos 4 al 5:* Contaminación específica en la Amazonía (deforestación, mercurio).
  - *Párrafos 6 al 7 (El Problema):* Minería ilegal (*garimpo*) inabarcable manualmente por la inmensidad selvática; fatiga y lentitud del monitoreo satelital humano.
  - *Párrafos 8 al 9 (La Solución):* Justificar el uso de IA (Visión Computacional y CNNs) para procesar miles de imágenes por segundo.
  - *Párrafo 10 (Cierre):* **1 o 2 oraciones máximo** definiendo el objetivo exacto del trabajo. El resto del párrafo describe la estructura de las siguientes secciones.

---

### SECCIÓN 2: TRABAJOS RELACIONADOS
- **Cantidad:** Mínimo **10 trabajos relacionados** (usando herramientas como *Consensus*).
- **Regla Estricta de las 6 Oraciones:** Cada trabajo se redacta como un solo párrafo fluido sin viñetas de **exactamente 6 oraciones cortas**:
  1. *Oración 1 (Problema):* El problema específico que atacó el autor.
  2. *Oración 2 (Objetivo):* El propósito central del trabajo.
  3. *Oración 3 (Aporte):* La novedad o contribución principal.
  4. *Oración 4 (Metodología):* El enfoque técnico/algorítmico utilizado.
  5. *Oración 5 (Resultado):* El resultado empírico o métrica cuantitativa obtenida.
  6. *Oración 6 (Deficiencia):* La limitación o fallo crítico (justifica la necesidad de nuestro proyecto).
- **Párrafo de Resumen:** Síntesis final que agrupa tendencias y define claramente la "brecha científica" (*research gap*).
- **Tabla Comparativa:** Tabla resumen en formato Markdown/Typst con los 10 trabajos especificando problema, aporte, metodología y deficiencia.

---

### SECCIÓN 3: MATERIALES Y MÉTODOS

#### 3.1. Fundamentos Teóricos (7 a 8 párrafos)
- *Teoría del Dominio:* Concepto técnico del *garimpo* aluvial y fundamento espacial (cambios en reflectancia por suelo desnudo y sedimentos).
- *Transición a la IA:* Visión Computacional, CNNs, filtros convolucionales ($k \times k$), mapas de características (*feature maps*) y *pooling*.
- *Modelos Específicos:* Transfer Learning (pesos ImageNet), ResNet50 (conexiones residuales $F(x)+x$ anti-desvanecimiento del gradiente) y VGG16 como línea base comparativa.
- *Métricas:* Justificación matemática de Matriz de Confusión, Accuracy, Precision, Recall (prioridad cero falsos negativos) y AUC-ROC.

#### 3.2. Herramientas y Tecnologías (1 a 2 párrafos)
- Entorno: Python v3.14, Jupyter Notebook/Colab, Pandas, NumPy, Scikit-learn, TensorFlow/Keras.
- **Regla:** Incluir **exactamente 1 referencia por párrafo**.

#### 3.3. Dataset
- **Regla Estricta:** Una sola referencia a Kaggle (*Dataset Amazonia Garimpo Binario*).
- Detallar volumen: 111,584 imágenes PNG de $128 \times 128$ píxeles.
- Definición de variables: `png_path` (Entrada X) y `label_int` (Salida Y, 1=garimpo, 0=selva).
- Análisis Exploratorio de Datos (EDA) con tablas de distribución de clases y características técnicas.

#### 3.4. Metodología Propuesta
- Diagrama de flujo visual del pipeline computacional.
- Detalle de los 4 pasos clave: Carga de datos, Preprocesamiento (con **Data Augmentation** obligatorio), Entrenamiento y Evaluación.
- **Pseudocódigo / Algoritmo formal** de la implementación.

---

### SECCIÓN 4: RESULTADOS
- **Estructura Fría de Datos (Sin opiniones ni interpretaciones):**
  - Gráficas de curvas de *Loss* (Pérdida) y *Accuracy* (Exactitud) para entrenamiento y validación.
  - Matriz de Confusión (VP, VN, FP, FN).
  - Tabla de métricas finales: Accuracy, Precision, Recall, F1-Score y AUC-ROC.

---

### SECCIÓN 5: DISCUSIÓN
- Interpretación técnica de los números obtenidos en la Sección 4 (énfasis en la sensibilidad/Recall).
- Comparación técnica directa frente a los 10 trabajos citados en la Sección 2.
- Análisis exhaustivo de limitaciones (confusión espectral entre agua lodosa/bancos de arena y minas, cobertura de nubes).

---

### SECCIONES 6, 7 Y 8: CONCLUSIONES, TRABAJOS FUTUROS Y ÉTICA

#### 6. Conclusiones
- Resumen conciso de los hallazgos principales y la brecha cubierta.

#### 7. Trabajos Futuros
- Exactamente 2 párrafos sobre líneas futuras (extensión a video satelital, mayor resolución espacial, fusión con radar SAR Sentinel-1).

#### 8. Cláusulas Éticas (Obligatorio 1 oración por cada una)
1. *Contribución de autoría:* Definición de roles según taxonomía CRediT.
2. *Conflicto de intereses:* Declaración de ausencia de conflicto de intereses.
3. *Conducta ética:* Cumplimiento de estándares de integridad académica.
4. *Disponibilidad de datos:* Declaración de acceso al dataset y repositorio de código.
5. *Financiamiento:* Declaración sobre fuentes de financiamiento o desarrollo no financiado.

---

### REFERENCIAS BIBLIOGRÁFICAS
- Lista automatizada procesada por el gestor de referencias en formato IEEE.