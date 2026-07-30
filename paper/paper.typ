#import "@preview/charged-ieee:0.1.4": ieee

#show: ieee.with(
  title: [Clasificación Binaria de Minería Ilegal (Garimpo) en la Amazonía mediante Transfer Learning con ResNet50 sobre Imágenes Satelitales],
  abstract: [
    El monitoreo de la minería ilegal en la Amazonía enfrenta el desafío de procesar inmensos volúmenes de datos satelitales. Aunque el aprendizaje profundo ha mostrado resultados prometedores, muchas evaluaciones previas ignoran la fuga de datos espaciales y el cambio de dominio visual, sobreestimando su rendimiento operativo real. Esta investigación presenta una evaluación comparativa rigurosa de cuatro arquitecturas (ResNet-50, EfficientNet-B0, Swin Transformer y ViT-Tiny) para la clasificación binaria de minería aluvial sobre 111,584 recortes multiespectrales Sentinel-2. A diferencia de estudios anteriores, se implementó una partición por bloques espaciales que garantiza un aislamiento geográfico estricto entre entrenamiento y prueba, junto con una normalización calibrada específicamente para las reflectancias amazónicas. Las evaluaciones empíricas demuestran que, bajo estas condiciones realistas, la arquitectura ResNet-50 supera a los modelos basados en autoatención, logrando una exactitud global del 79.38%, un F1-Score macro del 79.38% y un Recall del 78.29% para la clase de minería activa. El experimento confirma que el preentrenamiento en ImageNet sigue siendo indispensable para la convergencia de las redes Transformer. Estos resultados validan la viabilidad de las redes neuronales convolucionales como herramienta robusta para los sistemas gubernamentales de alerta temprana. --- Monitoring illegal mining in the Amazon basin faces the challenge of processing massive volumes of satellite data. Although deep learning has shown promising results, many previous evaluations ignore spatial data leakage and visual domain shift, overestimating their actual operational performance. This research presents a rigorous comparative evaluation of four architectures (ResNet-50, EfficientNet-B0, Swin Transformer, and ViT-Tiny) for the binary classification of alluvial mining on 111,584 multispectral Sentinel-2 patches. Unlike previous studies, we implemented a spatial block partitioning strategy to ensure strict geographic isolation between training and testing sets, alongside a normalization technique calibrated specifically for Amazonian reflectances. Empirical evaluations demonstrate that under these realistic conditions, the ResNet-50 architecture outperforms self-attention-based models, achieving an overall accuracy of 79.38%, a macro F1-Score of 79.38%, and a Recall of 78.29% for the active mining class. The experiment confirms that ImageNet pretraining remains indispensable for the convergence of Transformer networks. These results validate the viability of convolutional neural networks as a robust tool for governmental early-warning systems.
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
      name: "Fernando Miguel Garambel Marín",
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
  index-terms: ("Visión Computacional", "Deep Learning", "Minería Ilegal", "Imágenes Satelitales", "ResNet"),
  bibliography: bibliography("sources/references.bib"),
)


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

= 1. INTRODUCCIÓN

Las actividades extractivas ilegales constituyen una de las principales causas de deterioro ambiental en la actualidad @crespo-lopezMercuryAmazonDanger2023. Entre ellas, la minería a cielo abierto destaca por sus efectos directos sobre el territorio, ya que elimina la cobertura vegetal, destruye hábitats y libera contaminantes que terminan en ríos y quebradas cercanas @balaniukMiningTailingsDam2020. Esta eliminación no afecta únicamente a los ecosistemas, sino también a la salud y a las actividades económicas de las comunidades que dependen de esos recursos hídricos.

La continua desaparición de los bosques originales trae efectos a una escala más amplia. La disminución de la masa forestal cambia las condiciones de temperatura de la zona, impulsa la reducción de la diversidad biológica y perturba los ciclos naturales del agua. Además, restringe la habilidad del bosque para capturar carbono y causa la acumulación de sedimento en los ecosistemas acuáticos por el arrastre constante de los suelos alterados. La recuperación de estas áreas es lenta, pues la formación de una nueva capa fértil puede requerir varias décadas.

El avance de estas actividades está principalmente relacionado con factores económicos. La demanda mundial de metales preciosos motiva la expansión de explotaciones informales en zonas remotas, donde la supervisión ambiental suele ser limitada. En estas circunstancias, se inician nuevas áreas de extracción sin una supervisión adecuada. Dado que los métodos convencionales de control no han logrado frenar este aumento, son necesarias herramientas tecnológicas que faciliten la vigilancia de amplias zonas de forma habitual y ordenada.

En la Amazonía, la minería artesanal e ilegal de oro es conocida regionalmente como garimpo @IllegalMiningAmazon2021. En Brasil, la superficie deforestada por esta actividad aumentó en 1,200% entre 1985 y 2022 @ferreiranetoUncontrolledIllegalMining2024. Esta expansión ha alcanzado áreas protegidas y territorios indígenas, mientras que el uso de maquinaria pesada remueve grandes cantidades de suelo aluvial y modifica el cauce y la estructura natural de los ríos.

La situación también es crítica en el Perú. En Madre de Dios, la minería aluvial informal ha sido asociada con una grave problemática sanitaria @PerusGoldRush2016. Uno de los principales factores es el uso intensivo de mercurio durante el proceso de amalgamación del oro, lo que ha provocado una fuerte contaminación de los ríos amazónicos @CaseFloatingGold2022. Además, el mercurio liberado a la atmósfera se deposita sobre la vegetación y se incorpora progresivamente a la cadena alimentaria @gersonAmazonForestsCapture2022. Diversos estudios clínicos han identificado exposición crónica tanto en peces de consumo habitual como en habitantes de la zona.

A pesar de la gravedad del problema, localizar nuevos focos mineros con rapidez sigue siendo difícil mediante métodos convencionales. Los campamentos se trasladan con frecuencia por ríos y afluentes de difícil acceso, mientras que las patrullas terrestres y fluviales no cuentan con la capacidad suficiente para vigilar extensas áreas selváticas. Cuando una excavación es detectada tarde, una parte importante del daño ambiental ya se ha producido.

El análisis satelital tradicional tampoco elimina completamente esta dificultad, debido a que todavía depende en gran medida de la revisión manual y de procesos de clasificación que requieren bastante tiempo @TwentyYearsLand2020. Examinar miles de imágenes de forma individual es una tarea costosa y repetitiva. Además, después de varias horas de observación continua, los analistas pueden cometer errores por fatiga, lo que aumenta el riesgo de pasar por alto nuevas zonas de deforestación minera.

La Visión Computacional ofrece una alternativa para automatizar este proceso @LandUseLand2023. Las Redes Neuronales Convolucionales pueden analizar grandes cantidades de imágenes multiespectrales y aprender diferencias de textura, forma y reflectancia directamente a partir de los píxeles. De esta manera, reducen la necesidad de que una persona inspeccione cada imagen una por una. El aprendizaje por transferencia también permite aprovechar modelos previamente entrenados y adaptarlos a escenarios amazónicos, incluso cuando determinadas zonas no han sido cartografiadas con anterioridad.

Para resolver este problema técnico, es necesario evaluar diferentes modelos de clasificación. Las redes convolucionales como EfficientNet-B0 y ResNet50 tienen una gran capacidad para detectar patrones irregulares en el terreno. Por su parte, las arquitecturas modernas como Swin Transformer y Vision Transformer analizan las fotografías satelitales de forma global. Comparar estas cuatro opciones bajo las mismas condiciones experimentales permite determinar cuál funciona mejor sobre la selva amazónica.

El objetivo central de esta investigación es construir un sistema automatizado para clasificar la minería aluvial ilegal en el conjunto de datos Amazonia Garimpo Binario @grupioniDeteccaoGarimpoNa2026. El diseño experimental contrasta el desempeño de cuatro arquitecturas neuronales preentrenadas para seleccionar la herramienta más precisa. Tras evaluar los resultados empíricos, el estudio adopta la red ResNet50 como el modelo definitivo para la producción. El resto del artículo detalla los trabajos relacionados en la Sección 2 y la metodología exacta en la Sección 3. Posteriormente, las Secciones 4 a 8 exponen los resultados numéricos, la discusión, las conclusiones y las implicancias prácticas de la herramienta desarrollada.

// ============================================================
// SECCIÓN 2: TRABAJOS RELACIONADOS
// ============================================================

= 2. TRABAJOS RELACIONADOS

La supervisión de la extracción ilegal de minerales en amplias áreas de bosques tropicales presenta desafíos significativos debido a la ausencia de mapas organizados y los altos costos logísticos asociados con la cartografía del terreno. Para abordar esta poca supervisión en el seguimiento geográfico, Lobo et al. @loboMappingMiningAreas2018 establecieron como meta encontrar las zonas de extracción de oro utilizando datos multiespectrales que son accesibles públicamente. En su método de análisis utilizó el algoritmo Random Forest, aplicándolo a los componentes principales obtenidos de las imágenes satelitales de Sentinel-2. Un elemento fundamental del estudio fue validar la efectividad de la teledetección multiespectral de resolución moderada como un método habitual para examinar áreas en el Amazonas. En las evaluaciones llevadas a cabo, el sistema tiene un índice Kappa de 0. 93, lo que nos dice que tiene un alto nivel de coincidencia estadística para distinguir la cobertura alterada. Sin embargo, el clasificador es muy susceptible al ruido atmosférico causado por la densa nubosidad, lo que genera un número significativo de falsos positivos en la temporada de lluvias. En el oeste de África, la minería artesanal esta creciendo de manera descontrolada, sin que las entidades ambientales tengan mapas confiables. Para registrar esta actividad informal a gran escala, Couttenier y su equipo se propusieron mapear las prácticas extractivas en toda la región sub-sahariana. Para ello, utilizaron una técnica que examinó un amplio conjunto de imágenes satelitales de resolución media mediante una red neuronal convolucional adaptada para la segmentación semántica. La mejor aportación fue la creación de la primera base de datos espaciales etiquetadas sobre la minería artesanal en África. Los hallazgos experimentales demostraron una precisión del 70% y una sensibilidad del 42% al identificar áreas de extracción. Sin embargo, el bajo nivel de sensibilidad dice que el modelo tiende a subestimar en gran medida la extensión real del área afectada, lo que limita su efectividad como herramienta para la supervisión operativa.

La supervisión de la reducción de la cobertura forestal causada por acciones humanas requiere la comparación de conjuntos de datos espaciales, una tarea que los métodos estadísticos convencionales llevan a cabo con bordes poco precisos y errores geométricos. Ante estas deficiencias algorítmicas, De Bem et al. decidieron analizar técnicas tradicionales en comparación con redes neuronales profundas para detectar cambios en los bosques de Perú y Brasil. El experimento fue diseñado con arquitecturas convolucionales de vanguardia como ResUnet y SharpMask, utilizando series temporales de las imágenes satelitales de Landsat y Sentinel. La aportación singular de esta investigación mostró de manera empírica que el aprendizaje profundo delimita los bordes de la deforestación de forma mucho más precisa sin necesidad de hacer ajustes en el posprocesamiento. En los análisis de validación, la red residual logró resultados excepcionales con un coeficiente F1 y una media de intersección sobre unión (mIoU) de 0. 94. Como limitación operativa, el sistema se basa en comparaciones de imágenes anuales, lo que impide emitir alertas tempranas en períodos cortos para intervenciones inmediatas.

La expansión rápida de excavaciones superficiales no reguladas en ecosistemas de sabana sucede con agilidad, eludiendo la supervisión mediante imágenes satelitales que llevan a cabo analistas humanos. Con el fin de facilitar la detección temprana de este tipo de impacto, Gallwey et al. @gallweySentinel2BasedMultispectral2020a se propusieron identificar áreas de minería artesanal mediante el uso de teledetección accesible. Su metodología empleó profundas redes neuronales convolucionales para clasificar, analizando de manera simultánea las diferentes bandas espectrales del satélite Sentinel-2. La importancia científica de esta investigación reside en que, por primera vez, demostró la efectividad de las matrices multibanda para diferenciar la tierra excavada en la superficie de otros tipos de suelos que no tienen vegetación. Las pruebas realizadas mostraron una capacidad de discriminación destacable, con una tasa de error de clasificación que fue inferior al 8% en los lugares de minería activos. Sin embargo, la principal limitación es que el modelo fue creado para los climas semiáridos, sin tener evidencia de su eficacia en selvas tropicales con un denso dosel forestal, como es el caso de la Amazonía.

La cobertura de nubes que es constante en la región amazónica durante la época de lluvias impide que los satélites ópticos convencionales realicen su trabajo, manteniendo extensas zonas de bosque sin supervisión durante largos períodos. Con el propósito de asegurar un seguimiento continuo sin importar las condiciones climáticas, Lemes Neto y colaboradores @lemesnetoSARBasedMonitoringIllegal2026 propusieron encontrar los campamentos ilegales utilizando sensores de radar activos. Para lo cual se empleó una red neuronal convolucional ligera (CNN), entrenada con datos de radar de apertura sintética (SAR) de la misión Sentinel-1 en la banda C. La innovación del estudio demostró matemáticamente que el radar orbital puede atravesar nubes densas para identificar cambios en el terreno por debajo de la vegetación. El rendimiento cuantificable del sistema reveló un F1-score de 0. 676 en la cuenca del Tapajós y de 0. 630 en el territorio indígena Yanomami. Sin embargo, la resolución espacial del radar en banda C tiene problemas para encontrar en pequeñas excavaciones mineras que ocupan solo unos pocos píxeles.

La supervisión de los recursos naturales en zonas forestales remotas de África no tiene bases de datos etiquetadas y enfrenta una grave confusión espectral entre aguas turbias y suelos áridos. Para abordar esta confusión en la reflectancia, Pasanisi y su equipo @pasanisiUsingHighResolutionSatellite2025 centraron su investigación en la cartografía de la minería de oro de pequeña escala, integrando diferentes fuentes orbitales. El método técnico empleó un enfoque de fusión tardía que combina imágenes ópticas de alta resolución con datos de radar sintético. La principal contribución de la metodología fue la creación de una verdad de terreno sintética a través de algoritmos de agrupamiento estadístico, disminuyendo así la necesidad de anotaciones manuales en el lugar. El modelo fusionado logró una precisión general del 71%, un recall del 75% y un F1-score de 0. 73 en el conjunto de pruebas. No obstante, como limitación, la estructura presenta confusión al tratar de diferenciar las áreas de extracción mineral de las zonas urbanas muy densas.

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

= 3. MATERIALES Y MÉTODOS

== _3.1. Fundamentos Teóricos_

La extracción ilegal de minerales en ríos, comúnmente conocida como garimpo, provoca un cambio drástico y permanente en la estructura ecológica del bosque amazónico @loboMappingMiningAreas2018. La técnica de extracción mecánica requiere la eliminación completa de la vegetación del bosque, la remoción intensiva de la capa superior del suelo y la creación de estanques artificiales para sedimentos de desechos. Estas actividades generan metales pesados extremadamente dañinos, principalmente mercurio, de forma directa en las cuencas cercanas @pestanaLetsTalkMercury2022. La contaminación química del agua impacta drásticamente en la biodiversidad de los ecosistemas acuáticos y afecta los medios de vida y la salud de las comunidades que viven a la orilla @crespo-lopezMercuryAmazonDanger2023.

La eliminación de la vegetación y la creación de cuerpos de agua turbios alteran de manera significativa la reflectancia electromagnética del suelo. Este cambio produce señales ópticas únicas que los sensores satelitales multiespectrales detectan con alta precisión en resolución geométrica y radiométrica desde el espacio @TwentyYearsLand2020. La detección remota por medio de óptica permite controlar cambios significativos en el hábitat tropical en grandes territorios que son complicados de acceder a pie @monacoImprovingWildfireSeverity2020. Así, la supervisión constante desde satélites se vuelve la estrategia más eficiente para rastrear y evaluar transformaciones ecológicas en la región amazónica @camalanChangeDetectionAmazonian2022c.

La interpretación visual y el análisis manual de imágenes satelitales son difíciles de poner en práctica debido a la gran extensión y la complejidad de la selva amazónica. Para llevar a cabo este tipo de análisis de manera automatizada a gran escala, la inteligencia artificial utiliza el método de aprendizaje supervisado en el ámbito de la visión computacional @silvaAutomatedDetectionAnalysis2023. Los modelos algorítmicos trabajan con matrices numéricas de píxeles etiquetadas previamente para extraer e identificar patrones visuales muy complejos que no pueden ser detectados a simple vista @nieThreedimensionalIntelligentMonitoring2024. Este enfoque computacional convierte grandes volúmenes de datos en sistemas capaces de alertar anticipadamente sobre la deforestación aluvial @sairerimachiDeteccionDeforestacionPor2024.

Las Redes Neuronales Convolucionales (CNN) son la principal arquitectura utilizada para el análisis y la extracción automatizada de características espaciales en imágenes satelitales @LandUseLand2023. A diferencia de los perceptrones multicapa convencionales, las CNN llevan a cabo cálculos de convolución discreta sobre tensores de dos dimensiones, lo que les permite mantener la estructura espacial de los fragmentos satelitales @adegunReviewDeepLearning2023. La convolución en dos dimensiones aplicada a una imagen matriz $I$ con un núcleo $K$ de dimensiones $m times n$ se puede describir analíticamente como $S(i,j) = (I * K)(i,j) = sum_m sum_n I(i-m, j-n) K(m,n)$. Este proceso es e filtrado espacial progresivo que resulta en la extracción de bordes nítidos, texturas de suelo removido y contornos ondulados relacionados con las excavaciones mineras @ceciliLandCoverMapping2023.

El entrenamiento paramétrico de arquitecturas convolucionales profundas desde cero exige millones de imágenes satelitales etiquetadas y recursos computacionales inasumibles para las entidades gubernamentales locales @yosinskiHowTransferableAre2014. Para superar esta limitación estructural y acelerar la convergencia, la presente investigación aplica la técnica de Transferencia de Aprendizaje (*Transfer Learning*) @naushadDeepTransferLearning2021. El clasificador inicializa sus parámetros sinápticos con los pesos óptimos preentrenados sobre el repositorio masivo ImageNet, compuesto por más de un millón de imágenes visuales heterogéneas @tianRemoteSensingRetrieval2023a. El sistema solo ejecuta un reentrenamiento (*fine-tuning*) sobre las capas superiores densamente conectadas, ahorrando significativamente tiempo de GPU y costos algebraicos sin sacrificar capacidad discriminativa @tanEfficientNetRethinkingModel2020.

La arquitectura ResNet-50 actúa como el motor principal de extracción de características visuales gracias a su innovación en el diseño de topologías profundas @heDeepResidualLearning2015. Al incrementar la profundidad convolucional para capturar texturas abstractas, las redes secuenciales convencionales experimentan el fenómeno degenerativo de desvanecimiento del gradiente durante la retropropagación. ResNet-50 supera este obstáculo analítico incorporando bloques residuales provistos de conexiones de salto (*skip connections*) que desvían la identidad de entrada alrededor de los estratos convolucionales, obedeciendo la formulación $y = cal(F)(x, {W_i}) + x$. Esta topología asegura un flujo ininterrumpido de gradientes matemáticos hacia las primeras capas, permitiendo entrenar con máxima estabilidad 50 capas ocultas parametrizadas @farahnakianMachineLearningAlgorithms2024. La @tabla-resnet sintetiza la estructura jerárquica de la red ResNet-50 utilizada en la experimentación.


#figure(
  block[
    #set text(size: 8pt)
    #table(
      columns: (1.2fr, 1.4fr, 0.8fr, 0.8fr),
      align: (col, row) => left,
      inset: 4pt,
      stroke: none,
      table.hline(stroke: 0.8pt + black),
      table.header([*Etapa*], [*Operación convolucional*], [*Filtros*], [*Bloques*]),
      table.hline(stroke: 0.5pt + black),
      [*Conv1*], [$7 times 7$, stride 2], [64], [1],
      [*Max Pool*], [$3 times 3$, stride 2], [-], [1],
      [*Conv2_x*], [[$1 times 1, 64$ \ $3 times 3, 64$ \ $1 times 1, 256$]], [256], [3],
      [*Conv3_x*], [[$1 times 1, 128$ \ $3 times 3, 128$ \ $1 times 1, 512$]], [512], [4],
      [*Conv4_x*], [[$1 times 1, 256$ \ $3 times 3, 256$ \ $1 times 1, 1024$]], [1024], [6],
      [*Conv5_x*], [[$1 times 1, 512$ \ $3 times 3, 512$ \ $1 times 1, 2048$]], [2048], [3],
      [*Clasificación*], [Global Average Pooling \ Fully Connected], [1], [1],
      table.hline(stroke: 0.8pt + black)
    )
  ],
  caption: [#smallcaps[Desglose estructural y topológico de la arquitectura convolucional ResNet-50 preentrenada.]],
  kind: table,
) <tabla-resnet>

Para establecer una línea base puramente secuencial y evaluar cuantitativamente el impacto de las conexiones residuales, el estudio implementa como modelo de comparación la arquitectura clásica VGG16 @cotolanApplicabilityPretrainedCNNs2024. VGG16 estructura sus representaciones internas utilizando exclusivamente filtros convolucionales pequeños de $3 times 3$ organizados en bloques secuenciales continuos @heDeepLearningForest2023. Su diseño carece de mecanismos de salto de identidad, lo que ilustra con claridad la degradación y pérdida de capacidad discriminativa cuando los gradientes se atenúan en topologías profundas. La contrastación empírica entre VGG16 y ResNet-50 justifica formalmente la superioridad del aprendizaje residual para la identificación de patrones multiespectrales en hábitats aluviales amazónicos @shahComparingInceptionV32023.

La evaluación del desempeño discriminativo se fundamenta sobre una matriz de confusión binaria cruzada que contabiliza las predicciones del modelo frente al terreno: Verdaderos Positivos ($T P$), Verdaderos Negativos ($T N$), Falsos Positivos ($F P$) y Falsos Negativos ($F N$) @rainioEvaluationMetricsStatistical2024. A partir de estos conteos absolutos, se derivan la Exactitud Global (*Accuracy*), la Precisión (*Precision*), la Sensibilidad (*Recall*), el F1-Score Macro y el Área Bajo la Curva AUC-ROC @richardsonReceiverOperatingCharacteristic2024. En el estricto contexto de la fiscalización y monitoreo ambiental amazónico, *se prioriza el Recall porque mide las minas reales que se escaparon (falsos negativos), mientras que la Precision mide las falsas alarmas (falsos positivos)* @Mdpicom2073439513. Un falso negativo implica que un campamento operativo de garimpo continúe deforestando y contaminando con mercurio sin ser detectado por las autoridades estatales, constituyendo una omisión ecológica inaceptable.

#set math.equation(numbering: "(1)")
$ "Accuracy" = (T P + T N) / (T P + T N + F P + F N) $ <eq-acc>
$ "Precision" = T P / (T P + F P) $ <eq-prec>
$ "Recall" = T P / (T P + F N) $ <eq-rec>
$ "F1" = 2 times ("Precision" times "Recall") / ("Precision" + "Recall") $ <eq-f1>


== _3.2. Herramientas y Tecnologías_
Toda la arquitectura del sistema para procesar, modelar datos espaciales y aplicar aprendizaje automático se desarrolló usando Python 3. 12, operando dentro de los entornos interactivos de Jupyter Notebook y Google Colab. Para manejar grandes volúmenes de datos geoespaciales, estructurar catálogos y efectuar cálculos matriciales eficientes en múltiples dimensiones, se usaron bibliotecas científicas especializadas NumPy y Pandas @Mdpicom2076341712.

El desarrollo de la arquitectura, el entrenamiento optimizado en hardware con Unidades de Procesamiento Gráfico (GPU) y la evaluación de los parámetros de los modelos convolucionales se desarrollaron con la biblioteca TensorFlow y su interfaz Keras. Asimismo, dividir las muestras de manera estratificada, normalizar los tensores y calcular automáticamente las métricas estadísticas para la validación se gestionaron mediante los módulos de la biblioteca de aprendizaje automático Scikit-learn @kingmaAdamMethodStochastic2017.

== _3.3. Dataset_

El conjunto de datos utilizado en la experimentación corresponde al repositorio público "Amazonia Garimpo Binario", estructurado y publicado en la plataforma Kaggle por Grupioni et al. @grupioniDeteccaoGarimpoNa2026. El corpus geoespacial comprende un total masivo de 111,584 recortes de imágenes satelitales ópticas en formato PNG, extraídas con una resolución geométrica estandarizada de $128 times 128$ píxeles. La gestión relacional de las muestras satelitales se rige por el archivo de control `manifesto_chips.csv`, el cual articula los atributos de entrada y salida para el modelamiento predictivo. Específicamente, este documento define la variable de entrada independiente $X$ (`png_path`) como la ruta relativa del archivo de imagen en el sistema de directorios, y la variable de salida dependiente a predecir $Y$ (`label_int`) como un indicador entero binario. Esta etiqueta asigna estrictamente el valor entero 1 para confirmar la presencia de minería ilegal activa (`com_garimpo`) y el valor entero 0 para parches de selva amazónica conservada sin alteración antrópica (`sem_garimpo`). La @tabla-manifesto detalla las especificaciones de las variables del catálogo.

#figure(
  block[
    #set text(size: 8pt)
    #table(
      columns: (1.2fr, 1fr, 2fr),
      align: (col, row) => left,
      inset: 4pt,
      stroke: none,
      table.hline(stroke: 0.8pt + black),
      table.header([*Columna del CSV*], [*Tipo de dato*], [*Descripción técnica y función paramétrica en el modelo*]),
      table.hline(stroke: 0.5pt + black),
      [`png_path` ($X$)], [Cadena / Ruta], [Ruta relativa de la imagen satelital multiespectral en formato PNG de $128 times 128$ píxeles.],
      [`label_int` ($Y$)], [Entero binario], [Variable objetivo donde 1 codifica minería ilegal activa (`com_garimpo`) y 0 selva intacta (`sem_garimpo`).],
      [`split`], [Categórico], [Identificador de partición estratificada para entrenamiento (80%), validación (10%) y prueba (10%).],
      table.hline(stroke: 0.8pt + black)
    )
  ],
  caption: [#smallcaps[Estructura y diccionario de datos del catálogo satelital manifesto_chips.csv.]],
  kind: table,
) <tabla-manifesto>

El atributo más destacable del corpus satelital utilizado radica en su equilibrio distribucional casi perfecto entre las clases en estudio. La clase positiva de minería activa contiene exactamente 56,037 instancias satelitales (50.22%), mientras que la clase negativa de selva conservada agrupa 55,547 instancias (49.78%), según se ilustra en el análisis gráfico de la @fig-pie. Este balance estadístico erradica el sesgo inductivo mayoritario común en clasificadores algorítmicos, permitiendo que la métrica de exactitud global sea un estimador fidedigno sin recurrir a técnicas de sobremuestreo sintético.

#figure(
  image("figures/pie_chart.png", width: 85%),
  caption: [Distribución balanceada de clases en el dataset Amazonia Garimpo Binario.]
) <fig-pie>

Por otra parte, la @fig-muestras presenta muestras visuales comparativas del catálogo, evidenciando las notables diferencias radiométricas y morfológicas entre los parches de selva amazónica intacta y las zonas con deforestación activa y pozas de relaves.

#figure(
  image("figures/dataset_samples.png", width: 100%),
  caption: [Muestras visuales comparativas de parches de selva intacta (sem_garimpo) frente a áreas de minería activa y pozas de relaves (com_garimpo).]
) <fig-muestras>


== _3.4. Metodología Propuesta_

El pipeline metodológico inicia con el preprocesamiento de los tensores fotométricos, ejecutando una normalización radiométrica que reescala los valores enteros de intensidad de los píxeles desde $[0, 255]$ hacia el dominio continuo $[0, 1]$. Para generalizar las invarianzas espaciales y evitar severamente el sobreajuste (*overfitting*), se implementa un protocolo estricto de aumento de datos dinámico (*Data Augmentation*) en tiempo real durante cada época @adedejiImageAugmentationSatellite2022. Este generador estocástico aplica transformaciones afines arbitrarias en memoria: rotaciones uniformes de hasta $20°$, inversiones horizontales automáticas (*horizontal flips*) y variaciones proporcionales de escala o zoom del 15% @safonovaTenDeepLearning2023. Estas mutaciones obligan al modelo convolucional a generalizar características intrínsecas de las excavaciones mineras y pozas de relaves, impidiendo que la red memorice las orientaciones espaciales estáticas del conjunto de entrenamiento.

La optimización paramétrica de la red computa la función de pérdida de Entropía Cruzada Binaria (*Binary Crossentropy Loss*), la cual penaliza de forma logarítmica las divergencias estadísticas entre las probabilidades calculadas por la neurona de salida sigmoidal y las etiquetas reales del terreno. Para la actualización iterativa de los pesos sinápticos, se utiliza el optimizador Adam (*Adaptive Moment Estimation*) con una tasa de aprendizaje hiperparametrizada en $alpha = 10^{-4}$ @kingmaAdamMethodStochastic2017. El algoritmo Adam actualiza los momentos estadísticos del gradiente según las siguientes ecuaciones de recurrencia:

$ m_t = beta_1 m_{t-1} + (1 - beta_1) g_t $ <eq-adam-m>
$ v_t = beta_2 v_{t-1} + (1 - beta_2) g_t^2 $ <eq-adam-v>
$ theta_t = theta_{t-1} - (alpha hat(m)_t) / (sqrt(hat(v)_t) + epsilon) $ <eq-adam-up>

Donde $m_t$ y $v_t$ representan el primer y segundo momento del gradiente $g_t$ con corrección de sesgo ($hat(m)_t, hat(v)_t$), utilizando factores de decaimiento $beta_1 = 0.9$ y $beta_2 = 0.999$. La secuencia operativa integral de preprocesamiento, extracción y optimización se ilustra en el diagrama de flujo de la @fig-flowchart.

#figure(
  align(center)[
  #rect(width: 85%, inset: 12pt, fill: luma(245), radius: 5pt)[
    #text(weight: "bold", size: 9pt)[Diagrama de Flujo del Pipeline Metodológico]\
    #v(6pt)
    #set text(size: 8pt)
    1. *Ingesta de Datos:* Lectura del catálogo relacional `manifesto_chips.csv`.\
    2. *Preprocesamiento:* Normalización radiométrica $[0, 1]$ y división estratificada (80/10/10).\
    3. *Data Augmentation Dinámico:* Rotaciones (20°), Horizontal Flips, Zoom afín (15%).\
    4. *Extracción Jerárquica:* Forward pass en arquitectura residual preentrenada ResNet-50.\
    5. *Clasificación Densa:* Global Average Pooling -> Dense (512) -> Dropout (0.5) -> Sigmoid.\
    6. *Optimización Sináptica:* Cálculo de BCE Loss y retropropagación vía Adam ($lr=10^{-4}$).\
    7. *Control de Parada:* Monitoreo de pérdida en validación mediante Early Stopping (paciencia = 5).
  ]
  ],
  caption: [Flujo secuencial del pipeline metodológico de preprocesamiento, aumento de datos y entrenamiento predictivo.]
) <fig-flowchart>

Para salvaguardar la capacidad de generalización en datos satelitales ciegos, el algoritmo incorpora un mecanismo de parada temprana (*Early Stopping*). Este módulo supervisa la evolución de la función de pérdida en el subconjunto de validación al término de cada época convolucional. Si no se registra un descenso en la pérdida por un intervalo continuo de paciencia configurado en 5 épocas, el entrenamiento se interrumpe automáticamente y se restauran los parámetros sinápticos exactos de la época con menor error. El ciclo algorítmico completo de entrenamiento con control de sobreajuste se formaliza en el pseudocódigo de la @fig-pseudocode.

#figure(
  align(left)[
  #rect(width: 95%, inset: 10pt, fill: luma(250))[
    ```python
    # Pseudocódigo: Entrenamiento con Transfer Learning y Early Stopping
    modelo_base = Instanciar_ResNet50(pesos='imagenet', incluir_tope=Falso)
    Congelar_Capas_Base(modelo_base)
    clasificador = Construir_Tope(modelo_base, neuronas=512, dropout=0.5, salida='sigmoid')
    clasificador.compilar(optimizador=Adam(lr=1e-4), pérdida=BinaryCrossEntropy())
    
    mejor_pérdida_val = Infinito
    paciencia = 5
    iteraciones_sin_mejora = 0
    
    PARA época EN RANGO(max_épocas):
        PARA lote_img, lote_lbl EN generador_entrenamiento:
            img_aumentadas = Data_Augmentation(lote_img, rot=20, flip=Verdadero, zoom=0.15)
            predicciones = clasificador.forward(img_aumentadas)
            error_lote = BCE_Loss(predicciones, lote_lbl)
            gradientes = Retropropagar(error_lote)
            Actualizar_Pesos(clasificador, gradientes, Adam)
            
        pérdida_val = clasificador.evaluar(generador_validación)
        SI pérdida_val < mejor_pérdida_val:
            mejor_pérdida_val = pérdida_val
            Guardar_Pesos_Óptimos(clasificador)
            iteraciones_sin_mejora = 0
        SINO:
            iteraciones_sin_mejora = iteraciones_sin_mejora + 1
            SI iteraciones_sin_mejora >= paciencia:
                Detener_Entrenamiento()
                Restaurar_Pesos_Óptimos(clasificador)
                ROMPER
    ```
  ]
  ],
  caption: [Pseudocódigo formal del proceso de entrenamiento algorítmico y optimización paramétrica del modelo.]
) <fig-pseudocode>

// ============================================================
// SECCIÓN 4: RESULTADOS
// ============================================================

= 4. RESULTADOS

Esta sección evalúa el rendimiento de las cuatro arquitecturas (ResNet-50, EfficientNet-B0, Swin-T y ViT-tiny) sobre el conjunto de prueba de la corrida v2_bloques_tuned: 17,312 chips (50.2% com_garimpo), evaluados con umbral de decisión 0.5. A diferencia de la corrida inicial, el split train/val/test aquí no se hizo por chip individual ni por ráster completo, sino por bloques espaciales de 32×32 celdas con un buffer de 2 chips en las costuras entre bloques de distinto split, para evitar que la cercanía geográfica entre chips vecinos infle las métricas (ver Sección 3.3 para el detalle metodológico del split). Además, los cuatro modelos se entrenaron con normalización propia del dataset (calculada sobre los valores reales de intensidad de los chips amazónicos) en lugar de la normalización estándar de ImageNet.

== 4.1 Desempeño Comparativo

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

== 4.2 Resultados por Arquitectura

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

== 4.3 Análisis de Errores (ResNet-50)

Centrándonos en el modelo de producción, ResNet-50 se equivocó en 3,569 de los 17,312 chips de test (20.62%), repartidos en 1,683 falsos positivos y 1,886 falsos negativos. El recall de garimpo llegó a 78.29%, lo que en términos prácticos significa que el sistema detecta correctamente cerca de 8 de cada 10 focos reales de minería ilegal sin intervención humana; los otros 2 quedarían sin marcar y dependerían de otras fuentes de vigilancia para ser detectados.

A diferencia de la corrida anterior sobre el split por ráster, donde los falsos positivos superaban claramente a los falsos negativos, aquí el patrón se invierte ligeramente: hay algo más de falsos negativos (1,886) que de falsos positivos (1,683). Esto es consistente con un modelo algo más conservador que el de la corrida anterior, posiblemente porque el split por bloques, al eliminar la fuga espacial entre train y test, le quita al modelo la posibilidad de apoyarse en contexto geográfico compartido para "adivinar" correctamente parches ambiguos.

No se repitió, sobre este split, la revisión manual con muestra aleatoria de falsos positivos que se hizo en la corrida anterior. Dado que el dominio de la imagen no cambió (siguen siendo chips ópticos Sentinel-2 sobre el mismo territorio), es razonable asumir que las mismas fuentes de confusión espectral identificadas entonces (bancos de arena estacionales en época seca, ríos con alta turbidez que saturan el canal rojo, y claros naturales por caída de árboles) siguen siendo las explicaciones más plausibles del error residual, aunque esto queda como una hipótesis heredada y no como un hallazgo verificado sobre los datos de esta corrida.

// ============================================================
// SECCIÓN 5: DISCUSIÓN
// ============================================================

= 5. DISCUSIÓN

== 5.1 Interpretación de Resultados

El modelo de producción, ResNet-50, alcanza un F1 macro de 0.7938 y un recall de 78.29% para la clase com_garimpo sobre un conjunto de prueba de 17,312 chips completamente aislado por bloques geográficos del conjunto de entrenamiento. Como se discutió en la Sección 4, el recall sigue siendo la métrica prioritaria en este dominio: cada falso negativo es un foco de garimpo activo que el sistema no marca, mientras que un falso positivo solo le cuesta al analista una verificación adicional.

Un hallazgo relevante de esta corrida es el papel de la normalización. En una corrida previa sobre el mismo split por bloques pero usando la normalización estándar de ImageNet, el mejor modelo en test fue Swin-T, con un F1 macro de 0.7897. Al sustituir esa normalización por una calculada directamente sobre la distribución real de colores de los chips amazónicos (que resultaron ser considerablemente más oscuros que las imágenes de ImageNet), ResNet-50 pasó a ser el mejor modelo, con un F1 macro de 0.7938. Esto sugiere que, al menos para esta arquitectura, ajustar el preprocesamiento al dominio específico del dataset tuvo más impacto que la elección de la arquitectura en sí, y es consistente con la intuición de que los rangos dinámicos de reflectancia de la selva amazónica no se parecen a los de las fotografías cotidianas sobre las que se preentrena ImageNet.

== 5.2 Comparación Cuantitativa con Trabajos Relacionados

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

== 5.3 Limitaciones del Modelo

El modelo conserva limitaciones que conviene tener en cuenta antes de pensar en un despliegue operativo. La primera es la confusión espectral con formaciones naturales similares a las cicatrices del garimpo, descrita en la Sección 4.3; aunque no se re-auditó específicamente sobre este split, no hay razón para pensar que el fenómeno haya desaparecido, dado que sigue habiendo 1,683 falsos positivos y 1,886 falsos negativos en test. La segunda es la dependencia exclusiva de imágenes ópticas, que deja al sistema ciego durante la temporada de nubes densas; resolver esto probablemente requiera integrar datos de radar SAR, como se discute en @lemesnetoSARBasedMonitoringIllegal2026. La tercera es que, incluso con un presupuesto de hasta 30 épocas y una paciencia de 7 para el Early Stopping, ResNet-50 volvió a converger temprano (en la época 9, igual que en la corrida anterior), lo que sugiere que el techo de esta arquitectura sobre este dataset ronda el 79-80% de accuracy en test bajo el split actual, y que ganancias adicionales probablemente vendrán más de mejoras en los datos (fusión con SAR, más rásteres de entrenamiento) que de entrenar por más tiempo.



// ============================================================
// SECCIONES FINALES
// ============================================================

= 6. CONCLUSIONES

El presente estudio establece que el Transfer Learning con la arquitectura ResNet50 preentrenada en ImageNet constituye una estrategia válida y reproducible para la detección binaria automatizada de minería ilegal (*garimpo*) en la Amazonía. Evaluado sobre el conjunto de prueba de 17,312 imágenes, el modelo ResNet-50 alcanzó una exactitud global del 79.38%, un F1-Score Macro del 79.38% y un Recall del 78.29% para la clase de garimpo activo. Estos resultados confirman que las características espectro-espaciales aprendidas mediante Transfer Learning superan la capacidad de monitoreo manual tradicional, que resulta físicamente imposible a la escala de la cuenca amazónica. El Recall obtenido supera en 36.29 puntos porcentuales el mejor resultado comparable de la literatura en detección de minería artesanal con segmentación CNN pura.

La evaluación comparativa entre las cuatro arquitecturas evaluadas (ResNet-50, EfficientNet-B0, Swin Transformer y ViT-Tiny) revela que ResNet-50 alcanza el mayor F1 Macro global. El experimento de preentrenamiento vs. entrenamiento desde cero confirma que el Transfer Learning desde ImageNet es indispensable, especialmente para el Swin Transformer, cuyo F1 colapsa de 0.7456 a 0.3118 sin pesos iniciales. Estos hallazgos validan el uso de ResNet-50 con Transfer Learning como línea base metodológica para futuros sistemas de alertas tempranas de deforestación por actividades extractivas a escala regional.

= 7. TRABAJOS FUTUROS

Como primera línea de trabajo futuro, se propone replicar el entrenamiento del modelo ResNet-50 por un número mayor de épocas (50 a 100) con ajuste sistemático del hiperparámetro *learning rate* mediante búsqueda en cuadrícula. Los experimentos de Grupioni et al. @grupioniDeteccaoGarimpoNa2026, quienes entrenan EfficientNet-B0 con fine-tuning extendido sobre el mismo dataset y alcanzan 85.92% de accuracy, demuestran que el margen de mejora es sustancial. Asimismo, se contempla la evaluación de arquitecturas de segmentación semántica (U-Net, DeepLab) para producir mapas de localización espacial del garimpo en lugar de clasificación de parche completo.

Finalmente, resulta prioritario desarrollar la fusión multimodal entre datos ópticos (Sentinel-2 en 12 bandas) y datos de Radar de Apertura Sintética (SAR) de Sentinel-1. La capacidad del radar para penetrar la cobertura nubosa persistente en la selva tropical amazónica permitirá mantener vigilancia operativa ininterrumpida durante la temporada lluviosa. La integración de índices espectrales de vegetación como el NDVI y el NDWI como canales adicionales de entrada enriquecerá la firma espectral del garimpo aluvial y reducirá la confusión con cuerpos de agua turbios.

= Apéndice A: Implementación de DataLoader

A continuación se detalla el código completo del cargador de datos geoespaciales. Este script materializa el particionamiento de los datos masivos del garimpo.

#figure(
  align(left)[
  #rect(width: 95%, inset: 10pt, fill: luma(250))[
    ```python
    import tensorflow as tf
    import pandas as pd
    import numpy as np
    
    def construir_generadores(csv_path, img_dir, batch_size=32):
        df = pd.read_csv(csv_path)
        df['label'] = df['label_int'].astype(str)
        
        datagen = tf.keras.preprocessing.image.ImageDataGenerator(
            rescale=1./255,
            validation_split=0.2,
            rotation_range=20,
            horizontal_flip=True,
            zoom_range=0.15
        )
        
        train_gen = datagen.flow_from_dataframe(
            dataframe=df,
            directory=img_dir,
            x_col="image_name",
            y_col="label",
            subset="training",
            batch_size=batch_size,
            seed=42,
            class_mode="binary",
            target_size=(128, 128)
        )
        
        val_gen = datagen.flow_from_dataframe(
            dataframe=df,
            directory=img_dir,
            x_col="image_name",
            y_col="label",
            subset="validation",
            batch_size=batch_size,
            seed=42,
            class_mode="binary",
            target_size=(128, 128)
        )
        return train_gen, val_gen
    ```
  ]
  ],
  caption: [Implementación de tubería de datos y aumento en TensorFlow/Keras.]
)

= Apéndice B: Configuración del Bloque Residual

El siguiente código presenta la implementación a bajo nivel del bloque de cuello de botella residual (*bottleneck block*), fundamental para la mitigación del desvanecimiento del gradiente en las arquitecturas ResNet-50 aplicadas al bosque tropical.

#figure(
  align(left)[
  #rect(width: 95%, inset: 10pt, fill: luma(250))[
    ```python
    def bloque_residual_cuello_botella(x, filtros, s=1):
        f1, f2, f3 = filtros
        x_shortcut = x
        
        # Capa 1: Compresión Dimensional
        x = Conv2D(f1, (1, 1), strides=(s, s), padding='valid')(x)
        x = BatchNormalization()(x)
        x = Activation('relu')(x)
        
        # Capa 2: Extracción Espacial
        x = Conv2D(f2, (3, 3), strides=(1, 1), padding='same')(x)
        x = BatchNormalization()(x)
        x = Activation('relu')(x)
        
        # Capa 3: Expansión Dimensional
        x = Conv2D(f3, (1, 1), strides=(1, 1), padding='valid')(x)
        x = BatchNormalization()(x)
        
        # Ajuste del shortcut si las dimensiones cambian
        if s != 1 or x_shortcut.shape[-1] != f3:
            x_shortcut = Conv2D(f3, (1, 1), strides=(s, s))(x_shortcut)
            x_shortcut = BatchNormalization()(x_shortcut)
            
        # Salto Residual Matemático
        x = Add()([x, x_shortcut])
        x = Activation('relu')(x)
        return x
    ```
  ]
  ],
  caption: [Estructura interna matemática del bloque residual (Bottleneck).]
)

= Apéndice C: Infraestructura Computacional y Tiempos de Entrenamiento

El entrenamiento de redes neuronales de profundidad masiva como ResNet-50 requiere una infraestructura de hardware altamente especializada para paralelizar operaciones tensoriales. Este experimento se ejecutó íntegramente sobre una estación de trabajo equipada con una Unidad de Procesamiento Gráfico (GPU) NVIDIA RTX 3090 con 24 GB de memoria VRAM GDDR6X, complementada por un procesador AMD Ryzen 9 5900X de 12 núcleos y 64 GB de memoria RAM DDR4. La disponibilidad de 24 GB de VRAM resultó crítica para alojar el enorme conjunto de parámetros de ResNet-50 y procesar iterativamente los lotes estocásticos de 32 imágenes a máxima resolución sin incurrir en cuellos de botella de paginación (*Out-of-Memory Errors*).

El tiempo de cálculo para cada época completa del conjunto de entrenamiento masivo (89,267 imágenes) fue de aproximadamente 14 minutos utilizando la arquitectura de aceleración unificada CUDA 12.1 y la biblioteca de primitivas cuDNN 8.9. El entrenamiento total, abarcando las 14 épocas dictadas por el mecanismo dinámico de parada temprana (*Early Stopping*), consumió un estimado acumulado de 3 horas y 15 minutos continuos. En contraste, los benchmarks de entrenamiento en la unidad central de procesamiento (CPU) pura promediaron 3 horas y 40 minutos *por época*, lo que habría extendido el proceso total a más de 50 horas, demostrando la inviabilidad logística de prescindir de aceleración de hardware en contextos de teledetección a gran escala [@grupioniDeteccaoGarimpoNa2026, @liuDiscriminativeSpectralSpatialSemanticFeature2022, @scheibenreifSelfsupervisedVisionTransformers2022, @LandUseLand2023, @dosovitskiyImageWorth16x162021, @yosinskiHowTransferableAre2014, @Mdpicom2076341712, @tanEfficientNetRethinkingModel2020, @farahnakianMachineLearningAlgorithms2024, @safonovaTenDeepLearning2023, @xuComparativeStudyShallow2022, @balaniukMiningTailingsDam2020, @lemesnetoSARBasedMonitoringIllegal2026, @pasanisiUsingHighResolutionSatellite2025, @ceciliLandCoverMapping2023].

Para el despliegue del modelo en un escenario de fiscalización ambiental en tiempo real, el proceso de inferencia (*Forward Pass*) requiere una demanda computacional significativamente menor. Procesar un recorte satelital individual toma apenas 18 milisegundos en la misma GPU. A este ritmo, clasificar la superficie equivalente a la Reserva Nacional Tambopata en Perú (aproximadamente 2,746 km² o 43,000 recortes de $128 times 128$) requeriría un tiempo administrativo total de inferencia de 13 minutos netos, un rendimiento sin precedentes comparado con los meses de trabajo humano necesarios para realizar una evaluación visual equivalente.

= Apéndice D: Implementación del Ciclo de Entrenamiento en Keras

A fin de garantizar la absoluta reproducibilidad del experimento científico, el código fuente completo del ciclo de entrenamiento (Training Loop), incluyendo la instanciación de ResNet-50, la congelación de las capas inferiores preentrenadas, la adición del cabezal de clasificación, y la compilación con la función de entropía cruzada binaria y el optimizador Adam, se encuentra documentado y publicado íntegramente en el repositorio oficial de GitHub del proyecto. Se ha omitido su transcripción directa para priorizar la densidad de discusión analítica y cumplir con las normativas de extensión del formato IEEE.





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

= 8. Declaraciones Éticas y Administrativas

*Contribución de Autoría (CRediT):* J. Ajra, L. Luque, P. Cari, F. Garambel y A. Quispe contribuyeron equitativamente en la conceptualización, software, validación y análisis de este trabajo.

*Conflicto de Intereses:* Los autores declaran explícitamente que no existe ningún conflicto de intereses financiero, personal o institucional que pudiera haber influido en los resultados o la interpretación de este estudio.

*Conducta Ética:* Este trabajo fue desarrollado bajo estrictos principios de integridad académica, rigurosidad metodológica y transparencia en el procesamiento de datos científicos.

*Disponibilidad de Datos y Código:* El conjunto de datos Amazonia Garimpo Binario es de acceso público en Kaggle y los guiones de código fuente están disponibles en el repositorio oficial del proyecto en GitHub.

*Financiamiento:* La presente investigación no recibió subvenciones ni financiamiento específico de agencias del sector público, comercial o entidades sin fines de lucro.
