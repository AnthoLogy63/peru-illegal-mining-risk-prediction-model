# Mapping Mining Areas in the Brazilian Amazon Using MSI/Sentinel-2 Imagery (2017)

**BibTeX Key:** `loboMappingMiningAreas2018`  
**Authors:** Lobo, Felipe De Lucia and {Souza-Filho}, Pedro Walfir M. and Novo, Evlyn M{\'a}rcia Le{\~a}o De Moraes and Carlos, Felipe Menino and Barbosa, Claudio Clemente Faria  

---

## Abstract

Although mining plays an important role for the economy of the Amazon, little is known about its attributes such as area, type, scale, and current status as well as socio/environmental impacts. Therefore, we first propose a low time-consuming and high detection accuracy method for mapping the current mining areas within 13 regions of the Brazilian Amazon using Sentinel-2 images. Then, integrating the maps in a GIS (Geography Information System) environment, mining attributes for each region were further assessed with the aid of the DNPM (National Department for Mineral Production) database. Detection of the mining area was conducted in five main steps. (a) MSI (MultiSpectral Instrument)/Sentinel-2A (S2A) image selection; (b) definition of land-use classes and training samples; (c) supervised classification; (d) vector editing for quality control; and (e) validation with high-resolution RapidEye images (Kappa = 0.70). Mining areas derived from validated S2A classification totals 1084.7 km2 in the regions analyzed. Small-scale mining comprises up to 64\% of total mining area detected comprises mostly gold (617.8 km2), followed by tin mining (73.0 km2). The remaining 36\% is comprised by industrial mining such as iron (47.8), copper (55.5) and manganese (8.9 km2) in Caraj\'as, bauxite in Trombetas (78.4) and Rio Capim (48.5 km2). Given recent events of mining impacts, the large extension of mining areas detected raises a concern regarding its socio-environmental impacts for the Amazonian ecosystems and for local communities.

---

## Resumen / Notas (Tuyo)

*(Escribe aquí tus notas)*

---

## Texto Completo del Artículo (Extraído del PDF)

```text
remote sensing
Letter

Mapping Mining Areas in the Brazilian Amazon
Using MSI/Sentinel-2 Imagery (2017)
Felipe de Lucia Lobo 1,2, * ID , Pedro Walfir M. Souza-Filho 1,3 ID ,
Evlyn Márcia Leão de Moraes Novo 2 ID , Felipe Menino Carlos 4 and
Claudio Clemente Faria Barbosa 4
1
2
3
4

*

Instituto Tecnológico Vale, Rua Boaventura da Silva, 955, Belém, PA 66055-090, Brazil;
pedro.martins.souza@itv.org
Remote Sensing Division, National Institute for Space Research (INPE), Av. dos Astronautas 1758,
São José dos Campos, SP 12227-010, Brazil; evlyn.novo@inpe.br
Geosciences Institute, Universidade Federal do Pará, Rua Augusto Correa 1, Belém, PA 66075-110, Brazil
Image Processing Division, National Institute for Space Research (INPE), Av. dos Astronautas 1758,
São José dos Campos, SP 12227-010, Brazil; felipe.carlos@fatec.sp.gov.br (F.M.C.);
claudio.barbosa@inpe.br (C.C.F.B.)
Correspondence: felipe.lobo@inpe.br; Tel.: +55-12-3208-6810

Received: 27 June 2018; Accepted: 20 July 2018; Published: 25 July 2018




Abstract: Although mining plays an important role for the economy of the Amazon, little is known
about its attributes such as area, type, scale, and current status as well as socio/environmental
impacts. Therefore, we first propose a low time-consuming and high detection accuracy method for
mapping the current mining areas within 13 regions of the Brazilian Amazon using Sentinel-2 images.
Then, integrating the maps in a GIS (Geography Information System) environment, mining attributes
for each region were further assessed with the aid of the DNPM (National Department for Mineral
Production) database. Detection of the mining area was conducted in five main steps. (a) MSI
(MultiSpectral Instrument)/Sentinel-2A (S2A) image selection; (b) definition of land-use classes and
training samples; (c) supervised classification; (d) vector editing for quality control; and (e) validation
with high-resolution RapidEye images (Kappa = 0.70). Mining areas derived from validated S2A
classification totals 1084.7 km2 in the regions analyzed. Small-scale mining comprises up to 64% of
total mining area detected comprises mostly gold (617.8 km2 ), followed by tin mining (73.0 km2 ).
The remaining 36% is comprised by industrial mining such as iron (47.8), copper (55.5) and manganese
(8.9 km2 ) in Carajás, bauxite in Trombetas (78.4) and Rio Capim (48.5 km2 ). Given recent events
of mining impacts, the large extension of mining areas detected raises a concern regarding its
socio-environmental impacts for the Amazonian ecosystems and for local communities.
Keywords: small-scale mining; industrial mining; google engine; image classification; land-use
cover change

1. Introduction
Brazil is one of the leading countries in mineral production, 40% of which comes from the
Amazonian states [1] generating large financial compensation for local municipalities and states.
At the same time, these activities have profound impacts on the Amazon regional economy, and cause
intense social conflicts [2] and environmental impacts, such as water contamination [3]. For example,
a recent leak of toxic mining debris discharged by a bauxite mining company has contaminated several
communities in Barcarena (Pará State) with high levels of lead, aluminum, sodium, and other toxins
detected in drinking water up to 2 km downstream [3]. Another example regards gold exploitation

Remote Sens. 2018, 10, 1178; doi:10.3390/rs10081178

www.mdpi.com/journal/remotesensing

Remote Sens. 2018, 10, 1178

2 of 14

in the Tapajós River watershed, where water has been contaminated with mercury and impacted by
the siltation process due to discharges of artisanal gold-mining tailings since the 1950s [4]. Moreover,
recent publications have demonstrated the influence of mining project/activities on the Land Use
Cover Change (LUCC) caused by other land-use covers, such as pasture and agribusiness, indicating
its importance to territory expansion as well [5,6].
Although mining has an important role for the economy of the Amazon, little is known about its
attributes such as area, type, scale, status and socio/environmental impacts. One of the reasons for
this absence of information is due the lack of accurate mapping of the mining area [7,8]. This lack is
explained by the nature of the mining activity characterized by a diversity of techniques and scale of
exploitation. Mining in the Amazon ranges from small-scale with rudimentary techniques (water jets
and rafts), more mechanized exploitation with pit loaders and cyanide tanks (in the case of gold
extraction) where miners organized themselves into cooperatives, to large-scale mining characterized
by high mechanization at an industrial scale (ports, pipelines, roads, etc.) [9,10]. This diversity
of techniques and exploitation scale causes different types of land cover, which includes barren
soil, land pits, water bodies, degraded and recovering areas [7]. Moreover, a significant amount of
small-scale mining occurs in small areas (<10,000 m2 ) within forest land which are only detectable
by medium- to high-resolution images (≤20 m). Therefore, both high spectral variability and high
frequency of small-scale mining areas often causes misclassification by image classifiers and interpreters
because the visible features of the mines are similar to many other land cover and land-use changes
such as clearance for agriculture or cattle farms [8]. Another challenge to map mining areas is that
the stream network in which mining takes place can comprise of clear water, but also of highly turbid
water and riverbanks, with spectral signatures similar to those of bare soil [8]. One more aspect
regarding the criteria for including a given land use to the mining class area is that different land
uses such as ports, airstrips, access roads, can be considered to be direct LUCC by mining activities,
and therefore added to the exploitation area [7].
Considering all these difficulties and challenges, maps of mining areas are sporadic. To overcome
that, research efforts have been made to map mining areas around the world using different remote
sensing data and classification methods [11,12]. A recent review article indicates that classification
of mining area is improved when using high-resolution imagery and applies machine learning,
such as Support Vector Machine (SVM), object-oriented or decision tree to classify mining areas.
To detect small-scale mining in Malaysia, for example, some researchers have applied high-resolution
imagery [8] and provided high accuracy (89%) maps using object-oriented/SVM classification to detect
several mining-related land-cover uses. The high accuracy, however, relied on time-consuming image
processing methods. Also, the swath widths of high-resolution images are usually narrow, preventing
their application to large-scale areas. For the Brazilian Amazon, the only mining area estimation
publicly available is based on visual interpretation of Landsat imagery (30 m) and vector editing
(TerraClass Project [13], TC2014). This product, despite the satisfactory location of mining occurrence,
lacks details and is subject to misinterpretation. Moreover, due to the use of a time-demanding method,
it cannot be updated frequently [12].
Given the economic and environmental importance of mining exploitation around the world, and
particularly in the Amazon, the development of rapid and accurate methods for classifying mining
areas is key to understanding the influence of mining activities on the regional environment [7]. In this
context, this research aims to map current active mining areas (open pits) at a large scale (Brazilian
Amazon) and integrate attributes regarding the mining scale and ore exploited. The first objective of
this paper is to map current operational mining areas within the main mining regions of the Brazilian
Amazon using Sentinel-2A images (S2A) applying a low time-consumption mapping method based on
GEE (Google Earth Engine). In the face of a lack of information about the type of mineral exploited and
the scale (industrial or small-scale), the second objective is the integration of data provided by Brazilian
National Department for Mineral Production—DNPM (license status, mineral type among other
information) to the mining map. This integration will be carried out in a GIS (Geographic Information

Remote Sens. 2018, 10, 1178

3 of 14

System) database and will allow computation of the area occupied by each mining category, providing
key information for the environmental management of mining activities.
2. Materials and Methods
2.1. Mining Sites in the Brazilian Amazon
Remote Sens. 2018, 10, x FOR PEER REVIEW

3 of 15

Small-scale and large-scale mining are present within numerous regions in the Brazilian Amazon,
2. Materials and Methods
exploiting several ores such as iron, manganese, bauxite, tin, gold, nickel, and copper. Besides the
2.1. Mining
the Brazilian Amazon
different ore
types,Sites
theintechniques
applied in the exploitation also vary considerably. Industrial
iron mining inSmall-scale
Carajás, and
for example,
appliesare
high-end
technology
throughout
the whole
large-scale mining
present within
numerous
regions in the
Brazilianprocess of
exploiting
ores the
such as
iron,
manganese,
bauxite,
tin, gold,
and copper.
surveying,Amazon,
exploiting,
and several
recovering
area,
resulting
in high
yields
withnickel,
minimum
environmental
Besides the different ore types, the techniques applied in the exploitation also vary considerably.
impacts. On the other hand, small-scale gold mining in the Tapajós River, for example, uses low-end
Industrial iron mining in Carajás, for example, applies high-end technology throughout the whole
technologyprocess
in oreofprocessing
(water jets
dredges)
withresulting
low yields
andyields
highwith
impact
levels on land
surveying, exploiting,
andand
recovering
the area,
in high
minimum
degradation
and
water
contamination
(sediment
and
mercury)
[14–17].
environmental impacts. On the other hand, small-scale gold mining in the Tapajós River, for example,
uses the
low-end
technology
in oreactivities
processing in
(water
and dredges)
with regions
low yieldsfor
andore
high
impact
To cover
variety
of mining
the jets
Amazon,
13 main
exploitation
were
levels on land degradation and water contamination (sediment and mercury) [14–17].
considered for analysis, including both small-scale and large-scale that present specific characteristics
To cover the variety of mining activities in the Amazon, 13 main regions for ore exploitation
in terms ofwere
socio-economic
territorial
aspects
1). The
werethat
selected
based
on literature
considered forand
analysis,
including
both(Figure
small-scale
and areas
large-scale
present
specific
review [10] and
other in terms
databases
Although
areas
in the
Brazilian
Amazon
present relevant
characteristics
of [1,13].
socio-economic
and other
territorial
aspects
(Figure 1).
The areas
were selected
on such
literature
review
[10] of
and other
databases
[1,13]. of the
Although
other areas
in the
Brazilian and gold
mining based
activities,
as the
state
Roraima
and north
Amazon
State
(diamond
Amazon present relevant mining activities, such as the state of Roraima and north of the Amazon
mining), they were not included either due to the lack of cloud-free images or to the mining process,
State (diamond and gold mining), they were not included either due to the lack of cloud-free images
mainly in or
rivers
raftsprocess,
and dredges,
detectable
byhardly
satellite
imagery
[2,18].
to thein
mining
mainly inwhich
rivers inare
raftshardly
and dredges,
which are
detectable
by satellite
Figureimagery
1 shows
the
study
area
location
and
the
38
Sentinel-2A
tiles
used
for
mining
detection. All
[2,18].
Figure
1
shows
the
study
area
location
and
the
38
Sentinel-2A
tiles
used
for
mining
detection.
the images were selected with data range from July to September 2017, with exception of Taboca (AM)
images were selected with data range from July to September 2017, with exception of Taboca
and Serra All
do the
Navio
(AP), due to a lack of a more recent cloud-free images.
(AM) and Serra do Navio (AP), due to a lack of a more recent cloud-free images.

Figure 1. Thirteen mining regions in the Brazilian Amazon evaluated in this study: (1) Tapajós River; (2)

Figure 1. Thirteen
regions
in de
theAzevedo;
Brazilian
Amazon evaluated
in River;
this study:
Tapajós River;
Carajás; (3) mining
Rio Xingu;
(4) Peixoto
(5) Trombetas/Juruti;
(6) Capim
(7) Mina(1)
Taboca;
(2) Carajás;(8)(3) Rio
Xingu;
Peixoto
de (10)
Azevedo;
Trombetas/Juruti;
Capim
Mina Taboca;
Ariquemes;
(9) (4)
Pontes e
Lacerda;
Amanã (5)
River; (11)
Amapá; (12) (6)
Barcarena;
(13) River;
Madeira(7)
River.
Indication
of
38
Sentinel-2A
images
used
for
mapping
mining
areas
and
12
RapidEye
images
used
for
(8) Ariquemes; (9) Pontes e Lacerda; (10) Amanã River; (11) Amapá; (12) Barcarena; (13) Madeira
River.
validation purposes. Federal States within the Amazon region: Acre (AC), Amapá (AP), Amazonas
Indication of 38 Sentinel-2A images used for mapping mining areas and 12 RapidEye images used for
(AM), Maranhão (MA), Mato Grosso (MT), Pará (PA), Rondônia (RO), Roraima (RR), and Tocantins
validation (TO).
purposes. Federal States within the Amazon region: Acre (AC), Amapá (AP), Amazonas (AM),
Maranhão (MA), Mato Grosso (MT), Pará (PA), Rondônia (RO), Roraima (RR), and Tocantins (TO).

Remote Sens. 2018, 10, 1178

4 of 14

Based on a literature review [1,13,18], Table 1 provides more general information about each study
area including type of ore exploited, Federal Units-State, and whether it is a large-scale (industrial) or
small-scale mining (locally called “garimpos”).
Table 1. Information of the mining sites regarding to location, Sentinel-2 tiles and acquisition date,
ore exploited and mining scale. Mining scale varies from small-scale (“garimpos” with rudimentary
techniques), medium (mines with improved techniques, pitloaders, cyanide tanks), industrial scale
(large mining operations with high mechanization which can include ports, pipelines, ore refinery, etc.).
Federal Units: AM—Amazonas, AP—Amapá, MT—Mato Grosso, PA—Pará, RO—Rondônia.
#

Mining Sites

F.U.

Sentinel-2
Granule

Date

RapidEye
Tile_Date

Ore

Mining Scale

1

Tapajós region

PA

T21 MWQ,
MVP, MWP,
MVN, MWN,
MVM, MWM

19 July 2017

2135416_2015-06-07
2136118_2015-07-23
2136712_2015-07-19

Gold

Small-Medium

2

Carajás region

PA

T22MEU,
MFU, MET

13 and 20 July 2017

2235415_2014-07-30
2236318_2015-08-01

Iron, Copper,
Manganese,
Nickel

Industrial

3

Xingu/Rio
Fresco

PA

T22MCU,
MDU, MCT,
MDT, MET,
MDS, MES,
MFS

13 and 20 July 2017

Gold/Tin/Nickel

Small/Industrial

4

Teles
Pires/Peixoto
de Az.

MT

T21LXK, LYK,
LXJ, LYJ

6 July 2017

2134423_2015-07-28

Gold

Small-scale

5

Trombetas/Juruti

PA

T21MWU,
MWT

1 December 2017
29 July 2017

2138317_2015-09-21
2138217_2015-09-21

Bauxite

Industrial

6

Rio Capim

PA

T22MHB,
MHC

20 July 2017

Kaolinite

Industrial/Pipeline

7

Mina Taboca

AM

T20MRE

3 September 2017

Tin

Industrial

8

Ariquemes
region

RO

T20LMQ,
LMP

Tin

Small/Industrial

9

Pontes e
Lacerda

MT

T20LRJ

19 July 2017

Gold

Small/Industrial

10

Amanã

PA/AM

T21MVQ

19 July 2017

Gold

Small

11

Amapá/Serra
do Navio

AP

T22NCF, NCG

18 November 2016

Manganese/Gold

Industrial

12

Barcarena

PA

T22MGD

20 July 2017

2238325_2015-06-28

Bauxite/Kaolinite

Industrial/Port

RO/AM

T20LLR, LLQ,
LKQ

18 and 25 July 2017

2034705_2015-06-24

Gold

Small-scale

13

Rio Madeira

18 and 25 July 2017

2034714_2014-07-28
2034814_2015-07-02

2.2. Classification and Validation of Mining Areas
To address the first objective, the mapping process was conducted in five main steps, three of
which were carried out in the GEE platform and two in ArcGIS (ESRI, Redlands, CA, USA).
In GEE platform:
(a) The first step was to select current (2017) cloud-free images from the Sentinel-2 database
within the study areas (Figure 2a). A selection script was applied based on criteria of date and cloud
percentage (<20%) to identify the 38 Sentinel-2 granules used (see GEE script at https://goo.gl/2S8zSp).
The S2A image database available on GEE and used in this study is in digital number (DN) and not
submitted to atmospheric correction.

Remote Sens. 2018, 10, 1178
Remote Sens. 2018, 10, x FOR PEER REVIEW

5 of 14
5 of 15

Figure 2.
2. Flowchart
Flowchartwith
withexamples
examplesofofsteps
steps
taken
address
objective
1 (a–e)
objective
In
Figure
taken
to to
address
objective
1 (a–e)
and and
objective
2 (f).2In(f).
GEE
GEE
(Google
Earth
Engine):
(a)
Images
selection;
(b)
training
samples;
(c)
supervised
classification
(Google Earth Engine): (a) Images selection; (b) training samples; (c) supervised classification followed
followed
by exportation.
In a Geographical
Information
System—GIS
(d)editing
vector for
editing
for
by
exportation.
In Geographical
Information
System—GIS
software:software:
(d) vector
quality
quality
control,
(e)
validation
of
mining
areas
with
RapidEye
classification.
(f)
Identification
of
control, (e) validation of mining areas with RapidEye classification. (f) Identification of mineral type
mineral
asby
well
as scale by
intersecting
validated
mining
map
with mining
licenses
(National
as
well astype
scale
intersecting
validated
mining
map with
mining
licenses
(National
Department
for
Department
for
Mineral
Production—DNPM)
layer.
Mineral Production—DNPM) layer.

(b) The second step was to define the land-cover classes and select training samples [17]. Initially,
(b) The second step was to define the land-cover classes and select training samples [17]. Initially,
four land-use classes were used as reference for the classification process: dense forest, clear-cut
four land-use classes were used as reference for the classification process: dense forest, clear-cut
deforestation (usually pastures with regular geometry), water bodies and barren soil (open-pit
deforestation (usually pastures with regular geometry), water bodies and barren soil (open-pit mining
mining areas) (Figure 3a). For each study area, at least 10 small-sized polygons (~5 × 5 pixel) were
areas) (Figure 3a). For each study area, at least 10 small-sized polygons (~5 × 5 pixel) were used
used as training samples for each class. Although mining areas can include several land-use cover
as training samples for each class. Although mining areas can include several land-use cover types,
types, the criteria used in this study was to select only currently active areas, i.e., open-pit mining
the criteria used in this study was to select only currently active areas, i.e., open-pit mining areas that
areas that present high albedo levels in comparison to other classes (Figure 3b). The forest class
present high albedo levels in comparison to other classes (Figure 3b). The forest class includes dark
includes dark dense vegetation areas only and for the water class, natural rivers, and lakes,
dense vegetation areas only and for the water class, natural rivers, and lakes, preferentially of low
preferentially of low turbidity, were sampled for training process. Clear-cut contains areas of pasture
turbidity, were sampled for training process. Clear-cut contains areas of pasture with regular shape
with regular shape with little or non-vegetation (Figure 3a). These classes show spectral difference
with little or non-vegetation (Figure 3a). These classes show spectral difference between each other
between each other (Figure 3b). For example, band 4 shows values up to 400 (DN) for water and
(Figure 3b). For example, band 4 shows values up to 400 (DN) for water and forest and increased values
forest and increased values for clear-cut (1500) and mining (2900), whereas band 6 shows low values
for clear-cut (1500) and mining (2900), whereas band 6 shows low values for water (200), intermediate
for water (200), intermediate level for vegetation (1800) and clear-cut (2000) and high values for
level for vegetation (1800) and clear-cut (2000) and high values for mining (3100). The spectral
mining (3100). The spectral difference among the classes observed allowed proceeding with the
difference among the classes observed allowed proceeding with the classification process.
classification process.
(c) The third step was to apply a supervised classification available on GEE to the selected
(c) The third step was to apply a supervised classification available on GEE to the selected images
images (Figure 3c). The classification method used for mining detection was the Classification and
(Figure 3c). The classification method used for mining detection was the Classification and
Regression Trees (CART), a non-parametric classifier that does not require any a priori statistical
Regression Trees (CART), a non-parametric classifier that does not require any a priori statistical
assumptions regarding the distribution of data. Recent research has compared ten machine-learning
assumptions regarding the distribution of data. Recent research has compared ten machine-learning
image classification methods implemented on GEE, such as CART and Random Forest, to map wetlands
image classification methods implemented on GEE, such as CART and Random Forest, to map
in Indonesia [19], and indicated that CART presented the mapping accuracy (96%) demonstrating that
wetlands in Indonesia [19], and indicated that CART presented the mapping accuracy (96%)
CART provides reliable outputs for mapping land-use cover. CART is a pixel-based classifier that uses
demonstrating that CART provides reliable outputs for mapping land-use cover. CART is a pixelthe DN levels from the training samples (polygons) to create a decision tree that classifies each pixel of
based classifier that uses the DN levels from the training samples (polygons) to create a decision tree
the image (20 m). Based on Figure 3c, the bands 3 (550 nm), 4 (665 nm), 6 (740 nm), 8 (1600 nm) and
that classifies each pixel of the image (20 m). Based on Figure 3c, the bands 3 (550 nm), 4 (665 nm), 6
(740 nm), 8 (1600 nm) and 11 (2200 nm) were used by CART to classify S2A imagery into mining,
water, forest, and clear-cut areas. To avoid extensive misclassification with inactive mining areas that

Remote Sens. 2018, 10, 1178

6 of 14

11
(2200
nm)
were
by CART
to classify S2A imagery into mining, water, forest, and clear-cut6areas.
Remote
Sens.
2018,
10, xused
FOR PEER
REVIEW
of 15
To avoid extensive misclassification with inactive mining areas that includes some vegetation mostly
where
small-scale
mining mostly
occurs, the
mining
areas mining
considered
for this
included
only active
includes some
vegetation
where
small-scale
occurs,
theresearch
mining areas
considered
for
mining
areas, i.e.,
barrenonly
soil (active
exploitation
areas)
associated
water bodies.
Therefore,
forand
the
this
research
included
active mining
areas,
i.e.,and
barren
soil (active
exploitation
areas)
following steps,
the Therefore,
mining andfor
water
classes were
taken
into
consideration
removing
associated
wateronly
bodies.
the following
steps,
only
the
mining and by
water
classes forest
were
and
clear-cut classes
frombythe
raster forest
classification
(Figure 3c).
Thefrom
resulting
layer was
exported to
Tiff
taken into
consideration
removing
and clear-cut
classes
the raster
classification
(Figure
file
Google
Drive.
Unfortunately,
thefile
export
option
only Drive.
provides image
exportation
to
3c). type
The into
resulting
layer
was exported
to Tiff
type into
Google
Unfortunately,
the up
export
1option
million
pixels,
hindering
the export
of large
areas
whole
granule
extension).
is
only
provides
image
exportation
up to
1 (such
millionas the
pixels,
hindering
the
export ofThis
largeissue
areas
even
more
relevant
case of
MSI/S2A
imagery
m). To
overcome
issue,case
the of
exportation
(such as
the
whole in the
granule
extension).
This
issue is(10even
more
relevanthis
in the
MSI/S2A
step was (10
conducted
with a spatial
resolution
of 20 m andstep
using
subsets
to areas
ofamining
imagery
m). To overcome
this issue,
the exportation
was
conducted
with
spatialoccurrence
resolution
(Region
ROI). to areas of mining occurrence (Region of Interest, ROI).
of 20
m of
andInterest,
using subsets

Figure
industrial
mining
in in
Itapuã
dodo
Oeste/RO:
(a)
Figure 3.
3. Illustration
Illustrationofofthe
theclassification
classificationprocess
processfor
foranan
industrial
mining
Itapuã
Oeste/RO:
Sample
selection
for
four
classes
used
(Mining
in
red,
water
in
blue,
forest
in
green
and
clear-cut
areas
(a) Sample selection for four classes used (Mining in red, water in blue, forest in green and clear-cut
in
magenta).
(b) Average
and and
standard
deviation
of Sentinel-2A
spectra
forfor
2525pixels
areas
in magenta).
(b) Average
standard
deviation
of Sentinel-2A
spectra
pixelsofofeach
eachclass,
class,
bands
1
(443
nm),
2
(490
nm)
and
10-Cirrus
(1375
nm)
were
omitted
due
to
high
atmospheric
bands 1 (443 nm), 2 (490 nm) and 10-Cirrus (1375 nm) were omitted due to high atmospheric effects.
effects.
(c)
(c) Classification
Classification result
result from
from GEE
GEE based
based on
on CART
CART (Classification
(Classification and
and Regression
Regression Trees),
Trees), only
only mining
mining
areas
in
red
and
water
areas
in
blue
are
shown:
(i)
indicates
commission
areas
within
mining
areas in red and water areas in blue are shown: (i) indicates commission areas within mining class;
class;
and
(ii)
indicates
water
bodies
derived
from
mining
activities
and,
therefore,
integrated
into
mining
and (ii) indicates water bodies derived from mining activities and, therefore, integrated into mining
class.
class. (d)
(d) Final
Final mining
mining area
area map
map after
after vector
vector edition
edition with
with indication
indication of
of Mining
Mining License
License Areas
Areas (dashed
(dashed
rectangles)
used
for
type
of
ore
identification
(see
Table
2
for
details
on
Mining
License).
rectangles) used for type of ore identification (see Table 2 for details on Mining License).
Table
2. Example
DNPM (National
(National
Table 2.
Example of
of information
information related
related to
to the
the Exploitation
Exploitation License
License given
given by
by DNPM
Department
Process
numbers
referrefer
to the
indicated
in Figure
3d. In this
Department for
forMineral
MineralProduction).
Production).
Process
numbers
toareas
the areas
indicated
in Figure
3d.
case,
two
industrial
companied
have
the
license
to
exploit
tin
in
Itapuã
do
Oeste
(RO)
with
485485
ha
In this case, two industrial companied have the license to exploit tin in Itapuã do Oeste (RO) with
each.
ha each.
Process
Area
Year
Status
N.Process N. Year
(ha)Area (ha)
2965 29651965 1965
485
2967

2967

1965

1965

485

Active
485
485

Active

Last

Federal
Munici
Usage
Federal Unit
pality
Municipality
Unit
Itapuã
6 February6 February
Tin Not Not
e
Indústria Indústria
e Comércio
SA
ROItapuã do do
Active
Tin (Sn)
RO
2018
Comércio S A
Oeste
(Sn)informed
informed
2018
Oeste
7 February
Not
Itapuã do
Active
Ltd.a
Tin (Sn)
RO
2018
informed
Oeste Itapuã
Tin
Not
7 February
Ltd.a
RO
do
2018
(Sn)
informed
Oeste
UpdateLast Update
Status

Name

Name

Ore

Ore

Usage

In GIS environment: for data quality control (d), the exported Tiff files, from both S2A and
RapidEye classifications, were then collated in a GIS software and submitted to vector editing at

Remote Sens. 2018, 10, 1178

7 of 14

In GIS environment: for data quality control (d), the exported Tiff files, from both S2A and
RapidEye classifications, were then collated in a GIS software and submitted to vector editing at
1:25,000 scale to eliminate major miss-classification of mining areas. For example, in Figure 3(ci),
areas that were committed into mining class were manually removed from vector layer, whereas
water bodies that are directly derived from mining operation were re-classified into mining class
(Figure 3(cii)). This procedure is dependent on the user’s interpretation to distinguish mining areas
from those of other uses, which can lead to omission and commission errors (in particular small-scale
mining). To support the user’s visual interpretation, several ancillary data were used to minimize
these errors such as such as roads, water bodies, limits of gold-mining districts, mining sites and
protected areas [7]. This information helped to identify whether barren soil is an open-pit (mining
area) or a clear-cut for other land use, for example. Moreover, the capacity of identifying mining areas
is more precise using high spatial resolution imagery. Thus, for validation purposes, 12 RapidEye
images (5 m) available at geocatalogo.mma.gov.br [20] acquired in 2014/2015 were uploaded to GEE
and submitted to the same classification procedure developed for MSI/Sentinel-2 data (Table 1).
New independent training samples were selected for each class using RapidEye bands 2 (560 nm),
3665 nm), 4 (710 nm) and 5 (805 nm) for CART classification. Although the time gap between S2A 2017)
and RapidEye images may introduce commission errors as mining tends to expand from 2015 and
2017, RapidEye is the only high-resolution imagery freely available which can be used for validation.
Other high-resolution images, such as Ikonos and WorldView, are available but under purchase only,
which would make the mapping very expensive due to the wide extent of the study area.
Therefore, as part of the validation step (e), the results of Sentinel-2 classification (20 m) were
compared to the classification derived from RapidEye imagery (5 m), the latter being the reference
map (Figure 2e). Digital classification of RapidEye images were resampled to 20 m and used as ground
truth for the S2A classification via confusion matrix (Kappa Index). To minimize spatial errors due
to georeferencing, all the maps used for validation were projected to UTM (Universal Transverse
Mercator) SAD-1969 Brazil coordinate system.
2.3. Identification of Mineral Type and Mining Scale
To address the second objective, validated mining maps derived from S2A images were subject
to identification of mineral exploited, mining scale (whether is an industrial or small-scale mining)
followed by tabulation of mining area in km2 . To do so, the validated Mining areas map (2017) was
intersected with the territorial mining license layer controlled by Brazilian National Department for
Mineral Production (DNPM) [21], which contains information about the mineral, license status and
the owner (Figure 2f and Table 2). This information along with ancillary data allowed identification of
mineral exploited and scale of mining activities.
3. Results
3.1. Validation of Mining Areas in 2017
In terms of total mining area, even with the time gap of approximately 2 years, both sensors
provided quite similar results when examining individual tiles (Figure 4). In terms of map accuracy,
Figure 4 shows a better agreement in areas of large-scale mining (>0.70) than those of small-scale
mining (<0.70). For example, for Carajás (Figure 4a), characterized by industrial mining activities,
Kappa index was 0.86. However, for Tapajós (Figure 4b), containing extensive small-scale mining,
the index drops to 0.62. It is interesting to note that for industrial regions, mining concentrated in
large areas (presented by few polygons) and in regions dominated by small-scale, a more diffuse
land occupation, usually along the river network, was observed. The overall accuracy is above 98%,
taking into consideration the 12 RapidEye images (see Table 1) with Kappa index of 0.70 (Table 3).

Remote Sens. 2018, 10, 1178

8 of 14

Remote Sens. 2018, 10, x FOR PEER REVIEW

8 of 15

Figure
Evaluation
mining
classification using
RapidEye
classification
mapsmaps
Figure
4. 4.
Evaluation
of of
mining
classification
using S2A
S2Aimages
imageshaving
having
RapidEye
classification
25 km) as ground truth. (a) Carajás region (Industrial), Kappa = 0.86; (b) Tapajós region (Small(25 ×(25
25×km)
as ground truth. (a) Carajás region (Industrial), Kappa = 0.86; (b) Tapajós region
scale), Kappa = 0.62; (c) Trombetas region (Industrial), Kappa = 0.87; and (d) Peixoto de Azevedo/Telez
(Small-scale), Kappa = 0.62; (c) Trombetas region (Industrial), Kappa = 0.87; and (d) Peixoto de
Pires region (Small-scale), Kappa = 0.59. RapidEye RGB (3, 5, 2) composition. S2A RGB (4, 8, 3)
Azevedo/Telez Pires region (Small-scale), Kappa = 0.59. RapidEye RGB (3, 5, 2) composition. S2A RGB
composition.
(4, 8, 3) composition.
Table 3. Confusion matrix of 12 RapidEye tiles and their Sentinel (S2A) equivalent area. Only two

Confusion
matrix of
12 and
RapidEye
their
Sentinel
(S2A)is above
equivalent
area.overall
Only two
Table 3.
classes were
considered,
mining
not tiles
miningand
areas.
Overall
accuracy
98% and
Kappa
Index is
0.70. mining and not mining areas. Overall accuracy is above 98% and overall
classes
were
considered,
Kappa Index is 0.70.
RapidEye—2014/2015
Not
Mining
Total
RapidEye—2014/2015
Not
7138.63
42.46
6637.09
Not
Mining 238.91
Total
S2A-2017 Mining
73.17
165.75
Total
7218.30
7426.54
Not
7138.63 208.20
42.46
6637.09
S2A-2017

Mining

73.17

165.75

238.91

Total

7218.30

208.20

7426.54

Remote Sens. 2018, 10, 1178

9 of 14

Commission error was larger (73.17 km2 ) than omission error (42.46 km2 ) and the total area
detected by both imagery data was 165.75 km2 . The results show that the methodology proposed for
S2A data provided satisfactory results, giving support to the analysis of total mining distribution and
type of mineral exploited.
3.2. Total Mining Area, Type of Mineral and Mining Scale in 2017
As a result of mining areas derived from S2A images previously validated with RapidEye imagery,
a total of 1084.7 km2 were mapped considering the 13 regions analyzed. Table 4 shows the total mining
area per study area including type of mineral exploited.
Table 4. Mining area in km2 mapped with S2A images acquired in 2017 distributed over the study
areas and specified by mineral type. For gold and tin, percentage of small-scale mining is shown
between brackets. Federal Unit (F.U.).
N

Study Area

F.U.

Gold (% SS)

1
2
3
4
5
6
7
8
9
10
11
12
13

Rio Tapajós
Carajás
Rio Xingu
Peixoto de A.
Tromb./Juruti
Rio Capim
Mina Taboca
Ariquemes
Pontes e L.
Amanã
Amapá
Barcarena
Rio Madeira
TOTAL (km2 )

PA
PA
PA
MT
PA
PA
AM
RO
MT
AM
AP
PA
RO

345.8 (100)
24.2 (100)
92.1 (100)
116.7 (100)

Tin (% SS)

Baux.

Iron

Cop.

47.8

55.1
2.6

37.8 (100)
78.4
48.5

Kaol.

Mang. Nickel Sand
8.9

4.2
1.9

Clay

0.7

12.2

48.8 (0)
45.8 (50)
27.7 (50)
27.5 (100)
1.7 (0)

22.1
12.0

1.3 (100)
637.0 (97)

13.5 (100)
146.0 (50)

138.9

2.3
69.8

57.7

14.5

8.9

6.1

4.5

0.6

5.2

0.6

TOTAL (SS%)
345.8 (100)
140.9 (17)
134.4 (97)
116.7 (100)
78.4
60.6
48.8 (0)
45.8 (50)
27.7 (50)
27.5 (100)
23.8 (0)
19.4
14.8 (100)
1084.7 (64)

The total area exploited by gold mining totals 637.0 km2 , which is equivalent to 58.7% of the
mining area in the Amazon Region. Industrial gold mining takes place in Pontes e Lacerda (13.2 km2 )
and Amapá (1.7 km2 ). However, small-scale gold mining is responsible for 97% of the total area
distributed over Tapajós (345.8), Peixoto de A. (116.7), Xingu (92.1), Amanã (27.5), Pontes e Laderda
(13.5), and Madeira (1.3 km2 ). Small-scale also comprises 50% of total tin exploitation, mostly in
Rio Xingu (37.8), Ariquemes (22.9), and Rio Madeira (13.5 km2 ). The remaining 50% of tin mining
areas are related to industrial activities in Taboca (48.8) and Ariquemes (22.8 km2 ). Overall, small-scale
mining, including both gold and tin, comprises 64% of total mining area detected.
For the other minerals in Table 4, only industrial mining exploits them. Industrial bauxite mining,
for example, takes place in Trombetas (78.4 km2 ), Rio Capim (48.5 km2 ) and Barcarena (12.0 km2 ),
totaling 138.9 km2 . Iron mining is present in Carajás (47.8 km2 ) and Amapá (22.1 km2 ), at a total
of 69.8 km2 . Copper is exploited in Carajás (55.1 km2 ) and Xingu (2.6 km2 ). Kaolin is exploited at
Rio Capim (12.2 km2 ) and sent by pipeline to Barcarena (2.3 km2 of infra-structure). Manganese mining
occurs in Carajás only (8.9 km2 ). For nickel, mining is found in Carajás (4.2 km2 ) and Rio Xingu
(1.9 km2 ). Sand exploitation is found in Barcarena (4.5 km2 ) and Carajás (0.7 km2 ), whereas clay
exploitation only occurs in Barcarena (0.6 km2 ). Figure 5a shows the exploited area per different
mining activities.
According to Figure 5, the majority (74%) of the mining areas identified in this study, mostly
small-scale gold mining, is within the State of Pará boundaries. In this state, bauxite is the second most
exploited mineral, followed by copper, iron, tin and others. For Mato Grosso state, only gold mining
was identified, which has 9% out of 144.5 km2 as industrial mining. The remaining area is composed
of small-scale gold mining. In Rondônia and Amazonas states, tin mining is predominant. However,
in Rondônia, tin is exploited equally by small-scale (50%) and industrial mining (50%), whereas in
Amazonas only one industrial mining site (Mina Taboca) was identified. In Amapá, a large-scale
exploitation of iron comprises most of the mining areas (93%).

Remote Sens. 2018, 10, 1178
Remote Sens. 2018, 10, x FOR PEER REVIEW

10 of 14
10 of 15

2) based on mineral types (a): Au—Gold; Fe—Iron; Mn—
Figure 5.
5. Distribution
area
(km
2 ) based on mineral types (a): Au—Gold; Fe—Iron;
Figure
Distributionofofmining
mining
area
(km
Manganese;
Sn—Tin;
Cu—Copper;
Ni—Nickel;
and Federal
Units Units
(b): AM—Amazonas,
AP—
Mn—Manganese; Sn—Tin; Cu—Copper; Ni—Nickel;
and Federal
(b): AM—Amazonas,
Amapá,
MT—Mato
Grosso,
PA—Pará,
RO—Rondônia.
AP—Amapá, MT—Mato Grosso, PA—Pará, RO—Rondônia.

According to Figure 5, the majority (74%) of the mining areas identified in this study, mostly
4. Discussion
small-scale gold mining, is within the State of Pará boundaries. In this state, bauxite is the second
mostMethod
exploited
mineral,Mining
followed
byand
copper,
iron, tin and others. For Mato Grosso state, only gold
4.1.
for Mapping
Areas
Constrains
mining was identified, which has 9% out of 144.5 km2 as industrial mining. The remaining area is
Considering that the only mining area estimation for the Brazilian Amazon currently available
composed of small-scale gold mining. In Rondônia and Amazonas states, tin mining is predominant.
is based on visual interpretation (TC2014), the first contribution of this research was to develop a
However, in Rondônia, tin is exploited equally by small-scale (50%) and industrial mining (50%),
cost-effective method, in terms of time and resources, to map mining areas in the Brazilian Amazon
whereas in Amazonas only one industrial mining site (Mina Taboca) was identified. In Amapá, a
with satisfactory performance. Created in GEE environment, the mapping process allows quick
large-scale exploitation of iron comprises most of the mining areas (93%).
access and selection of S2A images, which usually would take hours for selecting and downloading
S2A
images from the usgs.gov database for example, can be now done in minutes [22]. In addition,
4. Discussion
the classification step is much faster than on stand-alone image processing. For example, in the cloud
(GEE)
a supervised
classification
takesand
a few
seconds, whereas in GIS software it usually takes several
4.1. Method
for Mapping
Mining Areas
Constrains
minutes or hours, depending on the computer configuration. Finally, employing the GEE for the
Considering
thatfrom
the only
mining area
estimation the
for the
Amazon
currently
available
classification
suffers
the limitation
of restricting
sizeBrazilian
of exports
and thus,
preventing
the
is based on of
visual
(TC2014), the first contribution of this research was to develop a
exportation
largeinterpretation
areas in 10 m resolution.
cost-effective
method,
in the
terms
andtoresources,
to mapareas
mining
areas in some
the Brazilian
On the other
hand,
useofoftime
CART
classify mining
presented
issues. Amazon
Because
with
satisfactory
performance.
Created
in
GEE
environment,
the
mapping
process
allows
quick
CART is a pixel-based algorithm, some mining areas where not fully classified, leaving isolated pixels
access
and
selection
of
S2A
images,
which
usually
would
take
hours
for
selecting
and
downloading
within a mining area, for example. One way to minimize it was to apply a low-pass filter in GIS
S2A images from
the usgs.gov
database
for example,
canEven
be now
donea in
minutes
[22]. In
environment.
Another
issue regards
commission
errors.
though
careful
selection
ofaddition,
training
the
classification
step
is
much
faster
than
on
stand-alone
image
processing.
For
example,
in
the
cloud
samples were conducted for four main classes, i.e., mining (open-pits), water (natural water bodies),
(GEE)
a
supervised
classification
takes
a
few
seconds,
whereas
in
GIS
software
it
usually
takes
several
forest (dense dark vegetation) and clear-cut (pasture with regular shape), commission errors were
minutes or hours, depending on the computer configuration. Finally, employing the GEE for the
classification suffers from the limitation of restricting the size of exports and thus, preventing the
exportation of large areas in 10 m resolution.

CART is a pixel-based algorithm, some mining areas where not fully classified, leaving isolated pixels
within a mining area, for example. One way to minimize it was to apply a low-pass filter in GIS
environment. Another issue regards commission errors. Even though a careful selection of training
samples were conducted for four main classes, i.e., mining (open-pits), water (natural water bodies),
Remote
2018,dark
10, 1178
of 14
forestSens.
(dense
vegetation) and clear-cut (pasture with regular shape), commission errors11were
often identified, mostly commissions of barren soil of other land-cover uses, such as pasture (Figure
3c). Given
the high
spectral
variability
of mining
(barren
soil, water,
recovery
areas,(Figure
etc.) [7],
a
often
identified,
mostly
commissions
of barren
soil areas
of other
land-cover
uses, such
as pasture
3c).
refined
evaluation
of
what
areas/polygons
were
or
were
not
mining
areas
was
necessary
based
on
Given the high spectral variability of mining areas (barren soil, water, recovery areas, etc.) [7], a refined
ancillary information
to improve the
maporprecision.
The useareas
of ancillary
data such
as mining
sites,
evaluation
of what areas/polygons
were
were not mining
was necessary
based
on ancillary
mining
license,
information
about
other
land-cover
uses
(such
as
aquaculture,
cattle
regions,
information to improve the map precision. The use of ancillary data such as mining sites, mining
agriculture)
as well as
literature
review wasuses
fundamental
to identify the
main
mining
areas, andas
is
license,
information
about
other land-cover
(such as aquaculture,
cattle
regions,
agriculture)
encouraged
to bereview
used on
for mining
area detection.
Therefore,
a fully
method
well
as literature
wasresearch
fundamental
to identify
the main mining
areas,
and isautomatic
encouraged
to be
that
detects
mining
areas
with
high
precision
is
yet
to
be
developed.
Overall,
the
method
presented
used on research for mining area detection. Therefore, a fully automatic method that detects mining
here shows
a progress
toward
and accurate
method
for mining
detection
inshows
large scale,
such
areas
with high
precision
is yet atoquick
be developed.
Overall,
the method
presented
here
a progress
as
the
Brazilian
Amazon.
toward a quick and accurate method for mining detection in large scale, such as the Brazilian Amazon.
4.2. Validation
Validation of
of Mining
Mining Areas
Areas with
with RapidEye
RapidEye Imagery
Imagery
4.2.
Besides being
being aa quick
quick method
method for
for mapping
mapping mining
mining areas,
areas, the
the accuracy
accuracy between
between mining
mining maps
maps
Besides
derived from
fromS2A
S2Ain in
comparison
RapidEye
confirms
the proposed
method
derived
comparison
to to
thosethose
from from
RapidEye
confirms
that thethat
proposed
method provides
provides
satisfactory
results.
Figure 4,
the is
accuracy
higher among
large-scale
areas
satisfactory
results. As
shownAsinshown
Figurein
4, the
accuracy
higher is
among
large-scale areas
than
for
than
for
small-scale
mining.
The
difference
in
Kappa
index
occurs
because
of
two
reasons:
(1)
the
small-scale mining. The difference in Kappa index occurs because of two reasons: (1) the more
more
concentrated
mining
areas in
industrial
mining
detection
comparison
smallconcentrated
mining
areas in
industrial
mining
allowsallows
easiereasier
detection
in in
comparison
to to
small-scale
scale
where
a
diffuse
distribution
of
small
polygons
is
observed;
(2)
Also,
on
small-scale,
the
LUCC
where a diffuse distribution of small polygons is observed; (2) Also, on small-scale, the LUCC is more
is more dynamic,
expanding
or recovering
quicker
than industrial
Therefore,
in of
thea case
of
dynamic,
expanding
or recovering
quicker than
industrial
activities.activities.
Therefore,
in the case
2-year
a
2-year
the commission
error is
more
likely to occur.
gap,
the gap,
commission
error is more
likely
to occur.
The
mining
detection
improvement
using
is more
evident
when
we
The mining detection improvement usingthe
theproposed
proposedmethods
methods
is more
evident
when
compared
the the
currently
available
mining
classification
we
compared
currently
available
miningareas
areas(TC2014
(TC2014 database)
database) to
to RapidEye
RapidEye classification
(2014/2015)
(2014/2015) used
used as
as ground
ground truth
truth (Figure
(Figure 6).
6).

Figure 6.
6. Comparison of mining areas between current available data (TerraClass 2014),
2014), map
map from
from
Figure
RapidEye (taken
(taken as
as ground
ground truth
truthand
andlimited
limitedto
tovalidation
validationtiles,
tiles,25
25×× 25 km) and Sentinel-2A (mining
RapidEye
maps for
for all
all study
study areas).
areas). In
an
In Carajás
Carajás region (a), accuracy measured by Kappa index shows an
improvementfrom
from0.16
0.16(TC2014)
(TC2014)toto
0.86
(S2A),
due
large
omission
TC2014.
smallimprovement
0.86
(S2A),
due
to ato a
large
omission
errorerror
in in
TC2014.
For For
small-scale
mining in Tapajós (b), Kappa increased from 0.32 to 0.62. S2A classification were able to detect small
polygons, whereas TC2014, due to a coarser classification, lacks detail.

For industrial mining in Carajás, for example, TC2014 detected only 4.81 km2 , resulting in a weak
agreement with RapidEye classification (Kappa = 0.16), whereas S2A classification showed a Kappa
index of 0.86. In the case of small-scale in Tapajós, the total area among all classifications were similar

Remote Sens. 2018, 10, 1178

12 of 14

but the TC22014 classification lacks in detecting very small polygons (Figure 6). The lack of details in
TC2014 maps can be attributed to (1) misclassification during visual interpretation and (2) to a lower
spatial resolution (30 m) of Landsat images used for TC2014 maps, as compared to RapidEye (5 m)
and Sentinel-2 (20 m) used in this study.
4.3. Total Area, Type of Mineral and Scale
The second main contribution of this research is the identification of scale and mineral type for
each mining area mapped. According to Table 4, some minerals such as iron, manganese, copper,
and nickel are exploited by industrial mining only, even though it comprises approximately a third
of the total mining area mapped in this research. Industrial mining in the Brazilian Amazon is
responsible for approximately 14% of total national annual exportation [1]. For some minerals such as
bauxite, copper, kaolin, manganese and tin, Amazonian production totals 90% of national production.
To illustrate its economic importance, the Financial Compensation for Mining Exploitation [1] indicates
that incomes from Amazonian mining exportation yielded, approximately, US$ 531 million in 2016,
of which 96% are related to the state of Pará, mostly from iron, bauxite and copper exploitation,
which corresponds to 90% of total exportation in Pará.
While industrial mining has a significant financial importance and usually follows legal
procedures for mining exploitation and the commitment of recovering degraded areas, several
socio-environment impacts have recently been reported. For example, water contamination by bauxite
exploitation in Barcarena [3], and by nickel exploitation in the Cateté river nearby Xikrin Indigenous
Land [4].
Table 4 also shows that mining areas in the Brazilian Amazon is mostly occupied by small-scale
gold mining, in particular Tapajós, Xingu/Fresco and Peixoto de Azevedo (MT). Including tin mining,
small-scale comprises up to 64% of total mining area detected in this study. According to Enriquez [18],
approximately 150,000 people are directly involved in small-scale mining in the Brazilian Amazon.
This activity creates a large amount of income (~US$ 10 million per month for the regional economy [2])
which is rarely subject to taxes or control because most of the area is informally or illegally installed.
The large extension of small-scale mining raises a concern regarding its socio-environment impacts
for the Amazonian ecosystems and for local people, since it usually does not follow environmental
protocols to recover degraded areas. In fact, recent studies have demonstrated the impact of small-scale
gold mining in the Tapajós River and its tributaries (Crepori, Novo and Tocantinzinho rivers) where
intense water siltation occurs [12,16,17]. The impacts also include geomorphological changes in the
riverbed and landscapes, causing severe impacts on benthic [23] and fish communities [24–27], not to
mention the mercury contamination used in the gold amalgamation process [24,28–30] which is usually
illegally imported [31].
5. Conclusions
This research presents a quick and efficient classification method developed in GEE to map
mining areas in the Brazilian Amazon. The methods rely on quick access to S2A database, supervised
classification of mining and other land-cover uses, exportation to GIS software, followed by vector
editing to assure the product’s quality control. Besides reducing image processing time, the methods
provided accurate maps when compared to classifications derived from high-resolution RapidEye
imagery (overall Kappa equals 0.70).
The main novelty of this research is the identification of scale and mineral type for each mining
area mapped. Based on this identification, we concluded that small-scale mining (gold and tin)
comprises up to 64% of total mining area detected in this study, which raises a concern regarding
its socio-environment impacts for the Amazonian ecosystems and for local people, since it usually
does not follow environmental protocols to recover degraded areas. The remaining 36% of mining
areas in the Brazilian Amazon is comprised of industrial mining, which is responsible for most
iron, manganese, copper, and nickel production. While industrial mining has a significant financial

Remote Sens. 2018, 10, 1178

13 of 14

importance and usually follows legal procedures for mining exploitation and the commitment of
recovering degraded areas, several socio-environment impacts have recently been reported and are
raising a concern regarding its socio-environment impacts.
Given the satisfactory results, the methods presented here will be applied to map deforestation
far beyond operational mining boundaries. Furthermore, we will carry out a historical mapping from
satellite images, such as Landsat, to support further investigation of water quality and on LUCC in
areas under the influence of both industrial and small-scale mining in the Brazilian Amazon.
Author Contributions: F.d.L.L. participated in every step of this article from planning, data processing, analysis,
and writing the manuscript as the first author. P.W.M.S.-F. and E.M.L.d.M.N. were the co-supervisors of this
research and were fundamental to define the research approach and data analysis. F.M.C. developed the GEE
script and C.C.F.B., head of LabISA (The Instrumentation Laboratory for Aquatic Systems) where this research
was conducted, collaborated with the methodological approach.
Funding: This research was funded by Coordenação de Aperfeiçoamento de Pessoal de Nível Superior (CAPES,
Brazil) and Instituto Tecnológico da Vale (ITV, Brazil), Project ‘Uso Sustentável de Recursos Naturais em Regiões
Tropicais’ (15024016001P1), as a Post-PhD Fellowship for F.d.L.L. Trainee Scholarship for F.M.C. funded by CNPq
(Brazilian National Council for Scientific and Technological Development, Process: 135114/2017-9).
Acknowledgments: Research developed in a partnership between the ITV (Instituto Tecnológico da Vale) and
INPE (Instituto Nacional de Pesquisas Espaciais) in Brazil. We would like to thank both reviewers for their
insightful comments, which enabled us to improve the paper. Thanks to Lauren Pansegrouw for English revision.
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

Pinheiro, W.F.; Ferreira Filho, O.B.; Neves, C.A.R. Anuário Mineral Brasileiro: Principais Substâncias Metálicas;
DNPM: Brasília, Brazil, 2016; p. 31.
Fernandes, F.R.C.; Alamino, R.d.C.J.; Araújo, E.R. Recursos Minerais e Comunidade: Impactos Humanos,
Socioambientais e Econômicos; CETEM/MCTI: Rio de Janeiro, Brazil, 2014; Volume 1.
Nathanson, M. Norsk Hydro Accused of Amazon Toxic Spill, Admits ‘Clandestine Pipeline’. Mongabay,
27 February 2018. Available online: https://news.mongabay.com/2018/02/norsk-hydro-accused-ofamazon-toxic-spill-admits-clandestine-pipeline/ (accessed on 5 June 2018).
Hofmeister, N.; Silva, J.C.D. The River is Dead: Is a Mine Polluting the Water of Brazil´s Xikrin Tribe?
Gaurdian. 2018. Available online: https://www.theguardian.com/global-development/2018/may/15/
brazil-xikrin-catete-river-amazon (accessed on 18 May 2018).
Sonter, L.J.; Herrera, D.; Barrett, D.J.; Galford, G.L.; Moran, C.J.; Soares-Filho, B.S. Mining drives extensive
deforestation in the Brazilian Amazon. Nat. Commun. 2017, 8, 1013. [CrossRef] [PubMed]
Sonter, L.J.; Moran, C.J.; Barrett, D.J.; Soares-Filho, B.S. Processes of land use change in mining regions.
J. Clean. Product. 2014, 84, 494–501. [CrossRef]
Chen, W.; Li, X.; He, H.; Wang, L. A review of fine-scale land use and land cover classification in open-pit
mining areas by remote sensing techniques. Remote Sens. 2017, 10, 15. [CrossRef]
Isidro, C.; McIntyre, N.; Lechner, A.; Callow, I. Applicability of earth observation for identifying small-scale
mining footprints in a wet tropical region. Remote Sens. 2017, 9, 945. [CrossRef]
Veiga, M.M.; Hinton, J.J. Abandoned artisanal gold mines In the Brazilian Amazon: A legacy of mercury
pollution. Nat. Res. Forum 2002, 26, 15–26. [CrossRef]
Cuchierato, G. 200 maiores minas brasileiras. Minérios & Minerales, November/December 2016; p. 45.
Garai, D.; Narayana, A.C. Land use/land cover changes in the mining area of Godavari coal fields of
Southern India. Egypt. J. Remote. Sens. Space Sci. 2018. [CrossRef]
Lobo, F.; Costa, M.; Novo, E.; Telmer, K. Distribution of artisanal and small-scale gold mining in The Tapajós
River Basin (Brazilian Amazon) over the past 40 years and relationship with water siltation. Remote Sens.
2016, 8, 579. [CrossRef]
Almeida, C.A.D.; Coutinho, A.C.; Esquerdo, J.C.D.M.; Adami, M.; Venturieri, A.; Diniz, C.G.; Dessay, N.;
Durieux, L.; Gomes, A.R. High spatial resolution land use and land cover mapping of the Brazilian Legal
Amazon in 2008 using landsat-5/tm and modis data. Acta Amazon. 2016, 46, 291–302. [CrossRef]

Remote Sens. 2018, 10, 1178

14.
15.

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

14 of 14

Coelho, M.C.N.; Wanderley, L.J.; Costa, R.C. Small scale gold mining in the xxi century. Examples in the
south-west brazilian amazon. Anuário do Instituto de Geociências-UFRJ. 2016, 39, 5–14. [CrossRef]
Monteiro, M.D.A.; Coelho, M.C.N.; Cota, R.G.; Barbosa, E.J.D.S. Ouro, empresas e garimpeiros na amazônia:
O caso emblemático de Serra Pelada. Revista Pós Ciências Sociais-UFMA (Universidade Federal do Maranhão)
2010, 7, 28.
Lobo, F.; Costa, M.; Novo, E.; Telmer, K. Effects of small-scale gold mining tailings on the underwater light
field in the Tapajós River Basin, Brazilian Amazon. Remote Sens. 2017, 9, 861. [CrossRef]
Lobo, F.L.; Costa, M.P.F.; Novo, E.M. Time-series analysis of Landsat-MSS/TM/OLI images over Amazonian
waters impacted by gold mining activities. Remote Sens. Environ. 2015, 157, 170–184. [CrossRef]
Enríquez, M.A. Mineração na Amazônia. Parcerias Estratégicas. 2014, 19, 155–198.
Farda, N.M. Multi-temporal land use mapping of coastal wetlands area using machine learning in Google
Earth Engine. IOP Conf. Ser. Earth Environ. Sci. 2017, 98, 012042. [CrossRef]
MMA. Geocatalogo Mma-Rapideye Imagery; MMA: Brasília, Brazil, 2018. Available online: http://geocatalogo.
mma.gov.br/index.jsp (accessed on 14 February 2018).
Departamento Nacional de Produção Mineral (DNPM). Sistema De Informações Geográficas Da
Mineração-Sigmine; DNPM: Brasília, Brazil, 2018; Volume 1. Available online: http://sigmine.dnpm.gov.br/
webmap/ (accessed on 20 February 2018).
Parente, L.; Ferreira, L. Assessing the spatial and occupation dynamics of the Brazilian pasturelands based
on the automated classification of MODIS images from 2000 to 2016. Remote Sens. 2018, 10, 606. [CrossRef]
Couceiro, S.R.M.; Hamada, N.; Forsberg, B.R.; Padovesi-Fonseca, C. Trophic structure of macroinvertebrates
in Amazonian streams impacted by anthropogenic siltation. Austral Ecol. 2011, 36, 628–637. [CrossRef]
Nevado, J.J.B.; Martin-Doimeadios, R.C.R.; Bernardo, F.J.G.; Moreno, M.J.; Herculano, A.M.;
do Nascimento, J.L.M.; Crespo-Lopez, M.E. Mercury in the Tapajos River Basin, Brazilian Amazon: A review.
Environ. Int. 2010, 36, 593–608. [CrossRef] [PubMed]
Sampaio da Silva, D.; Lucotte, M.; Paquet, S.; Davidson, R. Influence of ecological factors and of land use
on mercury levels in fish in the Tapajós River Basin, Amazon. Environ. Res. 2009, 109, 432–446. [CrossRef]
[PubMed]
Dorea, J.G.; Barbosa, A.C. Anthropogenic impact of mercury accumulation in fish from the Rio Madeira and
Rio Negro rivers (amazonia). Biol. Trace Element Res. 2007, 115, 243–254. [CrossRef] [PubMed]
Boudou, A.; Maury-Brachet, R.; Coquery, M.; Durrieu, G.; Cossa, D. Synergic effect of gold mining and
damming on mercury contamination in fish. Environ. Sci. Technol. 2005, 39, 2448–2454. [CrossRef] [PubMed]
Rabitto, I.d.S.; Bastos, W.R.; Almeida, R.; Anjos, A.; de Holanda, Í.B.B.; Galvão, R.C.F.; Neto, F.F.;
de Menezes, M.L.; dos Santos, C.A.M.; de Oliveira Ribeiro, C.A. Mercury and ddt exposure risk to fish-eating
human populations in Amazon. Environ. Int. 2011, 37, 56–65. [CrossRef] [PubMed]
Coelho-Souza, S.A.; Guimarães, J.R.D.; Miranda, M.R.; Poirier, H.; Mauro, J.B.N.; Lucotte, M.; Mergler, D.
Mercury and flooding cycles in the Tapajós River Basin, Brazilian Amazon: The role of periphyton of a
floating macrophyte (paspalum repens). Sci. Total Environ. 2011, 409, 2746–2753. [CrossRef] [PubMed]
Telmer, K.; Veiga, M. Chapter 6: World Emissions of Mercury from Artisanal and Small Scale Gold Mining.
In Mercury Fate and Transport in the Global Atmosphere; Pirrone, N., Mason, R., Eds.; Springer Science,
Switzerland AG: Basel, Switzerland, 2009; pp. 131–172.
NSCTV. Operacao faz apreensao de Carga de Mercurio no Porto de Itajai. 2018. Available online:
https://g1.globo.com/sc/santa-catarina/noticia/operacao-faz-apreensao-de-carga-de-mercurio-noporto-de-itajai.ghtml (accessed on 12 June 2018).
© 2018 by the authors. Licensee MDPI, Basel, Switzerland. This article is an open access
article distributed under the terms and conditions of the Creative Commons Attribution
(CC BY) license (http://creativecommons.org/licenses/by/4.0/).


```

---

## Referencia BibTeX

```bibtex
@article{loboMappingMiningAreas2018,
  title = {Mapping {{Mining Areas}} in the {{Brazilian Amazon Using MSI}}/{{Sentinel-2 Imagery}} (2017)},
  author = {Lobo, Felipe De Lucia and {Souza-Filho}, Pedro Walfir M. and Novo, Evlyn M{\'a}rcia Le{\~a}o De Moraes and Carlos, Felipe Menino and Barbosa, Claudio Clemente Faria},
  year = 2018,
  month = jul,
  journal = {Remote Sensing},
  volume = {10},
  number = {8},
  pages = {1178},
  issn = {2072-4292},
  doi = {10.3390/rs10081178},
  urldate = {2026-07-10},
  abstract = {Although mining plays an important role for the economy of the Amazon, little is known about its attributes such as area, type, scale, and current status as well as socio/environmental impacts. Therefore, we first propose a low time-consuming and high detection accuracy method for mapping the current mining areas within 13 regions of the Brazilian Amazon using Sentinel-2 images. Then, integrating the maps in a GIS (Geography Information System) environment, mining attributes for each region were further assessed with the aid of the DNPM (National Department for Mineral Production) database. Detection of the mining area was conducted in five main steps. (a) MSI (MultiSpectral Instrument)/Sentinel-2A (S2A) image selection; (b) definition of land-use classes and training samples; (c) supervised classification; (d) vector editing for quality control; and (e) validation with high-resolution RapidEye images (Kappa = 0.70). Mining areas derived from validated S2A classification totals 1084.7 km2 in the regions analyzed. Small-scale mining comprises up to 64\% of total mining area detected comprises mostly gold (617.8 km2), followed by tin mining (73.0 km2). The remaining 36\% is comprised by industrial mining such as iron (47.8), copper (55.5) and manganese (8.9 km2) in Caraj\'as, bauxite in Trombetas (78.4) and Rio Capim (48.5 km2). Given recent events of mining impacts, the large extension of mining areas detected raises a concern regarding its socio-environmental impacts for the Amazonian ecosystems and for local communities.},
  langid = {english},
  file = {/home/fernando/Zotero/storage/2AXRXFAT/Lobo et al. - 2018 - Mapping Mining Areas in the Brazilian Amazon Using MSISentinel-2 Imagery (2017).pdf}
}
```
