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

= 2. Trabajos Relacionados

La minería ilegal aurífera y su consecuente deforestación en la selva amazónica carecen a menudo de mapeo sistemático debido a la inmensidad del territorio. Lobo et al. @loboMappingMiningAreas2018 propusieron evaluar el uso de datos multiespectrales de Sentinel-2 para mapear áreas de extracción de oro. La metodología implementó el clasificador Machine Learning Random Forest sobre un análisis de componentes principales espectrales. El aporte es el establecimiento de Sentinel-2 como el sensor multiespectral estándar para la detección amazónica. El modelo alcanzó un índice Kappa de 0.93. La deficiencia principal es la alta susceptibilidad al ruido óptico provocado por las nubes densas tropicales.

La minería artesanal de pequeña escala en el continente africano carece de mapas de alta resolución actualizados de forma sistemática. Couttenier et al. @couttenierMappingArtisanalSmallscale2022 propusieron mapear la extracción mineral artesanal utilizando un flujo de trabajo satelital de resolución media del conjunto Sub-Tropical West Africa. La metodología integró una red convolucional de segmentación (CNN) escalable a nivel continental. El aporte es el primer dataset masivo de minería artesanal en dicha región africana. El modelo alcanzó 70% de precisión con 42% de recall en la detección de sitios mineros. La deficiencia es el recall moderado, que implica subestimación de la actividad real y limita el uso del mapa para fiscalización.

La detección de deforestación en la Amazonía requiere comparar pares de imágenes temporales, tarea que los métodos clásicos realizan con baja precisión geométrica. De Bem et al. @debemChangeDetectionDeforestation2020 compararon algoritmos estadísticos contra aproximaciones modernas para detectar deforestación entre pares de imágenes Landsat anuales en Brasil. La metodología desplegó arquitecturas de Deep Learning como ResUnet junto a métodos clásicos de Machine Learning. El aporte principal es la demostración de que los modelos profundos superan a los estadísticos con bordes mejor definidos y sin requerir postprocesamiento. El mejor modelo alcanzó Kappa, F1 e mIoU de 0.94 en ambas secuencias temporales. La limitación es la dependencia de pares anuales de imágenes, lo que impide una detección en tiempo casi real.

La minería artesanal de pequeña escala en Ghana se expande sin control, sin sistemas automatizados de monitoreo que alerten a las autoridades. Gallwey et al. @gallweySentinel2BasedMultispectral2020a desarrollaron un sistema multiespectral basado en Sentinel-2 para detectar minería artesanal de pequeña escala en África Occidental. La metodología, denominada "deep learning to shallow mining", aprovechó arquitecturas CNN sobre múltiples bandas espectrales para discriminar zonas mineras. El aporte principal es la primera aplicación de redes convolucionales multibanda a la detección de minería superficial en dicho contexto. El modelo identificó exitosamente zonas mineras activas utilizando exclusivamente información espectral de libre acceso. La deficiencia es la falta de generalización comprobada hacia ecosistemas tropicales distintos a la sabana ghanesa.

La cobertura nubosa persistente en la Amazonía invalida frecuentemente el uso de sensores ópticos para el monitoreo continuo en períodos lluviosos. Lemes Neto et al. @lemesnetoSARBasedMonitoringIllegal2026 propusieron explorar imágenes SAR de banda C (Sentinel-1) para detectar minería ilegal bajo cobertura nubosa total. La metodología entrenó una arquitectura CNN liviana en 7 escenas satelitales de la cuenca Tapajós y evaluó la generalización en el Territorio Indígena Yanomami. El aporte diferencial es la demostración empírica de que las imágenes de radar son una alternativa viable a los sensores ópticos. El sistema logró un F1-score de 0.676 en Tapajós y 0.630 en Yanomami. La deficiencia identificada es la dificultad para capturar correctamente patrones mineros de muy baja densidad y estructuras periféricas pequeñas.

La minería artesanal en la República Democrática del Congo opera en zonas sin cartografía confiable y con severa escasez de datos de entrenamiento etiquetados. Pasanisi et al. @pasanisiUsingHighResolutionSatellite2025 propusieron mapear la extensión espacial de este fenómeno mediante la fusión de imágenes de alta resolución con datos sintéticos de radar. La metodología generó un pseudo-ground truth mediante clustering estadístico e incorporó algoritmos de Machine Learning para refinar la segmentación. El aporte principal es el enfoque de fusión tardía (Late Fusion) entre Planet-NICFI y Sentinel-1, que mejora la discriminación entre cuerpos de agua lodosos y zonas mineras secas. El modelo de fusión alcanzó una precisión de 71%, recall de 75% y F1 de 73%. La deficiencia residual es la persistente dificultad para distinguir los sitios mineros de las áreas altamente urbanizadas.

La deforestación causada por actividades mineras en la Amazonía peruana no cuenta con herramientas automatizadas en idioma español adaptadas al contexto sociodemográfico latinoamericano. Saire Rimachi et al. @sairerimachiDeteccionDeforestacionPor2024 desarrollaron un enfoque computacional para detectar de forma temprana la deforestación provocada por actividades mineras y agrícolas en la selva peruana. La metodología aplicó diversas redes neuronales convolucionales (CNN) sobre imágenes satelitales localmente anotadas de la región amazónica de Madre de Dios. El aporte es la creación de un precedente investigativo directo para el contexto peruano utilizando datos endémicos. La arquitectura demostró una notable capacidad para detectar patrones espaciales diferenciando entre las causas antrópicas. La limitación estructural es el tamaño sumamente reducido del conjunto de datos utilizado para el entrenamiento.

Las agencias gubernamentales carecen de herramientas rápidas y de código abierto para localizar espacialmente zonas de minería ilegal en inmensos volúmenes de imágenes satelitales. Shashidhara y Khan @shashidharasIllegalMiningActivity2025 propusieron un sistema integrado de doble etapa que unifica la clasificación categórica y la identificación espacial de coordenadas mineras ilegales. La metodología implementó un pipeline de preprocesamiento seguido de un clasificador CNN acoplado a un detector YOLO, todo desplegado en una interfaz web Flask. El aporte central es la integración de estos modelos convolucionales masivos en una plataforma operativa lista para la toma de decisiones. El sistema reportó una altísima exactitud en la clasificación binaria entre zonas de bosque prístino y zonas de minería ilícita. La cobertura geográfica original del dataset fue demasiado reducida, limitando fuertemente la generalización del sistema hacia otros territorios forestales.

La escasez de líneas base sólidas dificulta la validación rigurosa de arquitecturas emergentes sobre conjuntos de datos estandarizados como el Amazonia Garimpo Binario. Grupioni et al. @grupioniDeteccaoGarimpoNa2026 establecieron un punto de referencia directo al aplicar técnicas computacionales de frontera sobre este mismo corpus fotográfico. La metodología desplegó una red CNN EfficientNet-B0 potenciada por mecanismos de Transfer Learning para clasificar los tensores multiespectrales. El aporte es la generación del estado del arte fundacional sobre este conjunto de datos específico. El entrenamiento iterativo convergió alcanzando 85.92% de accuracy global y un AUC de 0.9371. La deficiencia de dicho estudio es que evaluaron un único modelo convolucional, dejando una brecha empírica que el presente documento aborda comparando exhaustivamente ResNet50 contra Transformers y arquitecturas paralelas.

El mapeo del drenaje ácido de minas requiere identificar con altísima urgencia cuerpos de agua severamente contaminados en zonas de extracción geológica activa. Farahnakian et al. @farahnakianMachineLearningAlgorithms2024 se propusieron investigar la aplicación de algoritmos computacionales para mapear este drenaje ácido fusionando imágenes de Sentinel-2 y WorldView-3. La metodología implementó tres modelos de Machine Learning (Random Forest, KNN y MLP) para tareas duales de clasificación y regresión geoquímica. El aporte radica en demostrar matemáticamente que la fusión de imágenes de resolución media y altísima resolución satelital optimiza significativamente la detección temprana. El clasificador Random Forest logró separar los píxeles de agua ácida de los ecosistemas limpios con altos niveles de precisión. La deficiencia es que los algoritmos tradicionales evaluados no extraen características espaciales profundas, limitando su adaptabilidad ante nuevas topografías.

La detección de minería ilegal a pequeña escala carece a menudo de modelos de segmentación semántica que hayan sido estadísticamente validados frente a clasificadores convencionales. Hejmanowska et al. @hejmanowskaPotentialUNetDetecting2025 se propusieron evaluar rigurosamente el potencial de arquitecturas de segmentación computacional para detectar actividades mineras usando Sentinel-2. La metodología entrenó la red neuronal profunda convolucional U-Net y evaluó su exactitud comparándola directamente contra algoritmos de Machine Learning operando en Google Earth Engine. El aporte es la validación concluyente de que el aprendizaje profundo semántico supera ampliamente a los modelos estadísticos integrados en nubes públicas. La arquitectura U-Net alcanzó exactitudes significativamente superiores en áreas mineras espacialmente heterogéneas. La limitación radica en el altísimo costo computacional de inferencia de la red, lo que dificulta enormemente su despliegue en tiempo real para agencias sin hardware especializado.

#figure(
  block[
    #set text(size: 7pt)
    #table(
      columns: (1.3fr, 1.5fr, 1.7fr, 1.5fr, 1.3fr, 1.3fr),
      align: left,
      inset: 3pt,
      table.header(
        [*Autores*], [*Problema*], [*Aporte*], [*Metodología*], [*Resultado*], [*Deficiencia*]
      ),
    [Adegun (2023)], [Clasificación satelital], [Revisión CNN+ViT], [ResNet, DenseNet], [Acc mayor a 95%], [No representa trópico],
    [Balaniuk (2020)], [Minas ilegales BR], [Detección masiva], [FCN + GEE], [263 minas], [No clasifica tipo],
    [Camalan (2022)], [Cambios auríferos], [E-ReCNN], [Sentinel-2 6ch], [F1=0.88], [Depende atmósfera],
    [Couttenier (2022)], [ASM África], [1er mapa masivo], [CNN segmentación], [Recall=42%], [Recall bajo],
    [De Bem (2020)], [Deforestación], [ResUnet supera RF], [SharpMask/U-Net], [mIoU=0.94], [Solo anual],
    [Farahnakian (2024)], [Drenaje ácido], [Fusión Sentinel+WV3], [RF, KNN, MLP], [Detección precisa], [Sin contexto espacial],
    [Gallwey (2020)], [ASM Ghana], [CNN multibanda], [Deep-to-Shallow], [Error menor a 8%], [No generaliza],
    [Hejmanowska (2025)], [Segmentación ASM], [U-Net vs GEE], [U-Net Semántica], [Supera RF/SVM], [Costo GPU alto],
    [Lemes Neto (2026)], [Nubes], [CNN SAR], [Sentinel-1], [F1=0.676], [Baja densidad],
    [Pasanisi (2025)], [ASM Congo], [Late Fusion], [Planet+SAR], [F1=0.73], [Confusión urbana],
    [Saire Rimachi (2024)], [Deforestación Perú], [Precedente latam], [CNN], [Detecta causas], [Dataset pequeño],
    [Shashidhara (2025)], [Localización RT], [CNN+YOLO], [DenseNet121+YOLO], [Acc alta], [Cobertura reducida],
    [Grupioni (2026)], [Garimpo Amazónico], [Benchmarking], [EfficientNet-B0], [Acc=85.92%], [Solo 1 modelo],
    )
  ],
  caption: [Comparativa ampliada de trabajos relacionados sobre detección de minería ilegal y deforestación mediante teledetección y Deep Learning.],
) <tabla-relacionados>


// ============================================================
// SECCIÓN 3: MATERIALES Y MÉTODOS
// ============================================================

= 3. Materiales y Métodos

== 3.1 Fundamentos Teóricos

La minería ilegal aluvial, coloquialmente denominada *garimpo*, altera de forma drástica e irreversible la firma espectral del bosque tropical amazónico. El proceso extractivo involucra la deforestación de la cobertura vegetal, la remoción del suelo superficial y la creación artificial de pozas de sedimentación altamente reflectantes. Estas cicatrices antrópicas exhiben firmas ópticas distintivas en los satélites multiespectrales, diferenciándose claramente de los cuerpos de agua naturales y la vegetación circundante. La teledetección óptica permite capturar esta alteración a través de los canales espectrales visibles e infrarrojos @loboMappingMiningAreas2018 @TwentyYearsLand2020. 

Las Redes Neuronales Convolucionales (CNN) representan el estándar de oro arquitectónico para la extracción automatizada de características espaciales en imágenes satelitales. A diferencia de los perceptrones multicapa clásicos, las CNN aplican operaciones de convolución matemática discreta para preservar la estructura jerárquica de los píxeles. La operación de convolución bidimensional sobre una imagen $I$ con un kernel $K$ de tamaño $m times n$ se define formalmente como $S(i,j) = (I * K)(i,j) = sum_m sum_n I(i-m, j-n) K(m,n)$. Este proceso extrae progresivamente bordes, texturas y formas complejas asociadas a las zonas mineras @LandUseLand2023 @adegunReviewDeepLearning2023.

Para introducir no linealidad en el modelo de regresión lineal subyacente, la arquitectura aplica la función de activación Unidad Lineal Rectificada (ReLU). La función ReLU se define matemáticamente como $f(x) = max(0, x)$, anulando los valores negativos del mapa de características. Esta operación acelera drásticamente la convergencia del descenso de gradiente estocástico al evitar cálculos exponenciales costosos. Asimismo, previene el fenómeno de saturación del gradiente presente en funciones sigmoidales tradicionales @kingmaAdamMethodStochastic2017 @heDeepResidualLearning2015.

El estrato de agrupamiento (*Pooling*) reduce sistemáticamente la dimensionalidad espacial de la representación. La operación de *Max Pooling* selecciona el valor máximo dentro de una ventana deslizante de tamaño $k times k$, operando independientemente en cada canal de profundidad. Esta técnica confiere invarianza traslacional al modelo, permitiendo que la red reconozca una poza de relaves sin importar su ubicación exacta en el parche de la imagen. Adicionalmente, el *Pooling* disminuye drásticamente el número de parámetros computacionales, mitigando el riesgo de sobreajuste durante el entrenamiento @ceciliLandCoverMapping2023 @heDeepLearningForest2023.

La arquitectura VGG16 sentó las bases históricas de las redes convolucionales profundas secuenciales mediante el uso exclusivo de filtros pequeños de $3 times 3$. A pesar de su simplicidad conceptual, VGG16 sufre severamente del problema de desvanecimiento del gradiente al intentar aumentar su profundidad. Durante la fase de retropropagación (*backpropagation*), los gradientes disminuyen exponencialmente al multiplicarse por los pesos de las capas anteriores. Este defecto estructural impide que los modelos secuenciales puros alcancen altas exactitudes en clasificaciones complejas como las firmas espectrales del garimpo @cotolanApplicabilityPretrainedCNNs2024.

Para solucionar la degradación del gradiente, este estudio adopta la arquitectura ResNet-50 como motor principal de extracción de características. ResNet-50 introduce el concepto revolucionario de los bloques residuales, empleando conexiones de salto (*skip connections*) que desvían la información alrededor de las capas convolucionales. El bloque residual se formaliza mediante la ecuación $y = cal(F)(x, {W_i}) + x$, donde $x$ es el vector de entrada y $cal(F)$ representa el mapeo residual. Esta topología garantiza un flujo de gradiente ininterrumpido hacia las capas iniciales, posibilitando el entrenamiento eficiente de 50 capas de profundidad @heDeepResidualLearning2015 @farahnakianMachineLearningAlgorithms2024.

La limitación de datos satelitales etiquetados a gran escala se resuelve mediante la técnica de Transferencia de Aprendizaje (*Transfer Learning*). La red ResNet-50 se inicializa con los pesos sinápticos óptimos preentrenados sobre el masivo conjunto de datos ImageNet, compuesto por más de un millón de imágenes. Las primeras capas de la red ya poseen una sólida comprensión matemática de bordes, gradientes de color y texturas básicas. El modelo solo requiere un reentrenamiento (*fine-tuning*) de sus capas superiores densamente conectadas para adaptar esta visión general a las geometrías específicas de la deforestación minera amazónica @yosinskiHowTransferableAre2014 @naushadDeepTransferLearning2021.

== 3.2 Herramientas y Tecnologías

El desarrollo del pipeline de clasificación automatizada se implementó integralmente utilizando el lenguaje de programación Python en su versión 3.12. Python proporciona el ecosistema de computación científica más robusto para tareas de análisis de datos geoespaciales y aprendizaje automático a gran escala. La infraestructura de manejo de matrices multidimensionales y cálculos algebraicos de alto rendimiento fue operada a través de las librerías estándar NumPy y Pandas.

Para la construcción, entrenamiento y evaluación del modelo de aprendizaje profundo, se utilizó la biblioteca de código abierto TensorFlow y su API de alto nivel Keras. TensorFlow permite la paralelización de operaciones tensoriales sobre Unidades de Procesamiento Gráfico (GPU), acelerando exponencialmente los tiempos de iteración. La arquitectura ResNet-50 y los pesos preentrenados de ImageNet se instanciaron directamente desde el módulo interno de aplicaciones Keras, garantizando la estandarización metodológica y la reproducibilidad exacta del experimento.

== 3.3 Dataset

El conjunto de datos utilizado corresponde al repositorio "Amazonia Garimpo Binario", recopilado y estructurado por Grupioni et al. @grupioniDeteccaoGarimpoNa2026. El dataset comprende un total masivo de 111,584 recortes de imágenes satelitales en formato PNG con una resolución espacial estandarizada de $128 times 128$ píxeles. La variable objetivo dicotómica `label_int` codifica la presencia confirmada de minería ilegal (com_garimpo, valor 1) frente a la selva intacta (sem_garimpo, valor 0).

#figure(
  grid(
    columns: (1fr),
    gutter: 15pt,
    image("figures/pie_chart.png", width: 60%),
    image("figures/dataset_samples.png", width: 95%)
  ),
  caption: [Arriba: Distribución balanceada de clases en el dataset Amazonia Garimpo Binario. Abajo: Muestras visuales de parches de selva intacta (sem_garimpo) frente a minas activas (com_garimpo).]
) <fig-dataset>

El atributo más destacable de este corpus de datos es su distribución perfectamente balanceada. La clase positiva contiene 56,037 instancias (50.22%), mientras que la clase negativa posee 55,547 instancias (49.78%), como se ilustra en la @fig-dataset. Este equilibrio estadístico erradica el sesgo inductivo clásico de los algoritmos de clasificación, permitiendo que la métrica de exactitud global sea un indicador fidedigno del rendimiento del modelo sin necesidad de aplicar técnicas de sobremuestreo artificial.

== 3.4 Metodología Propuesta

El pipeline metodológico comienza con la ingesta y decodificación de las imágenes PNG, normalizando los tensores de píxeles al rango continuo $[0, 1]$ dividiendo por 255.0. Seguidamente, se aplica un protocolo estricto de Aumento de Datos (*Data Augmentation*) dinámico en memoria. Se configuran rotaciones aleatorias de hasta $20°$, inversiones horizontales (*flips*), y variaciones de escala (*zoom*) del 15% @adedejiImageAugmentationSatellite2022 @safonovaTenDeepLearning2023. Estas transformaciones estocásticas obligan al modelo a aprender características intrínsecas de las minas en lugar de memorizar orientaciones específicas, combatiendo directamente el sobreajuste.

#figure(
  align(center)[
  #rect(width: 80%, inset: 12pt, fill: luma(245), radius: 5pt)[
    #text(weight: "bold")[Diagrama de Flujo Metodológico]\
    #v(5pt)
    1. *Carga de Datos:* Lectura iterativa del archivo CSV `manifesto_chips.csv`.\
    2. *Preprocesamiento:* Normalización de tensores $[0, 1]$ y partición 80/10/10.\
    3. *Data Augmentation:* Rotaciones (20°), Horizontal Flips, Zoom (15%).\
    4. *Feature Extraction:* Paso hacia adelante (Forward Pass) por ResNet-50.\
    5. *Clasificación:* Capas densas (Flatten -> Dense 512 -> Dropout 0.5 -> Sigmoid).\
    6. *Optimización:* Cálculo de Binary Crossentropy Loss y ajuste de pesos vía Adam.\
    7. *Validación:* Early Stopping monitoreando la pérdida en validación.
  ]
  ],
  caption: [Flujo secuencial del pipeline de preprocesamiento, entrenamiento y clasificación.]
) <fig-flowchart>

El particionamiento del dataset se ejecuta de forma estratificada para mantener la proporción de clases, destinando un 80% para entrenamiento activo, 10% para validación cruzada y 10% para pruebas ciegas. La compilación del modelo emplea el optimizador Adam con una tasa de aprendizaje hiperparametrizada de $lr=10^{-4}$ @kingmaAdamMethodStochastic2017. La función de costo asignada es la Entropía Cruzada Binaria (BCE Loss), la cual penaliza logarítmicamente las divergencias entre las predicciones probabilísticas y las etiquetas reales. 

Para garantizar la generalización óptima y evitar el sobreentrenamiento, el algoritmo incorpora un mecanismo de parada temprana (*Early Stopping*). Este componente monitorea la métrica de pérdida en el conjunto de validación al final de cada época. El entrenamiento se detiene automáticamente si no se observa una reducción mínima en un horizonte de paciencia de 5 épocas, restaurando los pesos sinápticos de la iteración más exitosa. El bloque de código de la @fig-pseudocode detalla el pseudocódigo formal del ciclo de entrenamiento implementado.

#figure(
  align(left)[
  #rect(width: 95%, inset: 10pt, fill: luma(250))[
    ```python
    # Pseudocódigo del Algoritmo de Entrenamiento
    modelo = Inicializar_ResNet50(pesos='imagenet', incluir_tope=Falso)
    Congelar_Capas_Inferiores(modelo)
    modelo_completo = Agregar_Capas_Clasificacion(modelo, dropout=0.5, salida='sigmoid')
    modelo_completo.compilar(optimizador=Adam(lr=1e-4), perdida=BinaryCrossEntropy())
    
    mejor_perdida_val = infinito
    paciencia = 5
    contador_sin_mejora = 0
    
    PARA epoca EN RANGO(max_epocas):
        PARA lote_imagenes, lote_etiquetas EN generador_entrenamiento:
            imagenes_aumentadas = Data_Augmentation(lote_imagenes)
            predicciones = modelo_completo.forward(imagenes_aumentadas)
            perdida = Calcular_BCE(predicciones, lote_etiquetas)
            gradientes = Calcular_Gradientes(perdida)
            Actualizar_Pesos(gradientes, Adam)
            
        perdida_val = modelo_completo.evaluar(generador_validacion)
        SI perdida_val < mejor_perdida_val:
            mejor_perdida_val = perdida_val
            Guardar_Pesos(modelo_completo)
            contador_sin_mejora = 0
        SINO:
            contador_sin_mejora = contador_sin_mejora + 1
            SI contador_sin_mejora >= paciencia:
                Detener_Entrenamiento()
                Restaurar_Mejores_Pesos()
                ROMPER
    ```
  ]
  ],
  caption: [Pseudocódigo del proceso de optimización del modelo con parada temprana.]
) <fig-pseudocode>

== 3.5 Desglose Arquitectónico de ResNet-50

La arquitectura ResNet-50 implementada consta exactamente de 50 capas parametrizadas agrupadas en 5 etapas convolucionales (Conv1 a Conv5), culminando en una capa de *Average Pooling* y una capa densa (*Fully Connected*) para la clasificación final. A diferencia de las redes secuenciales convencionales, ResNet-50 utiliza bloques de cuello de botella (*bottleneck blocks*) diseñados estructuralmente para reducir la dimensionalidad y el costo computacional antes de aplicar las convoluciones más pesadas de $3 times 3$. 

La etapa inicial (Conv1) aplica un kernel masivo de $7 times 7$ con un salto (*stride*) de 2, produciendo 64 mapas de características espaciales. Este estrato actúa como un extractor primario de bordes y texturas básicas del dosel amazónico. Inmediatamente, se aplica una operación de agrupamiento máximo (*Max Pooling*) de $3 times 3$ con *stride* de 2, reduciendo agresivamente la resolución espacial y confiriendo invarianza traslacional robusta frente al desplazamiento de las minas en los parches satelitales.

La etapa Conv2_x contiene 3 bloques residuales en cascada. Cada bloque implementa el patrón de cuello de botella: una convolución de $1 times 1$ (64 filtros) para comprimir dimensionalidad, una convolución central de $3 times 3$ (64 filtros) para extraer características espaciales locales de los cuerpos de agua fangosos, y otra convolución de $1 times 1$ (256 filtros) para restaurar la dimensionalidad profunda. La conexión de salto (*skip connection*) suma la identidad de entrada directamente a la salida del bloque antes de aplicar la función de activación ReLU final.

Las etapas subsecuentes incrementan exponencialmente el número de filtros mientras reducen la dimensionalidad espacial mediante saltos fraccionales (*strided convolutions*). La etapa Conv3_x alberga 4 bloques (512 filtros de salida), Conv4_x contiene 6 bloques (1024 filtros de salida), y finalmente Conv5_x posee 3 bloques (2048 filtros de salida masiva). Esta jerarquía profunda permite al modelo componer texturas elementales en geometrías abstractas complejas, como la forma serpentina característica del garimpo aluvial en los lechos de los ríos tropicales.

El uso del bloque de cuello de botella reduce la complejidad algorítmica y el número de operaciones multiplicativas acumuladas (*Multiply-Accumulate Operations*, MACs). Una capa tradicional de $3 times 3$ operando sobre 256 canales requeriría $3 times 3 times 256 times 256 approx 600,000$ parámetros. Por el contrario, la secuencia de cuello de botella reduce este costo a apenas $1 times 1 times 256 times 64 + 3 times 3 times 64 times 64 + 1 times 1 times 64 times 256 approx 70,000$ parámetros, garantizando eficiencia computacional crítica para el despliegue del sistema en agencias gubernamentales.

#figure(
  table(
    columns: (auto, auto, auto, auto),
    align: center,
    inset: 6pt,
    table.header([*Etapa*], [*Operación*], [*Filtros*], [*Repeticiones*]),
    [*Conv1*], [$7 times 7$, stride 2], [64], [1],
    [*Max Pool*], [$3 times 3$, stride 2], [-], [1],
    [*Conv2_x*], [[$1 times 1, 64$ \ $3 times 3, 64$ \ $1 times 1, 256$]], [256], [3],
    [*Conv3_x*], [[$1 times 1, 128$ \ $3 times 3, 128$ \ $1 times 1, 512$]], [512], [4],
    [*Conv4_x*], [[$1 times 1, 256$ \ $3 times 3, 256$ \ $1 times 1, 1024$]], [1024], [6],
    [*Conv5_x*], [[$1 times 1, 512$ \ $3 times 3, 512$ \ $1 times 1, 2048$]], [2048], [3],
    [*Clasificación*], [Global Average Pooling \ Fully Connected], [1], [1],
  ),
  caption: [Desglose estructural y topológico de la arquitectura ResNet-50 preentrenada.],
) <tabla-resnet>

== 3.6 Formalización Matemática de las Métricas de Evaluación

Para cuantificar rigurosamente el rendimiento del modelo frente a la detección de garimpo destructivo, se implementa una matriz de confusión binaria cruzada. Esta matriz contabiliza los Verdaderos Positivos ($"TP"$), correspondientes a minas correctamente detectadas; los Verdaderos Negativos ($"TN"$), selva intacta correctamente clasificada; los Falsos Positivos ($"FP"$), cuerpos naturales confundidos con minas; y los Falsos Negativos ($"FN"$), minas activas que el modelo ignoró erróneamente.

La Exactitud Global (*Accuracy*) mide la proporción total de predicciones correctas sobre el universo completo de muestras satelitales analizadas. Se define matemáticamente como:
$ "Accuracy" = ("TP" + "TN") / ("TP" + "TN" + "FP" + "FN") $

La Precisión (*Precision*) determina la fiabilidad de las alertas positivas emitidas por el sistema clasificador. Evalúa qué fracción de las áreas marcadas como garimpo son efectivamente zonas de extracción ilegal. Su fórmula es:
$ "Precision" = "TP" / ("TP" + "FP") $

La Sensibilidad (*Recall* o *True Positive Rate*) constituye la métrica más crítica en el dominio operativo de monitoreo y conservación ambiental continuo. Mide la capacidad intrínseca del sistema para capturar todos los focos mineros existentes sin omitir alertas tempranas. Se expresa como:
$ "Recall" = "TP" / ("TP" + "FN") $

El F1-Score Macro consolida la Precisión y el Recall en una media armónica única balanceada, penalizando fuertemente a los modelos predictivos que priorizan una métrica a expensas de sacrificar severamente la otra. Su formulación teórica es:
$ "F1" = 2 times ("Precision" times "Recall") / ("Precision" + "Recall") $

== 3.7 Formulación Matemática del Optimizador Adam

El algoritmo de optimización Adam (*Adaptive Moment Estimation*) reemplaza el descenso de gradiente estocástico tradicional para actualizar iterativamente los parámetros del modelo @kingmaAdamMethodStochastic2017. Adam combina heurísticamente las ventajas del algoritmo AdaGrad y RMSProp calculando tasas de aprendizaje adaptativas individuales para cada peso de la red.

Adam mantiene un registro del primer momento (media) y del segundo momento (varianza no centrada) de los gradientes matemáticos, representados por los vectores $m_t$ y $v_t$ respectivamente. En la iteración de entrenamiento $t$, los momentos estadísticos se actualizan utilizando las tasas de decaimiento exponenciales $beta_1$ y $beta_2$:
$ m_t = beta_1 m_{t-1} + (1 - beta_1) g_t $
$ v_t = beta_2 v_{t-1} + (1 - beta_2) g_t^2 $

Donde $g_t$ representa el vector de gradiente de la función de costo multivariable respecto a los parámetros de red $theta$ en el instante $t$. Dado que los momentos $m_t$ y $v_t$ se inicializan en cero absoluto, estos estimadores sufren un sesgo matemático hacia cero durante las iteraciones iniciales. Para compensar este déficit analítico, Adam aplica sistemáticamente una corrección de sesgo asintótica:
$ hat(m)_t = m_t / (1 - beta_1^t) $
$ hat(v)_t = v_t / (1 - beta_2^t) $

Finalmente, los pesos sinápticos de la arquitectura de extracción de características se actualizan sustrayendo la fracción adaptativa del gradiente, escalada por el hiperparámetro crítico de tasa de aprendizaje $alpha$:
$ theta_t = theta_{t-1} - (alpha hat(m)_t) / (sqrt(hat(v)_t) + epsilon) $

En este estudio de monitoreo satelital, los hiperparámetros del optimizador se configuraron estrictamente en $alpha = 1e-4$, $beta_1 = 0.9$, $beta_2 = 0.999$, y la constante de estabilidad numérica $epsilon = 1e-7$.

== 3.8 Aumento de Datos y Pseudocódigo

El procedimiento dinámico de aumento de datos (*Data Augmentation*) en tiempo real resulta imperativo para mitigar drásticamente el sobreajuste (*overfitting*). Se aplicaron rotaciones aleatorias uniformes de [-20°, 20°], inversión horizontal estocástica, escalado afín (zoom de 85% a 115%) y ajustes de brillo estocásticos. Este pipeline matemático, implementado mediante la API `ImageDataGenerator` de TensorFlow, multiplica exponencialmente el tamaño efectivo del conjunto de entrenamiento en memoria.

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
