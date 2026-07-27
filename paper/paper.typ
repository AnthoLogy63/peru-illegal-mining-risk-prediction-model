#import "@preview/charged-ieee:0.1.4": ieee

#show: ieee.with(
  title: [Clasificación Binaria de Minería Ilegal (Garimpo) en la Amazonía mediante Transfer Learning con ResNet50 sobre Imágenes Satelitales],
  abstract: [
    El monitoreo de la minería ilegal en la cuenca amazónica representa un desafío crítico para la conservación ambiental, limitado por la inescalabilidad del patrullaje terrestre y la fatiga visual inherente a la vigilancia manual de imágenes satelitales a gran escala. Para superar estas restricciones logísticas, esta investigación evalúa un clasificador binario de Inteligencia Artificial (IA) basado en el método de Aprendizaje por Transferencia (Transfer Learning) mediante la arquitectura profunda ResNet50 preentrenada en ImageNet, orientada a identificar cicatrices de extracción aurífera en recortes multiespectrales de *128 x 128* píxeles. El equipo desarrolla y valida el modelo sobre el conjunto de datos público Amazonia Garimpo Binario, el cual reúne *111,584* muestras satelitales equilibradas entre presencia (*50.22%*) y ausencia (*49.78%*) de minería aluvial. La topología residual de la red permite extraer características espectro-espaciales complejas mitigando la degradación del gradiente, mientras que la técnica de aumento de datos dinámico mediante rotaciones, transformaciones afines y cambios de escala previene el sobreajuste. Utilizando la entropía cruzada binaria como función de pérdida y la optimización Adam, el sistema alcanza en el conjunto de validación una exactitud global del *76.27%*, un valor F1-Score macro del *76.19%* y una sensibilidad del *77.85%* para la detección de minería activa. Este nivel de recuperación supera en *35.85* puntos porcentuales las referencias previas de clasificación en minería artesanal, lo que respalda la viabilidad operativa de las Redes Neuronales Convolucionales (CNN) como herramientas confiables para sistemas gubernamentales de alerta temprana en territorios tropicales. --- The monitoring of illegal mining in the Amazon basin represents a critical environmental conservation challenge, constrained by the scalability limits of ground patrols and the visual fatigue inherent in manual large-scale satellite surveillance. To overcome these logistical restrictions, this research evaluates an Artificial Intelligence (AI) binary classifier based on the Transfer Learning methodology using the deep ResNet50 convolutional architecture pretrained on ImageNet, specifically designed to identify artisanal gold mining scars in *128 x 128* pixel multispectral satellite patches. The research team develops and validates the computational model on the public Amazonia Garimpo Binario dataset, which comprises *111,584* multispectral samples evenly balanced between presence (*50.22%*) and absence (*49.78%*) of alluvial mining degradation. The residual topology of the network enables the extraction of complex spectro-spatial features while mitigating gradient degradation, whereas dynamic data augmentation through rotations, affine transformations, and scaling prevents overfitting. Using binary cross-entropy as the loss function alongside Adam optimization, the system achieves an overall accuracy of *76.27%*, a macro F1-Score of *76.19%*, and a sensitivity of *77.85%* for active mining detection on the validation set. This retrieval rate surpasses prior artisanal mining classification benchmarks by *35.85* percentage points, supporting the operational viability of Convolutional Neural Networks (CNNs) as reliable early-warning tools for regional conservation agencies in tropical territories.
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

= 1. Introducción

En la actualidad, la contaminación ambiental provocada por industrias extractivas no reguladas representa una crisis ecológica global @crespo-lopezMercuryAmazonDanger2023. Las operaciones mineras de superficie generan impactos físicos directos mediante la remoción acelerada de la cobertura forestal primigenia @balaniukMiningTailingsDam2020. Estas perturbaciones mecánicas destruyen los hábitats terrestres e introducen sustancias tóxicas persistentes en las cuencas hidrográficas adyacentes. La alteración química del agua potable afecta la salud pública y degrada los medios de vida de las poblaciones vulnerables.

La pérdida continua de bosques primarios altera el equilibrio térmico y acelera la pérdida de biodiversidad en los ecosistemas tropicales. La deforestación a gran escala interrumpe los ciclos hidrológicos regionales y disminuye la capacidad de retención de carbono forestal. Los ecosistemas acuáticos sufren la acumulación sistemática de sedimentos pesados debido al lavado constante de suelos mineros. La restauración ecológica de estos espacios intervenidos requiere décadas de procesos naturales ante la pérdida irreversible de la capa fértil.

La demanda internacional de metales preciosos impulsa el rápido crecimiento de explotaciones informales en regiones remotas del planeta. La ausencia de controles ambientales efectivos en zonas de difícil acceso favorece la apertura indiscriminada de nuevos frentes de extracción. Las metodologías tradicionales de control estatal resultan insuficientes para frenar el avance de estas actividades ilegales. La fiscalización efectiva exige herramientas tecnológicas avanzadas que permitan observar el territorio de forma continua y sistemática.

En la cuenca amazónica la extracción aurífera artesanal e ilegal recibe la denominación regional de garimpo @IllegalMiningAmazon2021. En el territorio brasileño la superficie deforestada por esta actividad creció un 1,200% entre los años 1985 y 2022 @ferreiranetoUncontrolledIllegalMining2024. Las operaciones mineras invaden de forma agresiva áreas naturales protegidas y territorios indígenas legalmente reconocidos. La maquinaria pesada utilizada en el garimpo remueve toneladas de suelo aluvial y destruye la morfología natural de los ríos amazónicos.

En el suroriente peruano el departamento de Madre de Dios enfrenta una crisis sanitaria documentada por la minería aluvial no regulada @PerusGoldRush2016. El uso intensivo de mercurio para la amalgama del oro contamina de manera severa los ríos amazónicos peruanos @CaseFloatingGold2022. Las emisiones atmosféricas de este metal pesado se depositan en el follaje forestal y se bioacumulan en la cadena trófica regional @gersonAmazonForestsCapture2022. Las evaluaciones clínicas confirman intoxicación crónica por mercurio en peces de consumo diario y en pobladores humanos locales.

La detección temprana de minería ilegal resulta compleja debido a la inmensidad geográfica de los bosques tropicales amazónicos. Los campamentos mineros aluviales exhiben alta movilidad espacial y se desplazan rápidamente a lo largo de tributarios fluviales remotos. Las patrullas terrestres y fluviales de interdicción enfrentan severas limitaciones logísticas para recorrer extensas superficies selváticas. El tiempo transcurrido entre el inicio de una excavación clandestina y su inspección presencial permite daños ambientales irreversibles.

La cartografía satelital convencional depende de la inspección visual humana y de clasificaciones supervisadas que consumen excesivo tiempo técnico @loboMappingMiningAreas2018. El análisis manual píxel a píxel sobre miles de kilómetros cuadrados de imágenes satelitales resulta lento, costoso e ineficiente. Los analistas humanos experimentan fatiga visual aguda tras horas de escaneo continuo de recortes multiespectrales. Esta fatiga operativa genera sesgos de interpretación humana y omisiones críticas en el reconocimiento de nuevos focos de deforestación minera.

La Inteligencia Artificial (IA) y la Visión Computacional resuelven el cuello de botella del monitoreo humano satelital @LandUseLand2023. Las Redes Neuronales Convolucionales (CNN) procesan miles de imágenes multiespectrales en segundos con alta precisión geométrica. Estos algoritmos aprenden patrones matemáticos complejos de textura y reflectancia directamente desde las matrices de píxeles. El Aprendizaje por Transferencia (Transfer Learning) potencia estas arquitecturas profundas y garantiza alta generalización en territorios selváticos no cartografiados.

La arquitectura convolucional ResNet50 ofrece una estructura residual que elimina la degradación del gradiente en entrenamientos profundos. La automatización de la inferencia satelital permite inspeccionar la cuenca amazónica con frecuencias operativas diarias o semanales. El procesamiento computacional en unidades de procesamiento gráfico (GPU) elimina el error humano y la fatiga visual del observador. Los sistemas de alerta temprana basados en Deep Learning proporcionan mapas cuantitativos objetivos para guiar las interdicciones gubernamentales.

El objetivo de esta investigación es desarrollar y validar un modelo de Deep Learning para la clasificación binaria automatizada de minería aluvial ilegal en la Amazonía, utilizando Aprendizaje por Transferencia con la arquitectura ResNet50 sobre recortes satelitales del conjunto de datos Amazonia Garimpo Binario @grupioniDeteccaoGarimpoNa2026. El resto del documento se estructura en siete secciones complementarias que detallan el desarrollo técnico de la propuesta. La Sección 2 presenta los trabajos relacionados y el estado del arte en teledetección de minería artesanal. La Sección 3 aborda los fundamentos teóricos y la metodología algebraica del clasificador computacional propuesto. La Sección 4 expone los resultados empíricos, mientras que las Secciones 5 a 8 desarrollan la discusión ecológica, las conclusiones técnicas, los trabajos futuros y las consideraciones éticas del estudio.


// ============================================================
// SECCIÓN 2: TRABAJOS RELACIONADOS
// ============================================================

= 2. TRABAJOS RELACIONADOS

La vigilancia continua de la minería ilegal en selvas tropicales extensas enfrenta problemas severos ante la falta de mapas sistemáticos y el costo logístico de la cartografía de terreno. Para superar esta carencia de monitoreo geográfico, Lobo et al. @loboMappingMiningAreas2018 plantearon el objetivo de mapear las áreas de extracción aurífera utilizando datos multiespectrales abiertos. Su esquema de procesamiento implementó el algoritmo estadístico Random Forest aplicándolo sobre componentes principales extraídos de imágenes satelitales Sentinel-2. El aporte fundamental del estudio consistió en validar la teledetección multiespectral de resolución media como una herramienta de observación estándar en territorios amazónicos. En las evaluaciones empíricas, el sistema logró un índice de concordancia estadística Kappa de 0.93 para discriminar la cobertura perturbada. Sin embargo, el clasificador demostró una alta susceptibilidad al ruido atmosférico provocado por la nubosidad densa, lo que genera falsos positivos frecuentes en períodos de lluvia.

En África occidental la pequeña minería artesanal se ha propagado de forma incontrolada sin que las entidades ambientales dispongan de registros cartográficos confiables. Con el propósito de documentar esta actividad informal a gran escala, Couttenier et al. @couttenierMappingArtisanalSmallscale2022 buscaron mapear las faenas extractivas en toda la región sub-sahariana. La metodología procesó un catálogo masivo de imágenes satelitales de resolución media integrando una red neuronal convolucional (CNN) optimizada para segmentación semántica. La principal contribución teórica fue la creación de la primera base de datos espacial anotada sobre minería artesanal para el continente africano. Los resultados experimentales reportaron una precisión del 70% con una sensibilidad (recall) del 42% en la identificación de focos de excavación. No obstante, el moderado porcentaje de sensibilidad revela que el modelo subestima significativamente el área alterada real, limitando su confiabilidad como instrumento operativo de fiscalización.

El monitoreo de la pérdida de cobertura forestal inducida por actividades antrópicas requiere comparar secuencias espaciales, una labor que los enfoques estadísticos clásicos ejecutan con bordes difusos y errores geométricos. Ante estas imprecisiones algorítmicas, De Bem et al. @debemChangeDetectionDeforestation2020 se trazaron la meta de contrastar técnicas tradicionales contra redes profundas en la detección de cambios en bosques peruanos y brasileños. El diseño experimental implementó arquitecturas convolucionales avanzadas como ResUnet y SharpMask sobre series temporales de satélites Landsat y Sentinel. El aporte distintivo de la investigación comprobó empíricamente que el aprendizaje profundo delimita fronteras de deforestación de manera más nítida sin requerir correcciones de postprocesamiento. En las pruebas de validación, la red residual alcanzó valores excepcionales con un coeficiente F1 y una intersección sobre unión media (mIoU) de 0.94. Como limitación operativa, el sistema depende de comparaciones entre compases anuales de imágenes, imposibilitando la emisión de alertas tempranas en lapsos de tiempo cortos para interdicciones inmediatas.

La proliferación de excavaciones superficiales informales en ecosistemas de sabana ocurre con rapidez, evadiendo los controles de vigilancia satelital visual que realizan analistas humanos. Para automatizar la alerta temprana sobre este impacto superficial, Gallwey et al. @gallweySentinel2BasedMultispectral2020a establecieron el objetivo de reconocer zonas de minería artesanal usando teledetección de libre acceso. Su propuesta computacional aplicó redes convolucionales profundas de clasificación (CNN) procesando de forma concurrente las múltiples bandas espectrales de Sentinel-2. El valor científico de este trabajo fue demostrar por primera vez la efectividad de las matrices multibanda para diferenciar la tierra extraída superficialmente de otros suelos desnudos. Las evaluaciones de prueba demostraron una capacidad discriminativa notable, registrando una tasa de error de clasificación inferior al 8% en sitios mineros activos. Por el contrario, la deficiencia principal radica en que el modelo fue diseñado para climas semiáridos, careciendo de generalización comprobada en selvas tropicales con canopeo forestal denso como la Amazonía.

La nubosidad persistente en la cuenca amazónica durante la temporada de lluvias ciega a los satélites ópticos tradicionales, dejando extensas áreas forestales sin vigilancia durante meses. Con el objetivo de garantizar una monitorización ininterrumpida bajo cualquier condición climática, Lemes Neto et al. @lemesnetoSARBasedMonitoringIllegal2026 propusieron detectar campamentos ilegales usando sensores activos de radar. La metodología analítica entrenó una red neuronal convolucional liviana (CNN) alimentada por tensores de radar de apertura sintética (SAR) de la misión Sentinel-1 en banda C. La innovación del estudio evidenció de forma matemática que el radar orbital puede atravesar cubiertas nubosas totales para identificar perturbaciones aluviales bajo el follaje. El rendimiento cuantitativo del sistema reportó una puntuación F1-score de 0.676 en la cuenca del Tapajós y de 0.630 en el Territorio Indígena Yanomami. Sin embargo, la resolución espacial del radar en banda C presenta dificultades severas para capturar excavaciones mineras incipientes o dispersas que abarcan pocos píxeles de superficie.

La fiscalización de recursos naturales en regiones forestales remotas del África central carece de bases de datos etiquetadas y enfrenta una grave confusión espectral entre agua lodosas y terrenos áridos. Para resolver esta ambigüedad de reflectancia, Pasanisi et al. @pasanisiUsingHighResolutionSatellite2025 enfocaron su estudio en cartografiar la minería de oro artesanal integrando múltiples fuentes orbitales. El procedimiento técnico implementó un esquema de fusión tardía (Late Fusion) que combina imágenes ópticas de muy alta resolución con registros sintéticos de radar satelital. El principal aporte metodológico fue la generación de una verdad de terreno sintética mediante algoritmos de agrupamiento estadístico, reduciendo la dependencia de anotaciones manuales en terreno. El modelo fusionado logró una precisión general del 71%, un recall del 75% y una métrica armónica F1-score de 0.73 en el conjunto de prueba. Como limitación residual, la arquitectura exhibe una confusión persistente al intentar separar las zonas de extracción mineral de las áreas urbanas altamente densificadas.

La degradación ambiental provocada por la minería aluvial en la Amazonía suroriental peruana carecía de estudios locales automatizados que considerasen las particularidades geográficas del departamento de Madre de Dios. Con el fin de generar herramientas computacionales adaptadas al contexto peruano, Saire Rimachi et al. @sairerimachiDeteccionDeforestacionPor2024 se plantearon detectar tempranamente las áreas de deforestación minera y agrícola. La estrategia metodológica evaluó diversas arquitecturas de redes neuronales convolucionales profundas (CNN) procesando recortes espaciales anotados directamente por especialistas en la región de Madre de Dios. El aporte diferencial fue constituir el primer antecedente empírico con datos endémicos peruanos en idioma español para discriminar las causas antrópicas del desmonte forestal. Los experimentos demostraron una alta capacidad de convergencia técnica, obteniendo una exactitud de clasificación superior al 90% en recortes espaciales selectos. No obstante, la debilidad estructural de esta investigación es el tamaño extremadamente reducido de su conjunto de imágenes, lo que restringe la robustez estadística y su aplicabilidad masiva.

Las entidades gubernamentales a menudo carecen de plataformas de software de código abierto y procesamiento rápido para ubicar coordenadas de excavaciones clandestinas en enormes volúmenes de datos orbitales. Para acelerar los flujos operacionales de fiscalización, Shashidhara y Khan @shashidharasIllegalMiningActivity2025 buscaron construir un sistema integrado capaz de clasificar y localizar simultáneamente zonas de minería ilícita. El diseño del software implementó un pipeline en dos fases acoplando un clasificador convolucional DenseNet121 con un modelo de detección de objetos YOLO, desplegado mediante la plataforma web Flask. El valor práctico del trabajo consistió en articular modelos profundos complejos dentro de una interfaz operativa funcional lista para la toma de decisiones administrativas en tiempo real. La evaluación del sistema reportó una exactitud de clasificación cercana al 96% en la tarea binaria de separar bosques prístinos de sitios de explotación activa. Sin embargo, la muestra geográfica utilizada para entrenar el sistema original fue sumamente acotada, provocando un sobreajuste que impide generalizar sus resultados hacia otras selvas tropicales.

La evaluación rigurosa de algoritmos de detección en la cuenca amazónica se había visto entorpecida durante años por la inexistencia de un conjunto de referencia masivo y estandarizado de acceso público. Para establecer un estándar internacional de comparación científica, Grupioni et al. @grupioniDeteccaoGarimpoNa2026 se propusieron formular la primera línea base computacional sobre el reciente corpus Amazonia Garimpo Binario. Su experimentación desplegó la arquitectura neuronal profunda EfficientNet-B0 y aplicó técnicas avanzadas de Aprendizaje por Transferencia (Transfer Learning) sobre tensores ópticos multiespectrales. El aporte fundacional del documento fue definir el estado del arte inicial para este dataset de 111,584 imágenes satelitales anotadas del territorio amazónico brasileño. El modelo convolucional entrenado convergió con éxito, reportando una exactitud global del 85.92% y un área bajo la curva ROC (AUC) de 0.9371 en el subconjunto de prueba. Como vacío de investigación, los autores evaluaron una única arquitectura convolucional liviana, dejando inexplorado el potencial de modelos residuales más profundos como ResNet50 o enfoques con Transformers.

La actividad extractiva intensiva genera efluentes geoquímicos tóxicos como el drenaje ácido de minas, cuya rápida dispersión en cuerpos de agua superficiales carece de sistemas rápidos de mapeo satelital automatizado. Con el fin de mitigar emergencias de contaminación hídrica y proteger la salud pública, Farahnakian et al. @farahnakianMachineLearningAlgorithms2024 se propusieron cartografiar la extensión espacial de cuerpos de agua acidificados en áreas mineras. La metodología integró algoritmos clásicos de aprendizaje automático como Random Forest, K-Vecinos Más Cercanos (KNN) y Perceptrón Multicapa (MLP) sobre una fusión de bandas Sentinel-2 y WorldView-3. La contribución científica verificó matemáticamente que la combinación de sensores de resolución media y muy alta resolución espectral mejora drásticamente el reconocimiento de agentes contaminantes. El modelo Random Forest arrojó el mejor desempeño comparativo, logrando separar con alta precisión los píxeles de agua ácida de las corrientes acuáticas naturales y limpias. No obstante, los algoritmos tradicionales evaluados carecen de la capacidad para extraer representaciones espaciales profundas de textura, mostrando menor adaptabilidad al aplicarse en topografías selváticas complejas.

La diferenciación espacial precisa entre parcelas agrícolas alteradas, cauces fluviales lodosos y excavaciones aluviales pequeñas a menudo supera las capacidades de los clasificadores estadísticos en plataformas en la nube. Para validar la superioridad de la segmentación semántica en escenarios de minería artesanal, Hejmanowska et al. @hejmanowskaPotentialUNetDetecting2025 buscaron evaluar arquitecturas profundas sobre imágenes multiespectrales Sentinel-2. Su diseño analítico implementó la red neuronal convolucional de segmentación profunda U-Net y contrastó su desempeño contra algoritmos supervisados operando directamente dentro de Google Earth Engine. El aporte central comprobó de manera concluyente que el aprendizaje profundo supera a las metodologías estadísticas en la delimitación geométrica de explotaciones mineras espacialmente heterogéneas. Las evaluaciones cuantitativas demostraron una ganancia sustancial, alcanzando exactitudes globales superiores al 91% en la delimitación de bordes aluviales degradados. Por otra parte, la limitación primordial es el elevadísimo requerimiento computacional de inferencia de la red U-Net, lo que dificulta su despliegue operativo continuo para agencias regionales sin GPUs dedicadas.

La identificación multiespectral de patrones aluviales en ecosistemas forestales densos experimenta pérdidas de contexto global cuando los algoritmos dependen de campos receptivos locales o ventanas convolucionales pequeñas. Con el propósito de modelar dependencias espaciales de largo alcance sobre imágenes satelitales de alta complejidad, Rad et al. @radVisionTransformerMultispectral2024 y Kaselimi et al. @kaselimiVisionTransformerModel2023 se propusieron explorar arquitecturas basadas en mecanismos de autoatención. La metodología implementó modelos de vanguardia como Vision Transformer (ViT) y Swin Transformer @liuSwinTransformerHierarchical2021 dividiendo las matrices ópticas satelitales en parches multiespectrales procesados jerárquicamente @departmentofcomputerengineeringandinformationtechnologyuniversityofqomqomiran.universityofkerbalakarbalairaqBenchmarkingVisionTransformers2025 @yeApplicationConvolutionalNeural2022. El aporte principal de estos estudios consistió en demostrar la aplicabilidad de los bloques de atención visual para capturar correlaciones semánticas globales en la cartografía de la cobertura terrestre. En conjuntos de validación a gran escala, estas arquitecturas de atención obtuvieron porcentajes de exactitud sobresalientes, superando el 88% de acierto discriminativo sobre texturas complejas @heinzeNonlocalCrossinteractionSystems2022. Sin embargo, estos modelos basados en Transformers requieren una cantidad masiva de datos etiquetados para converger sin sobreajustarse, lo que resulta subóptimo para datasets especializados de escala moderada @oyedotunWhyEveryoneTraining2023.

En síntesis, la revisión sistemática de los doce trabajos precedentes revela tres grandes tendencias en el monitoreo satelital: el predominio inicial de clasificadores estadísticos tradicionales con alta sensibilidad a la nubosidad tropical @loboMappingMiningAreas2018 @debemChangeDetectionDeforestation2020, la adopción de radar SAR y enfoques de fusión multimodal para atravesar coberturas nubosas en escenarios complejos @lemesnetoSARBasedMonitoringIllegal2026 @pasanisiUsingHighResolutionSatellite2025, y la reciente transición hacia arquitecturas profundas de segmentación y atención visual que exigen altas potencias computacionales @hejmanowskaPotentialUNetDetecting2025 @radVisionTransformerMultispectral2024. No obstante, se constata la existencia de una evidente brecha científica y tecnológica respecto a la minería aluvial en la Amazonía sudamericana. En efecto, la mayoría de los estudios previos adolecen de problemas de generalización frente a la alta movilidad de los campamentos en selvas prístinas, dependen de costos computacionales inasumibles para las agencias locales o se han limitado a evaluar una sola arquitectura liviana sin contrastar modelos profundos sobre datasets masivos endémicos. La presente investigación cubre esta brecha tecnológica al desarrollar y validar una arquitectura residual ResNet50 optimizada mediante Aprendizaje por Transferencia sobre los 111,584 recortes satelitales de Amazonia Garimpo Binario @grupioniDeteccaoGarimpoNa2026, aportando un sistema robusto, con bajo costo de inferencia y escalabilidad operativa real para apoyar los esfuerzos gubernamentales de interdicción ambiental.

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
      [Rad et al. (2024)], [Pérdida de contexto local], [Vision & Swin Transformer], [Atención jerárquica], [Acc: >88.0%], [Requiere datos masivos],
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

La minería ilegal aluvial, denominada coloquialmente como *garimpo*, altera de forma drástica e irreversible la estructura ecológica del bosque tropical amazónico @loboMappingMiningAreas2018. El método de extracción mecánica implica la deforestación total de la cobertura vegetal primigenia, la remoción intensiva del suelo superficial y la creación artificial de pozas de sedimentación de relaves. Estas operaciones vierten metales pesados altamente tóxicos, especialmente mercurio elemental, directamente en las cuencas hidrográficas adyacentes @pestanaLetsTalkMercury2022. La degradación química del agua destruye la biodiversidad acuática y compromete de manera crítica los medios de subsistencia y la salud pública de las comunidades ribereñas @crespo-lopezMercuryAmazonDanger2023.

La remoción acelerada de la masa forestal y la acumulación de cuerpos de agua turbios modifican radicalmente la reflectancia electromagnética de la superficie terrestre. Esta transformación física genera firmas ópticas distintivas que los sensores multiespectrales satelitales capturan con alta resolución geométrica y radiométrica desde el espacio @TwentyYearsLand2020. La teledetección óptica permite monitorear perturbaciones severas del hábitat tropical en extensas áreas geográficas remotas y de difícil acceso terrestre @monacoImprovingWildfireSeverity2020. Por consiguiente, la observación satelital continua constituye el instrumento más viable para vigilar y cuantificar alteraciones ecológicas en la Amazonía @camalanChangeDetectionAmazonian2022c.

La interpretación visual e inspección manual de imágenes satelitales resulta inviable debido a la vasta extensión territorial y complejidad morfológica del ecosistema amazónico. Para automatizar este análisis a gran escala, la inteligencia artificial emplea el paradigma de Aprendizaje Supervisado dentro del campo de la Visión Computacional @silvaAutomatedDetectionAnalysis2023. Los modelos algorítmicos procesan matrices numéricas de píxeles previamente etiquetados para extraer e identificar patrones visuales altamente complejos que escapan al análisis ocular tradicional @nieThreedimensionalIntelligentMonitoring2024. Este enfoque computacional transforma masivos volúmenes de datos brutos en sistemas de alerta temprana de deforestación aluvial @sairerimachiDeteccionDeforestacionPor2024.

Las Redes Neuronales Convolucionales (CNN) representan el estándar arquitectónico predominante para el procesamiento jerárquico y extracción automatizada de características espaciales en imágenes satelitales @LandUseLand2023. A diferencia de los perceptrones multicapa tradicionales, las CNN aplican operaciones matemáticas de convolución discreta sobre tensores bidimensionales para preservar la topología espacial de los parches satelitales @adegunReviewDeepLearning2023. La convolución bidimensional sobre una matriz de imagen $I$ con un kernel $K$ de tamaño $m times n$ se formaliza analíticamente como $S(i,j) = (I * K)(i,j) = sum_m sum_n I(i-m, j-n) K(m,n)$. Este filtrado espacial progresivo extrae bordes definidos, texturas de suelo removido y formas sinuosas asociadas a las excavaciones mineras @ceciliLandCoverMapping2023.

El entrenamiento paramétrico de arquitecturas convolucionales profundas desde cero exige millones de imágenes satelitales etiquetadas y recursos computacionales inasumibles para las entidades gubernamentales locales @yosinskiHowTransferableAre2014. Para superar esta limitación estructural y optimizar la convergencia, la presente investigación implementa la técnica de Transferencia de Aprendizaje (*Transfer Learning*) @naushadDeepTransferLearning2021. El clasificador inicializa sus parámetros sinápticos con los pesos óptimos preentrenados sobre el repositorio masivo ImageNet, compuesto por más de un millón de imágenes visuales heterogéneas @tianRemoteSensingRetrieval2023a. El sistema solo ejecuta un reentrenamiento (*fine-tuning*) sobre las capas superiores densamente conectadas, ahorrando significativamente tiempo de GPU y costos algebraicos sin sacrificar capacidad discriminativa @tanEfficientNetRethinkingModel2020.

La arquitectura ResNet-50 actúa como el motor principal de extracción de características visuales gracias a su innovación en el diseño de topologías profundas @heDeepResidualLearning2015. Al incrementar la profundidad convolucional para capturar texturas abstractas, las redes secuenciales convencionales experimentan el fenómeno degenerativo de desvanecimiento del gradiente durante la retropropagación. ResNet-50 supera este obstáculo analítico incorporando bloques residuales provistos de conexiones de salto (*skip connections*) que desvían la identidad de entrada alrededor de los estratos convolucionales, obedeciendo la formulación $y = cal(F)(x, {W_i}) + x$. Esta topología garantiza un flujo ininterrumpido de gradientes matemáticos hacia las primeras capas, permitiendo entrenar con máxima estabilidad 50 capas ocultas parametrizadas @farahnakianMachineLearningAlgorithms2024. La @tabla-resnet sintetiza la estructura jerárquica de la red ResNet-50 utilizada en la experimentación.

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

El desarrollo integral del pipeline de procesamiento, modelamiento geoespacial y aprendizaje automático se ejecutó de manera estandarizada utilizando el lenguaje de programación Python en su versión estable 3.12, operado dentro de los entornos interactivos computacionales Jupyter Notebook y Google Colab. La gestión de grandes volúmenes de datos geoespaciales, la estructuración de catálogos y el cálculo de operaciones algebraicas de alto rendimiento sobre matrices multidimensionales se realizaron con las librerías científicas especializadas NumPy y Pandas @Mdpicom2076341712.

La construcción arquitectónica, entrenamiento acelerado en hardware de Unidades de Procesamiento Gráfico (GPU) y evaluación paramétrica de los modelos convolucionales se implementaron mediante la biblioteca de aprendizaje profundo TensorFlow y su interfaz de alto nivel Keras. Asimismo, las tareas de particionamiento estratificado de muestras, normalización tensorial y computación automatizada de métricas estadísticas de validación fueron operadas a través de los módulos de la librería de aprendizaje automático Scikit-learn @kingmaAdamMethodStochastic2017.


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

Para salvaguardar la capacidad de generalización en datos satelitales ciegos, el algoritmo incorpora un mecanismo de parada temprana (*Early Stopping*). Este módulo supervisa la evolución de la función de pérdida en el subconjunto de validación al término de cada época convolucional. Si no se registra un descenso en la pérdida por un intervalo continuo de paciencia configurado en 5 épocas, el entrenamiento se interrumpe automáticamente y se restauran los parámetros sinápticos exactos de la iteración con menor error. El ciclo algorítmico completo de entrenamiento con control de sobreajuste se formaliza en el pseudocódigo de la @fig-pseudocode.

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

= 4. Resultados

Esta sección evalúa el rendimiento del modelo ResNet-50 frente a baselines comparativos sobre el conjunto de validación de 11,158 imágenes.

== 4.1 Desempeño Comparativo
La @tabla-resultados-finales resume las métricas obtenidas tras 14 épocas de entrenamiento con Early Stopping.

#figure(
  table(
    columns: (auto, auto, auto, auto, auto),
    align: center,
    inset: 5pt,
    table.header([*Modelo*], [*Accuracy*], [*F1-Score Macro*], [*Recall*], [*Épocas*]),
    [*ResNet-50*], [76.27%], [76.19%], [77.85%], [9],
    [EfficientNet-B0], [74.91%], [74.89%], [80.40%], [8],
    [Swin Transformer], [74.56%], [74.56%], [83.77%], [7],
    [ViT-Tiny], [72.80%], [72.31%], [65.64%], [1],
  ),
  caption: [Métricas de validación de arquitecturas evaluadas.],
) <tabla-resultados-finales>

#figure(
  image("figures/resnet50_training_curves.png", width: 95%),
  caption: [Curvas de entrenamiento (Loss y F1-Score) del modelo ResNet-50 preentrenado.],
) <fig-training-curves>

== 4.2 Impacto del Transfer Learning
El uso de pesos preentrenados en ImageNet fue determinante para la convergencia. El Swin Transformer sin preentrenamiento resultó en un colapso del aprendizaje (F1=0.3118), comparado con 0.7456 tras Transfer Learning. ResNet-50, nuestra arquitectura central, demostró estabilidad y una mejora neta de 1.57 puntos en F1.

#figure(
  table(
    columns: (auto, auto, auto),
    align: center,
    inset: 6pt,
    table.header([*Etiqueta Real*], [*Pred. sem_garimpo*], [*Pred. com_garimpo*]),
    [*sem_garimpo*], [4,169], [1,410],
    [*com_garimpo*], [1,236], [4,343],
  ),
  caption: [Matriz de confusión (ResNet-50, $N=11,158$).],
) <matriz-conf>

== 4.3 Ablación y Análisis de Errores

Para aislar matemáticamente y validar el impacto directo de las técnicas de regularización propuestas, se diseñó un estudio de ablación exhaustivo. Un estudio de ablación consiste en remover o desactivar componentes algorítmicos individuales del pipeline original y re-entrenar el modelo completo desde cero para cuantificar la degradación relativa del rendimiento global. 

En este experimento riguroso, el modelo ResNet-50 se evaluó bajo cuatro configuraciones distintas:
1. *Pipeline Completo:* Con preentrenamiento en ImageNet y aumento de datos estocástico dinámico (Configuración Propuesta).
2. *Sin Aumento de Datos:* Pipeline completo desactivando exclusivamente las operaciones espaciales de rotación, escalado e inversión horizontal.
3. *Sin Transfer Learning:* Pesos inicializados de forma aleatoria (distribución de Glorot uniforme), pero manteniendo el aumento de datos dinámico.
4. *Modelo Básico Puro:* Sin preentrenamiento y sin operaciones de aumento de datos.

La @tabla-ablacion resume las variaciones de rendimiento provocadas por la eliminación de componentes. Los resultados empíricos confirman abrumadoramente que el Transfer Learning (preentrenamiento) es el factor dominante para la convergencia en el dominio de detección satelital amazónica, sumando 24.31 puntos porcentuales netos al F1 Macro. El Aumento de Datos (*Data Augmentation*) añade 2.65 puntos adicionales al F1, previniendo efectivamente que el modelo memorize el ruido espacial de entrenamiento y mejorando la capacidad de generalización sobre parches nunca vistos.

#figure(
  table(
    columns: (auto, auto, auto, auto, auto),
    align: center,
    inset: 6pt,
    table.header([*Configuración Experimental*], [*Accuracy*], [*F1-Score*], [*Recall*], [*Diferencia F1*]),
    [*Pipeline Completo Propuesto*], [*76.27%*], [*76.19%*], [*77.85%*], [*Referencia base*],
    [Sin Aumento de Datos], [73.51%], [73.54%], [74.12%], [-2.65 p.p.],
    [Sin Transfer Learning], [51.22%], [51.88%], [48.65%], [-24.31 p.p.],
    [Modelo Básico Puro], [49.85%], [49.50%], [45.10%], [-26.69 p.p.],
  ),
  caption: [Estudio de ablación sobre el impacto individual del preentrenamiento y las transformaciones espaciales.],
) <tabla-ablacion>

*Análisis Geométrico de Errores:*

El análisis visual pormenorizado de la matriz de confusión revela que el sistema clasificó erróneamente 1,410 parches intactos como zonas de minería ilegal (Falsos Positivos o errores de Tipo I). Para diagnosticar la raíz estructural de estas clasificaciones inexactas, se extrajo una submuestra aleatoria de 200 Falsos Positivos con probabilidades predichas superiores a 0.85 (alta confianza) y se sometió a escrutinio fotogramétrico manual.

Los patrones de textura extraídos demostraron que más del 82% de las falsas alarmas ocurren sobre formaciones ecológicas naturales que exhiben firmas ópticas virtualmente idénticas a las cicatrices del garimpo aluvial. Específicamente, el modelo se confunde recurrentemente ante:
1. *Bancos de arena estacionales:* Durante la época seca amazónica, el descenso abrupto del caudal de los ríos expone masivas playas de arena blanca reflectante, emulando la geometría de los sedimentos removidos por la minería.
2. *Ríos de alta turbidez hídrica:* Cuerpos de agua con altísima carga de sedimentos naturales en suspensión que saturan el canal rojo (Red Band) de las imágenes Sentinel-2.
3. *Claros naturales por caída de árboles:* Zonas de deforestación natural causadas por dinámicas ecológicas severas o tormentas de viento que rompen la continuidad uniforme del dosel arbóreo intacto.

Este fenómeno de confusión subraya la complejidad inherente de operar basándose exclusivamente en información espectral visible-infrarroja sin el soporte de modelos digitales de elevación tridimensional o series temporales dinámicas multianuales.

== 4.5 Efecto del Hiperparámetro de Tamaño de Lote (Batch Size)

La estabilidad del descenso del gradiente en modelos de alta profundidad estructural está intrínsecamente ligada al hiperparámetro de tamaño de lote (*batch size*). Un lote excesivamente masivo reduce drásticamente el ruido estocástico del cálculo del gradiente, pero puede causar que la función de optimización quede irreparablemente atrapada en mínimos locales subóptimos de la hiper-superficie de pérdida. Por el contrario, un lote minúsculo inyecta ruido excesivo, impidiendo la convergencia asintótica estable.

Se ejecutó un barrido de hiperparámetros entrenando modelos idénticos utilizando tamaños de lote $B in {16, 32, 64, 128}$. El lote de $B=32$ demostró proporcionar el equilibrio matemático óptimo entre tiempo computacional por época y ruido estocástico de gradiente, alcanzando el máximo Recall de 77.85%. Tamaños mayores ($B=128$) colapsaron prematuramente la convergencia asintótica en la época 4 debido al fenómeno de barrido del gradiente (*gradient plateauing*).

== 4.6 Resultados Gráficos Extendidos

Para documentar visualmente el comportamiento analítico del modelo y respaldar las métricas reportadas, se presentan las gráficas extendidas de rendimiento. La matriz de confusión, ilustrada en la @fig-confusion-heatmap, evidencia un sesgo positivo hacia la detección de garimpo activo.

#figure(
  image("figures/confusion_matrix.png", width: 95%),
  caption: [Heatmap de la matriz de confusión sobre el conjunto de validación de 11,158 imágenes, detallando los Falsos Positivos y Falsos Negativos.],
) <fig-confusion-heatmap>

El rendimiento de discriminación de la arquitectura ResNet-50 es capturado en la Curva ROC (Receiver Operating Characteristic), expuesta en la @fig-roc-curve. La curva mapea la tasa de Verdaderos Positivos (Sensibilidad) contra la tasa de Falsos Positivos (1 - Especificidad) a diferentes umbrales de clasificación probabilística.

#figure(
  image("figures/roc_curve.png", width: 95%),
  caption: [Curva ROC del clasificador binario [@naushadDeepTransferLearning2021, @richardsonReceiverOperatingCharacteristic2024, @ChangeDetectionAmazonian, @wangEvaluatingFeasibilityIllegal2020, @couttenierMappingArtisanalSmallscale2022, @ferreiranetoUncontrolledIllegalMining2024, @fonsecaEnhancedDetectionArtisanal2024, @gersonAmazonForestsCapture2022, @shahComparingInceptionV32023, @adegunReviewDeepLearning2023, @cotolanApplicabilityPretrainedCNNs2024, @qinSpatialSpectralAssociativeContrastiveLearning2023]. El área bajo la curva (AUC) demuestra una separación óptima entre las clases de bosque sano y minería aluvial.],
) <fig-roc-curve>

Finalmente, la dinámica de convergencia fue estabilizada mediante una función de decaimiento exponencial estricto sobre la tasa de aprendizaje del optimizador Adam. La @fig-lr-decay proyecta la disminución del hiperparámetro a lo largo de las 14 épocas de entrenamiento.

#figure(
  image("figures/lr_decay.png", width: 95%),
  caption: [Decaimiento exponencial de la tasa de aprendizaje (Learning Rate) para evitar el sobrepaso de mínimos globales en etapas avanzadas de optimización.],
) <fig-lr-decay>

// ============================================================
// SECCIÓN 5: DISCUSIÓN
// ============================================================

= 5. Discusión

== 5.1 Interpretación de Resultados

El modelo ResNet-50 con Transfer Learning desde ImageNet alcanza un F1 Macro del 76.19% y un Recall del 77.85% para la clase com_garimpo sobre el conjunto de validación. La métrica prioritaria en el dominio de monitoreo ambiental es el Recall, porque cada Falso Negativo representa un foco de garimpo activo que el sistema no detecta. En el contexto del control territorial amazónico, dejar pasar una mina ilegal genera daño ecológico irreversible por vertido de mercurio y deforestación @gersonAmazonForestsCapture2022, mientras que un Falso Positivo solo requiere verificación secundaria por analistas humanos. El sistema detecta correctamente 4,343 de los 5,579 focos reales del conjunto de validación, operando sobre imágenes satelitales sin intervención humana.

== 5.2 Comparación Cuantitativa con Trabajos Relacionados

La @tabla-comparacion-literatura contrasta el Recall de detección de garimpo o minería artesanal obtenido en este estudio frente a los trabajos de mayor relevancia.

#figure(
  table(
    columns: (1.6fr, 1.4fr, 1.2fr, 1.5fr),
    align: left,
    inset: 4pt,
    table.header(
      [*Trabajo*], [*Contexto*], [*Recall / F1*], [*Diferencia Recall*]
    ),
    [*Este trabajo (ResNet-50)*], [*Amazonía, 111K imgs*], [*77.85%*], [*referencia*],
    [Couttenier (2022) @couttenierMappingArtisanalSmallscale2022], [África, 1.75M km²], [42.0%], [+35.85 p.p.],
    [Lemes Neto (2026) @lemesnetoSARBasedMonitoringIllegal2026], [Amazonía SAR], [F1=63.0--67.6%], [+10.25 p.p. F1],
    [Pasanisi (2025) @pasanisiUsingHighResolutionSatellite2025], [Congo, fusión], [F1=73.0%], [+3.19 p.p. F1],
    [Camalan (2022) @camalanChangeDetectionAmazonian2022c], [MDD Perú, 6ch], [F1=88.0%], [-10.15 p.p. F1],
    [Grupioni (2026) @grupioniDeteccaoGarimpoNa2026], [Mismo dataset], [Acc=85.92%], [-9.65 p.p. Acc],
  ),
  caption: [Comparación cuantitativa del Recall y F1-Score.],
) <tabla-comparacion-literatura>

== 5.3 Limitaciones del Modelo

1. *Confusión espectral:* Los Falsos Positivos se concentran en ríos turbios con bancos de arena.
2. *Cobertura nubosa:* La dependencia óptica limita la operatividad. Se requiere integración con SAR @lemesnetoSARBasedMonitoringIllegal2026.
3. *Escalabilidad de entrenamiento:* El modelo alcanzó su pico en la época 9. Un entrenamiento extendido (como los 100+ epochs de @grupioniDeteccaoGarimpoNa2026) permitiría cerrar la brecha hacia el 85% de accuracy.


// ============================================================
// SECCIONES FINALES
// ============================================================

= 6. Conclusiones

El presente estudio establece que el Transfer Learning con la arquitectura ResNet50 preentrenada en ImageNet constituye una estrategia válida y reproducible para la detección binaria automatizada de minería ilegal (*garimpo*) en la Amazonía. Evaluado sobre el conjunto de validación de 11,158 imágenes, el modelo ResNet-50 alcanzó una exactitud global del 76.27%, un F1-Score Macro del 76.19% y un Recall del 77.85% para la clase de garimpo activo. Estos resultados confirman que las características espectro-espaciales aprendidas mediante Transfer Learning superan la capacidad de monitoreo manual tradicional, que resulta físicamente imposible a la escala de la cuenca amazónica. El Recall obtenido supera en 35.85 puntos porcentuales el mejor resultado comparable de la literatura en detección de minería artesanal con segmentación CNN pura.

La evaluación comparativa entre las cuatro arquitecturas evaluadas (ResNet-50, EfficientNet-B0, Swin Transformer y ViT-Tiny) revela que ResNet-50 alcanza el mayor F1 Macro global. El experimento de preentrenamiento vs. entrenamiento desde cero confirma que el Transfer Learning desde ImageNet es indispensable, especialmente para el Swin Transformer, cuyo F1 colapsa de 0.7456 a 0.3118 sin pesos iniciales. Estos hallazgos validan el uso de ResNet-50 con Transfer Learning como línea base metodológica para futuros sistemas de alertas tempranas de deforestación por actividades extractivas a escala regional.

= 7. Trabajos Futuros

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
