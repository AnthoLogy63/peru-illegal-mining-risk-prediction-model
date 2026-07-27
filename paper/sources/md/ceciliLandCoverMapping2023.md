# Land Cover Mapping with Convolutional Neural Networks Using Sentinel-2 Images: Case Study of Rome

**BibTeX Key:** `ceciliLandCoverMapping2023`  
**Authors:** Cecili, Giulia and De Fioravante, Paolo and Dichicco, Pasquale and Congedo, Luca and Marchetti, Marco and Munaf{\`o}, Michele  

---

## Abstract

Land cover monitoring is crucial to understand land transformations at a global, regional and local level, and the development of innovative methodologies is necessary in order to define appropriate policies and land management practices. Deep learning techniques have recently been demonstrated as a useful method for land cover mapping through the classification of remote sensing imagery. This research aims to test and compare the predictive models created using the convolutional neural networks (CNNs) VGG16, DenseNet121 and ResNet50 on multitemporal and single-date Sentinel-2 satellite data. The most promising model was the VGG16 both with single-date and multi-temporal images, which reach an overall accuracy of 71\% and which was used to produce an automatically generated EAGLE-compliant land cover map of Rome for 2019. The methodology is part of the land mapping activities of ISPRA and exploits its main products as input and support data. In this sense, it is a first attempt to develop a high-update-frequency land cover classification tool for dynamic areas to be integrated in the framework of the ISPRA monitoring activities for the Italian territory.

---

## Resumen / Notas (Tuyo)

*(Escribe aquí tus notas)*

---

## Texto Completo del Artículo (Extraído del PDF)

```text
land
Article

Land Cover Mapping with Convolutional Neural Networks
Using Sentinel-2 Images: Case Study of Rome
Giulia Cecili 1 , Paolo De Fioravante 2 , Pasquale Dichicco 2,3 , Luca Congedo 2, * , Marco Marchetti 1
and Michele Munafò 2
1
2

3

*

Department of Biosciences and Territory, University of Molise, C/da Fonte Lappone, 86090 Pesche, Italy
Italian Institute for Environmental Protection and Research (ISPRA), Via Vitaliano Brancati 48,
00144 Rome, Italy
geoLAB-Laboratory of Forest Geomatics, Department of Agricultural, Food and Forestry Systems,
University of Florence, Via San Bonaventura, 13, 50145 Firenze, Italy
Correspondence: luca.congedo@isprambiente.it

Abstract: Land cover monitoring is crucial to understand land transformations at a global, regional
and local level, and the development of innovative methodologies is necessary in order to define
appropriate policies and land management practices. Deep learning techniques have recently been
demonstrated as a useful method for land cover mapping through the classification of remote sensing
imagery. This research aims to test and compare the predictive models created using the convolutional
neural networks (CNNs) VGG16, DenseNet121 and ResNet50 on multitemporal and single-date
Sentinel-2 satellite data. The most promising model was the VGG16 both with single-date and
multi-temporal images, which reach an overall accuracy of 71% and which was used to produce an
automatically generated EAGLE-compliant land cover map of Rome for 2019. The methodology is
part of the land mapping activities of ISPRA and exploits its main products as input and support
data. In this sense, it is a first attempt to develop a high-update-frequency land cover classification
tool for dynamic areas to be integrated in the framework of the ISPRA monitoring activities for the
Italian territory.

Citation: Cecili, G.; De Fioravante, P.;

Keywords: deep learning; convolutional neural networks; land cover; remote sensing; Copernicus;
Sentinel-2

Dichicco, P.; Congedo, L.; Marchetti,
M.; Munafò, M. Land Cover Mapping
with Convolutional Neural Networks
Using Sentinel-2 Images: Case Study
of Rome. Land 2023, 12, 879. https://
doi.org/10.3390/land12040879
Academic Editor: Yuanjian Yang
Received: 1 March 2023
Revised: 22 March 2023
Accepted: 8 April 2023
Published: 13 April 2023

Copyright: © 2023 by the authors.
Licensee MDPI, Basel, Switzerland.
This article is an open access article
distributed under the terms and
conditions of the Creative Commons
Attribution (CC BY) license (https://
creativecommons.org/licenses/by/
4.0/).

1. Introduction
Background
The availability of updated and reliable land cover (LC, all the acronyms and abbreviations are reported in Abbreviations part) and land use (LU) data is a crucial element in
monitoring the effect of human activity on the territory, on ecosystems and on their ability to
provide ecosystem services, in order to guide decisions for sustainable soil management [1].
In Europe, the Copernicus Land Monitoring Service (CLMS) [2] offers users and
stakeholders a wide range of land cover and land use products to support land monitoring
activities (Table 1).
As part of the Global component of the CLMS, a 100-m-resolution annually updated
global LC map is provided for the period 2015–2019 [3]. The CLMS pan-European component includes the CORINE Land Cover (CLC, vector data updated every 6 years, with a
minimum mapping unit of 26 hectares and a 33-class land cover and land use classification
system) [4], the four High-Resolution Layers raster (with a resolution of 10 m for the land
cover classes of artificial surfaces, forest, grassland and water and wetness) [5], and the
new CLC Plus Backbone, which offers a 10-m-resolution LC mapping in raster format
for 2018 [6]. As part of the CLMS Local component, the Urban Atlas, Riparian Zones,
Natura 2000 and Coastal Zones [7] layers are available, which offer high spatial resolution
mapping for specific areas of the European territory (in order, urban areas, riparian zones,

Land 2023, 12, 879. https://doi.org/10.3390/land12040879

https://www.mdpi.com/journal/land

Land 2023, 12, 879

2 of 20

Natura 2000 protected areas and a buffer zone of 10 km of coastline). The CLMS Local data
adopt an LC and LU classification system in compliance with the Mapping Assessment of
Ecosystem Services (MAES) ecosystem types.
Table 1. Copernicus Land Monitoring Service land cover and land use data with reference to the
Global, Pan-European and Local component; LC = Land Cover classes, LU = Land Use classes,
CLMS = Copernicus Land Monitoring Service.

CLMS Global Component
CLMS Pan-European Component

CLMS Local Component

Name

Data Type

Classes

MMU

Global Land Cover

Raster

23 (LC)

Pixel 100 × 100 m

CLC Plus Backbone

Raster

12 (LC)

CORINE Land Cover

Vector

44 (LC, LU)

Pixel 10 × 10 m
25 ha (status)
5 ha (changes)

Coastal Zones
Natura 2000
Riparian Zones

Vector

Urban Atlas

55 (LC, LU)

0.5 ha

27 (LC, LU)

0.25 ha (class 1)
1 ha (class 2–5)

As part of the Global component of the CLMS, a 100-m-resolution annually updated
global LC map is provided for the period 2015–2019 [3]. The CLMS pan-European component includes the CORINE Land Cover (CLC, vector data updated every 6 years, with a
minimum mapping unit of 26 hectares and a 33-class land cover and land use classification
system) [4], the four High-Resolution Layers raster (with a resolution of 10 m for the land
cover classes of artificial surfaces, forest, grassland and water and wetness) [5], and the
new CLC Plus Backbone, which offers a 10-m-resolution LC mapping in raster format
for 2018 [6]. As part of the CLMS Local component, the Urban Atlas, Riparian Zones,
Natura 2000 and Coastal Zones [7] layers are available, which offer high spatial resolution
mapping for specific areas of the European territory (in order, urban areas, riparian zones,
Natura 2000 protected areas and a buffer zone of 10 km of coastline). The CLMS Local data
adopt an LC and LU classification system in compliance with the Mapping Assessment of
Ecosystem Services (MAES) ecosystem types.
These data are reliable and widely used for land monitoring but have limitations
in terms of low update frequency and classification system with mixed land cover
and land use classes. In this perspective, the growing availability of satellite data has
contributed to the development of new mapping techniques [8] which constitutes an
important support tool for the creation of new land monitoring products. Actually, there
are numerous experiences of LC and LU mapping by exploiting the 10-m-resolution
multispectral information of the Copernicus Sentienel-2 optical satellite and the Cband Sentinel-1 SAR data [9–12]. Among the main products with European coverage,
Malinowski et al. [13] proposed Sentinel-2 based 14-class land cover and land use
classification for 2017, ESA also introduced Sentinel-1 data for a 12-class land cover
classification [14] while Venter and Sydneham [15] integrated Sentinel data with the
Land Use and Cover Area frame Survey (LUCAS), producing a 2018 map with 90%
accuracy. Also of note are global products such as the ESA WorldCover [16,17], the Finer
Resolution Observation and Monitoring of Global Land Cover (FROM-GLC10) [18] or
the Esri 2020 LULC map [19].
However, the land cover classification of Remote Sensing images is extremely
challenging, due to the wide variety of anthropogenic and natural elements (buildings,
roads, trees, agricultural activities, water bodies) that correspond to different colors,
shapes and textures. Particularly important and complex is also the production of tools
for the detailed and high-frequency monitoring of dynamic contexts, such as peri-urban
and suburban areas, and of impactful and rapid phenomena such as illegal building
and construction sites.

Land 2023, 12, 879

3 of 20

Image processing methods have improved in recent years [20]. In many studies,
deep learning has been shown to be useful for land cover classification [21], with
successful applications in urban areas [22,23], agricultural land [24], forestry [25,26]
and wetlands [27,28].
Deep learning models used for land cover classification are based on Artificial Neural
Network algorithms [29], which include Convolutional Neural Networks (CNNs) [30,31],
Recurrent Neural Networks (RNNs) [32] and Generative Adversarial Networks (GANs) [33].
CNNs are currently the most commonly used in remote sensing image processing [34–36],
and its structure consists of an input layer, several convolutional and pooling layers and a
final output which is used for the classification of the image [37].
CNNs have proven to be effective alternatives to traditional Machine Learning methods such as Decision Trees [38], Random Forests [39], Support Vector Machines [40] and
K-Nearest Neighbors [41]. Using CNNs, information can be learned automatically and directly from data, without requiring human intervention, allowing also for solving complex
and non-linear problems [42,43]. They have better performances than ML since they can
handle a larger amount of data faster and adapt to changes [44]. Furthermore, convolutional neural networks are more generalized than traditional machine learning algorithms,
making them suitable for a wide range of tasks, as well as performing well on new data [45].
Finally, CNNs are able to learn from the spatial context of the data [46,47].
There are a variety of CNN architectures that can be used for LC classification, such
as the VGGNet [48], AlexNet [49], ResNet [50], DenseNet [51] and U-Net [52]. Several of
these algorithms have been used successfully on RGB [53,54], multispectral [55,56] and
hyperspectral data [57–59], and the state of the art reveals many publications regarding
classification of not freely available high-resolution images [54,60,61]. However, various
DL methods were recently utilized to generate LU and LC maps using free data, which are
receiving particular attention because their high temporal resolution allows for significant
cost savings in high-frequency monitoring [62–64], e.g., Hu et al. [65] used Landsat-8
images for wetland cover classification with a VGG, Di Pilato et al. [66] focused their study
on the detection of changes in urban areas using a CNN on Sentinel-2 images, Mirmazloumi
et al. [12] developed a workflow to generate a LULC map of Europe using Sentinel and
Landsat-8 images.
The Higher Institute for Environmental Protection and Research (ISPRA) produces
and updates tools for mapping and monitoring land cover, land use and land consumption for the Italian territory. ISPRA is responsible together with the National
Environmental Protection System (SNPA) for updating the National Land Consumption
Map (LCM) [1,67], a nationwide 10-m-resolution raster that maps land consumption
with a tree-level classification system. The LCM is updated annually through photointerpretation of the entire national territory with the aid of support layers obtained
through the classification of Sentinel data [68]. ISPRA also produces land cover and
land use maps with an EAGLE-compliant classification system integrating Copernicus
data [69,70] and develops innovative methodologies for the classification of land cover
and land consumption by the classification of satellite images [71], also through deep
learning techniques [54].
This research aims to define a methodology that integrates as much as possible with
the main ISPRA land monitoring products, in order to introduce valuable high-updatefrequency land mapping tools to the land monitoring framework already in place for the
Italian territory. This study shows the first results of land cover mapping by applying
three CNN imaging techniques to Sentinel-2 multispectral images in order to analyze their
performance in the production of classifications on the Italian territory. The VGG16 [72–74],
DenseNet121 [61,75] and ResNet50 [72,73] algorithms were compared for the identification
of five EAGLE-compliant land cover classes with respect to the classification of a single
image and multi-temporal data.

Land 2023, 12, x FOR PEER REVIEW

4 of 22

Land 2023, 12, 879

4 of 20

2. Materials and Methods
Materials
2.1.2.Study
Areaand Methods
2.1. Study Area

The considered study area is the Municipality of Rome located in Central Italy, in the
The considered study area is the Municipality of Rome located in Central Italy, in the
Latium region (Figure 1).
Latium region (Figure 1).

Figure 1. (a) Location of the study areas in Italy; (b) the Municipality of Rome.
Figure 1. (a) Location of the study areas in Italy; (b) the Municipality of Rome.

2 . km².
The
municipality
inthe
theTiber
Tibervalley
valley
and
spread
an of
area
of km
1287
The
municipalityis
is located
located in
and
is is
spread
overover
an area
1287
Rome
thelargest
largestmunicipality
municipality ininItaly
and
is one
of the
largest
European
capitals,
with a with
Rome
is is
the
Italy
and
is one
of the
largest
European
capitals,
territory with
population
density
due to
the to the
presence of
numerous
urban
areas.urban
a territory
withaalow
low
population
density
due
presence
of green
numerous
green
The
territory
has
reliefs
and
hills
alternating
with
flat
areas
and
extends
to
the
sandy
coasts
areas. The territory has reliefs and hills alternating with flat areas and extends to the sandy
on the Tyrrhenian Sea. According to the Köppen climate classification, Rome belongs to the
coasts
on the Tyrrhenian Sea. According to the Köppen climate classification, Rome
Csa zone, i.e., a temperate climate with hot summers. The average annual rainfall is around
belongs to the Csa zone, i.e., a temperate climate with hot summers. The average annual
800 mm in the thirty years 1971–2000, with maximum peaks in the months of November,
rainfall
is around
800 mm in the thirty years 1971–2000, with maximum peaks in the
December
and April.
months of
November,
December
and
April.with an area of 64 km2 was selected for the
Initially a
portion of
the
municipality
2 was selected for the
Initially
a
portion
of
the
municipality
with an area
of 64 kminput
comparison between different deep learning algorithms
and different
data. For this
purpose, the area
wasdiﬀerent
divided into
two
parts, the larger
(indicated
an “B”
in data.
Figure 2)
comparison
between
deep
learning
algorithms
and with
iﬀerent
input
For this
was
used
the was
predictive
model
training
phase,
while
the smaller
(indicated
“A”
purpose,
theforarea
divided
into two
parts,
the
larger
(indicated
with anwith
“B”a in
Figure
in
Figure
2)
was
used
in
the
validation
phase.
In
the
following,
the
two
areas
will
be
called
2) was used for the predictive model training phase, while the smaller (indicated with a
“validation area”, respectively.
“A”the
in“training
Figure 2)area”
wasand
used
in the validation phase. In the following, the two areas will be
The best combination of the input data and algorithm was then applied to the land
called the “training area” and “validation area”, respectively.
cover mapping of the whole municipality of Rome in the testing phase.
The best combination of the input data and algorithm was then applied to the land
2.2. Overview
cover
mapping of the whole municipality of Rome in the testing phase.

The proposed research applies deep learning algorithms on Sentinel-2 images for the
production of a land cover map based on an EAGLE-compliant land cover classification
system [71,76]. Figure 3 shows the main phases of the methodology, which foresees a first
phase of data collection and pre-processing, followed by the modeling phase. Modeling
consists of a model-training phase, a validation phase and a final application to the area of
interest through the testing phase.

Land
2023,12,
12,879
x FOR PEER REVIEW
Land
2023,

5 of 225 of 20

Figure
area
in the
Municipality
of Rome
for the
application
comparison
diﬀerent of
Figure 2.2.Test
Test
area
in the
Municipality
of used
Rome
used for
the and
application
and of
comparison
different algorithms against different input data. The portion A is the “validation area” while B is
“training area”.
the “training area”.

Land 2023, 12, x FOR PEER REVIEWalgorithms against diﬀerent input data. The portion A is the “validation area” while 6Bofis22the

2.2. Overview
The proposed research applies deep learning algorithms on Sentinel-2 images for the
production of a land cover map based on an EAGLE-compliant land cover classification
system [71,76]. Figure 3 shows the main phases of the methodology, which foresees a first
phase of data collection and pre-processing, followed by the modeling phase. Modeling
consists of a model-training phase, a validation phase and a final application to the area
of interest through the testing phase.

Figure 3.
Figure
3. Study
Studyworkflow.
workflow.

In the study, three CNN algorithms were tested on diﬀerent sets of label data in order
to identify the most promising configuration, which was then applied to the prediction
area and used for the land cover classification of the whole municipality of Rome.
The process was developed using the Python-friendly open-source library

Land 2023, 12, 879

6 of 20

In the study, three CNN algorithms were tested on different sets of label data in order
to identify the most promising configuration, which was then applied to the prediction
area and used for the land cover classification of the whole municipality of Rome.
The process was developed using the Python-friendly open-source library TensorFlow
(https://www.tensorflow.org/, accessed on 15 February 2023), and the accuracy assessment
was based on the Olofsson methodology [77].
2.3. Data Collection and Pre-Processing
The 10 Sentinel-2 bands with a spatial resolution of 10 and 20 m were selected with
reference to 22 March, 25 July and 8 October 2019. Data were downloaded through the
Semi-Automatic Classification Plugin for QGis [78], considering atmospherically corrected
Surface Reflectance Level-2A images with low cloud cover. The bands were stacked to
create three mono-temporal images for the three reference dates (with 10 bands each) and
merged into a fourth 30-band multitemporal image, according to the procedure described
by Wakulinska [62].
A PCA (principal component analysis) was used to reduce the dimensionality of the
data to three spectral bands, in order to optimize the processing times and the complexity
of the models. In order to create the training and validation datasets, a test area of 64 km2
was defined and then divided into two sections, which were used for the training phase
and for the validation phase (Figure 2).
2.4. Land Cover Classification System
Table 2 shows the classification system adopted for the land cover classification described in this research, which is based on the EAGLE Land Cover Components [76] and
coincides with the second level of the land cover classification systems used for other ISPRA
activities [1,69–71].
Table 2. EAGLE-compliant classification system adopted for land cover mapping activities.
I Level
1

Abiotic non-vegetated surfaces

2

Biotic vegetated surfaces

3

Water surfaces

II Level
1.1
1.2
2.1
2.2

Artificial abiotic
Natural abiotic
Woody vegetation
Herbaceous vegetation

The first classification level distinguishes three main land cover classes, two of which
are further developed at the second classification level.
1.

2.

3.

Abiotic non-vegetated surfaces include any unvegetated surfaces, with or without
anthropogenic influence or impact, either covered with man-made artificial structures
or natural materials. At the second classification level, the class is subdivided into
artificial abiotic surfaces (i.e., permanent and reversible consumed land, according
to the definition of ISPRA-SNPA [1]) and natural abiotic surfaces (i.e., any kind of
surface in its natural form, either with or without anthropogenic influence, such as
unvegetated rocky areas, sand, bare soil).
Biotic vegetated surfaces include any surface with spontaneous, semi-natural or artificial vegetation, with or without anthropogenic influence. At the second classification
level, woody vegetation and herbaceous vegetation are distinguished [76].
Water surfaces include water in its liquid or solid state of aggregation, both of artificial
origin or natural formation (water basins, rivers, streams, stagnant waters, glaciers).

Land 2023, 12, 879

7 of 20

2.5. Modeling
2.5.1. Deep Learning Algorithms

Land 2023, 12, x FOR PEER REVIEW

8 of 22

Three of the most popular and efficient CNN algorithms were selected with the aim of
evaluating the best-performing models:

•
•

DenseNet-121
ResNet-50
The basic idea of a DenseNet is similar to ResNet: connect shallow layers with deep
(ResidualAs
Network)
and
allDenseNet
its variants
(ResNet-18,
ResNet-34,
layersResNet
using shortcuts.
a matter of
fact,
architectures
[51]
modify theResNet-50,
standard
ResNet-101
and
ResNet-152)
were
proposed
in
2015
by
He
[50]
with
the
aim to
to maximize
reduce the
CNN structure by building shorter connections between each layer. In order
problem
vanishing gradients.
It was
partially
solved
the
flow ofofinformation,
DenseNets
connect
every
layer through
to every “shortcut
other one,connections”,
meaning thata
technique
used
to
create
connections
between
layers
that
are
not
directly
adjacent
the input of a layer is the result of concatenation of feature maps from previous ones. [54,75].
In this
Figure
4
shows
the
ResNet-50
architecture.
work, a DenseNet121 with a depth of 121 layers was employed, as shown in Figure 4 [75,79].

Figure4.4.The
Thethree
threeCNN
CNNarchitectures
architecturesused.
used.
Figure

•
VGG-16
Each
of the three classification algorithms was applied to the three single-date
multiband
and deep
to the
multitemporal
raster.
theVGG
following,
VGG is rasters
a standard
CNN
introduced multiband
by Simonyan
et al.In
[48].
consistseach
of
pairing between
a certain
multiband
raster and
a certain
classification
algorithm
defined
several
configurations
(VGG-13,
VGG-16,
VGG-19,
etc.), each
following the
sameisgeneric
as an “experiment”,
overall,
12 experiments
were performed
(Table layers
3).
design.
In a VGG, anand
image
is passed
through a stack
of convolutional
with very

Experiment
1
2
3
4
5

small filters to extract features. These architectures are based on the basic structure of
Table 3. Main characteristics of the experiments performed by applying the three classification
convolutional
neural networks. The VGG-16 used consists of 13 convolutional layers and
algorithms to the four multiband rasters.
3 fully connected layers. The complexity of the VGG network can be increased by adding
Figure 4 displays the VGG-16Algorithms
architecture. N° Bands
Typemore convolutional layers [8,48].
Date
22 March 2019
•
ResNet-50
DenseNet121
10
25 July 2019
8 October 2019
single-date
22 March 2019
VGG16
10
25 July 2019

Land 2023, 12, 879

8 of 20

ResNet (Residual Network) and all its variants (ResNet-18, ResNet-34, ResNet-50,
ResNet-101 and ResNet-152) were proposed in 2015 by He [50] with the aim to reduce the
problem of vanishing gradients. It was partially solved through “shortcut connections”, a
technique used to create connections between layers that are not directly adjacent [54,75].
Figure 4 shows the ResNet-50 architecture.
Each of the three classification algorithms was applied to the three single-date multiband rasters and to the multitemporal multiband raster. In the following, each pairing
between a certain multiband raster and a certain classification algorithm is defined as an
“experiment”, and overall, 12 experiments were performed (Table 3).
Table 3. Main characteristics of the experiments performed by applying the three classification
algorithms to the four multiband rasters.
Experiment

Type

1
2
3
4
5
6

single-date

7
8
9
10
11
12

multi-temporal

Date

Algorithms

N◦ Bands

22 March 2019
25 July 2019
8 October 2019

DenseNet121

10

22 March 2019
25 July 2019
8 October 2019

VGG16

10

22 March 2019
25 July 2019
8 October 2019

ResNet50

10

22 March 2019/25 July 2019/8 October 2019

DenseNet121
VGG16
ResNet50

30

2.5.2. Predictive Model Training, Validation and Testing
In the training phase, the labelling activity was carried out through the LC Map
produced and updated by ISPRA-SNPA, which is available in vector format only for the
municipality of Rome. The LC map was reclassified according to the classes of Table 2,
and 150,000 training areas were extracted from the LC Map to create the training dataset;
moreover, vector elements were combined with ground truth provided by Sentinel-2.
A CNN patch training was involved. This method is common in land cover applications
and trains a convolutional neural network on a large dataset of small land cover patches
rather than training on batches of individual pixels.
At first, a simple 2D CNN was applied to each of the 12 experiments in order to
evaluate which provides the best results. Typical CNN models include an input layer, a
series of convolutional and pooling layers, and an output layer [37].
The training procedure consisted of 100 epochs of iteration. The model was compiled
using an Adam optimizer [80], which iteratively updates network weights by using training
data rather than the traditional stochastic gradient descent method [81] with a learning
rate of 0.0001. The model output consists of a vector with one entry for each class. Using
the softmax activation function, the output is normalized, and a probability distribution
is generated. Next, a weighted cross-entropy was chosen and calculated as the network
loss function. In addition, batch normalization was implemented to improve the model’s
accuracy and to reduce training time and overfitting [82].
In order to select the best experiment, three of the most common DL metrics were
calculated on the land cover products obtained in the validation phase (Equations (1)–(3)):
True Positive
True Positive + False Positive

(1)

True Positive
True Positive + False Negative

(2)

Precision =

Recall =

Land 2023, 12, 879

9 of 20

F1 score = 2 ×

Recall × Precision
Recall + Precision

(3)

The experiment that showed the best results was used to map the land coverage of the
entire territory of the municipality of Rome in the testing phase.
2.6. Accuracy Assessment of the Land Cover Map of Rome
The land cover map of the municipality of Rome was validated with the photointerpretation of a sample of points, which was determined using Olofsson methodology [77].
Quantitative evaluation was conducted evaluating the Overall Accuracy (OA) for the
overall classification (Equation (4)) and the User Accuracy (PA) and Produser Accuracy
(UA) for each land cover class (Equations (5) and (6)).
Overall Accuracy(%) =

s Accuracy(%) =

number of correctly classified pixels
× 100
total number of pixels

number of correctly classified pixels in class i
× 100
number of pixels classified as class i(total row)

Producer0 s Accuracy(%) =

(4)

(5)

number of correctly classified pixels in class i
× 100 (6)
number of known pixels in class i(total column)

Accuracy was also calculated by deleting a strip of edge pixels from each patch
(“erosion”) to estimate the impact of mixed pixels on overall accuracy. The calculation of
the sample size is reported in Appendix A. The accuracy assessment was conducted for the
single-date and multi-temporal maps, both in the original version and in the version with
the erosion of a row of pixels at the edges of the patches.
3. Results
3.1. Results Overview
This section presents the results of the algorithm validation and testing activities. The
validation phase is carried out by applying the 12 experiments on the validation area,
and the accuracy metrics of the resulting classifications are reported. In the validation
phase, the VGG16 algorithm applied to the summer image (Experiment 5) and to the
multi-temporal one (Experiment 11) give the best results. Such configurations were used in
the subsequent testing phase for the production of two land cover maps of Rome, which
were then subjected to accuracy assessment through the Olofsson methodology.
3.2. Validation
Table 4 shows the results of the accuracy assessment carried out on the validation area,
with reference to the application of the 12 experiments.
Comparing the metrics and the maps for the twelve experiments, the best results are
obtained with the VGG16 algorithm (Figure 5).
This algorithm performs better than both ResNet50 and DenseNet121 with multitemporal data (experiment 11) and with each of the three single-date data experiments
(experiments 4–6). With reference to the input data, the best results are achieved using
multi-temporal data (experiments 10–12), while among the single-date images the summer
image (25 July 2019, used for experiments 2, 5 and 8) shows the best classification.

Land 2023, 12, 879

10 of 20

Table 4. Overall accuracy (OA), Precision, Recall and F1-Score of the validation phase for each of the
12 experiments.
Experiments

Type

1
2
3
4
5
6

single-date

7
8
9
Land 2023, 12, x FOR PEER REVIEW

10
11
12

multitemporal

Algorithms

OA

Precision

Recall

F1-Score

DenseNet121

0.67
0.72
0.70

0.59
0.65
0.63

0.63
0.68
0.67

0.59
0.64
0.63

VGG16

0.75
0.80
0.74

0.68
0.75
0.66

0.73
0.80
0.68

0.68
0.76
0.65

ResNet50

0.67
0.64
0.63

0.60
0.57
0.58

0.62
0.58
0.62

0.58
0.56
0.58

DenseNet121
VGG16
ResNet50

0.69
0.87
0.67

0.59
0.79
0.62

0.70
0.88
0.64

11 of 22
0.77

0.60
0.62

Figure5.5.Land
Land
cover
maps
produced
validation
phase
using
VGG16
algorithm
with respect
Figure
cover
maps
produced
in in
thethe
validation
phase
using
thethe
VGG16
algorithm
with
to
spring
(Experiment
4), 4),
summer
(Experiment
5) 5)
and
autumn
images and
and to the
respect
to spring
(Experiment
summer
(Experiment
and
autumn(Experiment
(Experiment 6)
6) images
to the
multitemporal
(Experiment
multitemporal
stackstack
(Experiment
11).11).

This algorithm performs better than both ResNet50 and DenseNet121 with multitemporal data (experiment 11) and with each of the three single-date data experiments
(experiments 4–6). With reference to the input data, the best results are achieved using
multi-temporal data (experiments 10–12), while among the single-date images the

Land 2023, 12, 879

11 of 20

3.3. Testing
Experiment 5 (Figure 6) and Experiment 11 (Figure 7) were selected for the production
of the land cover map of Rome (LCR).
The accuracy assessment carried out with the Olofsson methodology provided the
results of Table 5.
The single-date classification shows higher accuracy values than the multi-temporal
one
in
classes, except for the natural abiotic surfaces. By eliminating edge pixels from
Land 2023, 12, x FOR PEER all
REVIEW
each patch (erosion), an increase in overall accuracy is observed in both single-date and
multi-temporal classification.

12

Figure
6. Single-date
cover
maproduced
of Romeby
(LCR)
produced
by classifying
the 10-band s
Figure 6. Single-date
land
cover map ofland
Rome
(LCR)
classifying
the 10-band
single-date
date
Sentinel-2
data
of
July
the
25
with
the
VGG16
algorithm.
Sentinel-2 data of July the 25 with the VGG16 algorithm.

Table 5. Accuracy assessment of the LCR. The results in single dates refer to the classification
based on the summer image of 25 July 2019. P.A. = Producer Accuracy, U.A. = User Accuracy,
O.A. = Overall Accuracy.
Single Date
Land Cover Class
Abiotic surfaces
Artificial abiotic
Natural abiotic
Vegetation
Woody vegetation
Herbaceous vegetation
Water surfaces

P.A.

U.A.

0.75
0.63
0.39
0.81
0.62
0.58
0.94

0.73
0.77
0.23
0.87
0.52
0.73
0.66

O.A.

0.62

Multi-Temporal
O.A.
Erosion

P.A.

U.A.

O.A.

O.A.
Erosion

0.71

0.78
0.62
0.67
0.78
0.49
0.55
0.96

0.80
0.72
0.45
0.88
0.50
0.64
0.47

0.59

0.76

Land 2023, 12, 879 Land 2023, 12, x FOR PEER REVIEW

12 of 20

13

Figure 7. Multi-temporal
land
map
of Rome
(LCR) by
produced
by classifying
the 30-band
Figure 7. Multi-temporal
land cover map
ofcover
Rome
(LCR)
produced
classifying
the 30-band
temporal
Sentinel-2
data
with
the
VGG16
algorithm.
multi-temporal Sentinel-2 data with the VGG16 algorithm.

4. Discussion

The accuracy assessment carried out with the Olofsson methodology provide
results
ofcompares
Table 5. the three CNN algorithms VGG16, DenseNet121 and
The methodology
ResNet50 for land cover mapping according to five EAGLE-compliant land cover classes
Tablemultispectral
5. Accuracy assessment
of the LCR. The
results
in single dates
to the
through Sentinel-2
image classification.
The
methodology
alsorefer
refers
to classification
the
on the summer image of 25 July 2019. P.A. = Producer Accuracy, U.A. = User Accuracy, O
land monitoring activities carried out by ISPRA for the national territory, in an attempt to
Overall Accuracy.
enhance its standards and products for the creation of new land mapping tools.
In detail, three Setinel-2 acquisitions
relating
summer
Single
Date to spring (22 March 2019),
Multi-Temporal
(25Cover
July 2019)
Land
Class and autumn (8 October 2019) were selected,
O.A. processed individually and
O.A
O.A.
P.A.
U.A. obtaining
O.A.
combined into a stack, then P.A.
the threeU.A.
algorithms
were applied
to
the
four
datasets,
Erosion
Erosi
12 land cover classifications. The accuracy assessment of single-date classifications shows
Abiotic surfaces
0.75
0.73
0.78
0.80
that all three algorithms are affected by seasonal land cover variations. For the DenseNet121
Artificial abiotic
0.63
0.77
0.62
0.72
and the VGG16, the best results were related to the summer image, while for the ResNet50,
Natural
abiotic
0.39
0.23
0.67
0.45
spring classification was slightly better. In all three cases, the multi-temporal classification
0.62
0.71
0.76
Vegetation
0.81best single-date
0.87
0.78
shows results in line with the
one, demonstrating
that the0.88
models 0.59
work
Woody
vegetation
0.52 implications in terms of time
0.49 and 0.50
well even
on a single date, 0.62
with positive
computational
costs. On
the other hand, the
best result
Herbaceous
vegetation
0.58
0.73 relates to the summer period,
0.55 which
0.64is the same
as
the
ISPRA
data
used
to
extract
the
training
areas;
therefore,
to
obtain
products with
Water surfaces
0.94
0.66
0.96
0.47
high update frequency (less than one year), it will be necessary to take into account the
seasonal variabilityThe
of the
land cover
in the selection
of higher
the training
dataset,
especially
single-date
classification
shows
accuracy
values
than thein
multi-tem
agricultural areas
and
those
with
mixed
vegetation.
The
VVG16
algorithm
gave
the best
one in all classes, except for the natural abiotic surfaces. By eliminating
edge pixels
results in the training
and(erosion),
validationanactivities
was used
for theisland
cover in
mapping
each patch
increaseand
in overall
accuracy
observed
both single-date
of the municipality
of Rome, with
respect to the summer image (experiment 5) and the
multi-temporal
classification.
multitemporal stack (experiment 11).

Land 2023, 12, 879

13 of 20

The accuracy assessment carried out on the two land cover maps of Rome shows better
results as regards the classification on a single date (which reaches an overall accuracy of
62%), while the land cover map based on the multi-temporal stack reaches 59%.
The algorithm is efficient in distinguishing the three macro-classes of Abiotic surfaces,
vegetation and water bodies, while for analyzing the second classification level, natural
Land 2023, 12, x FOR PEER REVIEW
15 of 22
abiotic surfaces have the highest omission and commission errors due to the small number
of training areas, which limits the effectiveness of the algorithm (Figure 8).

Figure 8. Examples of land cover classes with reference to the single-date classification through the

Figure 8. Examples of land cover classes with reference to the single-date classification through the
VGG16 algorithm. The first image from above (a) represents an artificial abiotic surface, the second
VGG16
algorithm.
The first
from
above
(a) represents
abiotic
theofsecond
(b) a clay
area classified
as aimage
natural
abiotic
surface,
while thean
lastartificial
two images
aresurface,
examples
(b) a
clayareas
areacovered
classified
natural
abiotic(c) and
surface, while
the last
two (d).
images are examples of natural
natural
byas a
woody
vegetation
herbaceous
vegetation
areas covered by woody vegetation (c) and herbaceous vegetation (d).
Most of the herbaceous vegetation omission errors (which instead has few
Most of the
herbaceous
vegetation
omission
errors
(which
instead
hasedges
few of
commiscommissions)
are mainly
located in
peri-urban
and rural
areas,
above all
on the
sions) are
mainly
located
peri-urban
anddue
rural
areas,
above
all
the
edges of the
the
shelterbelt
of trees
and in
riparian
vegetation,
to the
woody
vegetation
commission
shelterbelt
of of
treesthe
andwoody
riparian
vegetation, due
to the
vegetation
commission
errors.
Most
vegetation
omissions
arewoody
concentrated
in urban
areas, errors.
particularly
small green
urban
areas (for
sparseintrees
alternating
a
Most
of the in
woody
vegetation
omissions
areexample,
concentrated
urban
areas, with
particularly
in
herbaceous
rows of
trees.sparse
Permanent
bodies with
showa few
omissioncover)
small
green cover)
urban and
areasin(for
example,
treeswater
alternating
herbaceous
errors,
whileof trees.
commission
errors are
concentrated
at the
edge of
the water
and
in rows
Permanent
water
bodies show
few
omission
errors,bodies
whileand on
commission
small are
patches of
arable at
land.
errors
concentrated
the edge of the water bodies and on small patches of arable land.
Most of
of the
occur
on on
thethe
edges
of the
and are
the to the
Most
the classification
classificationerrors
errors
occur
edges
of classes
the classes
anddue
aretodue
spectral
signature
of
the
mixed
pixels.
These
errors
aﬀect
both
the
single-date
spectral signature of the mixed pixels. These errors affect both the single-date classification
classification (which, however, has fewer errors on woody vegetation) and the multitemporal one. A second assessment conducted by excluding the border pixels of all
patches shows a significant increase in overall accuracy, which reaches 71% for singledate classification and 76% for multitemporal classification.

Land 2023, 12, 879

14 of 20

(which, however, has fewer errors on woody vegetation) and the multi-temporal one.
A second assessment conducted by excluding the border pixels of all patches shows a
significant increase in overall accuracy, which reaches 71% for single-date classification and
76% for multitemporal classification.
The artificial abiotic surfaces show good results, commission errors mainly concern
the bare soil in the agricultural area and omissions are mainly located in urban areas with
a simultaneous presence of many small patches of different land cover classes (such as
tree-lined streets) and along the road network.
This methodology is based on Sentinel-2 data and adopts an EAGLE-compliant classification system, resulting in it being integrated well into the Copernicus framework and
suitable for a wide range of improvements, such as the introduction of Sentinel-1 SAR
data or the expansion of the classification system (e.g., distinguishing trees from shrubs
and separating permanent and periodic herbaceous vegetation), evaluating the seasonal
variability of the land cover and integrating high-resolution or hyperspectral data into the
methodology. It will also be important to evaluate the sensitivity of the algorithm with
respect to the use of a higher number of Sentinel-2 spectral bands.
The map is more accurate in urbanized areas, since the ISPRA land cover map of
the municipality of Rome used to extract the training areas represents the consumed
land with more geometric detail than the non-consumed land [83]. Anyway, the use of
ISPRA products for the extraction of training areas allows for progressively improving the
reliability of the training dataset without additional photo-interpretation costs, since the
annual and highly accurate update of the land cover and land consumption maps is one of
the institutional tasks of ISPRA and SNPA.
Already in this preliminary phase, the map shows good results in single-date classification, with notable positive implications in terms of the timeliness of updates and reduction
in computational costs. In this sense, the methodology constitutes a first attempt to create
new tools for high-frequency land monitoring in critical areas, for example, with reference
to the monitoring of urban densification phenomena and the management of green spaces
included in the consolidated urban fabric.
5. Conclusions
This research compares for the first time three CNN algorithms for the definition of
a land cover mapping methodology that exploits the data produced by ISPRA for Italy
to optimize the collection of training areas. Actually, compared to other traditional or
machine-learning-based classification techniques, CNNs require little pre-processing of
the data and marginal human intervention once the model is calibrated. However, the
creation of the training dataset is cumbersome and delicate, since the correct training of
the algorithm requires a large number of well-selected training areas, whose collection is
generally carried out through photo-interpretation.
The use of the ISPRA land cover map significantly optimizes this onerous phase, since
a dataset is exploited which is already physiologically subject to manual updating and
which must guarantee high accuracy. In this way, a training dataset that is reviewed and
updated every year is obtained, which allows the production of a land cover map on an
annual basis with limited training area selection efforts. Achieving higher update frequencies requires an in-depth analysis of the selection of training areas relating to the classes
most subject to land cover variations during the year, such as agricultural areas, so that
the algorithms understand their behavior during the year. Once the reasonably achievable
update frequency has been defined on the basis of data availability, optimization of computational costs and adaptation of training areas to seasonal variations, the methodology will
be able to support high-frequency monitoring of rapid and impactful phenomena, such
as large infrastructure construction sites, illegal building or forest disturbances. Anyway,
already in the preliminary phase, the results are encouraging to consider applications to
the monitoring of urban areas. By 2050, more than 75% of the world’s population will
live in urban areas, with repercussions in terms of exposure to extreme events, significant

Land 2023, 12, 879

15 of 20

environmental impacts and lower resilience in dealing with the climate crisis and phenomena such as the urban heat island. Controlling land transformations in urban areas is
therefore essential because it affects people’s health and well-being. This theme is included
among the priorities of the 7th of the 8th Environmental Action Programme, is included
in the “Biodiversity Strategy for 2030”, is the theme of the UN Sustainable Development
Goals number 11 and requires the adoption of effective policies based on reliable and
timely observations. Actually, the methodology stands as a promising tool to deepen the
monitoring of urban areas and in particular the green infrastructures in urban areas and
the related ecosystem services, the evaluation of the cooling index, the SDG 11.7.1 [84]
associated with accessibility, and maps of vulnerability in terms of physical access to green
spaces. Experiences such as the recent “Dynamic world” [85] show the potential of deep
learning techniques in land cover mapping, even on a large scale and with high update
frequency. With appropriate refinements in the selection of training areas, the methodology
will be also improved for high-frequency monitoring of peri-urban and rural areas, with a
view to maximizing integration with other land monitoring tools available nationwide.
Author Contributions: Conceptualization, G.C., L.C., P.D.F., P.D. and M.M. (Michele Munafò);
methodology, G.C. and L.C.; software, G.C., P.D.F. and L.C.; validation, G.C., P.D. and P.D.F.; formal
analysis, G.C., P.D.F. and L.C.; investigation, G.C. and L.C.; resources, M.M. (Michele Munafò) and
M.M. (Marco Marchetti); data curation, G.C., P.D.F., P.D. and L.C.; writing—original draft preparation,
G.C. and P.D.F.; visualization, G.C. and P.D.F.; supervision, L.C., M.M. (Michele Munafò) and M.M.
(Marco Marchetti); funding acquisition, M.M. (Marco Marchetti) and M.M. (Michele Munafò). All
authors have read and agreed to the published version of the manuscript.
Funding: This research was funded by the University of Molise.
Institutional Review Board Statement: Not applicable.
Informed Consent Statement: Not applicable.
Data Availability Statement: The data are not publicly available because they are part of ongoing research.
Conflicts of Interest: The authors declare no conflict of interest.

Abbreviations
Abbreviation
CLC
CLMS
CNN
DenseNet
DL
EAGLE
GAN
ISPRA
LCM
LC
LCR
LU
MAES
ML
OA
PA
PCA
ResNet
RNN
UA
SNPA
VGG

Meaning
CORINE Land Cover
Copernicus Land Monitoring Service
Convolutional Neural Networks
Densely Connected Convolutional Networks
Deep Learning
EIONET Action Group on Land monitoring in Europe
Generative Adversarial Networks
Italian Institute for Environmental Protection and Research
National Land Consumption Map
Land Cover
Land Cover map of Rome
Land Use
Mapping Assessment of Ecosystem Services
Machine Learning
Overall Accuracy
Producer Accuracy
Principal Component Analysis
Residual Network
Recurrent Neural Network
User Accuracy
National Environmental Protection System
Visual Geometry Group

Land 2023, 12, 879

16 of 20

Appendix A. Calculation of the Sample Size for the Accuracy Assessment
The accuracy assessment was conducted on four land cover maps of the municipality
of Rome: the land cover map from single-data classification of the summer image, that
from multi-temporal image classification and the related versions subjected to the “erosion”
operation, i.e., deleting a strip of pixels along the edges between patches of different classes
to evaluate how the classification of mixed pixels affects accuracy.
The sample size (n) was calculated with Olofsson’s methodology:

(∑ Wi Si )2


S Ô ]2
where:
Wi —is the area proportion of each class derived from the map classification
√
Si —standard deviation of stratum i, Si = (Ui (1 − Ui ))
Ui —user accuracy of class i
S(Ô) is the standard target standard error.
Si is related to the Ui , which was assumed to be equal to 0.6 for all classes.
The target standard error for overall accuracy was assumed to be 0.01, which corresponds to a confidence interval of 1%.
The points were distributed among the land cover classes through a stratified sampling
and then they were photo-interpreted. The number of points attributed to each class was
the average between the equal and area-proportional distribution (see https://fromgistors.
blogspot.com/2019/09/Accuracy-Assessment-of-Land-Cover-Classification.html, accessed
on 27 February 2023). In the distribution of points between the classes, the results have
been rounded up, and a minimum of 100 points has been set for all classes.
Calculation of the sample size for the four maps is reported in Tables A1–A4.
Table A1. Calculation of the sample size of the land cover map of the municipality of Rome from
single-date summer image classification.
LC Class

Area (ha)

Wi

Ui

Si

Wi *Si

Equal

Propor.

Mean

Final

110
120
210
220
310
Total

27.606
417
38.813
60.496
1302
128.634

0.21
0.00
0.30
0.47
0.01
1.00

0.60
0.60
0.60
0.60
0.60
-

0.49
0.49
0.49
0.49
0.49
-

0.105
0.002
0.148
0.230
0.005
-

160
160
160
160
160
800

173
3
242
378
9
805

167
82
202
270
85
806

167
100
202
270
100
839

Table A2. Calculation of the sample size of the land cover map of the municipality of Rome from
multi-temporal data classification.
LC Class

Area (ha)

Wi

Ui

Si

Wi *Si

Equal

Propor.

Mean

Final

110
120
210
220
310
Total

32.582
4
25.641
68.278
2129
128.634

0.25
0.00
0.20
0.53
0.02
1.00

0.60
0.60
0.60
0.60
0.60
-

0.49
0.49
0.49
0.49
0.49
-

0.124
0.000
0.098
0.260
0.008
-

160
160
160
160
160
800

204
1
160
426
14
805

183
81
161
294
88
807

183
100
161
294
100
838

Table A3. Calculation of the sample size of the land cover map of the municipality of Rome from
single-date summer image classification after the application of the “erosion” operation.
LC class

Area (ha)

Wi

Ui

Si

Wi *Si

Equal

Propor.

Mean

Final

110

22.786

0.25

0.60

0.49

0.121

170

210

191

191

Land 2023, 12, 879

17 of 20

Table A3. Cont.
LC class

Area (ha)

Wi

Ui

Si

Wi *Si

Equal

Propor.

Mean

Final

120
210
220
310
Total

12
27.041
44.628
915
95.383

0.00
0.29
0.48
0.01
1.00

0.60
0.60
0.60
0.60
-

0.49
0.49
0.49
0.49
-

0.000
0.143
0.236
0.005
-

170
170
170
170
850

1
249
411
9
880

86
210
291
90
868

100
210
291
100
892

Table A4. Calculation of the sample size of the land cover map of the municipality of Rome from
multi-temporal data classification after the application of the “erosion” operation.
LC Class

Area (ha)

Wi

Ui

Si

Wi *Si

Equal

Propor.

Mean

Final

110
120
210
220
310
Total

24.729
0
16.110
50.134
1590
92.563

0.27
0.00
0.17
0.54
0.02
1.00

0.60
0.60
0.60
0.60
0.60
-

0.49
0.49
0.49
0.49
0.49
-

0.131
0.000
0.085
0.265
0.008
-

160
160
160
160
160
800

215
1
140
435
14
805

188
81
151
298
88
806

188
100
151
298
100
837

References
1.
2.
3.
4.
5.
6.
7.
8.

9.
10.
11.

12.

13.

14.
15.
16.
17.

Munafò, M. Consumo Di Suolo, Dinamiche Territoriali e Servizi Ecosistemici Edizione 2022 Rapporto ISPRA SNPA; ISPRA, SNPA:
Rome, Italy, 2022; ISBN 9788844811242.
EEA. Copernicus Land Monitoring Service. Available online: https://land.copernicus.eu/ (accessed on 27 February 2023).
Buchhorn, M.; Smets, B.; Bertels, L.; de Roo, B.; Lesiv, M.; Tsendbazar, N.-E.; Herold, M.; Fritz, S. Copernicus Global Land Service:
Land Cover 100 m: Collection 3: Epoch 2019: Globe. Zenodo 2020. [CrossRef]
Kosztra György Büttner, B.; Hazeu Stephan Arnold, G. Updated CLC Illustrated Nomenclature Guidelines; EEA: Wien, Austria, 2019.
EEA. High Resolution Layers. Available online: https://land.copernicus.eu/pan-european/high-resolution-layers (accessed on
27 February 2023).
EEA. CORINE Land Cover. Available online: https://land.copernicus.eu/pan-european/corine-land-cover (accessed on
27 February 2023).
EEA. Local. Available online: https://land.copernicus.eu/local (accessed on 27 February 2023).
Gharbia, R.; Khalifa, N.E.M.; Hassanien, A.E. Land Cover Classification Using Deep Convolutional Neural Networks. In Intelligent
Systems Design and Applications, Proceedings of the 20th International Conference on Intelligent Systems Design and Applications (ISDA
2020), 12–15 December 2020; Springer: Berlin/Heidelberg, Germany, 2021; pp. 911–920.
Zhang, T.; Su, J.; Xu, Z.; Luo, Y.; Li, J. Sentinel-2 Satellite Imagery for Urban Land Cover Classification by Optimized Random
Forest Classifier. Appl. Sci. 2021, 11, 543. [CrossRef]
Gašparović, M.; Jogun, T. The Effect of Fusing Sentinel-2 Bands on Land-Cover Classification. Int. J. Remote Sens. 2018, 39, 822–841.
[CrossRef]
Abdikan, S.; Sanli, F.B.; Ustuner, M.; Calò, F. Land Cover Mapping Using Sentinel-1 SAR Data. In Proceedings of the International Archives of the Photogrammetry, Remote Sensing and Spatial Information Sciences, 2016 XXIII ISPRS Congress, Prague,
Czech Republic, 12–19 July 2016; Volume XLI-B7.
Mirmazloumi, S.M.; Kakooei, M.; Mohseni, F.; Ghorbanian, A.; Amani, M.; Crosetto, M.; Monserrat, O. ELULC-10, a 10 m
European Land Use and Land Cover Map Using Sentinel and Landsat Data in Google Earth Engine. Remote Sens. 2022, 14, 41.
[CrossRef]
Malinowski, R.; Lewiński, S.; Rybicki, M.; Gromny, E.; Jenerowicz, M.; Krupiński, M.; Nowakowski, A.; Wojtkowski, C.; Krupiński,
M.; Krätzschmar, E.; et al. Automated Production of a Land Cover/Use Map of Europe Based on Sentinel-2 Imagery. Remote Sens.
2020, 12, 3523. [CrossRef]
ESA. Land-Cover Maps of Europe from the Cloud. Available online: https://www.esa.int/Applications/Observing_the_Earth/
Copernicus/Sentinel-2/Land-cover_maps_of_Europe_from_the_Cloud#.YLIADWazCxU.link (accessed on 21 March 2023).
Venter, Z.S.; Sydenham, M.A.K. Continental-Scale Land Cover Mapping at 10 m Resolution over Europe (Elc10). Remote Sens.
2021, 13, 2301. [CrossRef]
Tsendbazar, N.; Herold, M.; Li, L.; Tarko, A.; de Bruin, S.; Masiliunas, D.; Lesiv, M.; Fritz, S.; Buchhorn, M.; Smets, B.; et al.
Towards Operational Validation of Annual Global Land Cover Maps. Remote Sens. Environ. 2021, 266, 112686. [CrossRef]
Zanaga, D.; Van De Kerchove, R.; De Keersmaecker, W.; Souverijns, N.; Brockmann, C.; Quast, R.; Wevers, J.; Grosu, A.;
Paccini, A.; Vergnaud, S.; et al. ESA WorldCover 10 m 2020 V100. Available online: https://zenodo.org/record/5571936#.YrV3
8HZByUk (accessed on 21 March 2023).

Land 2023, 12, 879

18.

19.

20.
21.
22.
23.
24.
25.

26.
27.

28.
29.
30.
31.
32.
33.
34.

35.
36.
37.
38.

39.
40.
41.
42.
43.
44.

18 of 20

Gong, P.; Liu, H.; Zhang, M.; Li, C.; Wang, J.; Huang, H.; Clinton, N.; Ji, L.; Li, W.; Bai, Y.; et al. Stable Classification with Limited
Sample: Transferring a 30-m Resolution Sample Set Collected in 2015 to Mapping 10-m Resolution Global Land Cover in 2017.
Sci. Bull. 2019, 64, 370–373. [CrossRef]
Karra, K.; Kontgis, C.; Statman-Weil, Z.; Mazzariello, J.C.; Mathis, M.M.; Brumby, S.P. Global Land Use/Land Cover with Sentinel
2 and Deep Learning. In Proceedings of the 2021 IEEE International Geoscience and Remote Sensing Symposium IGARSS 2021,
Brussels, Belgium, 11–16 July 2021; pp. 4704–4707.
Debella-Gilo, M.; Gjertsen, A.K. Mapping Seasonal Agricultural Land Use Types Using Deep Learning on Sentinel-2 Image Time
Series. Remote Sens. 2021, 13, 289. [CrossRef]
Cresson, R. A Framework for Remote Sensing Images Processing Using Deep Learning Techniques. IEEE Geosci. Remote Sens. Lett.
2019, 16, 25–29. [CrossRef]
Liu, C.; Zeng, D.; Wu, H.; Wang, Y.; Jia, S.; Xin, L. Urban Land Cover Classification of High-Resolution Aerial Imagery Using a
Relation-Enhanced Multiscale Convolutional Network. Remote Sens. 2020, 12, 311. [CrossRef]
Arndt, J.; Lunga, D. Large-Scale Classification of Urban Structural Units from Remote Sensing Imagery. IEEE J. Sel. Top. Appl.
Earth Obs. Remote Sens. 2021, 14, 2634–2648. [CrossRef]
Pareeth, S.; Karimi, P.; Shafiei, M.; de Fraiture, C. Mapping Agricultural Landuse Patterns from Time Series of Landsat 8 Using
Random Forest Based Hierarchial Approach. Remote Sens 2019, 11, 601. [CrossRef]
Li, Y.; Chen, L. Land Cover Classification for High Resolution Remote Sensing Images with Atrous Convolution and BFS.
In Proceedings of the 2019 IEEE 5th International Conference on Computer and Communications (ICCC), Chengdu, China,
6–9 December 2019. ISBN 9781728147437.
Khan, S.H.; He, X.; Porikli, F.; Bennamoun, M. Forest Change Detection in Incomplete Satellite Images with Deep Neural
Networks. IEEE Trans. Geosci. Remote Sens. 2017, 55, 5407–5423. [CrossRef]
Jamali, A.; Mahdianpari, M.; Brisco, B.; Granger, J.; Mohammadimanesh, F.; Salehi, B. Comparing Solo versus Ensemble
Convolutional Neural Networks for Wetland Classification Using Multi-Spectral Satellite Imagery. Remote Sens. 2021, 13, 2046.
[CrossRef]
DeLancey, E.R.; Simms, J.F.; Mahdianpari, M.; Brisco, B.; Mahoney, C.; Kariyeva, J. Comparing Deep Learning and Shallow
Learning for Large-Scalewetland Classification in Alberta, Canada. Remote Sens. 2020, 12, 2. [CrossRef]
Heaton, J. Ian Goodfellow, Yoshua Bengio, and Aaron Courville: Deep Learning. Genet. Program Evolvable Mach. 2018, 19, 305–307.
[CrossRef]
LeCun, Y.; Bottou, L.; Bengio, Y.; Haffner, P. Gradient-Based Learning Applied to Document Recognition. Proc. IEEE 1998, 86,
2278–2323. [CrossRef]
Shahin, A.; Amer, K.; Elattar, M. Deep Convolutional Encoder-Decoders with Aggregated Multi-Resolution Skip Connections for
Skin Lesion Segmentation. arXiv 2019, arXiv:1901.09197.
Liang, M.; Hu, X. Recurrent Convolutional Neural Network for Object Recognition. In Proceedings of the 2015 IEEE Conference
on Computer Vision and Pattern Recognition (CVPR), Boston, MA, USA, 7–12 June 2015; pp. 3367–3375.
Goodfellow, I.; Pouget-Abadie, J.; Mirza, M.; Xu, B.; Warde-Farley, D.; Ozair, S.; Courville, A.; Bengio, Y. Generative Adversarial
Networks. Commun. ACM 2020, 63, 139–144. [CrossRef]
Alem, A.; Kumar, S. Deep Learning Methods for Land Cover and Land Use Classification in Remote Sensing: A Review.
In Proceedings of the 2020 8th International Conference on Reliability, Infocom Technologies and Optimization (Trends and
Future Directions) (ICRITO), Noida, India, 4–5 June 2020; pp. 903–908.
Hoeser, T.; Kuenzer, C. Object Detection and Image Segmentation with Deep Learning on Earth Observation Data: A Review-Part
I: Evolution and Recent Trends. Remote Sens 2020, 12, 1667. [CrossRef]
Liu, W.; Wang, Z.; Liu, X.; Zeng, N.; Liu, Y.; Alsaadi, F.E. A Survey of Deep Neural Network Architectures and Their Applications.
Neurocomputing 2017, 234, 11–26. [CrossRef]
Raschka, S.; Patterson, J.; Nolet, C. Machine Learning in Python: Main Developments and Technology Trends in Data Science,
Machine Learning, and Artificial Intelligence. Information 2020, 11, 193. [CrossRef]
Hua, L.; Zhang, X.; Chen, X.; Yin, K.; Tang, L. A Feature-Based Approach of Decision Tree Classification to Map Time Series
Urban Land Use and Land Cover with Landsat 5 TM and Landsat 8 OLI in a Coastal City, China. ISPRS Int. J. Geoinf. 2017, 6, 331.
[CrossRef]
Kulkarni, A.D.; Lowe, B. Random Forest Algorithm for Land Cover Classification. Int. J. Recent Innov. Trends Comput. Commun.
2016, 4, 58–63.
Shi, D.; Yang, X. Support Vector Machines for Land Cover Mapping from Remote Sensor Imagery. In Monitoring and Modeling of
Global Changes: A Geomatics Perspective; Springer: Dordrecht, The Netherlands, 2015; pp. 265–279.
Ruiz, L.; Guasselli, L.; Caten, A.; Zanotta, D. Iterative K–Nearest Neighbors Algorithm (IKNN) for Submeter Spatial Resolution
Image Classification Obtained by Unmanned Aerial Vehicle (UAV). Int. J. Remote Sens. 2018, 39, 5043–5058. [CrossRef]
Schmidhuber, J. Deep Learning in Neural Networks: An Overview. Neural Netw. 2015, 61, 85–117. [CrossRef]
LeCun, Y.; Bengio, Y.; Hinton, G. Deep Learning. Nature 2015, 521, 436–444. [CrossRef]
Zhang, L.; Zhang, L.; Du, B. Deep Learning for Remote Sensing Data: A Technical Tutorial on the State of the Art. IEEE Geosci.
Remote Sens. Mag. 2016, 4, 22–40. [CrossRef]

Land 2023, 12, 879

45.
46.
47.

48.
49.

50.
51.
52.
53.
54.
55.
56.
57.
58.
59.
60.

61.
62.
63.
64.
65.
66.
67.
68.
69.
70.

71.
72.

19 of 20

Thapa, N.; Liu, Z.; Kc, D.B.; Gokaraju, B.; Roy, K. Comparison of Machine Learning and Deep Learning Models for Network
Intrusion Detection Systems. Future Internet 2020, 12, 167. [CrossRef]
Minar, M.R.; Naher, J. Recent Advances in Deep Learning: An Overview. arXiv 2018, arXiv:1807.08169.
Barash, Y.; Guralnik, G.; Tau, N.; Soffer, S.; Levy, T.; Shimon, O.; Zimlichman, E.; Konen, E.; Klang, E. Comparison of Deep
Learning Models for Natural Language Processing-Based Classification of Non-English Head CT Reports. Neuroradiology 2020,
62, 1247–1256. [CrossRef]
Simonyan, K.; Zisserman, A. Very Deep Convolutional Networks for Large-Scale Image Recognition. arXiv 2014, arXiv:1409.1556.
Krizhevsky, A.; Sutskever, I.; Hinton, G.E. ImageNet Classification with Deep Convolutional Neural Networks. In Proceedings of
the Advances in Neural Information Processing Systems; Pereira, F., Burges, C.J., Bottou, L., Weinberger, K.Q., Eds.; Curran Associates,
Inc.: Red Hook, NY, USA, 2012; Volume 25.
He, K.; Zhang, X.; Ren, S.; Sun, J. Deep Residual Learning for Image Recognition. arXiv 2015, arXiv:1512.03385.
Huang, G.; Liu, Z.; van der Maaten, L.; Weinberger, K.Q. Densely Connected Convolutional Networks. arXiv 2016,
arXiv:1608.06993.
Ronneberger, O.; Fischer, P.; Brox, T. U-Net: Convolutional Networks for Biomedical Image Segmentation. arXiv 2015,
arXiv:1505.04597.
Yang, C.; Rottensteiner, F.; Heipke, C. A Hierarchical Deep Learning Framework for the Consistent Classification of Land Use
Objects in Geospatial Databases. ISPRS J. Photogramm. Remote Sens. 2021, 177, 38–56. [CrossRef]
Cecili, G.; de Fioravante, P.; Congedo, L.; Marchetti, M.; Munafò, M. Land Consumption Mapping with Convolutional Neural
Network: Case Study in Italy. Land 2022, 11, 1919. [CrossRef]
Boulila, W.; Ghandorh, H.; Khan, M.A.; Ahmed, F.; Ahmad, J. A Novel CNN-LSTM-Based Approach to Predict Urban Expansion.
Ecol. Inform. 2021, 64, 101325. [CrossRef]
Chaudhuri, U.; Dey, S.; Datcu, M.; Banerjee, B.; Bhattacharya, A. Interband Retrieval and Classification Using the Multilabeled
Sentinel-2 BigEarthNet Archive. IEEE J. Sel. Top. Appl. Earth Obs. Remote Sens. 2021, 14, 9884–9898. [CrossRef]
Kumar, V.; Singh, R.S.; Dua, Y. Morphologically Dilated Convolutional Neural Network for Hyperspectral Image Classification.
Signal Process. Image Commun. 2022, 101, 116549. [CrossRef]
Wan, S.; Pan, S.; Zhong, P.; Chang, X.; Yang, J.; Gong, C. Dual Interactive Graph Convolutional Networks for Hyperspectral
Image Classification. IEEE Trans. Geosci. Remote Sens. 2022, 60, 5510214. [CrossRef]
Pashaei, M.; Kamangir, H.; Starek, M.J.; Tissot, P. Review and Evaluation of Deep Learning Architectures for Efficient Land Cover
Mapping with UAS Hyper-Spatial Imagery: A Case Study over a Wetland. Remote Sens. 2020, 12, 959. [CrossRef]
Qi, X.; Zhu, P.; Wang, Y.; Zhang, L.; Peng, J.; Wu, M.; Chen, J.; Zhao, X.; Zang, N.; Mathiopoulos, P.T. MLRSNet: A Multi-Label
High Spatial Resolution Remote Sensing Dataset for Semantic Scene Understanding. ISPRS J. Photogramm. Remote Sens. 2020, 169,
337–350. [CrossRef]
Rousset, G.; Despinoy, M.; Schindler, K.; Mangeas, M. Assessment of Deep Learning Techniques for Land Use Land Cover
Classification in Southern New Caledonia. Remote Sens. 2021, 13, 2257. [CrossRef]
Wakulinśka, M.; Marcinkowska-Ochtyra, A. Multi-Temporal Sentinel-2 Data in Classification of Mountain Vegetation. Remote
Sens. 2020, 12, 2696. [CrossRef]
Campos-Taberner, M.; García-Haro, F.J.; Martínez, B.; Izquierdo-Verdiguier, E.; Atzberger, C.; Camps-Valls, G.; Gilabert, M.A.
Understanding Deep Learning in Land Use Classification Based on Sentinel-2 Time Series. Sci. Rep. 2020, 10, 17188. [CrossRef]
Martini, M.; Mazzia, V.; Khaliq, A.; Chiaberge, M. Domain-Adversarial Training of Self-Attention-Based Networks for Land
Cover Classification Using Multi-Temporal Sentinel-2 Satellite Imagery. Remote Sens. 2021, 13, 2564. [CrossRef]
Hu, X.; Zhang, P.; Zhang, Q.; Wang, J. Improving Wetland Cover Classification Using Artificial Neural Networks with Ensemble
Techniques. Gisci. Remote Sens. 2021, 58, 603–623. [CrossRef]
Di Pilato, A.; Taggio, N.; Pompili, A.; Iacobellis, M.; Di Florio, A.; Passarelli, D.; Samarelli, S. Deep Learning Approaches to Earth
Observation Change Detection. Remote Sens. 2021, 13, 4083. [CrossRef]
Strollo, A.; Smiraglia, D.; Bruno, R.; Assennato, F.; Congedo, L.; de Fioravante, P.; Giuliani, C.; Marinosci, I.; Riitano, N.;
Munafò, M. Land Consumption in Italy. J. Maps 2020, 16, 113–123. [CrossRef]
Luti, T.; de Fioravante, P.; Marinosci, I.; Strollo, A.; Riitano, N.; Falanga, V.; Mariani, L.; Congedo, L.; Munafò, M. Land
Consumption Monitoring with Sar Data and Multispectral Indices. Remote Sens. 2021, 13, 1586. [CrossRef]
de Fioravante, P.; Strollo, A.; Assennato, F.; Marinosci, I.; Congedo, L.; Munafò, M. High Resolution Land Cover Integrating
Copernicus Products: A 2012–2020 Map of Italy. Land 2022, 11, 35. [CrossRef]
de Fioravante, P.; Strollo, A.; Cavalli, A.; Cimini, A.; Smiraglia, D.; Assennato, F.; Munafò, M. Ecosystem Mapping and Accounting
in Italy Based on Copernicus and National Data through Integration of EAGLE and SEEA-EA Frameworks. Land 2023, 12, 286.
[CrossRef]
de Fioravante, P.; Luti, T.; Cavalli, A.; Giuliani, C.; Dichicco, P.; Marchetti, M.; Chirici, G.; Congedo, L.; Munafò, M. Multispectral
Sentinel-2 and Sar Sentinel-1 Integration for Automatic Land Cover Classification. Land 2021, 10, 611. [CrossRef]
Fahmi, H.; Sari, W.P. Analysis of Deep Learning Architecture for Patch-Based Land Cover Classification. In Proceedings of
the 2022 6th International Conference on Information Technology, Information Systems and Electrical Engineering (ICITISEE),
Yogyakarta, Indonesia, 13–14 December 2022; pp. 1–5.

Land 2023, 12, 879

73.

74.
75.
76.
77.
78.
79.
80.
81.
82.
83.
84.
85.

20 of 20

Tao, C.S.; Chen, S.W.; Xiao, S.P. Comparison Study of Multitemporal PolSAR Classification Using Convolutional Neural
Networks. In Proceedings of the International Geoscience and Remote Sensing Symposium (IGARSS), Waikoloa, HI, USA,
26 September–2 October 2020; pp. 204–207.
Zhang, Q.; Zhang, Y.; Yang, P.; Meng, Y.; Zhuo, S.; Yang, Z. The Land Cover Classification Using a Feature Pyramid Networks
Architecture from Satellite Imagery. Int. Arch. Photogramm. Remote Sens. Spat. Inf. Sci. 2020, 43, 241–246. [CrossRef]
Schmitt, M.; Wu, Y.L. Remote Sensing Image Classification with the SEN12MS DATASET. ISPRS Ann. Photogramm. Remote Sens.
Spat. Inf. Sci. 2021, 5, 101–106. [CrossRef]
Arnold, S.; Kosztra, B.; Banko, G.; Milenov, P.; Smith, G.; Hazeu, G. Explanatory Documentation of the EAGLE Concept-Version 3.1.2;
European Environment Agency: Copenhagen, Denmark, 2016.
Olofsson, P.; Foody, G.M.; Herold, M.; Stehman, S.V.; Woodcock, C.E.; Wulder, M.A. Good Practices for Estimating Area and
Assessing Accuracy of Land Change. Remote Sens. Environ. 2014, 148, 42–57. [CrossRef]
Congedo, L. Semi-Automatic Classification Plugin: A Python Tool for the Download and Processing of Remote Sensing Images in
QGIS. J. Open Source Softw. 2021, 6, 3172. [CrossRef]
Cai, H.; Chen, T.; Niu, R.; Plaza, A. Landslide Detection Using Densely Connected Convolutional Networks and Environmental
Conditions. IEEE J. Sel. Top. Appl. Earth Obs. Remote Sens. 2021, 14, 5235–5247. [CrossRef]
Kingma, D.P.; Ba, J. Adam: A Method for Stochastic Optimization. arXiv 2014, arXiv:1412.6980.
Amari, S. Backpropagation and Stochastic Gradient Descent Method. Neurocomputing 1993, 5, 185–196. [CrossRef]
Ioffe, S.; Szegedy, C. Batch Normalization: Accelerating Deep Network Training by Reducing Internal Covariate Shift. arXiv 2015,
arXiv:1502.03167.
Munafò, M.; Cesetti, F. L’uso e Il Consumo Di Suolo Di Roma Capitale. Analisi Della Copertura Del Suolo Nel Territorio Di Roma–Rapporto
2021; ISPRA: Rome, Italy, 2021.
Cimini, A.; Fioravante, P.; Riitano, N.; Dichicco, P.; Calò, A.; Mugnozza, G.; Marchetti, M.; Munafò, M. Land Consumption
Dynamics and Urban–Rural Continuum Mapping in Italy for SDG 11.3.1 Indicator Assessment. Land 2023, 12, 155. [CrossRef]
Brown, C.F.; Brumby, S.P.; Guzder-Williams, B.; Birch, T.; Hyde, S.B.; Mazzariello, J.; Czerwinski, W.; Pasquarella, V.J.; Haertel,
R.; Ilyushchenko, S.; et al. Dynamic World, Near Real-Time Global 10 m Land Use Land Cover Mapping. Sci. Data 2022, 9, 251.
[CrossRef]

Disclaimer/Publisher’s Note: The statements, opinions and data contained in all publications are solely those of the individual
author(s) and contributor(s) and not of MDPI and/or the editor(s). MDPI and/or the editor(s) disclaim responsibility for any injury to
people or property resulting from any ideas, methods, instructions or products referred to in the content.


```

---

## Referencia BibTeX

```bibtex
@article{ceciliLandCoverMapping2023,
  title = {Land {{Cover Mapping}} with {{Convolutional Neural Networks Using Sentinel-2 Images}}: {{Case Study}} of {{Rome}}},
  shorttitle = {Land {{Cover Mapping}} with {{Convolutional Neural Networks Using Sentinel-2 Images}}},
  author = {Cecili, Giulia and De Fioravante, Paolo and Dichicco, Pasquale and Congedo, Luca and Marchetti, Marco and Munaf{\`o}, Michele},
  year = 2023,
  month = apr,
  journal = {Land},
  volume = {12},
  number = {4},
  pages = {879},
  issn = {2073-445X},
  doi = {10.3390/land12040879},
  urldate = {2026-07-10},
  abstract = {Land cover monitoring is crucial to understand land transformations at a global, regional and local level, and the development of innovative methodologies is necessary in order to define appropriate policies and land management practices. Deep learning techniques have recently been demonstrated as a useful method for land cover mapping through the classification of remote sensing imagery. This research aims to test and compare the predictive models created using the convolutional neural networks (CNNs) VGG16, DenseNet121 and ResNet50 on multitemporal and single-date Sentinel-2 satellite data. The most promising model was the VGG16 both with single-date and multi-temporal images, which reach an overall accuracy of 71\% and which was used to produce an automatically generated EAGLE-compliant land cover map of Rome for 2019. The methodology is part of the land mapping activities of ISPRA and exploits its main products as input and support data. In this sense, it is a first attempt to develop a high-update-frequency land cover classification tool for dynamic areas to be integrated in the framework of the ISPRA monitoring activities for the Italian territory.},
  langid = {english},
  file = {/home/fernando/Zotero/storage/CCXS8AC5/Cecili et al. - 2023 - Land Cover Mapping with Convolutional Neural Networks Using Sentinel-2 Images Case Study of Rome.pdf}
}
```
