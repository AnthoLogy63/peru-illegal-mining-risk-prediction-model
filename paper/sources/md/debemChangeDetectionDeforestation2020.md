# Change Detection of Deforestation in the Brazilian Amazon Using Landsat Data and Convolutional Neural Networks

**BibTeX Key:** `debemChangeDetectionDeforestation2020`  
**Authors:** De Bem, Pablo and De Carvalho Junior, Osmar and Fontes Guimar{\~a}es, Renato and Trancoso Gomes, Roberto  

---

## Abstract

Mapping deforestation is an essential step in the process of managing tropical rainforests. It lets us understand and monitor both legal and illegal deforestation and its implications, which include the effect deforestation may have on climate change through greenhouse gas emissions. Given that there is ample room for improvements when it comes to mapping deforestation using satellite imagery, in this study, we aimed to test and evaluate the use of algorithms belonging to the growing field of deep learning (DL), particularly convolutional neural networks (CNNs), to this end. Although studies have been using DL algorithms for a variety of remote sensing tasks for the past few years, they are still relatively unexplored for deforestation mapping. We attempted to map the deforestation between images approximately one year apart, specifically between 2017 and 2018 and between 2018 and 2019. Three CNN architectures that are available in the literature---SharpMask, U-Net, and ResUnet---were used to classify the change between years and were then compared to two classic machine learning (ML) algorithms---random forest (RF) and multilayer perceptron (MLP)---as points of reference. After validation, we found that the DL models were better in most performance metrics including the Kappa index, F1 score, and mean intersection over union (mIoU) measure, while the ResUnet model achieved the best overall results with a value of 0.94 in all three measures in both time sequences. Visually, the DL models also provided classifications with better defined deforestation patches and did not need any sort of post-processing to remove noise, unlike the ML models, which needed some noise removal to improve results.

---

## Resumen / Notas (Tuyo)

*(Escribe aquí tus notas)*

---

## Texto Completo del Artículo (Extraído del PDF)

```text
remote sensing
Article

Change Detection of Deforestation in the Brazilian
Amazon Using Landsat Data and Convolutional
Neural Networks
Pablo Pozzobon de Bem , Osmar Abílio de Carvalho Junior * , Renato Fontes Guimarães
Roberto Arnaldo Trancoso Gomes

and

Departamento de Geografia, Campus Universitário Darcy Ribeiro, Asa Norte, Universidade de Brasília, DF,
70910-900 Brasília, Brazil; pablo.bem@aluno.unb.br (P.P.d.B.); renatofg@unb.br (R.F.G.);
robertogomes@unb.br (R.A.T.G.)
* Correspondence: osmarjr@unb.br
Received: 23 January 2020; Accepted: 3 March 2020; Published: 11 March 2020




Abstract: Mapping deforestation is an essential step in the process of managing tropical rainforests.
It lets us understand and monitor both legal and illegal deforestation and its implications,
which include the effect deforestation may have on climate change through greenhouse gas emissions.
Given that there is ample room for improvements when it comes to mapping deforestation using
satellite imagery, in this study, we aimed to test and evaluate the use of algorithms belonging to the
growing field of deep learning (DL), particularly convolutional neural networks (CNNs), to this end.
Although studies have been using DL algorithms for a variety of remote sensing tasks for the past
few years, they are still relatively unexplored for deforestation mapping. We attempted to map the
deforestation between images approximately one year apart, specifically between 2017 and 2018 and
between 2018 and 2019. Three CNN architectures that are available in the literature—SharpMask,
U-Net, and ResUnet—were used to classify the change between years and were then compared to two
classic machine learning (ML) algorithms—random forest (RF) and multilayer perceptron (MLP)—as
points of reference. After validation, we found that the DL models were better in most performance
metrics including the Kappa index, F1 score, and mean intersection over union (mIoU) measure,
while the ResUnet model achieved the best overall results with a value of 0.94 in all three measures
in both time sequences. Visually, the DL models also provided classifications with better defined
deforestation patches and did not need any sort of post-processing to remove noise, unlike the ML
models, which needed some noise removal to improve results.
Keywords: deep learning; CNN; classification; change detection; deforestation

1. Introduction
Deforestation is one of the primary sources of concern regarding climate change as it is one of the
largest sources of greenhouse gas emissions in the world, second only to the burning of fossil fuels [1].
Within the region of the Brazilian Amazon, studies have shown that deforestation, in conjunction
with forest fires, can make up to 48% of the total emissions [2]. It also bears substantial implications
regarding the conservation of ecosystems and their biodiversity in the region, and it has been linked
to the loss of species [3] and general loss of ecosystem stability through fragmentation [4]. Locally,
estimates also show that unchecked deforestation could lead to reductions in seasonal rainfall [5] and
into the savanization of the environment [6].
Remote sensing imagery has been instrumental in the process of keeping track of deforestation in
the Amazon. The Brazilian National Institute for Space Research (INPE) releases annual deforestation

Remote Sens. 2020, 12, 901; doi:10.3390/rs12060901

www.mdpi.com/journal/remotesensing

Remote Sens. 2020, 12, 901

2 of 19

and land use information derived from satellite imagery data through their Program for Deforestation
Monitoring (PRODES) and TerraClass projects [7,8], which have been widely used for monitoring,
research, and policymaking. Carbon emission estimates from deforestation are also dependent on land
use and land-use change data [1]. However, they are likely to be underestimated due to the omission
of illegal logging data in official reports [9].
Change detection is one of the most common tasks within the field of remote sensing. It is defined
as the process of analyzing and quantifying the state of an object or phenomenon at different times [10],
and is consequently an essential tool in the processes of understanding and tackling deforestation.
The changes present in the images can be semantic (of the object under analysis) or noisy (variations in
lighting, shadows, among others) [11]. Therefore, the challenge in change detection is to use a method
that establishes features that minimize noisy changes and emphasize the semantic changes that are
intertwined. Typically, the final map of change detection techniques is a binary classification that
contains unchanged and changed regions.
Several reviews and classifications of digital change detection techniques are available in the
literature [10,12–18], evidencing a large quantity of approaches and algorithms in this research
area. Tewkesbury et al. [18] provide a synthesis of change detection methods, distinctly considering
the units of analysis (pixel, kernel, image-object overlay, image-object comparison, multi-temporal
image-object, vector polygon, and hybrid) and the method used to identify the change (layer arithmetic,
post-classification change, direct classification, transformation, change vector analysis, hybrid change
detection).
Change detection methods based on machine learning (ML) algorithms typically use direct
classification [18], which takes a set of stacked temporal images as input and uses complex nonlinear
functions to model and determine changes. In this approach, it is not necessary to use pre-classification
techniques that seek to define the best measures to detect changes (such as temporal subtraction,
data transformation, and change vector analysis). In long-term time series, direct classification based
on ML is predominant [19,20].
Deep learning (DL) has recently attracted increasing attention from remote sensing researchers
because of its ability to automatically extract features from the image dataset, high-level semantic
segmentation, nonlinear problem modeling, and mapping in complex environments [21]. DL has shown
great potential in remote sensing, producing state-of-the-art results in different types of remote sensing
data processing [22]: image registration [23–26], land-use and land-cover classification [27–30], object
detection [31–34], image fusion [35–38], semantic segmentation [39–42], and precision evaluation [43].
DL has also been used for change detection techniques, showing superior performance with greater
precision in comparison to classic ML methods [44]. The capacity for pattern recognition in the three
dimensions of the image (special, spectral, and temporal) makes DL algorithms especially effective
when used to change detection with common and recurring patterns [45]. DL-based change detection
methods have been applied to different targets such as urban [46–49], land use/land cover [50–52],
and landslides [53], among others. Peng et al. [54] proposed a subdivision of DL-based change
detection methods that considered three units of analysis: (1) feature [55–57]; (2) patch [58–61]; and (3)
image [62,63]. In the case of image-based DL change detection, the algorithms learn the segmentation
of changes directly from bi-temporal image pairs, avoiding the negative effects caused when using
pixel patches [54]. In this approach, the U-Net architecture has been successfully employed [63,64].
Among the DL algorithms, convolutional neural networks (CNN) are one of the leading types of
architectures [22]. CNNs differ from traditional ML algorithms by being able to identify patterns
within an n-dimensional context with multiple abstraction levels through convolutional filters and use
them for inference.
The objective of this study was to investigate the use of CNNs for the detection of deforestation
within the Brazilian Amazon to verify the hypotheses that DL algorithms are a viable and possibly
better alternative in comparison to classic ML algorithms when it comes to mapping deforestation.
Like many anthropogenic changes in the landscape, deforestation follows specific spatial patterns with

Remote Sens. 2020, 12, 901

3 of 19

support geometric or regular configurations and usually develop around official or unofficial roads,
2.1.
Training
and Test
forming a
dendritic
or Sites
“fishbone” distribution [65]. Despite being a prime target for the application of
DL algorithms,
the number
of studies
related to
deforestation
is still
small, given
thesites.
variety
of the
types
In this study,
we selected
three regions
within
the Brazilian
Amazon
as study
These
scenes
ofencompass
algorithmsmajor
available.
In
order
to
investigate
the
use
of
DL
for
deforestation
detection,
three
different
deforestation centers that have developed along the “TransAmazon” (BR-230) [66–
CNN
architectures
were used(BR-163)
to classify
deforested
areas (Figure
yearly and
then compared
to the
two
,68] and
“Cuiabá–Santarem”
[69,–7170]
highways
1). Inwere
the Amazon,
roads are
classical
algorithms
points of
reference.
drivingML
forces for
the as
spatial
distribution
of deforestation in the Amazon, where most deforestation
occurs in the neighborhood of the main highway [721,732]. Widely discussed in the literature, the
2. Material and Methods
opening of roads in the Amazon forest favors the establishment of settlements, attracts migrants,
facilitates the extraction of resources, increases the profitability of livestock and agriculture, and
2.1. Training and Test Sites
establishes access to wood [734–787].
InThe
thistraining
study, we
selected
three (Sites
regions
Amazon
study
sites. These
used
two scenes
A within
and B),the
andBrazilian
validation
utilizedasthe
remaining
scenescenes
(Site
encompass
major adeforestation
that
developed
the Landsat
“TransAmazon”
(BR-230)
[66–68]
C).
We defined
bi-temporal centers
approach
forhave
modeling
and along
obtained
8/OLI imagery
for each
and
“Cuiabá–Santarem”
(BR-163)
[69,70]
highways (Figure
1). In
theyear
Amazon,
roads
driving
site for the
years of 2017,
2018, and
2019, with
approximately
one
between
eachare the
observation.
forces
for
the
spatial
distribution
of
deforestation
in
the
Amazon,
where
most
deforestation
Multitemporal images from similar periods of the year reduce variations in the phenology andoccurs
sunterrain-sensor
geometry.
images
acquired
were from
season
cloud
andof
in the
neighborhood
of theThe
main
highway
[71,72].
Widelythe dry
discussed
in to
theminimize
literature,
the cover
opening
reduce
noise
(Table 1).
Tier 1
Landsat
wereofused as
they offer
consistent
georegistration
roads
in the
Amazon
forest
favors
the images
establishment
settlements,
attracts
migrants,
facilitates the
within prescribed
image-to-image
tolerances ofofless
than 12-meter
radial root
square
errorto
extraction
of resources,
increases the profitability
livestock
and agriculture,
and mean
establishes
access
(RMSE)
and are therefore appropriate for time-series analysis (https://www.usgs.gov/landwood
[73–77].
resources/nli/landsat/landsat-collection-1)[78].

Figure
Amazon region
region with
withthe
the(b,c)
(b,c)train
trainsites
sitesAAand
andBB
Figure1.1.(a)
(a)Location
Locationof
ofthe
thestudy
study sites
sites within
within the
the Amazon
and
trueA,
color
composite
Landsat
fromimages
June and
July
2018.
and(d)
(d)test
testsite
siteCCassites
B, and C
as true
color images
compositetaken
Landsat
taken
from
June (C) and
July (A and B) 2018.

The training used two scenes (Sites A and B), and validation utilized the remaining scene (Site
C). We defined a bi-temporal
approach
and
obtained Landsat
8/OLI imagery for each
Table 1. Acquisition
datesfor
formodeling
each site and
corresponding
Landsat scenes.
site for the years of 2017, 2018, and 2019, with approximately one year between each observation.
Acquisition date
Site Landsat Scene
2017
2018
2019

Remote Sens. 2020, 12, 901

4 of 19

Multitemporal images from similar periods of the year reduce variations in the phenology and
sun-terrain-sensor geometry. The images acquired were from the dry season to minimize cloud cover
and reduce noise (Table 1). Tier 1 Landsat images were used as they offer consistent georegistration
within prescribed image-to-image tolerances of less than 12-meter radial root mean square error (RMSE)
and are therefore appropriate for time-series analysis [78].
Table 1. Acquisition dates for each site and corresponding Landsat scenes.
Site
A
B
C

Acquisition Date

Landsat Scene
227_63
227_65
230_65

2017

2018

2019

July 18
July 18
June 21

July 21
July 21
June 24

July 24
July 24
July 13

A
227_63
July 18 July 21 July 24
B
227_65
July 18 July 21 July 24
C
230_65
June
21 June 24available
July 13
This research used three different DL architectures
in the literature:

2.2. Deep Learning Models

U-Net [79],
SharpMask [80], and ResUnet [81]. While the U-Net and SharpMask algorithms were not developed
2.2. Deep Learning Models
for classification with remote sensing data in mind, studies have found that they are not only
This research used three different DL architectures available in the literature: U-Net [799],
suitable, but
offer state-of-the-art results [39,82]. These algorithms share similarities, being based on
SharpMask [8080], and ResUnet [8181]. While the U-Net and SharpMask algorithms were not
architectures
known
as autoencoders
withsensing
the addition
bridges
or have
residual
connections.
Autoencoders
developed for classification
with remote
data inof
mind,
studies
found
that they are not
downsample
the but
feature
generated
through
convolutional
filters share
whilesimilarities,
incrementally
only suitable,
offermaps
state-of-the-art
results
[39,8282–84].
These algorithms
being increasing
on to learn
architectures
known asfeatures
autoencoders
with the and
addition
of bridges
or residual
connections.
their based
number
low-level
compactly,
then
upsample
them back
to the original
Autoencoders
downsample
theprocess
feature can
mapsbegenerated
through convolutional
filters while
input shape
for inference.
This
further enhanced
using connections
bridging the
incrementally increasing their number to learn low-level features compactly, and then upsample
downsampling and upsampling steps (Figure 2) to propagate information. These connections help
them back to the original input shape for inference. This process can be further enhanced using
speed up
trainingbridging
and reduce
the degradation
of data by steps
combining
both
low-levelinformation.
detail and high-level
connections
the downsampling
and upsampling
(Figure 2)
to propagate
contextual
information.
Low-level
spatial
detail
is
essential
for
change
detection
These connections help speed up training and reduce the degradation of data by combining bothand
low- land cover
level
detail
and
high-level
contextual
information.
Low-level
spatial
detail
is
essential
for
change
classifications, and that is the main reason behind the choice of this specific type of architecture for
detection and land cover classifications, and that is the main reason behind the choice of this specific
this study.
type of architecture for this study.

2. Simple
representationof
of an
an autoencoder
architecture
with the
addition
of skip connections.
FigureFigure
2. Simple
representation
autoencoder
architecture
with
the addition
of skip connections.
H, W and F represent the height, width, and number of filtered feature maps, respectively. In this
H, W and F represent the height, width, and number of filtered feature maps, respectively. In this study,
study, H and W are both 200 pixels, while F depends on the specific model architecture.
H and W are both 200 pixels, while F depends on the specific model architecture.

While similar in principle and structure, the chosen architectures differ in depth and complexity.

While
similar
principle
and
structure,
theand
chosen
architectures
differ inindepth
and complexity.
Table 2
shows ainsummary
of the
number
of layers
the total number
of parameters
each model
adapting
for this
of the
workings
model are
alsoof
different.
For
Table 2after
shows
a them
summary
ofstudy.
the Some
number
ofinner
layers
and of
theach
total
number
parameters
in each
the U-Netthem
and SharpMask
algorithmsSome
downsample
feature
maps through
a pooling
model example,
after adapting
for this study.
of the the
inner
workings
of each
model are also
operation, whereas the ResUnet architecture downsamples by using a stride of two between
different.
For example, the U-Net and SharpMask algorithms downsample the feature maps through a
convolutional filter windows. Another example is how the models use skip connections in different
poolingways,
operation,
the and
ResUnet
architecture
downsamples
by using a (linking
stride ofthe
two between
where whereas
both U-Net
SharpMask
use xclusively
long connections
downsampling and upsampling sides of the architecture) while ResUnet makes use of long and short
connections (between convolutional blocks).
Table 2. Total number of layers and parameters in each deep learning (DL) architecture used in this
study.

Architecture

Layers

Parameters

Remote Sens. 2020, 12, 901

5 of 19

convolutional filter windows. Another example is how the models use skip connections in different
ways, where both U-Net and SharpMask use exclusively long connections (linking the downsampling
and upsampling sides of the architecture) while ResUnet makes use of long and short connections
(between convolutional blocks).
Table 2. Total number of layers and parameters in each deep learning (DL) architecture used in
this study.

2.3. Data Structure

Architecture

Layers

Parameters

U-Net
SharpMask
ResUnet

69
114
93

1,933,866
221,386
2,068,554

SharpMask
ResUnet

114
93

221,386
2,068,554

The Landsat dataset consisted only of bands 1 through 7, as they share the same spatial resolution
2.3. Data Structure
and contain most of the spectral information. Our initial training data was a bi-temporal cube stacking
Landsat
dataset
of bands
through
they share
spatial
the base The
image and
next
year’sconsisted
image, only
constituting
14 1
bands.
We 7, as
maintained
this the
datasame
structure
for the Formatted: Space A
resolution
containwhere
most of
the pixel
spectral
information.
Ourand
initial
training
data was
bi-temporal
RF and
MLP and
algorithms,
each
is an
observation,
each
band is
variable.
The datasets
cube
the base
and algorithms
next year’s image,
constituting
bands. Weofmaintained
data
had to
be stacking
restructured
forimage
the DL
due to
the inner14
workings
the CNNsthis
and
due to
structure for the RF and MLP algorithms, where each pixel is an observation, and each band is a
hardware memory constraints. To build and train the models in this study, we used the Keras [83]
variable. The datasets had to be restructured for the DL algorithms due to the inner workings of the
python library, a high-level wrapper for the well-known Tensorflow library [84]. When working with
CNNs and due to hardware memory constraints. To build and train the models in this study, we used
three-dimensional
Keras
acceptswrapper
inputs for
in the
form of a four-dimensional
array with
the Keras [8379]image
pythondata,
library,
a high-level
the well-known
Tensorflow library [8084].
shapeWhen
(samples,
sample
rows,
sample
columns,
channels).
To
convert
our
images
to
the
correct
format,
working with three-dimensional image data, Keras accepts inputs in the form of a fourwe extracted
patches
through
200 × 200
pixel
windows
a 10-pixel
on To
eachconvert
side our
(Figure 3).
dimensional
array with
shape
(samples,
sample
rows,with
sample
columns,overlap
channels).
correcta total
format,ofwe
extracted
patches
through
200 × 200
pixel with
windows
with
10-pixel
This images
processto the
generated
844
samples
per site
per time
sequence,
a total
ofa3376
training
overlap
on
each
side
(Figure
3).
This
process
generated
a
total
of
844
samples
per
site
per
time
samples and 1688 test samples.
sequence, with a total of 3376 training samples and 1688 test samples.

Figure
3. Example
the patch
patch extraction
method
to prepare
the datasets
for the deep
learning
Figure
3. Example
ofofthe
extraction
method
to prepare
the datasets
for the
deep(DL)
learning
algorithms.
(DL) algorithms.

Ground
Truth
2.4. 2.4.
Ground
Truth

To create
ground
truth
masks,we
weused
used the
the Brazilian
of of
Space
Research’s
Project
for for
To create
our our
ground
truth
masks,
BrazilianInstitute
Institute
Space
Research’s
Project
Deforestation
Mapping
(INPE’s
PRODES)
data
(available
Deforestation Mapping (INPE’s PRODES) data [7] for the years of 2018 and 2019 as a visualatguide Formatted: Highligh
http://www.dpi.inpe.br/prodesdigital/dadosn/)[7] for the years of 2018 and 2019 as a visual guide
and then refined it by remapping the deforestation polygons on a smaller scale. PRODES data are
and then refined it by remapping the deforestation polygons on a smaller scale. PRODES data are
commonly
usedused
for deforestation
reports
and studies
havehave
usedused
it before
whenwhen
modeling
and studying
commonly
for deforestation
reports
and studies
it before
modeling
and
studying deforestation dynamics [851,826]. The changes were mapped using digitizing tools from the
QGIS software [837] at 1:30,000 scale and subsequently transformed into binary raster files with 0 and
1 as absence–presence codes, respectively. In this process, we mapped changes exclusively to the
natural forest, regardless of the land cover type in the following year (Figure 4).

Remote Sens. 2020, 12, 901

6 of 19

deforestation dynamics [85,86]. The changes were mapped using digitizing tools from the QGIS
software [87] at 1:30,000 scale and subsequently transformed into binary raster files with 0 and 1 as
absence–presence codes, respectively. In this process, we mapped changes exclusively to the natural
forest, regardless of the land cover type in the following year (Figure 4).

Figure 4. Example of the change mapping in three locations between (a) 2017 and (b) 2018 and the

Figure 4. Example of the change mapping in three locations between (a) 2017 and (b) 2018 and the
respective (c) rasterized deforestation mask.
respective (c) rasterized deforestation mask.

2.5. Hyperparameters

2.5. Hyperparameters

The RF model only needed two hyperparameters set, the number of trees to build (ntree) and

The
RF model
only needed
twosampled
hyperparameters
set,
the number
of trees
build
the number
of variables
randomly
as candidates
at each
split (mtry).
Thesetowere
set(ntree)
to 500 and
the number
of
variables
randomly
sampled
as
candidates
at
each
split
(mtry).
These
were
set3-to 500
trees, and three variables, respectively. The structure of the MLP algorithm consisted of a simple
trees,layer
and three
variables,
respectively.
The
structure
the
algorithm
consisted
simple
network
containing an input
layer, a
hidden
layer of
with
256MLP
nodes, and
an output
layer. of
TheaDL
algorithms
MLP shared
hyperparameters
training.
Focal loss
[848] was
used
as the
3-layer
networkand
containing
an the
inputsame
layer, a hidden
layerfor
with
256 nodes,
and an
output
layer.
The DL
loss function
as it shared
excels inthe
classification
problems with an
number
observations
eachas the
algorithms
and MLP
same hyperparameters
foruneven
training.
Focalofloss
[88] was in
used
class,
as
is
the
case
of
our
object
of
study.
For
gradient
descent
optimization,
we
used
the
adaptive
loss function as it excels in classification problems with an uneven number of observations in each
(ADAM) algorithm [895] with incorporated Nesterov Momentum (NADAM)
class,moment
as is theestimation
case of our
object of study. For gradient descent optimization, we used the adaptive
with a learning rate of 2e-3, of 0.9 and of 0.999. The number of epochs was set to 250 and the
moment estimation (ADAM) algorithm [89] with incorporated Nesterov Momentum (NADAM) with a
batch size to 16 to fit the training process into memory.
learning rate of 2e-3, β1 of 0.9 and β2 of 0.999. The number of epochs was set to 250 and the batch size
to 16 2.6.
to fit
the training
process into memory.
Modeling
Approach
Given
the context of our main methodological steps described in the previous sections, a top2.6. Modeling
Approach

down view of our modeling approach is described in Figure 5. In addition to the DL algorithms, two

Given
the
context
of ourandom
main forest
methodological
described
in the
previous
sections,
a top-down
classical
ML
algorithms,
(RF) and asteps
simple
multilayer
perceptron
(MLP)
architecture,
were
as a reference
point for
the in
assessment
DL to
models.
Both models
have
view of
ourused
modeling
approach is
described
Figure 5.ofInthe
addition
the DL
algorithms,
twobeen
classical
extensively
researched
for
land
cover
classification,
and
change
detection
in
remote
sensing
data
with
ML algorithms, random forest (RF) and a simple multilayer perceptron (MLP) architecture, were used
their performance
well
documented
[9086,9187].
as a reference
point foristhe
assessment
of the
DL models. Both models have been extensively researched
for land cover classification, and change detection in remote sensing data with their performance is
well documented [90,91].

Remote Sens. 2020, 12, 901

7 of 19

Figure 5. Flowchart of the modeling approach taken in this study.
Figure 5. Flowchart of the modeling approach taken in this study.

2.7.Accuracy
AccuracyAssessment
Assessment
2.7.
Theaccuracy
accuracymetrics
metrics were
were calculated
calculated using
The
using the
the test
testsite
sitedata
dataexclusively
exclusivelytotoavoid
avoidthe
thepossibility
possibility
biased results
results due
TheThe
classification
results
werewere
compared
to the to
ground
mask
ofofbiased
duetotooverfitting.
overfitting.
classification
results
compared
the truth
ground
truth
for
the
test
site
in
order
to
calculate
the
accuracy
measures.
Given
that
deforestation
related
change
mask for the test site in order to calculate the accuracy measures. Given that deforestation related
is typically
a rare aphenomenon,
the change–no-change
ratio isratio
highly
imbalanced
[9288,8993].
change
is typically
rare phenomenon,
the change–no-change
is highly
imbalanced
[92,93].
Therefore,
change
detection
research
usually
shows
a
predominance
of
invariant
areas,
causing
Therefore, change detection research usually shows a predominance of invariant areas, causinga bias
a bias
in
some
accuracy
metrics.
For
example,
overall
accuracy
is
relatively
high
on
most
change
maps
in some accuracy metrics. For example, overall accuracy is relatively high on most change maps [94].
[9094].
The Precision
and measures
Recall measures
(Equations
(1) (2))
and were
(2)) were
to offer
more
insight
The
Precision
and Recall
(Equations
(1) and
usedused
to offer
more
insight
in in
the
the distribution of errors in the classifications, along with three other measures besides accuracy: F1
distribution of errors in the classifications, along with three other measures besides accuracy: F1 score
score (also known as Dice coefficient), Kappa index, and mean intersection over union (mIoU)
(also known as Dice coefficient), Kappa index, and mean intersection over union (mIoU) measure
measure (Equations (3)–(5), respectively). These measures are often used to evaluate DL and ML
(Equations (3)–(5), respectively). These measures are often used to evaluate DL and ML classifications
classifications and are better suited for classifications with imbalanced datasets than overall accuracy
and are better suited for classifications with imbalanced datasets than overall accuracy as they equally
as they equally weight class distributions.
weight class distributions.
=

True Positives
+
True Positives + False Positives

(1)

True Positives
+
True Positives + False Negatives
×
1=2×
Precision × Recall
+
F1 = 2 ×
Precision + Recall
−
=
1−

(2)

Precision =
=

(1)

Recall =

(2)
(3)
(4)

(3)

Remote Sens. 2020, 12, 901

8 of 19

Kappa =

po − pe
1 − pe

(4)

where po is the rate of agreement between the ground truth and the classification, and pe is the expected
rate of agreement due to chance.
mIoU =

IoU1 + IoU2 · · · + IoUn
n

(5)

where IoU is the area of intersection divided by the area of union between the classification and ground
truth for a class and n is the total number of classes. Finally, we used McNemar’s test [95] to evaluate
the statistical significance of differences between the classifications.
3. Results
Quantitatively, the DL models showed a clear advantage over RF and MLP (Table 3). The ResUnet
model had the best results with regard to every measure with the exception of Precision in the
2017–2018 time frame. The SharpMask and U-Net models showed similar but slightly inferior results.
In comparison, the RF model showed the worst results in most measures, although the performance
measures still indicated a good classification. It should be noted that the RF and MLP classifications
exhibited a considerable amount of impulse noise (“salt-and-pepper” type), and a majority filter was
applied to reduce the noise and improve the classification both visually and quantitatively. The DL
models did not require any post-processing steps as they produced classifications with virtually no
noise. All models showed very high overall accuracy, but, as explained previously, this measure should
be carefully considered as the ratio between the change and no-change classes is highly imbalanced
and is mostly explained by the larger, no-change class. McNemar’s test results indicate that despite
the seemingly similar results, the model classifications were all significantly different from each other
(Table 4).
Table 3. Performance measures for the model validation results for the 2017–2018 and 2018–2019
sequences. Best results in the column in bold text.
2017–2018

2017–2019

Model
RF
MLP
Resunet
Unet
Sharpmask

F1

Kappa

mIoU

Precision

Recall

Overall
Accuracy

F1

Kappa

mIoU

Precision

Recall

Overall
Accuracy

0.8014
0.8926
0.9432
0.9112
0.9223

0.8003
0.8920
0.9428
0.9106
0.9218

0.8332
0.9024
0.9459
0.9179
0.9274

0.9414
0.9282
0.9252
0.9223
0.9173

0.6976
0.8597
0.9619
0.9003
0.9274

0.9979
0.9987
0.9993
0.9989
0.9990

0.8902
0.9101
0.9465
0.9339
0.9337

0.8892
0.9093
0.9460
0.9332
0.9331

0.9000
0.9167
0.9487
0.9373
0.9372

0.8877
0.9314
0.9358
0.9175
0.9218

0.8928
0.8898
0.9574
0.9508
0.9460

0.9979
0.9983
0.9990
0.9987
0.9987

Table 4. McNemar’s test p-values between model classifications. Values bellow p = 0.05 indicate the
differences between classifications are statistically significant.
2017–2018

MLP
ResUnet
RF
SharpMask
U-Net

MLP

ResUnet

<0.001
<0.001
<0.001
<0.001

<0.001
<0.001
<0.001

RF

<0.001
<0.001

2018–2019
SharpMask U-Net

<0.001

MLP

ResUnet

RF

<0.001
<0.001
<0.001
<0.001

<0.001
<0.001
<0.001

<0.001
<0.001

SharpMask U-Net

<0.001

RF’s higher precision in the 2017–2018 frame can be explained by the low number of false positives
produced. Conversely, however, it produced a very high number of false negatives within the same
frame (Figure 6). The ResUnet model had the lowest number of misclassified pixels in both time
sequences. It also produced the least number of false negatives out of all the models. When looking
at the number of false-positive cases, the DL algorithms did not show a large difference over the ML
models. With regard to false-negatives, however, they showed a clear advantage. The reduction

k

1
1
1
1
<0.00
<0.00
<0.00
<0.00
<0.001
<0.001
U-Net
<0.001
<0.001
1
1
1
1
RF’s higher precision in the 2017–2018 frame can be explained by the low number of false
positives produced. Conversely, however, it produced a very high number of false negatives within
Remote
2020,
12, 901
theSens.
same
frame
(Figure 106). The ResUnet model had the lowest number of misclassified pixels in 9 of 19
both time sequences. It also produced the least number of false negatives out of all the models. When
looking at the number of false-positive cases, the DL algorithms did not show a large difference over
of the ML
false-negative
classifications
is afalse-negatives,
considerable however,
advantage
of the
DL amodels
the The
classic ML
models. With
regard to
they
showed
clear over
advantage.
reduction of
false-negative
classificationsthe
is a
considerable
advantageisofathe
models over
the than
algorithms,
given that
underestimating
extent
of deforestation
lessDL
desirable
outcome
classic
ML
algorithms,
given
that
underestimating
the
extent
of
deforestation
is
a
less
desirable
its overestimation.
outcome than its overestimation.

Figure
6. Error
distributions
in the
(a) 2017–2018
(b) 2018–2019
time
sequences
in total
pixel
Figure
6. Error
distributions
in the
(a) 2017–2018
andand
(b) 2018–2019
time
sequences
in total
pixel
numbers.
numbers.

The models detected roughly the same deforestation sites at the validation site across both time
The models detected roughly the same deforestation sites at the validation site across both time
sequences (Figures 7 and 8). However, the DL models provided more detailed classifications within
sequences (Figures 76 and 78). However, the DL models provided more detailed classifications within
smaller scales, particularly around feature edges. Moreover, all models were able to classify “easy”
smaller scales, particularly around feature edges. Moreover, all models were able to classify “easy”
deforestation
patches
spectral
mixtures
(Figure
9), but
the classification
of the ML
deforestation
patcheswith
withless
less complex
complex spectral
mixtures
(Figure
98), but
the classification
of the ML
algorithms
degraded
as
the
spectral
signatures
within
the
patches
increased
in
complexity
(Figure
10).
algorithms degraded as the spectral signatures within the patches increased in complexity (Figure
RF 109).
showed
highera higher
tendency
to
produce
false-negatives
both
visually
RF a
showed
tendency
to
produce
false-negatives
both
visuallyand
andquantitatively.
quantitatively.
The total deforested area was slightly higher than the ground truth in the SharpMask and
ResUnet predictions in both time sequences (Table 5). The opposite was true for the MLP prediction,
which slightly underestimated the total area in both time spans. The RF model underestimated the
total deforested area by a very large portion (almost 40 km2 or a 26% decrease in area) in the 2017–2018
sequence due to a large number of false negative predictions, but despite this, it came closest to the
ground truth area in the 2018–2019 sequence, although, that does not necessarily mean the predicted
areas were the same as the ground truth.
Table 5. Total deforested area according to the ground truth and each model’s prediction.
Reference
Ground Truth
Random Forest
MultiLayer
Perceptron
SharpMask
U-Net
ResUnet

Deforested Area (km2 )

Difference from Ground Truth (%)

2017–2018

2018–2019

2017–2018

2018–2019

152.73
113.17

233.44
234.79

—
−25.90

—
+0.58

141.45

223.01

−7.39

-4.47

154.40
149.10
158.78

239.56
241.90
238.84

+1.10
−2.38
+3.96

+2.62
+3.62
+2.31

Processing times varied from model to model, but the MLP and DL models offered faster training
and prediction times than RF, mainly due to the fact that the Tensorflow framework uses the computer’s
graphical processing unit (GPU) for parallel processing instead of the central processing unit (CPU),
which is traditionally used for ML. Using an NVIDIA GTX 1070 GPU and a batch size of 16, the total
training time ranged from approximately 40 minutes for the simpler MLP model (around 10 seconds
per epoch) to almost three hours for the more complex ResUnet model (approximately 40 seconds
per epoch). Given the size of the datasets, RF took approximately six hours to train using parallel

Remote Sens. 2020, 12, 901

10 of 19

processing with an Intel Core i5-4690k processor. The difference in processing times was particularly
considerable when using the models to classify the images after training. The DL models and MLP
classified the test scene within seconds, whereas RF took almost an hour to complete the task.

Figure 7. Deforestation masks according to the (a) ground truth and classifications produced by the

Figure(b)
7. random
Deforestation
masks
accordingperceptron
to the (a) (MLP),
ground(d)
truth
and classifications
produced
by the
forest (RF),
(c) multilayer
SharpMask,
(e) U-Net, and
(f) ResUnet
(b) random
forest
(RF),
(c)
multilayer
perceptron
(MLP),
(d)
SharpMask,
(e)
U-Net,
and
(f)
ResUnet
models in the 2017–2018 sequence.
models in the 2017–2018 sequence.

Remote Sens. 2020, 12, 901

11 of 19

Figure 8. Deforestation masks according to the (a) ground truth and classifications produced by the
Figure 8. Deforestation masks according to the (a) ground truth and classifications produced by the (b)
(b) RF, (c) MLP, (d) SharpMask, (e) U-Net, and (f) ResUnet models in the 2018–2019 sequence.
RF, (c) MLP, (d) SharpMask, (e) U-Net, and (f) ResUnet models in the 2018–2019 sequence.

Remote Sens. 2020, 12, 901

Figure 9. First example location within the test site with the (a) ground truth and classifications made

12 of 19

Figure 9. First example location within the test site with the (a) ground truth and classifications made
by the (b) RF, (c) MLP, (d) SharpMask, (e) U-Net, and (f) ResUnet models in each time sequence.
by the (b) RF, (c) MLP, (d) SharpMask, (e) U-Net, and (f) ResUnet models in each time sequence.

Remote Sens. 2020, 12, 901

13 of 19

Figure 10. Second example location within the test site with the (a) ground truth and classifications

Figure 10. Second example location within the test site with the (a) ground truth and classifications
made by the (b) RF, (c) MLP, (d) SharpMask, (e) U-Net, and (f) ResUnet models in each time sequence.
made by the (b) RF, (c) MLP, (d) SharpMask, (e) U-Net, and (f) ResUnet models in each time sequence.
The yellow rectangle highlights an example of a “hard-to-classify” deforestation patch.
The yellow rectangle highlights an example of a “hard-to-classify” deforestation patch.

The total deforested area was slightly higher than the ground truth in the SharpMask and
ResUnet predictions in both time sequences (Table 5). The opposite was true for the MLP prediction,
which
slightly
underestimated
time
spans. The
RF model
underestimated
The CNN
architectures
usedthe
in total
this area
studyin both
showed
a clear
advantage
to the classic
ML the
algorithms,
deforested area
by a
very large
portion (almost
40 km2 or a
26% decrease
in area)
2017– study
bothtotal
quantitatively
and
visually,
regarding
deforestation
mapping.
Similarly,
a in the
comparative
2018 sequence
due to aby
large
of falsemapping
negative predictions,
despite
this, itmethods
came closest
to
of methods
developed
[96]number
for wetland
found thatbut
deep
learning
(completely
the ground truth area in the 2018–2019 sequence, although, that does not necessarily mean the
convolutional networks and patch-based deep CNN) obtained better accuracy than RF and support
predicted areas were the same as the ground truth.

4. Discussion

vector machine. The authors found that CNN may produce inferior performance when the training
sample size is
small,
but it
tends to
show
substantially
higher
accuracy
thanprediction.
conventional classifiers
Table
5. Total
deforested
area
according to
the ground
truth and
each model’s
using a larger training sample size. We assume that the difference in performance between the DL and
traditional ML methods stems from the former’s capability to understand both the spatial and spectral
context, whereas the regular ML models inherently only see the spectral information.

Remote Sens. 2020, 12, 901

14 of 19

Although the current methodologies to detect deforestation with DL architectures vary widely,
studies are in agreement that they produce excellent classification results [97–99]. Other analogous
studies that have investigated the use of DL for single class classifications seem to corroborate with this
trend, although there is a large variation between the choice of targets and architectures [34,100–102].
While choice and development of architectures for certain targets is a relevant topic for future research,
we have found that autoencoder networks with residual connections seem to be a good starting
point for classifications in remote sensing imagery as they can take advantage of spatial and spectral
information in a very efficient manner.
Despite their advantages, DL algorithms are still not as accessible or as easy to use as classic ML
models. Besides needing specific hardware for training, they require a relatively large quantity of
samples, and developing ground truth masks for specific targets can be challenging and time-consuming
in large extents as both spatial and spectral context are strictly needed, whereas the traditional ML
algorithms work with simpler sampling schemes and can produce reasonably good results with a much
smaller sample size. Therefore, the process of building a model for broader use (i.e., country-wide
monitoring) can be complicated. However, these models have another advantage in the fact that
they can be incrementally trained, meaning they could be gradually provided with new samples to
update the model weights and improve their classifications with time. With that said, the “black box”
nature of these networks can make them undesirable for those who might wish to know and disclose
their internal workings such as public and governmental entities. Despite that, through our findings,
we believe that with enough development, DL algorithms can provide a viable automatic solution for
mapping deforestation in the Amazon alongside projects such as INPE’s PRODES and TerraClass.
It should be noted that while the models showed good capability for generalization within our
region of study, we cannot assert that they would achieve the same results in different areas where
deforestation is a common occurrence. A broader reaching model would necessarily require samples
from different regions to account for the possible spatial and spectral variability from one region to
another. Further research should be carried out to study the applicability of the models for similar
targets in different areas. In addition, while Landsat data are enough for annual deforestation mapping
between dry seasons, more frequent monitoring is virtually impossible as clouds are present above the
forest canopy during most of the year, and the ground reflectance cannot reach the satellite’s optical
sensors. One solution would be the use of radar data to be able to cross the cloud cover. As such,
we also recommend the investigation of the use of radar data and DL algorithms to detect deforestation
within a shorter time-frame.
5. Conclusions
In this study, we proposed the use of existing DL architectures to detect yearly changes in the
vegetation cover in the region of the Brazilian Amazon, successfully achieving our goal. Results show
that these algorithms are a viable alternative to classical ML algorithms, with the improvement of all
performance measures and clear advantages such as faster prediction times and lack of noise in the
classifications. The SharpMask, U-Net, and ResUnet models showed similar results. However, ResUnet
achieved the best values of accuracy, Kappa, F1, and mIoU, and the least amount of errors overall.
Visually, the DL algorithms also produced classification masks with well-defined deforestation patches,
while the ML models showed an evident loss of quality in harder to classify patches, with a tendency
to produce false-negatives and impulse noise that needed to be filtered. One of the main shortcomings
of CNNs seems to be the necessity of a 1:1 ground truth regarding the extent of the area of study
as the spatial context is critical. In contrast, simpler ML models can be trained on a point-by-point
basis (e.g., random sampling points within the extent). Developing a whole ground truth can be an
extensive process. However, we have achieved very good results with a relatively small sample size
with very little augmentation in the form of overlapping sample patches. The additional bands in
remote sensing data may facilitate the detection of targets with less samples, but that supposition
needs further research. Furthermore, considering the models were validated by being applied to

Remote Sens. 2020, 12, 901

15 of 19

an independent dataset, the performance measures show that they have very good potential for
generalization. DL is still a growing technology, particularly in the remote sensing field as not even
popular libraries such as Keras and Tensorflow have built-in tools for dealing with multi-band satellite
imagery, but researchers are slowly adapting and developing better architectures specific for remote
sensing data. The architectures used in this study performed well in our specific task, although they
were developed for entirely different targets. Therefore, these algorithms do not necessarily need to be
tailored for specific cases and can even work interchangeably between fields of research.
Author Contributions: Conceptualization, P.P.d.B. and O.A.d.C.J.; Methodology, P.P.d.B. and O.A.d.C.J.; Validation
and writing the original draft, P.P.d.B.; Formal analysis, R.F.G. and R.A.T.G; Writing, review, editing, and supervision
O.A.d.C.J., R.F.G. and R.A.T.G. All authors have read and agreed to the published version of the manuscript.
Funding: This research was funded by the following institutions: National Council for Scientific and Technological
Development (434838/2018-7), Coordination for the Improvement of Higher Education Personnel and the Union
Heritage Secretariat of the Ministry of Economy.
Acknowledgments: We are grateful for the suggestions and the formal evaluations of the anonymous reviewers,
which allowed an improvement of the manuscript.
Conflicts of Interest: The authors declare no conflict of interest.

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

Le Quéré, C.; Andrew, R.M.; Friedlingstein, P.; Sitch, S.; Hauck, J.; Pongratz, J.; Pickers, P.A.; Korsbakken, J.I.;
Peters, G.P.; Canadell, J.G.; et al. Global carbon budget 2018. Earth Syst. Sci. Data 2018, 10, 2141–2194.
[CrossRef]
Aragão, L.E.O.C.; Poulter, B.; Barlow, J.B.; Anderson, L.O.; Malhi, Y.; Saatchi, S.; Phillips, O.L.; Gloor, E.
Environmental change and the carbon balance of Amazonian forests: Environmental change in Amazonia.
Biol. Rev. 2014, 89, 913–931. [CrossRef] [PubMed]
Rosa, I.M.D.; Smith, M.J.; Wearn, O.R.; Purves, D.; Ewers, R.M. The environmental legacy of modern tropical
deforestation. Curr. Biol. 2016, 26, 2161–2166. [CrossRef] [PubMed]
Vedovato, L.B.; Fonseca, M.G.; Arai, E.; Anderson, L.O.; Aragão, L.E.O.C. The extent of 2014 forest
fragmentation in the Brazilian Amazon. Reg. Environ. Chang. 2016, 16, 2485–2490. [CrossRef]
Spracklen, D.V.; Garcia-Carreras, L. The impact of Amazonian deforestation on Amazon basin rainfall:
Amazonian deforestation and rainfall. Geophys. Res. Lett. 2015, 42, 9546–9552. [CrossRef]
Boisier, J.P.; Ciais, P.; Ducharne, A.; Guimberteau, M. Projected strengthening of Amazonian dry season by
constrained climate model simulations. Nat. Clim. Chang. 2015, 5, 656–660. [CrossRef]
INPE Projeto PRODES: Monitoramento da Floresta Amazônica Brasileira por satélite. Available online:
http://www.obt.inpe.br/OBT/assuntos/programas/amazonia/prodes (accessed on 7 October 2019).
INPE Projeto TerraClass. Available online: http://www.inpe.br/cra/projetos_pesquisas/dados_terraclass.php
(accessed on 7 October 2019).
Pearson, T.R.H.; Brown, S.; Murray, L.; Sidman, G. Greenhouse gas emissions from tropical forest degradation:
An underestimated source. Carbon Balance Manag. 2017, 12, 3. [CrossRef]
Singh, A. Review article digital change detection techniques using remotely-sensed data. Int. J. Remote Sens.
1989, 10, 989–1003. [CrossRef]
Guo, E.; Fu, X.; Zhu, J.; Deng, M.; Liu, Y.; Zhu, Q.; Li, H. Learning to Measure Change: Fully Convolutional
Siamese Metric Networks for Scene Change Detection. arXiv 2018, arXiv:1810.09111.
Coppin, P.; Jonckheere, I.; Nackaerts, K.; Muys, B.; Lambin, E. Digital change detection methods in ecosystem
monitoring: A review. Int. J. Remote Sens. 2004, 25, 1565–1596. [CrossRef]
Lu, D.; Mausel, P.; Brondízio, E.; Moran, E. Change detection techniques. Int. J. Remote Sens. 2004, 25,
2365–2401. [CrossRef]
Radke, R.J.; Andra, S.; Al-Kofahi, O.; Roysam, B. Image change detection algorithms: A systematic survey.
IEEE Trans. Image Process. 2005, 14, 294–307. [CrossRef] [PubMed]
Warner, T.; Almutairi, A.; Lee, J.Y. Remote sensing of land cover change. In The SAGE Handbook of Remote
Sensing; Warner, T.A., Nellis, D.M., Foody, G.M., Eds.; SAGE Publications: London, UK, 2009; pp. 459–472.

Remote Sens. 2020, 12, 901

16.

17.
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

16 of 19

Hecheltjen, A.; Thonfeld, F.; Menz, G. Recent Advances in Remote Sensing Change Detection—A Review.
In Land Use and Land Cover Mapping in Europe; Manakos, I., Braun, M., Eds.; Springer: Dordrecht,
The Netherlands, 2014; Volume 18, pp. 145–178.
Zhu, Z. Change detection using landsat time series: A review of frequencies, preprocessing, algorithms,
and applications. ISPRS J. Photogramm. Remote Sens. 2017, 130, 370–384. [CrossRef]
Tewkesbury, A.P.; Comber, A.J.; Tate, N.J.; Lamb, A.; Fisher, P.F. A critical synthesis of remotely sensed optical
image change detection techniques. Remote Sens. Environ. 2015, 160, 1–14. [CrossRef]
Ghosh, S.; Roy, M.; Ghosh, A. Semi-supervised change detection using modified self-organizing feature map
neural network. Appl. Soft Comput. 2014, 15, 1–20. [CrossRef]
Schneider, A. Monitoring land cover change in urban and peri-urban areas using dense time stacks of Landsat
satellite data and a data mining approach. Remote Sens. Environ. 2012, 124, 689–704. [CrossRef]
Zhang, L.; Zhang, L.; Du, B. Deep learning for remote sensing data: A technical tutorial on the state of the
art. IEEE Geosci. Remote Sens. Mag. 2016, 4, 22–40. [CrossRef]
Ma, L.; Liu, Y.; Zhang, X.; Ye, Y.; Yin, G.; Johnson, B.A. Deep learning in remote sensing applications:
A meta-analysis and review. ISPRS J. Photogramm. Remote Sens. 2019, 152, 166–177. [CrossRef]
Hughes, L.; Schmitt, M.; Zhu, X. Mining hard negative samples for SAR-optical image matching using
generative adversarial networks. Remote Sens. 2018, 10, 1552. [CrossRef]
Ma, W.; Zhang, J.; Wu, Y.; Jiao, L.; Zhu, H.; Zhao, W. A Novel Two-Step Registration Method for Remote
Sensing Images Based on Deep and Local Features. IEEE Trans. Geosci. Remote Sens. 2019, 57, 4834–4843.
[CrossRef]
Merkle, N.; Auer, S.; Müller, R.; Reinartz, P. Exploring the potential of conditional adversarial networks
for optical and SAR image matching. IEEE J. Sel. Top. Appl. Earth Obs. Remote Sens. 2018, 11, 1811–1820.
[CrossRef]
Wang, S.; Quan, D.; Liang, X.; Ning, M.; Guo, Y.; Jiao, L. A deep learning framework for remote sensing
image registration. ISPRS J. Photogramm. Remote Sens. 2018, 145, 148–164. [CrossRef]
Carranza-García, M.; García-Gutiérrez, J.; Riquelme, J. A Framework for Evaluating Land Use and Land
Cover Classification Using Convolutional Neural Networks. Remote Sens. 2019, 11, 274. [CrossRef]
Kussul, N.; Lavreniuk, M.; Skakun, S.; Shelestov, A. Deep Learning Classification of Land Cover and Crop
Types Using Remote Sensing Data. IEEE Geosci. Remote Sens. Lett. 2017, 14, 778–782. [CrossRef]
Li, M.; Wang, L.; Wang, J.; Li, X.; She, J. Comparison of land use classification based on convolutional neural
network. J. Appl. Remote Sens. 2020, 14, 1. [CrossRef]
Scott, G.J.; England, M.R.; Starms, W.A.; Marcum, R.A.; Davis, C.H. Training Deep Convolutional Neural
Networks for Land–Cover Classification of High-Resolution Imagery. IEEE Geosci. Remote Sens. Lett. 2017,
14, 549–553. [CrossRef]
Chen, F.; Ren, R.; Van de Voorde, T.; Xu, W.; Zhou, G.; Zhou, Y. Fast Automatic Airport Detection in Remote
Sensing Images Using Convolutional Neural Networks. Remote Sens. 2018, 10, 443. [CrossRef]
Kang, M.; Ji, K.; Leng, X.; Lin, Z. Contextual Region-Based Convolutional Neural Network with Multilayer
Fusion for SAR Ship Detection. Remote Sens. 2017, 9, 860. [CrossRef]
Qian, X.; Lin, S.; Cheng, G.; Yao, X.; Ren, H.; Wang, W. Object Detection in Remote Sensing Images Based on
Improved Bounding Box Regression and Multi-Level Features Fusion. Remote Sens. 2020, 12, 143. [CrossRef]
Yu, L.; Wang, Z.; Tian, S.; Ye, F.; Ding, J.; Kong, J. Convolutional Neural Networks for Water Body Extraction
from Landsat Imagery. Int. J. Comput. Intell. Syst. 2017, 16, 1750001. [CrossRef]
Liu, X.; Liu, Q.; Wang, Y. Remote sensing image fusion based on two-stream fusion network. Inf. Fusion
2020, 55, 1–15. [CrossRef]
Liu, Y.; Chen, X.; Wang, Z.; Wang, Z.J.; Ward, R.K.; Wang, X. Deep learning for pixel-level image fusion:
Recent advances and future prospects. Inf. Fusion 2018, 42, 158–173. [CrossRef]
Scarpa, G.; Vitale, S.; Cozzolino, D. Target-Adaptive CNN-Based Pansharpening. IEEE Trans. Geosci. Remote
Sens. 2018, 56, 1–15. [CrossRef]
Yuan, Q.; Wei, Y.; Meng, X.; Shen, H.; Zhang, L. A Multiscale and Multidepth Convolutional Neural Network
for Remote Sensing Imagery Pan-Sharpening. IEEE J. Sel. Top. Appl. Earth Obs. Remote Sens. 2018, 11,
978–989. [CrossRef]
Kemker, R.; Salvaggio, C.; Kanan, C. Algorithms for semantic segmentation of multispectral remote sensing
imagery using deep learning. ISPRS J. Photogramm. Remote Sens. 2018, 145, 60–77. [CrossRef]

Remote Sens. 2020, 12, 901

40.

41.
42.
43.
44.
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

17 of 19

Malambo, L.; Popescu, S.; Ku, N.-W.; Rooney, W.; Zhou, T.; Moore, S. A Deep Learning Semantic
Segmentation-Based Approach for Field-Level Sorghum Panicle Counting. Remote Sens. 2019, 11, 2939.
[CrossRef]
Xiao, X.; Zhou, Z.; Wang, B.; Li, L.; Miao, L. Ship Detection under Complex Backgrounds Based on Accurate
Rotated Anchor Boxes from Paired Semantic Segmentation. Remote Sens. 2019, 11, 2506. [CrossRef]
Zhuo, X.; Fraundorfer, F.; Kurz, F.; Reinartz, P. Optimization of openstreetmap building footprints based on
semantic information of oblique UAV images. Remote Sens. 2018, 10, 624. [CrossRef]
Xing, H.; Meng, Y.; Wang, Z.; Fan, K.; Hou, D. Exploring geo-tagged photos for land cover validation with
deep learning. ISPRS J. Photogramm. Remote Sens. 2018, 141, 237–251. [CrossRef]
Khan, S.H.; He, X.; Porikli, F.; Bennamoun, M. Forest change detection in incomplete satellite images with
deep neural networks. IEEE Trans. Geosci. Remote Sens. 2017, 55, 5407–5423. [CrossRef]
Mou, L.; Bruzzone, L.; Zhu, X.X. Learning Spectral-Spatial-Temporal Features via a Recurrent Convolutional
Neural Network for Change Detection in Multispectral Imagery. IEEE Trans. Geosci. Remote Sens. 2018, 57,
924–935. [CrossRef]
Ajami, A.; Ku er, M.; Persello, C.; Pfeffer, K. Identifying a slums’ degree of deprivation from VHR images
using convolutional neural networks. Remote Sens. 2019, 11, 1282. [CrossRef]
Cao, G.; Li, Y.; Liu, Y.; Shang, Y. Automatic change detection in high-resolution remote-sensing images
by means of level set evolution and support vector machine classification. Int. J. Remote Sens. 2014, 35,
6255–6270. [CrossRef]
Mboga, N.; Persello, C.; Bergado, J.R.; Stein, A. Detection of informal settlements from VHR images using
convolutional neural networks. Remote Sens. 2017, 9, 1106. [CrossRef]
Liu, R.; Kuffer, M.; Persello, C. The Temporal Dynamics of Slums Employing a CNN-Based Change Detection
Approach. Remote Sens. 2019, 11, 2844. [CrossRef]
Cao, C.; Dragićević, S.; Li, S. Land-use change detection with convolutional neural network methods.
Environments 2019, 6, 25. [CrossRef]
Zhang, X.; Shi, W.; Lv, Z.; Peng, F. Land cover change detection from high-resolution remote sensing imagery
using multitemporal deep feature collaborative learning and a semi-supervised chan–vese model. Remote
Sens. 2019, 11, 2787. [CrossRef]
Zhang, C.; Sargent, I.; Pan, X.; Li, H.; Gardiner, A.; Hare, J.; Atkinson, P.M. An object-based convolutional
neural network (OCNN) for urban land use classification. Remote Sens. Environ. 2018, 216, 57–70. [CrossRef]
Liu, Y.; Wu, L. Geological disaster recognition on optical remote sensing images using deep learning. Procedia
Comput. Sci. 2016, 91, 566–575. [CrossRef]
Peng, D.; Zhang, Y.; Guan, H. End-to-End Change Detection for High Resolution Satellite Images Using
Improved UNet++. Remote Sens. 2019, 11, 1382. [CrossRef]
Hou, B.; Wang, Y.; Liu, Q. Change Detection Based on Deep Features and Low Rank. IEEE Geosci. Remote
Sens. Lett. 2017, 14, 2418–2422. [CrossRef]
Niu, X.; Gong, M.; Zhan, T.; Yang, Y. A Conditional Adversarial Network for Change Detection in
Heterogeneous Images. IEEE Geosci. Remote Sens. Lett. 2019, 16, 45–49. [CrossRef]
Zhang, M.; Xu, G.; Chen, K.; Yan, M.; Sun, X. Triplet-Based Semantic Relation Learning for Aerial Remote
Sensing Image Change Detection. IEEE Geosci. Remote Sens. Lett. 2019, 16, 266–270. [CrossRef]
Gong, M.; Zhan, T.; Zhang, P.; Miao, Q. Superpixel-based difference representation learning for change
detection in multispectral remote sensing images. IEEE Trans. Geosci. Remote Sens. 2017, 55, 2658–2673.
[CrossRef]
Ma, W.; Xiong, Y.; Wu, Y.; Yang, H.; Zhang, X.; Jiao, L. Change Detection in Remote Sensing Images Based on
Image Mapping and a Deep Capsule Network. Remote Sens. 2019, 11, 626. [CrossRef]
Wang, Q.; Yuan, Z.; Du, Q.; Li, X. GETNET: A General End-to-End 2-D CNN Framework for Hyper- spectral
Image Change Detection. IEEE Trans. Geosci. Remote Sens. 2018, 57, 3–13. [CrossRef]
Zhang, W.; Lu, X. The Spectral-Spatial Joint Learning for Change Detection in Multispectral Imagery.
Remote Sens. 2019, 11, 240. [CrossRef]
Lebedev, M.; Vizilter, Y.V.; Vygolov, O.; Knyaz, V.; Rubis, A.Y. Change detection in remote sensing images
using conditional adversarial networks. Int. Arch. Photogramm. Remote Sens. Spat. Inf. Sci. 2018, 42, 565–571.
[CrossRef]

Remote Sens. 2020, 12, 901

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

18 of 19

Lei, T.; Zhang, Y.; Lv, Z.; Li, S.; Liu, S.; Nandi, A.K. Landslide Inventory Mapping from Bi-temporal Images
Using Deep Convolutional Neural Networks. IEEE Geosci. Remote Sens. Lett. 2019, 16, 982–986. [CrossRef]
Daudt, R.C.; Le Saux, B.; Boulch, A.; Gousseau, Y. High Resolution Semantic Change Detection. arXiv 2018,
arXiv:1810.08452v1.
Arima, E.Y.; Walker, R.T.; Perz, S.; Souza, C. Explaining the fragmentation in the Brazilian Amazonian forest.
J. Land Use Sci. 2015, 1–21. [CrossRef]
Godar, J.; Tizado, E.J.; Pokorny, B. Who is responsible for deforestation in the Amazon? A spatially explicit
analysis along the Transamazon Highway in Brazil. Forest Ecol. Manag. 2012, 267, 58–73. [CrossRef]
Carrero, G.C.; Fearnside, P.M. Forest clearing dynamics and the expansion of landholdings in Apuí,
a deforestation hotspot on Brazil’s Transamazon Highway. Ecol. Soc. 2011, 16, 26. [CrossRef]
Li, G.; Lu, D.; Moran, E.; Calvi, M.F.; Dutra, L.V.; Batistella, M. Examining deforestation and agropasture
dynamics along the Brazilian TransAmazon Highway using multitemporal Landsat imagery. Gisci. Remote
Sens. 2019, 56, 161–183. [CrossRef]
Soares-Filho, B.; Alencar, A.; Nepstad, D.; Cerqueira, G.; Vera Diaz, M.D.C.; Rivero, S.; Solórzano, L.; Voll, E.
Simulating the response of land-cover changes to road paving and governance along a major Amazon
highway: The Santarem–Cuiaba corridor. Glob. Chang. Biol. 2004, 10, 745–764. [CrossRef]
Müller, H.; Griffiths, P.; Hostert, P. Long-term deforestation dynamics in the Brazilian Amazon—Uncovering
historic frontier development along the Cuiabá–Santarém highway. Int. J. Appl. Earth Obs. 2016, 44, 61–69.
[CrossRef]
Barber, C.P.; Cochrane, M.A.; Souza, C.M., Jr.; Laurance, W.F. Roads, deforestation, and the mitigating effect
of protected areas in the Amazon. Biol. Conserv. 2014, 177, 203–209. [CrossRef]
Fearnside, P.M. Highway construction as a force in destruction of the Amazon forest. In Handbook of Road
Ecology; van der Ree, R., Smith, D.J., Grilo, C., Eds.; John Wiley & Sons Publishers: Oxford, UK, 2015;
pp. 414–424.
Alves, D.S. Space-time dynamics of deforestation in Brazilian Amazônia. Int. J. Remote Sens. 2002, 23,
2903–2908. [CrossRef]
Arima, E.; Walker, R.T.; Perz, S.G.; Caldas, M. Loggers and forest fragmentation: Behavioral models of road
building in the Amazon basin. Ann. Assoc. Am. Geogr. 2005, 95, 525–541. [CrossRef]
Arima, E.Y.; Walker, R.T.; Sales, M.; Souza, C., Jr.; Perz, S.G. The fragmentation of space in the Amazon basin:
Emergent road networks. Photogramm. Eng. Remote Sens. 2008, 74, 699–709. [CrossRef]
Asner, G.P.; Broadbent, E.N.; Oliveira, P.J.C.; Keller, M.; Knapp, D.E.; Silva, J.N.M. Condition and fate of
logged forests in the Brazilian Amazon. Proc. Natl. Acad. Sci. USA 2006, 103, 12947–12950. [CrossRef]
[PubMed]
Pfaff, A.; Robalino, J.; Walker, R.; Aldrich, S.; Caldas, M.; Reis, E.; Perz, S.; Bohrer, C.; Arima, E.; Laurance, W.;
et al. Road investments, spatial spillovers, and deforestation in the Brazilian Amazon. J. Reg. Sci. 2007, 47,
109–123. [CrossRef]
USGS. Landsat Collections: Landsat Collection 1. Available online: https://www.usgs.gov/land-resources/
nli/landsat/landsat-collection-1 (accessed on 3 March 2020).
Ronneberger, O.; Fischer, P.; Brox, T. U-Net: Convolutional Networks for Biomedical Image Segmentation.
arXiv 2015, arXiv:1505.04597.
Pinheiro, P.O.; Lin, T.-Y.; Collobert, R.; Dollàr, P. Learning to Refine Object Segments. arXiv 2016,
arXiv:1603.08695.
Zhang, Z.; Liu, Q.; Wang, Y. Road Extraction by Deep Residual U-Net. IEEE Geosci. Remote Sens. Lett. 2018,
15, 749–753. [CrossRef]
Wei, S.; Zhang, H.; Wang, C.; Wang, Y.; Xu, L. Multi-Temporal SAR Data Large-Scale Crop Mapping Based
on U-Net Model. Remote Sens. 2019, 11, 68. [CrossRef]
Chollet, F. Keras. 2015. Available online: https://github.com/fchollet/keras (accessed on 3 March 2020).
Abadi, M.; Agarwal, A.; Barham, P.; Brevdo, E.; Chen, Z.; Citro, C.; Corrado, G.S.; Davis, A.; Dean, J.;
Devin, M.; et al. TensorFlow: Large-Scale Machine Learning on Heterogeneous Systems. arXiv 2016,
arXiv:1603.04467.
Shimabukuro, Y.E.; Arai, E.; Duarte, V.; Jorge, A.; Santos, E.G.; Gasparini, K.A.C.; Dutra, A.C. Monitoring
deforestation and forest degradation using multi-temporal fraction images derived from Landsat sensor
data in the Brazilian Amazon. Int. J. Remote Sens. 2019, 40, 5475–5496. [CrossRef]

Remote Sens. 2020, 12, 901

19 of 19

86.

Cabral, A.I.R.; Saito, C.; Pereira, H.; Laques, A.E. Deforestation pattern dynamics in protected areas of the
Brazilian Legal Amazon using remote sensing data. Appl. Geogr. 2018, 100, 101–115. [CrossRef]
87. Quantum GIS Geographic Information System. Open Source Geospatial Foundation Project. Available
online: http://www.qgis.org/it/site/ (accessed on 1 January 2020).
88. Lin, T.-Y.; Goyal, P.; Girshick, R.; He, K.; Dollar, P. Focal Loss for Dense Object Detection. In Proceedings
of the 2017 IEEE International Conference on Computer Vision (ICCV), Venice, Italy, 22–29 October 2017;
pp. 2999–3007.
89. Kingma, D.P.; Ba, J. Adam: A Method for Stochastic Optimization. arXiv 2014, arXiv:1412.6980.
90. Belgiu, M.; Drăguţ, L. Random forest in remote sensing: A review of applications and future directions.
ISPRS J. Photogramm. Remote Sens. 2016, 114, 24–31. [CrossRef]
91. Mahmon, N.A.; Ya’acob, N. A review on classification of satellite image using Artificial Neural Network
(ANN). In Proceedings of the 2014 IEEE 5th Control and System Graduate Research Colloquium, Shah Alam,
Malaysia, 11–12 August 2014; pp. 153–157.
92. Stehman, S.V. Sampling designs for accuracy assessment of land cover. Int. J. Remote Sens. 2009, 30, 5243–5272.
[CrossRef]
93. Foody, G.M. Status of land cover classification accuracy assessment. Remote Sens. Environ. 2002, 80, 185–201.
[CrossRef]
94. Stehman, S. Comparing estimators of gross change derived from complete coverage mapping versus
statistical sampling of remotely sensed data. Remote Sens. Environ. 2005, 96, 466–474. [CrossRef]
95. McNemar, Q. Note on the sampling error of the difference between correlated proportions or percentages.
Psychometrika 1947, 12, 153–157. [CrossRef]
96. Liu, T.; Abd-Elrahman, A.; Morton, J.; Wilhelm, V.L. Comparing fully convolutional networks, random
forest, support vector machine, and patch-based deep convolutional neural networks for object-based
wetland mapping using images from small unmanned aircraft system. Gisci. Remote Sens. 2018, 55, 243–264.
[CrossRef]
97. Rakshit, S.; Debnath, S.; Mondal, D. Identifying Land Patterns from Satellite Imagery in Amazon Rainforest
using Deep Learning. arXiv 2018, arXiv:1809.00340.
98. Helber, P.; Bischke, B.; Dengel, A.; Borth, D. EuroSAT: A Novel Dataset and Deep Learning Benchmark for
Land Use and Land Cover Classification. arXiv 2019, arXiv:1709.00029. [CrossRef]
99. Ortega, M.X.; Bermudez, J.D.; Happ, P.N.; Gomes, A.; Feitosa, R.Q. Evaluation of Deep Learning Techniques
for Deforestation Detection the Amazon Forest. ISPRS Ann. Photogramm. Remote Sens. Spatial Inf. Sci. 2019,
IV-2/W7, 121–128. [CrossRef]
100. Liu, C.-C.; Zhang, Y.-C.; Chen, P.-Y.; Lai, C.-C.; Chen, Y.-H.; Cheng, J.-H.; Ko, M.-H. Clouds Classification
from Sentinel-2 Imagery with Deep Residual Learning and Semantic Image Segmentation. Remote Sens. 2019,
11, 119. [CrossRef]
101. Li, L.; Liang, J.; Weng, M.; Zhu, H. A Multiple-Feature Reuse Network to Extract Buildings from Remote
Sensing Imagery. Remote Sens. 2018, 10, 1350. [CrossRef]
102. Ghorbanzadeh, O.; Blaschke, T.; Gholamnia, K.; Meena, S.; Tiede, D.; Aryal, J. Evaluation of Different Machine
Learning Methods and Deep-Learning Convolutional Neural Networks for Landslide Detection. Remote Sens.
2019, 11, 196. [CrossRef]
© 2020 by the authors. Licensee MDPI, Basel, Switzerland. This article is an open access
article distributed under the terms and conditions of the Creative Commons Attribution
(CC BY) license (http://creativecommons.org/licenses/by/4.0/).


```

---

## Referencia BibTeX

```bibtex
@article{debemChangeDetectionDeforestation2020,
  title = {Change {{Detection}} of {{Deforestation}} in the {{Brazilian Amazon Using Landsat Data}} and {{Convolutional Neural Networks}}},
  author = {De Bem, Pablo and De Carvalho Junior, Osmar and Fontes Guimar{\~a}es, Renato and Trancoso Gomes, Roberto},
  year = 2020,
  month = mar,
  journal = {Remote Sensing},
  volume = {12},
  number = {6},
  pages = {901},
  issn = {2072-4292},
  doi = {10.3390/rs12060901},
  urldate = {2026-07-10},
  abstract = {Mapping deforestation is an essential step in the process of managing tropical rainforests. It lets us understand and monitor both legal and illegal deforestation and its implications, which include the effect deforestation may have on climate change through greenhouse gas emissions. Given that there is ample room for improvements when it comes to mapping deforestation using satellite imagery, in this study, we aimed to test and evaluate the use of algorithms belonging to the growing field of deep learning (DL), particularly convolutional neural networks (CNNs), to this end. Although studies have been using DL algorithms for a variety of remote sensing tasks for the past few years, they are still relatively unexplored for deforestation mapping. We attempted to map the deforestation between images approximately one year apart, specifically between 2017 and 2018 and between 2018 and 2019. Three CNN architectures that are available in the literature---SharpMask, U-Net, and ResUnet---were used to classify the change between years and were then compared to two classic machine learning (ML) algorithms---random forest (RF) and multilayer perceptron (MLP)---as points of reference. After validation, we found that the DL models were better in most performance metrics including the Kappa index, F1 score, and mean intersection over union (mIoU) measure, while the ResUnet model achieved the best overall results with a value of 0.94 in all three measures in both time sequences. Visually, the DL models also provided classifications with better defined deforestation patches and did not need any sort of post-processing to remove noise, unlike the ML models, which needed some noise removal to improve results.},
  langid = {english},
  file = {/home/fernando/Zotero/storage/4MSDGKSL/De Bem et al. - 2020 - Change Detection of Deforestation in the Brazilian Amazon Using Landsat Data and Convolutional Neura.pdf}
}
```
