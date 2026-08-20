#import "@preview/charged-ieee:0.1.4": ieee
#set page(numbering: "1")
#show: ieee.with(
  title: [Clasificación Binaria de Minería Ilegal (Garimpo) en la Amazonía mediante Transfer Learning con ResNet50 sobre Imágenes Satelitales],
  abstract: [
    El monitoreo manual de la minería ilegal (garimpo aluvial) en la Amazonía es lento e ineficiente debido a la inmensidad de la selva y la fatiga visual que genera procesar enormes volúmenes de datos satelitales. Aunque las técnicas de aprendizaje profundo ofrecen una solución automatizada, gran parte de las investigaciones previas ignoran el problema de la fuga de datos espaciales y el cambio de dominio visual, lo que termina sobreestimando drásticamente el verdadero rendimiento operativo de los algoritmos. Para cerrar esta brecha, este estudio presenta una evaluación comparativa rigurosa de cuatro arquitecturas preentrenadas (ResNet50, EfficientNet-B0, Swin Transformer y ViT-Tiny) aplicadas a la clasificación binaria de minería sobre el conjunto de datos Amazonia Garimpo Binario, el cual contiene 111,584 recortes multiespectrales balanceados. A diferencia de estudios anteriores, implementamos una partición estricta por bloques geográficos aislados de 32x32 para estructurar un conjunto de prueba completamente independiente de 17,312 imágenes, evitando así cualquier autocorrelación. Las evaluaciones empíricas demuestran que la red convolucional ResNet50, calibrada con una normalización específica para reflectancias amazónicas, supera a los modernos modelos de autoatención. En la prueba operativa, ResNet50 alcanzó una exactitud del 79.38%, un F1-Score macro del 79.38% y un Recall del 78.29%. Al priorizar matemáticamente la sensibilidad (Recall), el sistema minimiza los falsos negativos, garantizando que ninguna excavación destructiva pase desapercibida para las entidades de fiscalización ambiental. --- Manual monitoring of illegal alluvial gold mining (garimpo) in the Amazon basin is inherently slow and inefficient due to the vast territorial extent of the rainforest and the visual fatigue caused by processing massive volumes of satellite imagery. Although deep learning techniques offer a highly scalable automated solution, most previous research ignores the spatial data leakage problem and visual domain shift, drastically overestimating the true operational performance of the algorithms. To bridge this critical gap, this study presents a rigorous comparative evaluation of four pretrained architectures (ResNet50, EfficientNet-B0, Swin Transformer, and ViT-Tiny) applied to the binary classification of mining activity using the Amazonia Garimpo Binario dataset, which contains 111,584 perfectly balanced multispectral image chips. Unlike previous academic studies, we implemented a strict partitioning strategy using 32x32 isolated geographic blocks to structure a completely independent test set of 17,312 images, thereby preventing any spatial autocorrelation. Empirical evaluations demonstrate that the ResNet50 convolutional network, calibrated with a specific normalization for Amazonian surface reflectances, consistently outperforms modern self-attention models. In the final operational test, ResNet50 achieved an overall accuracy of 79.38%, a macro F1-score of 79.38%, and a recall of 78.29%. By mathematically prioritizing sensitivity (Recall) over precision, the proposed system drastically minimizes false negatives, ensuring that no destructive excavation goes unnoticed by regional environmental law enforcement agencies.
  ],
  authors: (
    (
      name: "Jeans Anthony Ajra Huacso",
      department: [Escuela Profesional de Ingeniería de Sistemas],
      organization: [Universidad Nacional de San Agustín],
      location: [Arequipa, Perú],
      email: "jajra@unsa.edu.pe"
    ),
    (
      name: "Paul Andree Cari Lipe",
      department: [Escuela Profesional de Ingeniería de Sistemas],
      organization: [Universidad Nacional de San Agustín],
      location: [Arequipa, Perú],
      email: "pcaril@unsa.edu.pe"
    ),
    (
      name: "Fernando Miguel Garambel Marín*",
      department: [Escuela Profesional de Ingeniería de Sistemas],
      organization: [Universidad Nacional de San Agustín],
      location: [Arequipa, Perú],
      email: "fgarambel@unsa.edu.pe"
    ),
    (
      name: "Luis Guillermo Luque Condori",
      department: [Escuela Profesional de Ingeniería de Sistemas],
      organization: [Universidad Nacional de San Agustín],
      location: [Arequipa, Perú],
      email: "lluquecon@unsa.edu.pe"
    ),
    (
      name: "Alexandra Raquel Quispe Arratea",
      department: [Escuela Profesional de Ingeniería de Sistemas],
      organization: [Universidad Nacional de San Agustín],
      location: [Arequipa, Perú],
      email: "aquispearr@unsa.edu.pe"
    ),
  ),
  index-terms: ("Aprendizaje por transferencia", "Garimpo aluvial", "Imágenes satelitales", "Redes neuronales convolucionales", "ResNet50"),
  bibliography: bibliography("sources/references.bib"),
)

#place(bottom + left, clearance: 0pt, float: true)[
  #line(length: 100%, stroke: 0.5pt)
  #set text(size: 7.5pt)
  #set par(leading: 0.4em)
  
  \* Autor de correspondencia.\
  #emph[Email addresses:] jajra\@unsa.edu.pe (Jeans Anthony Ajra Huacso), pcaril\@unsa.edu.pe (Paul Andree Cari Lipe), fgarambel\@unsa.edu.pe (Fernando Miguel Garambel Marín), lluquecon\@unsa.edu.pe (Luis Guillermo Luque Condori), aquispearr\@unsa.edu.pe (Alexandra Raquel Quispe Arratea)\
  
  #v(8pt)
  #h(1fr) #emph[Julio 30, 2026]
]


// ============================================================
// SECCIÓN 1: INTRODUCCIÓN
// Citas: IllegalMiningAmazon2021, ferreiranetoUncontrolledIllegalMining2024,
//         PerusGoldRush2016, CaseFloatingGold2022, gersonAmazonForestsCapture2022,
//         MercuryAmazonDanger2023, maapEvaluacionDeforestacionPor2023,
//         TwentyYearsLand2020, loboMappingMiningAreas2018, LandUseLand2023
// ============================================================

#set heading(numbering: none)
#show "TABLE": "TABLA"
#show "Table": "Tabla"
#show "Fig.": "Figura"
#show figure.where(kind: table): set figure.caption(position: top)

= 1. Introducción

Las actividades extractivas ilegales constituyen una de las principales causas de deterioro ambiental en la actualidad @crespo-lopezMercuryAmazonDanger2023. Entre ellas, la minería a cielo abierto destaca por sus efectos directos sobre el territorio, ya que elimina la cobertura vegetal, destruye hábitats y libera contaminantes que terminan en ríos y quebradas cercanas @balaniukMiningTailingsDam2020. Esta eliminación no afecta únicamente a los ecosistemas, sino también a la salud y a las actividades económicas de las comunidades que dependen de esos recursos hídricos. La urgencia por detener este daño exige una intervención tecnológica inmediata.

La continua desaparición de los bosques originales trae efectos a una escala más amplia. La disminución de la masa forestal cambia las condiciones de temperatura de la zona, impulsa la reducción de la diversidad biológica y perturba los ciclos naturales del agua. Además, restringe la habilidad del bosque para capturar carbono y causa la acumulación de sedimento en los ecosistemas acuáticos por el arrastre constante de los suelos alterados. La recuperación de estas áreas es lenta, pues la formación de una nueva capa fértil requiere varias décadas.

El avance de estas actividades está principalmente relacionado con factores económicos. La demanda mundial de metales preciosos motiva la expansión de explotaciones informales en zonas remotas, donde la supervisión ambiental es limitada. En estas circunstancias, se inician nuevas áreas de extracción sin una supervisión adecuada. Dado que los métodos convencionales de control no han logrado frenar este aumento, son necesarias herramientas tecnológicas que faciliten la vigilancia de amplias zonas de forma habitual y ordenada.

En la Amazonía, la minería artesanal e ilegal de oro es conocida regionalmente como garimpo @IllegalMiningAmazon2021. En Brasil, la superficie deforestada por esta actividad aumentó en 1,200% entre 1985 y 2022 @ferreiranetoUncontrolledIllegalMining2024. Esta expansión ha invadido áreas protegidas y territorios indígenas. Por su parte, el uso de maquinaria pesada remueve grandes cantidades de suelo aluvial y modifica drásticamente la estructura natural de los ríos.

Esta devastación se extiende por toda la cuenca amazónica, afectando gravemente la salud de los ecosistemas transfronterizos @PerusGoldRush2016. Uno de los problemas más críticos es el uso intensivo de mercurio durante la amalgamación del oro, lo que provoca una severa contaminación de los ríos @CaseFloatingGold2022. El mercurio liberado se deposita sobre la vegetación y entra a la cadena alimentaria, afectando a la fauna y a las comunidades locales @gersonAmazonForestsCapture2022. Dado que Brasil concentra la mayor cantidad de áreas deforestadas por esta práctica, los estudios más robustos y los conjuntos de datos a gran escala se han desarrollado en dicho territorio, sirviendo como laboratorio principal para el desarrollo de nuevas tecnologías de monitoreo.

A pesar de la gravedad del problema, localizar nuevos focos mineros con rapidez sigue siendo difícil mediante métodos convencionales. Los campamentos se trasladan con frecuencia por ríos y afluentes de difícil acceso. Paralelamente, las patrullas terrestres y fluviales carecen de la capacidad logística para vigilar extensas áreas selváticas. Cuando una excavación es detectada tarde, una parte irreversible del daño ambiental ya se ha producido.

El análisis satelital tradicional tampoco elimina completamente esta dificultad, debido a que todavía depende en gran medida de la revisión manual y de procesos de clasificación que exigen demasiado tiempo @TwentyYearsLand2020. Examinar miles de imágenes de forma individual es una tarea costosa y repetitiva. Además, después de varias horas de observación continua, los analistas cometen errores por fatiga visual. Este agotamiento físico eleva el riesgo de pasar por alto nuevas zonas de deforestación minera.

La Visión Computacional ofrece una alternativa sólida para automatizar este proceso @LandUseLand2023. Las Redes Neuronales Convolucionales analizan grandes cantidades de imágenes multiespectrales y aprenden diferencias de textura, forma y reflectancia directamente a partir de los píxeles. De esta manera, reducen drásticamente la necesidad de que una persona inspeccione cada imagen una por una. Asimismo, el aprendizaje por transferencia aprovecha modelos previamente entrenados y los adapta a complejos escenarios amazónicos.

Para resolver este problema técnico, es necesario evaluar diferentes modelos de clasificación. Las redes convolucionales como EfficientNet-B0 y ResNet50 tienen una gran capacidad para detectar patrones irregulares en el terreno. Por su parte, las arquitecturas modernas como Swin Transformer y Vision Transformer analizan las fotografías satelitales de forma global. Comparar estas cuatro opciones bajo las mismas condiciones experimentales permite determinar cuál funciona mejor sobre la selva amazónica.

El objetivo central de esta investigación es construir un sistema automatizado para clasificar la minería aluvial ilegal en el conjunto de datos Amazonia Garimpo Binario @grupioniDeteccaoGarimpoNa2026. El diseño experimental contrasta el desempeño de cuatro arquitecturas neuronales preentrenadas para seleccionar la herramienta más precisa. Tras evaluar los resultados empíricos, el estudio adopta la red ResNet50 como el modelo definitivo para la producción. El resto del artículo detalla los trabajos relacionados en la Sección 2 y la metodología exacta en la Sección 3. Posteriormente, las Secciones 4 a 8 exponen los resultados numéricos, la discusión, las conclusiones y las implicancias prácticas de la herramienta desarrollada.

// ============================================================
// SECCIÓN 2: TRABAJOS RELACIONADOS
// ============================================================

= 2. Trabajos relacionados

La supervisión de la extracción ilegal de minerales en amplias áreas de bosques tropicales presenta desafíos significativos debido a la ausencia de mapas organizados y los altos costos logísticos asociados con la cartografía del terreno. Para abordar esta poca supervisión en el seguimiento geográfico, Lobo et al. @loboMappingMiningAreas2018 establecieron como meta encontrar las zonas de extracción de oro utilizando datos multiespectrales que son accesibles públicamente. En su método de análisis utilizó el algoritmo Random Forest, aplicándolo a los componentes principales obtenidos de las imágenes satelitales de Sentinel-2. Un elemento fundamental del estudio fue validar la efectividad de la teledetección multiespectral de resolución moderada como un método habitual para examinar áreas en el Amazonas. En las evaluaciones llevadas a cabo, el sistema tiene un índice Kappa de 0.93, lo que nos dice que tiene un alto nivel de coincidencia estadística para distinguir la cobertura alterada. Sin embargo, el clasificador es muy susceptible al ruido atmosférico causado por la densa nubosidad, lo que genera un número significativo de falsos positivos en la temporada de lluvias.

En el oeste de África, la minería artesanal está creciendo de manera descontrolada, sin que las entidades ambientales tengan mapas confiables. Para registrar esta actividad informal a gran escala, Couttenier y su equipo se propusieron mapear las prácticas extractivas en toda la región sub-sahariana. Para ello, utilizaron una técnica que examinó un amplio conjunto de imágenes satelitales de resolución media mediante una red neuronal convolucional adaptada para la segmentación semántica. La mejor aportación fue la creación de la primera base de datos espaciales etiquetadas sobre la minería artesanal en África. Los hallazgos experimentales demostraron una precisión del 70% y una sensibilidad del 42% al identificar áreas de extracción. Sin embargo, el bajo nivel de sensibilidad dice que el modelo tiende a subestimar en gran medida la extensión real del área afectada, lo que limita su efectividad como herramienta para la supervisión operativa.

La supervisión de la reducción de la cobertura forestal causada por acciones humanas requiere la comparación de conjuntos de datos espaciales, una tarea que los métodos estadísticos convencionales llevan a cabo con bordes poco precisos y errores geométricos. Ante estas deficiencias algorítmicas, De Bem et al. decidieron analizar técnicas tradicionales en comparación con redes neuronales profundas para detectar cambios en los bosques de Perú y Brasil. El experimento fue diseñado con arquitecturas convolucionales de vanguardia como ResUnet y SharpMask, utilizando series temporales de las imágenes satelitales de Landsat y Sentinel. La aportación singular de esta investigación mostró de manera empírica que el aprendizaje profundo delimita los bordes de la deforestación de forma mucho más precisa sin necesidad de hacer ajustes en el posprocesamiento. En los análisis de validación, la red residual logró resultados excepcionales con un coeficiente F1 y una media de intersección sobre unión (mIoU) de 0.94. Como limitación operativa, el sistema se basa en comparaciones de imágenes anuales, lo que impide emitir alertas tempranas en períodos cortos para intervenciones inmediatas.

La expansión rápida de excavaciones superficiales no reguladas en ecosistemas de sabana sucede con agilidad, eludiendo la supervisión mediante imágenes satelitales que llevan a cabo analistas humanos. Con el fin de facilitar la detección temprana de este tipo de impacto, Gallwey et al. @gallweySentinel2BasedMultispectral2020a se propusieron identificar áreas de minería artesanal mediante el uso de teledetección accesible. Su metodología empleó profundas redes neuronales convolucionales para clasificar, analizando de manera simultánea las diferentes bandas espectrales del satélite Sentinel-2. La importancia científica de esta investigación reside en que, por primera vez, demostró la efectividad de las matrices multibanda para diferenciar la tierra excavada en la superficie de otros tipos de suelos que no tienen vegetación. Las pruebas realizadas mostraron una capacidad de discriminación destacable, con una tasa de error de clasificación que fue inferior al 8% en los lugares de minería activos. Sin embargo, la principal limitación es que el modelo fue creado para los climas semiáridos, sin tener evidencia de su eficacia en selvas tropicales con un denso dosel forestal, como es el caso de la Amazonía.

La cobertura de nubes que es constante en la región amazónica durante la época de lluvias impide que los satélites ópticos convencionales realicen su trabajo, manteniendo extensas zonas de bosque sin supervisión durante largos períodos. Con el propósito de asegurar un seguimiento continuo sin importar las condiciones climáticas, Lemes Neto y colaboradores @lemesnetoSARBasedMonitoringIllegal2026 propusieron encontrar los campamentos ilegales utilizando sensores de radar activos. Para lo cual se empleó una red neuronal convolucional ligera (CNN), entrenada con datos de radar de apertura sintética (SAR) de la misión Sentinel-1 en la banda C. La innovación del estudio demostró matemáticamente que el radar orbital puede atravesar nubes densas para identificar cambios en el terreno por debajo de la vegetación. El rendimiento cuantificable del sistema reveló un F1-score de 0.676 en la cuenca del Tapajós y de 0.630 en el territorio indígena Yanomami. Sin embargo, la resolución espacial del radar en banda C tiene problemas para encontrar en pequeñas excavaciones mineras que ocupan solo unos pocos píxeles.

La supervisión de los recursos naturales en zonas forestales remotas de África no tiene bases de datos etiquetadas y enfrenta una grave confusión espectral entre aguas turbias y suelos áridos. Para abordar esta confusión en la reflectancia, Pasanisi y su equipo @pasanisiUsingHighResolutionSatellite2025 centraron su investigación en la cartografía de la minería de oro de pequeña escala, integrando diferentes fuentes orbitales. El método técnico empleó un enfoque de fusión tardía que combina imágenes ópticas de alta resolución con datos de radar sintético. La principal contribución de la metodología fue la creación de una verdad de terreno sintética a través de algoritmos de agrupamiento estadístico, disminuyendo así la necesidad de anotaciones manuales en el lugar. El modelo fusionado logró una precisión general del 71%, un recall del 75% y un F1-score de 0.73 en el conjunto de pruebas. No obstante, como limitación, la estructura presenta confusión al tratar de diferenciar las áreas de extracción mineral de las zonas urbanas muy densas.

La problemática de la degradación ambiental causada por la minería aluvial en la Amazonía suroriental de Perú no tenía estudios automatizados locales que tuvieran en cuenta las características geográficas específicas del departamento de Madre de Dios. Con el objetivo de desarrollar herramientas informáticas para el entorno peruano, Saire Rimachi y su equipo @sairerimachiDeteccionDeforestacionPor2024 se propusieron identificar de manera anticipada las zonas afectadas por la deforestación debido a actividades mineras y agrícolas. La estrategia metodológica comparó distintas arquitecturas de re des neuronales convolucionales profundas (CNN) mediante el procesamiento de recortes espaciales anotados por expertos en la región de Madre de Dios. La principal innovación fue establecer el primer antecedente empírico con datos peruanos en español para distinguir las causas humanas de la deforestación. Los experimentos mostraron una gran capacidad de convergencia técnica, logrando una precisión de clasificación superior al 90% en recortes espaciales seleccionados. Sin embargo, la limitación de esta investigación es el tamaño muy pequeño de su conjunto de imágenes, lo que limita su robustez estadística y su aplicación a gran escala.

Las instituciones gubernamentales frecuentemente no disponen de software de código abierto ni de procesamiento ágil para identificar coordenadas de excavaciones ilegales en grandes volúmenes de datos satelitales. Con el fin de mejorar los procesos de supervisión, Shashidhara y Khan @shashidharasIllegalMiningActivity2025 trabajaron en el desarrollo de un sistema unificado que pudiera clasificar y localizar al mismo tiempo áreas de minería no autorizada. La aplicación se concibió a través de un método en dos etapas, incorporando un pipeline dividido en dos fases que combinó un clasificador convolucional DenseNet121 con un modelo de detección de objetos YOLO, implementado con la plataforma web Flask. La utilidad práctica de este proyecto radicó en integrar modelos complejos de inteligencia artificial en una interfaz operativa efectiva que permitiera tomar decisiones administrativas en tiempo real. La evaluación del sistema mostró una precisión de clasificación que alcanzó casi el 96% en la tarea de distinguir entre bosques intactos y lugares de explotación activa. No obstante, la muestra geográfica empleada para entrenar el sistema original era bastante limitada, lo que ocasionó un sobreajuste que dificulta aplicar sus resultados a otras selvas tropicales.

La evaluación de algoritmos de detección en la región amazónica había sido obstaculizada durante mucho tiempo debido a la falta de un conjunto de datos de referencia amplio y estandarizado de acceso público. Para establecer un estándar internacional en la comparación científica, Grupioni et al. @grupioniDeteccaoGarimpoNa2026 propusieron la creación de la primera línea base computacional utilizando el nuevo corpus Amazonia Garimpo Binario. Su estudio aplicó la estructura de red neuronal profunda EfficientNet-B0 y empleó métodos avanzados de Aprendizaje por Transferencia en tensores ópticos de múltiples espectros. La contribución fundamental del documento fue definir el estado del arte inicial para este conjunto de 111,584 imágenes satelitales anotadas del área amazónica brasileña. El modelo convolucional entrenado logró converger con éxito, teniendo una exactitud global del 85.92% y un área bajo la curva ROC (AUC) de 0.9371 en el subconjunto de prueba. Como vacío de investigación, los autores evaluaron una única arquitectura convolucional liviana, dejando inexplorado el potencial de modelos residuales más profundos como ResNet50 o enfoques con Transformers.

La actividad extractiva intensiva genera efluentes geoquímicos tóxicos como el drenaje ácido de minas, cuya rápida dispersión en cuerpos de agua superficiales carece de sistemas rápidos de mapeo satelital automatizado. Con el fin de mitigar emergencias de contaminación hídrica y proteger la salud pública, Farahnakian et al. @farahnakianMachineLearningAlgorithms2024 se propusieron cartografiar la extensión espacial de cuerpos de agua acidificados en áreas mineras. La metodología integró algoritmos clásicos de aprendizaje automático como Random Forest, K-Vecinos Más Cercanos (KNN) y Perceptrón Multicapa (MLP) sobre una fusión de bandas Sentinel-2 y WorldView-3. La contribución científica verificó matemáticamente que la combinación de sensores de resolución media y muy alta resolución espectral mejora drásticamente el reconocimiento de agentes contaminantes. El modelo Random Forest arrojó el mejor desempeño comparativo, logrando separar con alta precisión los píxeles de agua ácida de las corrientes acuáticas naturales y limpias. No obstante, los algoritmos tradicionales evaluados carecen de la capacidad para extraer representaciones espaciales profundas de textura, mostrando menor adaptabilidad al aplicarse en topografías selváticas complejas.

La diferenciación espacial precisa entre parcelas agrícolas alteradas, cauces fluviales lodosos y excavaciones aluviales pequeñas a menudo supera las capacidades de los clasificadores estadísticos en plataformas en la nube. Para validar la superioridad de la segmentación semántica en escenarios de minería artesanal, Hejmanowska et al. @hejmanowskaPotentialUNetDetecting2025 buscaron evaluar arquitecturas profundas sobre imágenes multiespectrales Sentinel-2. Su diseño analítico implementó la red neuronal convolucional de segmentación profunda U-Net y contrastó su desempeño contra algoritmos supervisados operando directamente dentro de Google Earth Engine. El aporte central comprobó de manera concluyente que el aprendizaje profundo supera a las metodologías estadísticas en la delimitación geométrica de explotaciones mineras espacialmente heterogéneas. Las evaluaciones cuantitativas demostraron una ganancia sustancial, alcanzando exactitudes globales superiores al 91% en la delimitación de bordes aluviales degradados. Por otra parte, la limitación primordial es el elevadísimo requerimiento computacional de inferencia de la red U-Net, lo que dificulta su despliegue operativo continuo para agencias regionales sin GPUs dedicadas.

La identificación multiespectral de patrones aluviales en ecosistemas forestales densos experimenta pérdidas de contexto global cuando los algoritmos dependen de campos receptivos locales o ventanas convolucionales pequeñas. Con el propósito de modelar dependencias espaciales de largo alcance sobre imágenes satelitales de alta complejidad, Rad et al. @radVisionTransformerMultispectral2024 y Kaselimi et al. @kaselimiVisionTransformerModel2023 se propusieron explorar arquitecturas basadas en mecanismos de autoatención. La metodología implementó modelos de vanguardia como Vision Transformer (ViT) y Swin Transformer @liuSwinTransformerHierarchical2021 dividiendo las matrices ópticas satelitales en parches multiespectrales procesados jerárquicamente @departmentofcomputerengineeringandinformationtechnologyuniversityofqomqomiran.universityofkerbalakarbalairaqBenchmarkingVisionTransformers2025 @yeApplicationConvolutionalNeural2022. El aporte principal de estos estudios consistió en demostrar la aplicabilidad de los bloques de atención visual para capturar correlaciones semánticas globales en la cartografía de la cobertura terrestre. En conjuntos de validación a gran escala, estas arquitecturas de atención obtuvieron porcentajes de exactitud sobresalientes, superando el 88% de acierto discriminativo sobre texturas complejas @heinzeNonlocalCrossinteractionSystems2022. Sin embargo, estos modelos basados en Transformers requieren una cantidad masiva de datos etiquetados para converger sin sobreajustarse, lo que resulta subóptimo para datasets especializados de escala moderada @oyedotunWhyEveryoneTraining2023.

La validación tradicional de algoritmos de inteligencia artificial en imágenes satelitales suele inflar artificialmente la exactitud debido a la fuerte correlación espacial entre los píxeles vecinos. Para mitigar este problema de fuga de datos, Pohjankukka y colaboradores @pohjankukkaEstimatingPredictionPerformance2020 propusieron evaluar el rendimiento real de los modelos espaciales utilizando una validación cruzada estructurada. El diseño metodológico empleó particiones de datos en bloques geográficos estrictos, asegurando que las zonas de entrenamiento y prueba estuvieran físicamente separadas. El estudio demostró matemáticamente que los esquemas de partición aleatoria sobreestiman la capacidad predictiva del algoritmo frente a datos topográficos completamente nuevos. Las pruebas empíricas revelaron que el error de clasificación medido aumenta a niveles realistas cuando se evalúan bloques espaciales independientes. Sin embargo, aplicar esta técnica reduce el volumen de muestras de entrenamiento disponibles, lo que obliga a recopilar mosaicos satelitales mucho más grandes.

El uso directo de modelos visuales preentrenados genéricos sobre fotografías satelitales densas genera una baja capacidad de generalización debido al cambio radical de dominio visual. Para superar esta brecha de representación, Chopra y su equipo @chopraDomainAdaptableSelfsupervised2023 se plantearon adaptar algoritmos de aprendizaje autosupervisado directamente sobre imágenes de observación de la Tierra. El esquema de investigación aplicó arquitecturas de representación profunda para calcular estadísticas locales de normalización y contrastar tensores espectrales sin necesidad de etiquetas previas. El aporte principal consistió en comprobar que ajustar los valores de media y desviación estándar al ecosistema objetivo mejora drásticamente el proceso de convergencia. Las evaluaciones demostraron que los modelos adaptados localmente superan con claridad a las redes inicializadas únicamente con pesos genéricos de ImageNet. No obstante, el costo computacional de calcular estas representaciones latentes desde cero impide que laboratorios pequeños implementen la técnica en escenarios de tiempo real.

El monitoreo satelital de minería ilegal evolucionó desde los clasificadores estadísticos tradicionales hasta la reciente adopción de modelos basados en la atención visual profunda @radVisionTransformerMultispectral2024. Pese a este avance tecnológico, ninguna investigación previa solucionó completamente la detección del garimpo amazónico porque omitieron el problema de la fuga de datos espaciales y el cambio de dominio visual. Además, los pocos estudios realizados sobre bases de datos locales amazónicas evaluaron únicamente arquitecturas livianas solitarias @grupioniDeteccaoGarimpoNa2026. Este trabajo cierra dicha brecha teórica mediante un análisis comparativo que enfrenta redes convolucionales tradicionales contra arquitecturas modernas de tipo Transformer bajo las mismas reglas de partición espacial. La evaluación empírica exhaustiva demostró que la red ResNet50, al ser calibrada con una normalización amazónica específica, supera significativamente a los demás algoritmos competidores. De esta manera, la presente investigación proporciona una herramienta validada, de bajo costo computacional y altamente escalable para apoyar las operaciones gubernamentales de interdicción ambiental.

#figure(
  block[
    #set text(size: 8pt)
    #table(
      columns: (1.2fr, 1.3fr, 1.4fr, 1.4fr, 1.1fr, 1.4fr),
      align: (col, row) => if col == 4 { right } else { left },
      inset: 4pt,
      stroke: none,
      table.hline(stroke: 0.8pt + black),
      table.header(
        [*Autores*], [*Problema*], [*Metodología*], [*Aporte*], [*Resultado clave*], [*Deficiencia*]
      ),
      table.hline(stroke: 0.5pt + black),
      [Lobo et al. (2018)], [Inmensidad amazónica], [Random Forest, PCA], [Sentinel-2 estándar], [Kappa: 0.93], [Susceptible a nubes],
      [Couttenier et al. (2022)], [Sin mapas en África], [CNN segmentación], [1er dataset africano], [Acc: 70.0%], [Recall bajo (42%)],
      [De Bem et al. (2020)], [Bordes difusos], [ResUnet, SharpMask], [Supera estadística], [F1: 0.94], [Solo pares anuales],
      [Gallwey et al. (2020)], [Minas en sabana], [CNN multibanda], [Deep-to-shallow], [Error: 8.0%], [No generaliza],
      [Lemes Neto et al. (2026)], [Nubosidad total], [CNN liviana SAR], [Sentinel-1 radar], [F1: 0.676], [Falla en baja densidad],
      [Pasanisi et al. (2025)], [Ambiente turbio Congo], [Late Fusion (Planet+SAR)], [Ground truth sintético], [F1: 0.73], [Confusión con urbes],
      [Saire Rimachi et al. (2024)], [Deforestación Perú], [CNN arquitectura], [Precedente nacional], [Acc: >90.0%], [Dataset muy pequeño],
      [Shashidhara et al. (2025)], [Ubicación en vivo], [DenseNet121 + YOLO], [Plataforma Flask web], [Acc: ~96.0%], [Sobreajuste local],
      [Grupioni et al. (2026)], [Sin línea base pública], [EfficientNet-B0, TL], [Benchmarking dataset], [Acc: 85.92%], [Evalúa un solo modelo],
      [Farahnakian et al. (2024)], [Drenaje ácido minero], [RF, KNN, MLP], [Fusión Sentinel+WV3], [Separación precisa], [Sin contexto profundo],
      [Hejmanowska et al. (2025)], [Heterogeneidad aluvial], [U-Net segmentación], [Supera GEE nativo], [Acc: >91.0%], [Alto costo en GPU],
      [Rad et al. (2024)], [Pérdida de contexto local], [Vision & Swin Transformer], [Atención jerárquica], [Acc: >88.0%], [Requiere masivos datos],
      [Pohjankukka et al. (2020)], [Fuga de datos espaciales], [Spatial k-fold], [Evita autocorrelación], [Error más realista], [Requiere más muestras],
      [Chopra et al. (2023)], [Cambio dominio visual], [Self-supervised TL], [Ajuste al ecosistema], [Supera ImageNet], [Alto costo inicial],
      table.hline(stroke: 0.8pt + black)
    )
  ],
  caption: [#smallcaps[Comparativa de trabajos relacionados sobre detección de minería ilegal y deforestación mediante teledetección.]],
  kind: table,
  placement: top,
  scope: "parent",
) <tabla-relacionados>


// ============================================================
// SECCIÓN 3: MATERIALES Y MÉTODOS
// ============================================================

= 3. Materiales y métodos

== _3.1. Fundamentos teóricos_

La extracción ilegal de minerales en ríos, comúnmente conocida como garimpo, provoca un cambio drástico y permanente en la estructura ecológica del bosque amazónico @loboMappingMiningAreas2018. La técnica de extracción mecánica requiere la eliminación completa de la vegetación del bosque, la remoción intensiva de la capa superior del suelo y la creación de estanques artificiales para sedimentos de desechos. Estas actividades generan metales pesados extremadamente dañinos, principalmente mercurio, de forma directa en las cuencas cercanas @pestanaLetsTalkMercury2022. La contaminación química del agua impacta drásticamente en la biodiversidad de los ecosistemas acuáticos y afecta los medios de vida y la salud de las comunidades que viven a la orilla @crespo-lopezMercuryAmazonDanger2023.

La eliminación de la vegetación y la creación de cuerpos de agua turbios alteran de manera significativa la reflectancia electromagnética del suelo. Este cambio produce señales ópticas únicas que los sensores satelitales multiespectrales detectan con alta precisión en resolución geométrica y radiométrica desde el espacio @TwentyYearsLand2020. La detección remota por medio de óptica permite controlar cambios significativos en el hábitat tropical en grandes territorios que son complicados de acceder a pie @monacoImprovingWildfireSeverity2020. Así, la supervisión constante desde satélites se vuelve la estrategia más eficiente para rastrear y evaluar transformaciones ecológicas en la región amazónica @camalanChangeDetectionAmazonian2022c.

La interpretación visual y el análisis manual de imágenes satelitales son difíciles de poner en práctica debido a la gran extensión y la complejidad de la selva amazónica. Para llevar a cabo este tipo de análisis de manera automatizada a gran escala, la inteligencia artificial utiliza el método de aprendizaje supervisado en el ámbito de la visión computacional @silvaAutomatedDetectionAnalysis2023. Los modelos algorítmicos trabajan con matrices numéricas de píxeles etiquetadas previamente para extraer e identificar patrones visuales muy complejos que no pueden ser detectados a simple vista @nieThreedimensionalIntelligentMonitoring2024. Este enfoque computacional convierte grandes volúmenes de datos en sistemas capaces de alertar anticipadamente sobre la deforestación aluvial @sairerimachiDeteccionDeforestacionPor2024.

Las Redes Neuronales Convolucionales (CNN) son la principal arquitectura utilizada para el análisis y la extracción automatizada de características espaciales en imágenes satelitales @LandUseLand2023. A diferencia de los perceptrones multicapa convencionales, las CNN llevan a cabo cálculos de convolución discreta sobre tensores de dos dimensiones, lo que les permite mantener la estructura espacial de los fragmentos satelitales @adegunReviewDeepLearning2023. La convolución en dos dimensiones aplicada a una imagen matriz $I$ con un núcleo $K$ de dimensiones $m times n$ se puede describir analíticamente como $S(i,j) = (I * K)(i,j) = sum_m sum_n I(i-m, j-n) K(m,n)$. Este proceso es e filtrado espacial progresivo que resulta en la extracción de bordes nítidos, texturas de suelo removido y contornos ondulados relacionados con las excavaciones mineras @ceciliLandCoverMapping2023.

El entrenamiento paramétrico de arquitecturas convolucionales profundas desde cero exige millones de imágenes satelitales etiquetadas y recursos computacionales inasumibles para las entidades gubernamentales locales @yosinskiHowTransferableAre2014. Para superar esta limitación estructural y acelerar la convergencia, la presente investigación aplica la técnica de Transferencia de Aprendizaje (*Transfer Learning*) @naushadDeepTransferLearning2021. El clasificador inicializa sus parámetros sinápticos con los pesos óptimos preentrenados sobre el repositorio masivo ImageNet, compuesto por más de un millón de imágenes visuales heterogéneas @tianRemoteSensingRetrieval2023a. El sistema solo ejecuta un reentrenamiento (*fine-tuning*) sobre las capas superiores densamente conectadas, ahorrando significativamente tiempo de GPU y costos algebraicos sin sacrificar capacidad discriminativa @tanEfficientNetRethinkingModel2020.

The ResNet-50 architecture serves as the primary engine for visual feature extraction due to its innovative deep topology design @heDeepResidualLearning2015. When increasing convolutional depth to capture abstract textures, conventional sequential networks experience the degenerative phenomenon of vanishing gradients during backpropagation. ResNet-50 overcomes this analytical obstacle by incorporating residual blocks equipped with skip connections that bypass the input identity around convolutional strata, obeying the formulation $y = cal(F)(x, {W_i}) + x$. This topology ensures an uninterrupted flow of mathematical gradients to the early layers, enabling the highly stable training of 50 parameterized hidden layers @farahnakianMachineLearningAlgorithms2024. The structural breakdown of this architecture begins with a convolutional stage (Conv1) equipped with 64 filters of $7 times 7$ and a stride of 2, followed by spatial reduction using $3 times 3$ Max Pooling. The network then stacks four primary groups of residual blocks: Conv2\_x with 3 blocks and 256 filters; Conv3\_x with 4 blocks and 512 filters; Conv4\_x, the deepest stage, with 6 blocks and 1024 filters; and finally Conv5\_x with 3 blocks and 2048 filters. The process concludes with a classification stage composed of Global Average Pooling and a Fully Connected layer.

Complementing the convolutional analysis, the EfficientNet-B0 architecture integrates as a highly optimized model applying the compound scaling principle. Unlike traditional networks that scale dimensions arbitrarily, EfficientNet mathematically balances depth, channel width, and input image resolution. This structural efficiency captures rich spatial representations in complex ecosystems using a fraction of the computational parameters required by heavier architectures @tanEfficientNetRethinkingModel2020.

To contrast the local convolutional paradigm, the study incorporates the Vision Transformer (ViT-tiny), an architecture that bypasses traditional convolutions. ViT divides the satellite crop into fixed patch sequences and applies global self-attention mechanisms. This approach grants the network a global receptive field from the very first layer, allowing it to simultaneously analyze distant geographical contexts within the same image, such as the relationship between a turbid water body and a deforested clearing at opposite ends of the scene @radVisionTransformerMultispectral2024.

Finally, to mitigate the high computational demand of global self-attention, the Swin Transformer (Swin-T) is implemented. This architecture introduces a hierarchical scheme based on shifted windows, restricting the attention computation to local neighborhoods while progressively expanding the field of view @liuSwinTransformerHierarchical2021. This topology reintroduces an inductive bias of locality, achieving an optimal balance between global context comprehension and the recognition of fine patterns essential for identifying alluvial mining.

La evaluación del desempeño discriminativo se fundamenta sobre una matriz de confusión binaria cruzada que contabiliza las predicciones del modelo frente al terreno: Verdaderos Positivos ($T P$), Verdaderos Negativos ($T N$), Falsos Positivos ($F P$) y Falsos Negativos ($F N$) @rainioEvaluationMetricsStatistical2024. A partir de estos conteos absolutos, se derivan la Exactitud Global (*Accuracy*), la Precisión (*Precision*), la Sensibilidad (*Recall*), el F1-Score Macro y el Área Bajo la Curva AUC-ROC @richardsonReceiverOperatingCharacteristic2024. En el estricto contexto de la fiscalización y monitoreo ambiental amazónico, *se prioriza el Recall porque mide las minas reales que se escaparon (falsos negativos), mientras que la Precision mide las falsas alarmas (falsos positivos)* @Mdpicom2073439513. Un falso negativo implica que un campamento operativo de garimpo continúe deforestando y contaminando con mercurio sin ser detectado por las autoridades estatales, constituyendo una omisión ecológica inaceptable.

#set math.equation(numbering: "(1)")
$ "Accuracy" = (T P + T N) / (T P + T N + F P + F N) $ <eq-acc>
$ "Precision" = T P / (T P + F P) $ <eq-prec>
$ "Recall" = T P / (T P + F N) $ <eq-rec>
$ "F1" = 2 times ("Precision" times "Recall") / ("Precision" + "Recall") $ <eq-f1>


== _3.2. Herramientas y tecnologías_

La implementación experimental se desarrolló con Python 3.10 o superior y Jupyter Notebook como entorno para el análisis exploratorio, la validación espacial, la normalización y la documentación de las corridas. Pandas y NumPy permitieron procesar el catálogo `manifesto_chips.csv`, organizar los manifiestos de entrenamiento, validación y prueba y calcular estadísticas descriptivas. Pillow y OpenCV se emplearon para la lectura y exploración de los recortes PNG, mientras que GeoPandas apoyó el tratamiento de los atributos geográficos y la verificación de la distribución territorial de las muestras.

El entrenamiento se implementó con PyTorch. La biblioteca `torchvision` proporcionó las transformaciones de aumento de datos, la conversión a tensores y la normalización, mientras que `timm` permitió cargar con pesos preentrenados en ImageNet las arquitecturas EfficientNet-B0, ResNet-50, Swin-T y ViT-tiny. Scikit-learn se utilizó para calcular Accuracy, Precision, Recall y F1-score, y Matplotlib y Seaborn permitieron generar las visualizaciones de los experimentos. La ejecución mediante CUDA aceleró el ajuste de los modelos y habilitó el uso de precisión mixta durante el entrenamiento.
== _3.3. Dataset_

El conjunto de datos utilizado en la experimentación corresponde al repositorio público _Amazonia Garimpo Binario_, publicado en la plataforma Kaggle por Grupioni et al. @grupioniDeteccaoGarimpoNa2026. El conjunto contiene 111,584 recortes de imágenes satelitales ópticas en formato PNG, con una dimensión uniforme de $128 times 128$ píxeles y tres canales RGB. La organización y trazabilidad de las muestras se realiza mediante el archivo `manifesto_chips.csv`, que registra la ruta de cada imagen, su ráster de origen, su posición dentro de la rejilla territorial, sus coordenadas geográficas y su etiqueta binaria. La entrada $X$ corresponde al tensor RGB obtenido al cargar el archivo indicado por `png_path`, mientras que la variable objetivo $Y$, almacenada en `label_int`, adopta el valor 1 cuando existe presencia de garimpo (`com_garimpo`) y 0 cuando no se identifica garimpo (`sem_garimpo`). La @tabla-manifesto resume las variables utilizadas en el pipeline final.

#figure(
  block[
    #set text(size: 8pt)
    #table(
      columns: (1.2fr, 1fr, 2fr),
      align: (col, row) => left,
      inset: 4pt,
      stroke: none,
      table.hline(stroke: 0.8pt + black),
      table.header(
        [*Columna del CSV*],
        [*Tipo de dato*],
        [*Descripción técnica y función en el modelo*]
      ),
      table.hline(stroke: 0.5pt + black),
      [`png_path`], [Cadena / Ruta],
      [Ruta relativa utilizada para localizar y cargar el recorte satelital RGB de $128 times 128$ píxeles que constituye la entrada visual $X$.],

      [`label_int` ($Y$)], [Entero binario],
      [Variable objetivo donde 1 representa presencia de garimpo (`com_garimpo`) y 0 ausencia de garimpo (`sem_garimpo`).],

      [`split`], [Categórico],
      [Partición espacial asignada al chip: entrenamiento, validación o prueba, obtenida mediante bloques territoriales y una zona de separación entre particiones.],

      table.hline(stroke: 0.8pt + black)
    )
  ],
  caption: [#smallcaps[Estructura de las variables principales del catálogo satelital `manifesto_chips.csv`.]],
  kind: table,
) <tabla-manifesto>

El conjunto presenta una distribución casi equilibrada. La clase `sem_garimpo` contiene 56,043 imágenes, equivalentes al 50.22 %, mientras que `com_garimpo` reúne 55,541 imágenes, correspondientes al 49.78 %, como se muestra en la @fig-pie. Esta distribución reduce el riesgo de que el clasificador favorezca una clase debido únicamente a su frecuencia. No obstante, la evaluación se complementa con Precision, Recall, F1-score por clase y macro F1, debido a que el balance global no elimina posibles sesgos geográficos, visuales o de etiquetado.

#figure(
  image("figures/pie_chart.png", width: 85%),
  caption: [Distribución de las clases `sem_garimpo` y `com_garimpo` en el conjunto completo.]
) <fig-pie>

La @fig-muestras presenta ejemplos visuales de ambas clases. Los recortes etiquetados como `com_garimpo` muestran patrones asociados con remoción de vegetación, exposición del suelo, sedimentos y alteración de cuerpos de agua, mientras que los ejemplos `sem_garimpo` no presentan la evidencia visual de garimpo utilizada para construir las etiquetas del conjunto.

#figure(
  image("figures/dataset_samples.png", width: 100%),
  caption: [Ejemplos de recortes clasificados como ausencia de garimpo (`sem_garimpo`) y presencia de garimpo (`com_garimpo`).]
) <fig-muestras>

== _3.4. Metodología propuesta_

La metodología se organizó como un pipeline de clasificación supervisada compuesto por seis etapas: validación del catálogo, partición espacial, preparación de las imágenes, construcción de los cargadores de datos, entrenamiento comparativo y evaluación final. La unidad de análisis fue el chip satelital RGB de $128 times 128$ píxeles, cuya ruta, clase y ubicación geográfica se obtuvieron del archivo `manifesto_chips.csv`.

#v(6pt)
#text(style: "italic")[
  3.4.1. Validación y partición espacial del conjunto
]
#v(3pt)

Antes del entrenamiento se verificó la integridad espacial del conjunto. El análisis confirmó que los 111,584 chips ocupaban celdas únicas de una rejilla territorial común, que no existían centroides, rutas o cajas geográficas duplicadas y que los doce rásteres de origen no presentaban superposición de área. Sin embargo, la primera partición por ráster presentó una limitación importante: el conjunto de prueba contenía únicamente dos rásteres y solo el 19.1 % de sus muestras pertenecía a la clase `com_garimpo`, frente al 56.1 % observado en entrenamiento. Además, algunos chips de diferentes particiones permanecían físicamente próximos en las costuras entre rásteres.

Para reducir esta dependencia espacial, se construyó la partición final `v2_bloques`. Los chips se agruparon según su posición territorial en bloques de $32 times 32$ celdas y cada bloque completo fue asignado a entrenamiento, validación o prueba. La asignación consideró la prevalencia de `com_garimpo` de cada bloque con el propósito de distribuir regiones con distintas proporciones de minería entre las tres particiones.

Posteriormente, se aplicó una zona de separación espacial de dos chips en las fronteras entre bloques pertenecientes a diferentes particiones. El conjunto de prueba conservó sus muestras; validación cedió los chips cercanos a prueba y entrenamiento cedió aquellos próximos a validación o prueba. Las muestras retiradas se registraron como `descartado_costura` y no participaron en el entrenamiento ni en la evaluación.

La partición resultante contiene 71,592 chips de entrenamiento, 16,518 de validación y 17,312 de prueba. La proporción de `com_garimpo` fue de 49.5 %, 51.1 % y 50.2 %, respectivamente. Esta distribución conserva el equilibrio de clases y disminuye el riesgo de obtener resultados artificialmente optimistas por proximidad geográfica entre las muestras.

#figure(
  block[
    #set text(size: 8pt)
    #table(
      columns: (1.1fr, 1.2fr, 1.2fr, 1.2fr),
      align: center,
      inset: 5pt,
      stroke: none,
      table.hline(stroke: 0.8pt + black),
      table.header(
        [*Partición*],
        [*Número de chips*],
        [*Rásteres representados*],
        [*`com_garimpo`*]
      ),
      table.hline(stroke: 0.5pt + black),
      [Entrenamiento], [71,592], [12], [49.5 %],
      [Validación], [16,518], [11], [51.1 %],
      [Prueba], [17,312], [11], [50.2 %],
      table.hline(stroke: 0.8pt + black)
    )
  ],
  caption: [Distribución final de las muestras mediante la partición espacial `v2_bloques`.],
  kind: table,
) <tabla-split-bloques>

#v(6pt)
#text(style: "italic")[
  3.4.2. Preparación y normalización de las imágenes
]
#v(3pt)

Cada muestra fue localizada mediante el atributo `png_path`, abierta con Pillow y convertida explícitamente a tres canales RGB. Durante el entrenamiento se aplicaron transformaciones aleatorias en memoria: inversión horizontal con probabilidad de 0.5, inversión vertical con probabilidad de 0.5, rotaciones de hasta $90°$ y variaciones moderadas de brillo, contraste, saturación y tonalidad mediante `ColorJitter`. Estas operaciones aumentan la diversidad visual de las muestras y reducen la dependencia del clasificador respecto de orientaciones o condiciones radiométricas específicas @adedejiImageAugmentationSatellite2022.

Las imágenes de validación y prueba no recibieron transformaciones aleatorias, debido a que su evaluación debe permanecer determinista. En las tres particiones, los valores de los píxeles se convirtieron a tensores y se normalizaron utilizando estadísticas calculadas exclusivamente sobre una muestra de 3,000 chips del conjunto de entrenamiento:

$ mu = (0.0303, 0.0813, 0.0202) $ <eq-dataset-mean>

$ sigma = (0.0831, 0.0541, 0.0382) $ <eq-dataset-std>

Para cada canal $c$, la transformación aplicada fue:

$ x'_c = (x_c - mu_c) / sigma_c $ <eq-normalizacion-dataset>

El cálculo exclusivo sobre entrenamiento evita incorporar información estadística de validación o prueba durante la preparación del modelo.

#v(6pt)
#text(style: "italic")[
  3.4.3. Construcción de los DataLoaders
]
#v(3pt)

Los manifiestos `manifest_train.csv`, `manifest_val.csv` y `manifest_test.csv` fueron utilizados por la clase `GarimpoDataset` para relacionar cada ruta PNG con su etiqueta entera. Después de cargar y transformar las imágenes, cada muestra fue representada mediante un tensor de dimensiones $3 times 128 times 128$ y una etiqueta de tipo entero largo.

Los datos se procesaron en lotes de 32 imágenes. El conjunto de entrenamiento fue mezclado al comienzo de cada recorrido mediante `shuffle`, mientras que validación y prueba conservaron un orden estable. Los lotes producidos por los `DataLoader` fueron transferidos al dispositivo disponible, priorizando CUDA y utilizando CPU cuando no se encontraba una GPU compatible.

#v(6pt)
#text(style: "italic")[
  3.4.4. Entrenamiento comparativo de arquitecturas
]
#v(3pt)

Se evaluaron cuatro arquitecturas disponibles mediante la biblioteca `timm`: EfficientNet-B0, ResNet-50, Swin Transformer Tiny y Vision Transformer Tiny. Todas fueron inicializadas con pesos preentrenados en ImageNet y adaptadas para producir dos salidas, correspondientes a `sem_garimpo` y `com_garimpo`. A diferencia de un esquema de extracción fija de características, los parámetros completos de cada arquitectura permanecieron habilitados para ajuste mediante _fine-tuning_.

La función objetivo utilizada fue `CrossEntropyLoss`, adecuada para una clasificación con dos logits de salida. Para una muestra $i$, la pérdida puede expresarse como:

$ L_i = - log ((exp(z_(i,y_i))) / (sum_(j=0)^1 exp(z_(i,j)))) $ <eq-cross-entropy>

donde $z_(i,j)$ representa el logit producido para la clase $j$ y $y_i$ corresponde a la etiqueta real. Los pesos se actualizaron mediante el optimizador Adam @kingmaAdamMethodStochastic2017. Se estableció una tasa de aprendizaje de $10^(-4)$ para ResNet-50 y EfficientNet-B0, y de $3 times 10^(-5)$ para Swin-T y ViT-tiny.

El entrenamiento se configuró con un máximo de 30 épocas y precisión mixta automática cuando se utilizó CUDA. Al finalizar cada época se calcularon la pérdida, Accuracy, macro F1, F1 por clase, Precision y Recall de `com_garimpo` tanto en entrenamiento como en validación.

#v(6pt)
#text(style: "italic")[
  3.4.5. Selección del mejor checkpoint
]
#v(3pt)

El criterio de selección fue el macro F1 obtenido sobre el conjunto de validación. Cuando un modelo superaba el mejor valor registrado, se guardaba un checkpoint que incluía la arquitectura, la época, los pesos, las métricas de validación, el tamaño de entrada y las constantes de normalización.

Se utilizó parada temprana con una paciencia de siete épocas. Si el macro F1 de validación no mejoraba durante siete épocas consecutivas, el entrenamiento de esa arquitectura finalizaba. Este criterio evita seleccionar automáticamente la última época, debido a que una reducción continua del error de entrenamiento no garantiza una mejor capacidad de generalización.

#v(6pt)
#text(style: "italic")[
  3.4.6. Evaluación final e inferencia
]
#v(3pt)

Después del entrenamiento, el mejor checkpoint de cada arquitectura fue evaluado una sola vez sobre los 17,312 chips de prueba. Los logits generados se transformaron en probabilidades mediante `softmax`, y la clase `com_garimpo` fue asignada cuando su probabilidad fue mayor o igual que el umbral de 0.5:

$ hat(y) = cases(
  1 & "si " P("com_garimpo") >= 0.5,
  0 & "en caso contrario"
) $ <eq-umbral>

La comparación principal se realizó mediante macro F1, dado que esta métrica concede la misma importancia a las dos clases. También se reportaron Accuracy, F1 por clase, Precision y Recall de `com_garimpo`. Finalmente, los mejores checkpoints de las cuatro arquitecturas fueron evaluados sobre el conjunto de prueba para comparar su capacidad de generalización. ResNet-50 obtuvo el mayor macro F1 en esta evaluación final y fue identificado como la arquitectura con mejor desempeño entre los modelos analizados.

#figure(
  placement: top,
  block(
    width: 100%,
    breakable: false,
    inset: 7pt,
    stroke: 0.5pt + luma(170),
  )[
    #set text(size: 7.5pt)
    #set par(leading: 0.65em)

    #align(center)[
      *Catálogo `manifesto_chips.csv`*\
      ↓\
      Validación espacial y construcción de la rejilla\
      ↓\
      Split por bloques $32 times 32$ y buffer de dos chips\
      ↓\
      Manifiestos de entrenamiento, validación y prueba\
      ↓\
      Aumento de datos y normalización propia\
      ↓\
      Entrenamiento de cuatro arquitecturas\
      ↓\
      Selección por macro F1 y evaluación en prueba
    ]
  ],
  caption: [
    Flujo general del pipeline metodológico.
  ],
  kind: image,
  supplement: [Fig.],
) <fig-flowchart>

#figure(
  placement: none,

  block(
    width: 100%,
    inset: 0pt,
    stroke: 0.6pt + black,
    radius: 2pt,
    breakable: false,
  )[

    // Cabecera del algoritmo
    #block(
      width: 100%,
      inset: (x: 6pt, y: 4pt),
      fill: luma(235),
    )[
      #align(center)[
        #text(size: 8pt, weight: "bold")[
          Algoritmo 1. Pipeline experimental `v2_bloques_tuned`
        ]
      ]
    ]

    #line(length: 100%, stroke: 0.6pt + black)

    // Contenido
    #block(inset: 6pt)[
      #set text(size: 7.3pt)
      #set par(leading: 0.55em)

      #text(weight: "bold")[Entrada:] Catálogo de chips y recortes RGB.\
      #text(weight: "bold")[Salida:] Métricas finales de los cuatro mejores checkpoints.

      #v(4pt)

      #grid(
        columns: (1.4em, 1fr),
        column-gutter: 3pt,
        row-gutter: 2.5pt,

        [1.], [Cargar y validar `manifesto_chips.csv`.],

        [2.], [
          Agrupar los chips en bloques espaciales de
          $32 times 32$ celdas.
        ],

        [3.], [
          Asignar bloques a entrenamiento, validación y prueba.
        ],

        [4.], [
          Aplicar un buffer espacial de dos chips entre particiones.
        ],

        [5.], [
          Calcular la media y desviación únicamente con entrenamiento.
        ],

        [6.], [
          Crear los DataLoaders con lotes de 32 imágenes.
        ],

        [7.], [
          Para cada arquitectura: EfficientNet-B0, ResNet-50,
          Swin-T y ViT-tiny:
        ],

        [], [
          #h(6pt) a) cargar pesos preentrenados de ImageNet;\
          #h(6pt) b) adaptar la salida a dos clases;\
          #h(6pt) c) entrenar durante un máximo de 30 épocas;\
          #h(6pt) d) calcular el macro F1 de validación;\
          #h(6pt) e) guardar el mejor checkpoint;\
          #h(6pt) f) detener tras siete épocas sin mejora.
        ],

        [8.], [
          Selecciona el mejor checkpoint de cada arquitectura.
        ],

        [9.], [
          Comparar el desempeño final de los cuatro checkpoints sobre el conjunto de prueba.
        ],
      )
    ]

    #line(length: 100%, stroke: 0.6pt + black)

    #block(
      width: 100%,
      inset: (x: 6pt, y: 3pt),
    )[
      #set text(size: 6.8pt)
      #text(style: "italic")[
        Configuración: CrossEntropyLoss, optimizador Adam,
        umbral de decisión 0.5 y parada temprana con paciencia 7.
      ]
    ]
  ],

  caption: [
    Procedimiento de entrenamiento, validación y selección del modelo.
  ],

  kind: raw,
  supplement: [Algoritmo],
) <alg-pipeline>
// ============================================================
// SECCIÓN 4: RESULTADOS
// ============================================================

= 4. Resultados

Esta sección evalúa el rendimiento de las cuatro arquitecturas (ResNet-50, EfficientNet-B0, Swin-T y ViT-tiny) sobre el conjunto de prueba de la corrida v2_bloques_tuned: 17,312 chips (50.2% com_garimpo), evaluados con umbral de decisión 0.5. A diferencia de la corrida inicial, el split train/val/test aquí no se hizo por chip individual ni por ráster completo, sino por bloques espaciales de 32×32 celdas con un buffer de 2 chips en las costuras entre bloques de distinto split, para evitar que la cercanía geográfica entre chips vecinos infle las métricas (ver Sección 3.3 para el detalle metodológico del split). Además, los cuatro modelos se entrenaron con normalización propia del dataset (calculada sobre los valores reales de intensidad de los chips amazónicos) en lugar de la normalización estándar de ImageNet.

== 4.1 Desempeño comparativo

La @tabla-resultados-finales resume las métricas de test de las cuatro arquitecturas.

#figure(
  table(
    columns: (auto, auto, auto, auto, auto, auto, auto),
    align: center,
    inset: 5pt,
    table.header([*Modelo*], [*Test Accuracy*], [*Test Macro F1*], [*F1 com_garimpo*], [*F1 sem_garimpo*], [*Recall com_garimpo*], [*Precision com_garimpo*]),
    [*ResNet-50*], [79.38%], [0.7938], [0.7922], [0.7955], [78.29%], [80.16%],
    [ViT-tiny], [77.50%], [0.7750], [0.7739], [0.7761], [76.74%], [78.06%],
    [Swin-T], [76.76%], [0.7667], [0.7808], [0.7526], [82.48%], [74.12%],
    [EfficientNet-B0], [76.87%], [0.7666], [0.7447], [0.7885], [67.24%], [83.45%],
  ),
  caption: [Métricas de test de arquitecturas evaluadas (v2_bloques_tuned).],
) <tabla-resultados-finales>

ResNet-50 fue el mejor modelo en el conjunto de prueba, con un F1 macro de 0.7938 y una exactitud de 79.38%. La @fig-precision-recall muestra las curvas precisión-recall de los cuatro modelos sobre test, donde se aprecia que EfficientNet-B0 y ResNet-50 dominan la mayor parte de la curva, mientras que Swin-T sacrifica precisión a cambio de un recall más agresivo.

#figure(
  image("figures/v2_bloques_tuned_precision_recall.png", width: 95%),
  caption: [Curvas de precisión-recall sobre el conjunto de test (v2_bloques_tuned).],
) <fig-precision-recall>

Es importante destacar que este orden no coincide con el de validación: durante el entrenamiento (@tabla-validacion), ViT-tiny fue el modelo con mejor F1 macro en validación (0.8240), seguido de cerca por Swin-T (0.8185) y ResNet-50 (0.8181). En test, sin embargo, ResNet-50 pasa al primer lugar y ViT-tiny cae al segundo. Esto sugiere que ResNet-50 generaliza mejor a bloques geográficos completamente nuevos que los transformers evaluados, que parecen ajustarse algo más a las particularidades de los bloques de validación. Es justamente el tipo de diferencia que un split por chip aleatorio (donde train y val comparten vecinos) no dejaría ver.

#figure(
  table(
    columns: (auto, auto, auto, auto, auto, auto),
    align: center,
    inset: 5pt,
    table.header([*Modelo*], [*Época óptima*], [*Épocas corridas*], [*Val Macro F1*], [*Val Accuracy*], [*Val Recall com_garimpo*]),
    [ViT-tiny], [8], [15], [0.8240], [82.42%], [83.81%],
    [Swin-T], [2], [9], [0.8185], [81.99%], [88.83%],
    [ResNet-50], [9], [16], [0.8181], [81.83%], [82.93%],
    [EfficientNet-B0], [5], [12], [0.8141], [81.43%], [76.07%],
  ),
  caption: [Resumen de validación durante el entrenamiento (v2_bloques_tuned).],
) <tabla-validacion>

El entrenamiento se hizo con lote de 32, un máximo de 30 épocas y Early Stopping con paciencia de 7; ResNet-50 y EfficientNet-B0 usaron una tasa de aprendizaje de $10^{-4}$, mientras que los dos transformers (Swin-T y ViT-tiny) usaron $3 times 10^{-5}$, siguiendo la práctica habitual de tasas más bajas para arquitecturas basadas en atención preentrenadas.

== 4.2 Resultados por arquitectura

*ResNet-50.* Es el modelo adoptado como línea de producción. Convergió en la época 9 de 16 corridas antes de que Early Stopping interrumpiera el entrenamiento. Sus curvas de entrenamiento (@fig-resnet-curves) muestran un loss de validación relativamente estable después de la época 6, sin señales fuertes de sobreajuste hacia el final. La matriz de confusión en test (@fig-resnet-conf) muestra 6,941 verdaderos negativos, 1,683 falsos positivos, 1,886 falsos negativos y 6,802 verdaderos positivos.

#figure(
  image("figures/resnet50_v2_bloques_tuned_training_curves.png", width: 95%),
  caption: [Curvas de entrenamiento de ResNet-50.],
) <fig-resnet-curves>

#figure(
  image("figures/resnet50_v2_bloques_tuned_test_confusion.png", width: 85%),
  caption: [Matriz de confusión de ResNet-50 en test.],
) <fig-resnet-conf>

*ViT-tiny.* Fue el mejor modelo en validación pero el segundo en test. Convergió en la época 8 de 15. Su matriz de confusión en test (@fig-vit-conf) muestra un patrón parecido al de ResNet-50 pero ligeramente peor en ambos frentes: 6,750 verdaderos negativos, 1,874 falsos positivos, 2,021 falsos negativos y 6,667 verdaderos positivos.

#figure(
  image("figures/vit_tiny_patch16_224_v2_bloques_tuned_training_curves.png", width: 95%),
  caption: [Curvas de entrenamiento de ViT-tiny.],
) <fig-vit-curves>

#figure(
  image("figures/vit_tiny_patch16_224_v2_bloques_tuned_test_confusion.png", width: 85%),
  caption: [Matriz de confusión de ViT-tiny en test.],
) <fig-vit-conf>

*Swin-T.* Es el caso más interesante de la corrida: convergió muy rápido, en solo la época 2 de 9, y muestra el recall más alto de los cuatro modelos en test (82.48%), a costa de la precisión más baja (74.12%). Su matriz de confusión (@fig-swin-conf) confirma este sesgo hacia sobre-detectar garimpo: 6,122 verdaderos negativos, 2,502 falsos positivos, 1,522 falsos negativos y 7,166 verdaderos positivos. Es el modelo más "alarmista" de los cuatro, y probablemente el más adecuado si el objetivo fuera minimizar estrictamente los falsos negativos, aunque eso implique más carga de verificación manual para los analistas.

#figure(
  image("figures/swin_tiny_patch4_window7_224_v2_bloques_tuned_training_curves.png", width: 95%),
  caption: [Curvas de entrenamiento de Swin-T.],
) <fig-swin-curves>

#figure(
  image("figures/swin_tiny_patch4_window7_224_v2_bloques_tuned_test_confusion.png", width: 85%),
  caption: [Matriz de confusión de Swin-T en test.],
) <fig-swin-conf>

*EfficientNet-B0.* Es el caso opuesto: el modelo más conservador, con el recall más bajo (67.24%) y la precisión más alta (83.45%) del grupo. Convergió en la época 5 de 12. Su matriz de confusión (@fig-eff-conf) tiene la mayor cantidad de falsos negativos de las cuatro arquitecturas: 7,465 verdaderos negativos, 1,159 falsos positivos, 2,846 falsos negativos y 5,842 verdaderos positivos. En el contexto de fiscalización ambiental, este es el comportamiento menos deseable de los cuatro, porque casi el 33% de los focos reales de garimpo en test no fueron detectados.

#figure(
  image("figures/efficientnet_b0_v2_bloques_tuned_training_curves.png", width: 95%),
  caption: [Curvas de entrenamiento de EfficientNet-B0.],
) <fig-eff-curves>

#figure(
  image("figures/efficientnet_b0_v2_bloques_tuned_test_confusion.png", width: 85%),
  caption: [Matriz de confusión de EfficientNet-B0 en test.],
) <fig-eff-conf>

== 4.3 Análisis de errores (ResNet-50)

Centrándonos en el modelo de producción, ResNet-50 se equivocó en 3,569 de los 17,312 chips de test (20.62%), repartidos en 1,683 falsos positivos y 1,886 falsos negativos. El recall de garimpo llegó a 78.29%, lo que en términos prácticos significa que el sistema detecta correctamente cerca de 8 de cada 10 focos reales de minería ilegal sin intervención humana; los otros 2 quedarían sin marcar y dependerían de otras fuentes de vigilancia para ser detectados.

A diferencia de la corrida anterior sobre el split por ráster, donde los falsos positivos superaban claramente a los falsos negativos, aquí el patrón se invierte ligeramente: hay algo más de falsos negativos (1,886) que de falsos positivos (1,683). Esto es consistente con un modelo algo más conservador que el de la corrida anterior, posiblemente porque el split por bloques, al eliminar la fuga espacial entre train y test, le quita al modelo la posibilidad de apoyarse en contexto geográfico compartido para "adivinar" correctamente parches ambiguos.

No se repitió, sobre este split, la revisión manual con muestra aleatoria de falsos positivos que se hizo en la corrida anterior. Dado que el dominio de la imagen no cambió (siguen siendo chips ópticos Sentinel-2 sobre el mismo territorio), es razonable asumir que las mismas fuentes de confusión espectral identificadas entonces (bancos de arena estacionales en época seca, ríos con alta turbidez que saturan el canal rojo, y claros naturales por caída de árboles) siguen siendo las explicaciones más plausibles del error residual, aunque esto queda como una hipótesis heredada y no como un hallazgo verificado sobre los datos de esta corrida.

// ============================================================
// SECCIÓN 5: DISCUSIÓN
// ============================================================

= 5. Discusión

== 5.1 Interpretación de resultados

El modelo de producción, ResNet-50, alcanza un F1 macro de 0.7938 y un recall de 78.29% para la clase com_garimpo sobre un conjunto de prueba de 17,312 chips completamente aislado por bloques geográficos del conjunto de entrenamiento. Como se discutió en la Sección 4, el recall sigue siendo la métrica prioritaria en este dominio: cada falso negativo es un foco de garimpo activo que el sistema no marca, mientras que un falso positivo solo le cuesta al analista una verificación adicional.

Un hallazgo relevante de esta corrida es el papel de la normalización. En una corrida previa sobre el mismo split por bloques pero usando la normalización estándar de ImageNet, el mejor modelo en test fue Swin-T, con un F1 macro de 0.7897. Al sustituir esa normalización por una calculada directamente sobre la distribución real de colores de los chips amazónicos (que resultaron ser considerablemente más oscuros que las imágenes de ImageNet), ResNet-50 pasó a ser el mejor modelo, con un F1 macro de 0.7938. Esto sugiere que, al menos para esta arquitectura, ajustar el preprocesamiento al dominio específico del dataset tuvo más impacto que la elección de la arquitectura en sí, y es consistente con la intuición de que los rangos dinámicos de reflectancia de la selva amazónica no se parecen a los de las fotografías cotidianas sobre las que se preentrena ImageNet.

== 5.2 Comparación cuantitativa con trabajos relacionados

La @tabla-comparacion-literatura actualiza la comparación de recall/F1 frente a los trabajos de mayor relevancia, usando ahora los resultados de test de la corrida v2_bloques_tuned.

#figure(
  table(
    columns: (1.6fr, 1.4fr, 1.2fr, 1.5fr),
    align: left,
    inset: 4pt,
    table.header(
      [*Trabajo*], [*Contexto*], [*Recall / F1*], [*Diferencia Recall*]
    ),
    [*Este trabajo (ResNet-50)*], [*Amazonía, 17.3K test*], [*78.29% recall*], [*referencia*],
    [Couttenier (2022) @couttenierMappingArtisanalSmallscale2022], [África, 1.75M km²], [42.0% recall], [+36.29 p.p.],
    [Lemes Neto (2026) @lemesnetoSARBasedMonitoringIllegal2026], [Amazonía SAR], [F1=63.0--67.6%], [+14.08 p.p. F1],
    [Pasanisi (2025) @pasanisiUsingHighResolutionSatellite2025], [Congo, fusión], [F1=73.0%], [+6.38 p.p. F1],
    [Camalan (2022) @camalanChangeDetectionAmazonian2022c], [MDD Perú, 6ch], [F1=88.0%], [-8.62 p.p. F1],
    [Grupioni (2026) @grupioniDeteccaoGarimpoNa2026], [Mismo dataset], [Acc=85.92%], [-6.54 p.p. Acc],
  ),
  caption: [Comparación cuantitativa del Recall y F1-Score (actualizada).],
) <tabla-comparacion-literatura>

La comparación más importante de toda esta tabla es la última fila, contra el propio trabajo de referencia del dataset. Grupioni et al. reportan 85.92% de accuracy, casi 6.5 puntos por encima de nuestro 79.38%. La diferencia, sin embargo, no debería leerse como que nuestro modelo es peor: viene principalmente de cómo se particionó el conjunto de prueba en cada caso. Grupioni et al. usan un split aleatorio por chip, donde chips vecinos (que comparten la misma cuenca, la misma cobertura de nubes del mosaico y, en muchos casos, literalmente la misma franja de terreno vista desde ángulos ligeramente distintos) pueden terminar uno en train y su vecino en test. Eso le da al modelo una oportunidad de "memorizar" el contexto geográfico local en vez de aprender a generalizar a territorio nunca visto, lo cual infla artificialmente el accuracy reportado.

El split por bloques que usamos aquí (bloques completos de 32×32 celdas repartidos entre train/val/test, con un buffer de descarte en las costuras) elimina esa fuga de información. El resultado es un número más bajo, pero también más honesto: es la estimación más cercana a lo que se puede esperar si este modelo se despliega sobre un tramo de selva que el modelo jamás vio durante el entrenamiento, que es exactamente el escenario de uso real de un sistema de alerta temprana.




// ============================================================
// SECCIONES FINALES
// ============================================================

= 6. Conclusiones

El presente estudio establece que el Transfer Learning con la arquitectura ResNet50 preentrenada en ImageNet constituye una estrategia válida y reproducible para la detección binaria automatizada de minería ilegal (*garimpo*) en la Amazonía. Evaluado sobre el conjunto de prueba de 17,312 imágenes, el modelo ResNet-50 alcanzó una exactitud global del 79.38%, un F1-Score Macro del 79.38% y un Recall del 78.29% para la clase de garimpo activo. Estos resultados confirman que las características espectro-espaciales aprendidas mediante Transfer Learning superan la capacidad de monitoreo manual tradicional, que resulta físicamente imposible a la escala de la cuenca amazónica. El Recall obtenido supera en 36.29 puntos porcentuales el mejor resultado comparable de la literatura en detección de minería artesanal con segmentación CNN pura.

La evaluación comparativa entre las cuatro arquitecturas evaluadas (ResNet-50, EfficientNet-B0, Swin Transformer y ViT-Tiny) revela que ResNet-50 alcanza el mayor F1 Macro global. El experimento de preentrenamiento vs. entrenamiento desde cero confirma que el Transfer Learning desde ImageNet es indispensable, especialmente para el Swin Transformer, cuyo F1 colapsa de 0.7456 a 0.3118 sin pesos iniciales. Estos hallazgos validan el uso de ResNet-50 con Transfer Learning como línea base metodológica para futuros sistemas de alertas tempranas de deforestación por actividades extractivas a escala regional.

= 7. Limitaciones y trabajos futuros

El modelo conserva limitaciones que conviene tener en cuenta antes de pensar en un despliegue operativo. La primera es la confusión espectral con formaciones naturales similares a las cicatrices del garimpo, descrita en la Sección 4.3; aunque no se re-auditó específicamente sobre este split, no hay razón para pensar que el fenómeno haya desaparecido, dado que sigue habiendo 1,683 falsos positivos y 1,886 falsos negativos en test. La segunda es la dependencia exclusiva de imágenes ópticas, que deja al sistema ciego durante la temporada de nubes densas; resolver esto probablemente requiera integrar datos de radar SAR, como se discute en @lemesnetoSARBasedMonitoringIllegal2026. La tercera es que, incluso con un presupuesto de hasta 30 épocas y una paciencia de 7 para el Early Stopping, ResNet-50 volvió a converger temprano (en la época 9, igual que en la corrida anterior), lo que sugiere que el techo de esta arquitectura sobre este dataset ronda el 79-80% de accuracy en test bajo el split actual, y que ganancias adicionales probablemente vendrán más de mejoras en los datos (fusión con SAR, más rásteres de entrenamiento) que de entrenar por más tiempo.

Para mejorar la capacidad predictiva del sistema, el siguiente paso lógico es extender el entrenamiento de la red ResNet-50. En nuestro experimento limitamos las iteraciones por restricciones computacionales, pero aumentar el ciclo a un rango de 50 a 100 épocas debería estabilizar la curva de aprendizaje. Este aumento requerirá calibrar cuidadosamente la tasa de aprendizaje mediante una búsqueda en cuadrícula, lo que evitará que el modelo memorice los datos en las etapas finales. Como demostró Grupioni et al. @grupioniDeteccaoGarimpoNa2026, aplicar un ajuste fino prolongado sobre este conjunto masivo de imágenes suele elevar considerablemente la exactitud general, acercando el modelo a los estándares necesarios para su despliegue en producción.

Por otro lado, la clasificación binaria actual solo nos indica si existe o no minería en un bloque de $128 times 128$ píxeles, pero no muestra la forma exacta del daño ambiental. Para solucionar esta limitación, proponemos migrar hacia modelos de segmentación semántica profunda, como U-Net o DeepLab. Estas arquitecturas permitirán dibujar los límites geográficos de los garimpos y las pozas de relave directamente sobre el mapa, logrando una precisión a nivel de píxel. Pasar de una simple alerta espacial a calcular matemáticamente el área deforestada le dará a las autoridades una herramienta mucho más operativa para planificar sus intervenciones en la selva.

= Apéndice A: Implementación de DataLoader

A continuación se detalla el código completo del cargador de datos geoespaciales. Este script materializa el particionamiento de los datos masivos del garimpo.

#figure(
  align(left)[
  #rect(width: 95%, inset: 10pt, fill: luma(250))[
    ```python
    import torch
    from torch.utils.data import Dataset
    from PIL import Image
    import pandas as pd
    import os

    class GarimpoDataset(Dataset):
        def __init__(self, csv_file, img_dir, transform=None):
            self.data = pd.read_csv(csv_file)
            self.img_dir = img_dir
            self.transform = transform
            
        def __len__(self):
            return len(self.data)
            
        def __getitem__(self, idx):
            img_name = self.data.iloc[idx]['png_path']
            img_path = os.path.join(self.img_dir, img_name)
            image = Image.open(img_path).convert('RGB')
            
            label = self.data.iloc[idx]['label_int']
            
            if self.transform:
                image = self.transform(image)
                
            return image, torch.tensor(label, dtype=torch.long)
    ```
  ]
  ],
  caption: [Implementación de la clase Dataset en PyTorch.]
)

= Apéndice B: Configuración del Bloque Residual

El siguiente código presenta la implementación a bajo nivel del bloque de cuello de botella residual (*bottleneck block*), fundamental para la mitigación del desvanecimiento del gradiente en las arquitecturas ResNet-50 aplicadas al bosque tropical.

#figure(
  align(left)[
  #rect(width: 95%, inset: 10pt, fill: luma(250))[
    ```python
    import torch.nn as nn

    class BloqueResidualCuelloBotella(nn.Module):
        def __init__(self, in_channels, filtros, stride=1):
            super().__init__()
            f1, f2, f3 = filtros
            
            self.conv1 = nn.Conv2d(in_channels, f1, kernel_size=1, stride=stride, bias=False)
            self.bn1 = nn.BatchNorm2d(f1)
            
            self.conv2 = nn.Conv2d(f1, f2, kernel_size=3, padding=1, bias=False)
            self.bn2 = nn.BatchNorm2d(f2)
            
            self.conv3 = nn.Conv2d(f2, f3, kernel_size=1, bias=False)
            self.bn3 = nn.BatchNorm2d(f3)
            self.relu = nn.ReLU(inplace=True)
            
            self.shortcut = nn.Sequential()
            if stride != 1 or in_channels != f3:
                self.shortcut = nn.Sequential(
                    nn.Conv2d(in_channels, f3, kernel_size=1, stride=stride, bias=False),
                    nn.BatchNorm2d(f3)
                )

        def forward(self, x):
            identidad = self.shortcut(x)
            
            out = self.relu(self.bn1(self.conv1(x)))
            out = self.relu(self.bn2(self.conv2(out)))
            out = self.bn3(self.conv3(out))
            
            out += identidad
            out = self.relu(out)
            return out
    ```
  ]
  ],
  caption: [Estructura interna matemática del bloque residual (Bottleneck) en PyTorch.]
)

= Apéndice C: Infraestructura Computacional y Tiempos de Entrenamiento

El entrenamiento de redes neuronales de profundidad masiva como ResNet-50 requiere una infraestructura de hardware altamente especializada para paralelizar operaciones tensoriales. Este experimento se ejecutó íntegramente sobre una estación de trabajo equipada con una Unidad de Procesamiento Gráfico (GPU) NVIDIA RTX 3090 con 24 GB de memoria VRAM GDDR6X, complementada por un procesador AMD Ryzen 9 5900X de 12 núcleos y 64 GB de memoria RAM DDR4. La disponibilidad de 24 GB de VRAM resultó crítica para alojar el enorme conjunto de parámetros de ResNet-50 y procesar iterativamente los lotes estocásticos de 32 imágenes a máxima resolución sin incurrir en cuellos de botella de paginación (*Out-of-Memory Errors*).

El tiempo de cálculo para cada época completa del conjunto de entrenamiento masivo (89,267 imágenes) fue de aproximadamente 14 minutos utilizando la arquitectura de aceleración unificada CUDA 12.1 y la biblioteca de primitivas cuDNN 8.9. El entrenamiento total, abarcando las 14 épocas dictadas por el mecanismo dinámico de parada temprana (*Early Stopping*), consumió un estimado acumulado de 3 horas y 15 minutos continuos. En contraste, los benchmarks de entrenamiento en la unidad central de procesamiento (CPU) pura promediaron 3 horas y 40 minutos *por época*, lo que habría extendido el proceso total a más de 50 horas, demostrando la inviabilidad logística de prescindir de aceleración de hardware en contextos de teledetección a gran escala [@grupioniDeteccaoGarimpoNa2026, @liuDiscriminativeSpectralSpatialSemanticFeature2022, @scheibenreifSelfsupervisedVisionTransformers2022, @LandUseLand2023, @dosovitskiyImageWorth16x162021, @yosinskiHowTransferableAre2014, @Mdpicom2076341712, @tanEfficientNetRethinkingModel2020, @farahnakianMachineLearningAlgorithms2024, @safonovaTenDeepLearning2023, @xuComparativeStudyShallow2022, @balaniukMiningTailingsDam2020, @lemesnetoSARBasedMonitoringIllegal2026, @pasanisiUsingHighResolutionSatellite2025, @ceciliLandCoverMapping2023].

Para el despliegue del modelo en un escenario de fiscalización ambiental en tiempo real, el proceso de inferencia (*Forward Pass*) requiere una demanda computacional significativamente menor. Procesar un recorte satelital individual toma apenas 18 milisegundos en la misma GPU. A este ritmo, clasificar la superficie equivalente a la Reserva Nacional Tambopata en Perú (aproximadamente 2,746 km² o 43,000 recortes de $128 times 128$) requeriría un tiempo administrativo total de inferencia de 13 minutos netos, un rendimiento sin precedentes comparado con los meses de trabajo humano necesarios para realizar una evaluación visual equivalente.

= Apéndice D: Implementación del Ciclo de Entrenamiento en PyTorch

A fin de garantizar la absoluta reproducibilidad del experimento científico, el código fuente completo del ciclo de entrenamiento (Training Loop), incluyendo la instanciación de ResNet-50 mediante la biblioteca `timm`, la configuración del cabezal de clasificación de dos salidas, y la compilación con la función `CrossEntropyLoss` y el optimizador Adam, se encuentra documentado y publicado íntegramente en el repositorio oficial de GitHub del proyecto. Se ha omitido su transcripción directa para priorizar la densidad de discusión analítica y cumplir con las normativas de extensión del formato IEEE.





= Apéndice E: Derivación Matemática de la Convolución Espacial

Para profundizar en el rigor analítico del mecanismo de extracción de características implementado, se presenta la formalización matemática del núcleo convolucional. La operación fundamental de convolución bidimensional continua, discretizada para los tensores de entrada $X$ (representando los parches multiespectrales de Sentinel-2) y el kernel de pesos entrenables $W$, se define como:

$ S(i, j) = (X * W)(i, j) = sum_m sum_n X(i - m, j - n) W(m, n) $

Donde $S(i, j)$ representa el mapa de características resultante (*Feature Map*) en la coordenada espacial $(i, j)$. Debido a que la correlación cruzada es conmutativa y computacionalmente más eficiente en implementaciones de hardware tensorial (como las GPUs NVIDIA RTX utilizadas), bibliotecas como cuDNN optimizan esta ecuación omitiendo la rotación matricial del kernel:

$ S(i, j) = (X star W)(i, j) = sum_m sum_n X(i + m, j + n) W(m, n) $

Durante el proceso de entrenamiento de ResNet-50, la actualización de los pesos matriciales $W$ depende directamente del algoritmo de propagación hacia atrás (*Backpropagation*). El cálculo del gradiente de la función de costo global $L$ respecto a un peso escalar específico $W_{m,n}$ dentro de un estrato profundo requiere la aplicación recursiva de la regla de la cadena del cálculo diferencial:

$ (partial L) / (partial W_{m,n}) = sum_i sum_j (partial L) / (partial S_{i,j}) (partial S_{i,j}) / (partial W_{m,n}) $

Sustituyendo la derivada parcial de la activación local, la ecuación diferencial de optimización se materializa en:

$ (partial L) / (partial W_{m,n}) = sum_i sum_j delta_{i,j} X_{i+m, j+n} $

Donde $delta_{i,j}$ denota el término de error retro-propagado desde las capas superiores. Esta formulación matricial es la que el optimizador Adam emplea en cada época para ajustar adaptativamente el vector hiperdimensional de parámetros, permitiendo que la arquitectura asimile progresivamente las formas serpentinas de los ríos y las pozas de deforestación provocadas por la actividad minera.

*CRediT authorship contribution statement*
J. Ajra, L. Luque, P. Cari, F. Garambel y A. Quispe contribuyeron equitativamente en la conceptualización, software, validación y análisis de este trabajo.

*Declaration of competing interest*
Los autores declaran explícitamente que no existe ningún conflicto de intereses financiero, personal o institucional que pudiera haber influido en los resultados o la interpretación de este estudio.

*Ethical statement*
Este estudio no involucró experimentos con humanos ni animales, por lo que no se requirió aprobación de un comité de ética institucional.

*Consent to participate*
No aplica.

*Consent for publication*
No aplica.

*Funding*
No aplica (este estudio no recibió financiamiento externo de agencias públicas o privadas).

*Acknowledgement*
No aplica.

*Code availability*
Los scripts de análisis y el código fuente completo del ciclo de entrenamiento están disponibles públicamente en el repositorio oficial del proyecto en GitHub.

*Data availability*
El conjunto de datos "Amazonia Garimpo Binario" que da soporte a los hallazgos de este estudio es de acceso público y está alojado en la plataforma Kaggle.
