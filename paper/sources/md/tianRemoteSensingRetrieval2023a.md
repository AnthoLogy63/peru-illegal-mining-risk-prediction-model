# Remote Sensing Retrieval of Inland Water Quality Parameters Using Sentinel-2 and Multiple Machine Learning Algorithms

**BibTeX Key:** `tianRemoteSensingRetrieval2023a`  
**Authors:** Tian, Shang and Guo, Hongwei and Xu, Wang and Zhu, Xiaotong and Wang, Bo and Zeng, Qinghuai and Mai, Youquan and Huang, Jinhui Jeanne  

---

## Abstract

Remote sensing has long been an effective method for water quality monitoring because of its advantages such as high coverage and low consumption. For non-optically active parameters, traditional empirical and analytical methods cannot achieve quantitative retrieval. Machine learning has been gradually used for water quality retrieval due to its ability to capture the potential relationship between water quality parameters and satellite images. This study is based on Sentinel-2 images and compared the ability of four machine learning algorithms (eXtreme Gradient Boosting (XGBoost), Support Vector Regression (SVR), Random Forest (RF), and Artificial Neural Network (ANN)) to retrieve chlorophyll-a (Chl-a), dissolved oxygen (DO), and ammonia-nitrogen (NH3-N) for inland reservoirs. The results indicated that XGBoost outperformed the other three algorithms. We used XGBoost to reconstruct the spatial-temporal patterns of Chl-a, DO, and NH3-N for the period of 2018-2020 and further analyzed the interannual, seasonal, and spatial variation characteristics. This study provides an efficient and practical way for optically and non-optically active parameters monitoring and management at the regional scale.

---

## Resumen / Notas (Tuyo)

*(Escribe aquí tus notas)*

---

## Texto Completo del Artículo (Extraído del PDF)

```text
Environmental Science and Pollution Research
https://doi.org/10.1007/s11356-022-23431-9

RESEARCH ARTICLE

Remote sensing retrieval of inland water quality parameters using
Sentinel‑2 and multiple machine learning algorithms
Shang Tian1 · Hongwei Guo1 · Wang Xu2 · Xiaotong Zhu1 · Bo Wang1 · Qinghuai Zeng2 · Youquan Mai2 ·
Jinhui Jeanne Huang1
Received: 9 June 2022 / Accepted: 29 September 2022
© The Author(s), under exclusive licence to Springer-Verlag GmbH Germany, part of Springer Nature 2022

Abstract
Remote sensing has long been an effective method for water quality monitoring because of its advantages such as high coverage and low consumption. For non-optically active parameters, traditional empirical and analytical methods cannot achieve
quantitative retrieval. Machine learning has been gradually used for water quality retrieval due to its ability to capture the
potential relationship between water quality parameters and satellite images. This study is based on Sentinel-2 images and
compared the ability of four machine learning algorithms (eXtreme Gradient Boosting (XGBoost), Support Vector Regression (SVR), Random Forest (RF), and Artificial Neural Network (ANN)) to retrieve chlorophyll-a (Chl-a), dissolved oxygen
(DO), and ammonia-nitrogen ­(NH3-N) for inland reservoirs. The results indicated that XGBoost outperformed the other
three algorithms. We used XGBoost to reconstruct the spatial-temporal patterns of Chl-a, DO, and ­NH3-N for the period of
2018–2020 and further analyzed the interannual, seasonal, and spatial variation characteristics. This study provides an efficient and practical way for optically and non-optically active parameters monitoring and management at the regional scale.
Keywords Remote sensing · Water quality · Machine learning · Non-optically active parameters · Sentinel-2 · Inland waters

Introduction
Inland waters are vital for recreational and industrial needs
such as transport, energy production, and aquaculture, as a
major source of drinking water and irrigation. Not only do
they provide habitat for flora and fauna, but they are also
important in global climate change and the carbon cycle. As
an important part of inland waters, reservoirs have gradually replaced rivers and lakes as the main source of drinking water in China and their water quality safety is closely
related to public health (Alcantara et al. 2017; Fernanda
et al. 2015; Li et al. 2018; Xiao et al. 2016). Traditional
water quality monitoring methods are mainly based on field
Responsible Editor: Xianliang Yi
* Jinhui Jeanne Huang
huangj@nankai.edu.cn
1

College of Environmental Science and Engineering/
Sino‑Canada Joint R&D Centre for Water and Environmental
Safety, Nankai University, Tianjin, China

2

Shenzhen environmental monitoring center station,
Shenzhen, China

sampling, laboratory analysis, or automated instrument.
These methods are labor-intensive, costly, and time-consuming and do not meet the needs of dynamic water quality
monitoring. In addition, the sampling point scale measurements are also considered insufficient to represent the spatial-temporal characteristics of water quality on the entire
water surface (Bierman et al. 2011; Chawla et al. 2020).
Remote sensing technology has emerged as an effective
method for retrieving and mapping inland, coastal waters,
and ocean water quality parameters (WQPs) due to its fullcoverage, low-cost, and micro-dynamic characteristics.
Inland waters are optically complex due to the strong
impact of human activities and therefore require sensors
with high signal-to-noise ratios and high dynamic ranges to
make effective measurements in these highly reflective waters
(Barnes and Hu 2016). The large pixel-size of standard ocean
color sensors (Coastal Zone Color Scanners (CZCS), ocean
observation wide-field sensors (SeaWiFS), Moderate Resolution Imaging Spectroradiometer (MODIS), and Medium
Resolution Imaging Spectrometer (MERIS)) limits their use
to smaller spatial scales (Kaire et al. 2016). Sentinel 2 MultiSpectral Instrument (MSI) has a spatial resolution of 10–60
m and a short revisit period of 5 days. Although originally
Vol.:(0123456789)
1
3

Environmental Science and Pollution Research

designed for terrestrial applications, the MSI offers optimal
opportunity for water quality monitoring of inland waters due
to its sufficient spectral and radiometric properties. Researchers had shown that MSI sensor can not only improve the mapping of water quality parameters in inland waters around the
world, but also enhance environmental policy by better predicting certain water quality indicators (Achmad et al. 2019;
Gitelson 1992; Mouw et al. 2015).
The retrieval methods of optically active parameters using
remote sensing technology can be divided into two types,
i.e., analytical and empirical methods. Empirical methods
focus on establishing the relationship between remote sensing reflectance (Rrs) and WQPs (such as chlorophyll-a (Chla)) based on (i) the baseline subtraction procedure to calculate the main peak heights in the bands that are sensitive to
Chl-a (Matthews et al. 2012; Matthews and Odermatt 2015);
(ii) the clustering spectra to classify the different optical
water types and linked to the concentrations of WQPs; (iii)
the band ratio algorithms (the blue-green band ratio for the
ocean and near-infrared (NIR)-red band ratio for productive
waters) (Gons 1999; O’Reilly et al. 1998). Analytical methods based on the radiative transfer equation to derive inherent optical properties (IOPs) from Rrs and then estimate
Chl-a by the IOPs, such as the Garver-Siegel-Maritorena
(GSM) model applied to the marine and the quasi-analytical
algorithm (QAA) applied to coastal waters (Lee et al. 2002;
Maritorena et al. 2002). These methods are widely and successfully applied in inland and coastal waters and the open
ocean (Liu et al. 2020; Neil et al. 2019).
Chl-a is one of the most relevant parameters in
water quality retrieval because it quantitatively indicates
the state of eutrophication and aids the evaluation of
health risks of aquatic ecosystems (Hunter et al. 2009).
DO is defined as the amount of free and non-compounded
oxygen dissolved in water and is required by almost all
aquatic organisms to survive. As DO levels drop, some
sensitive aquatic animals may leave, decline in health, or
even die. DO is therefore considered an important indicator of water quality and a direct measure of the ability of
aquatic resources to support aquatic life (Breitburg et al.
2018; Chi et al. 2020; Varol 2020). ­NH3-N exists in water
as free ­N H 3 or as ammonia salt (NHA). Ammonia is a
major factor in the poisoning of aquatic organisms and is
also a nutrient in the water, causing eutrophication, and
being a major oxygen-consuming pollutant in the water.
Therefore, the three WQPs Chl-a, DO, and ­N H3-N have
strong correlations and can be used as important indicators to evaluate the water quality status (Dong et al.
2020; Wang et al. 2021).
This paper based on Sentinel-2 images, four machine
learning algorithms are used to establish the best models
of DO, ­NH3-N, and Chl-a to realize the retrieval of water
quality parameters of the study area. Then using the optimal

13

model, we reconstructed the spatial-temporal patterns of
Chl-a, DO, and ­NH3-N in the study area for the period
2018–2020, and further analyzed the interannual, seasonal,
and spatial variation characteristics. It aims to provide good
scientific suggestions and evaluation for the water quality
monitoring and evaluation of the urban water source through
the spatial and temporal distribution of different water quality parameters. This paper seeks to provide some contribution in the remote sensing monitoring of non-optically active
parameters in inland waters.

Data and methods
Study site and WQPs measurements
The study area (Q reservoir) is located in Shenzhen of China,
with a total drainage area of 28.20 ­km2 and a mainstream
length of 2.56 km. It is a large-scale water conservancy project mainly for water supply regulation, storage, and emergency reserve, with flood control, drinking water supply, and
other comprehensive benefits.
We conducted ten times field measurements during the
non-freezing period in 2020 to ensure that we had enough
data to train the machine learning model. Due to the subtropical maritime climate of the study area, frequent rainfall
in summer greatly affects the acquisition and use of satellite
images. So, we have not conducted in-situ measurements
in summer. The specific sampling strategy is as follows:
(i) to reduce errors of water movement, the time window
was controlled to ±1 h, i.e., the overpass time of Sentinel-2
was within ±1 h of the sampling and measurements. (ii) We
extracted a 3 × 3 pixels window to exclude the effect of adjacency effects. (iii) The grid distribution method was used
to evenly distribute 24 sampling points in the head, middle,
and tail areas of the reservoir, as shown in Fig. 1. (iv) The
water samples were collected from the Q reservoir using
brown bottles at less than 0.3 m from the water surface and
were stored in the dark environment at 4 °C for laboratory
experiments. (v) Chl-a and DO measured by Yellow Springs
Instrument (YSI)-EXO2 multi-parameter water quality analyzer and ­NH3-N was determined in the laboratory using
spectrophotometric. Table 1 shows the mean value of three
WQPs.

Imagery acquisition and processing
Sentinel-2 composes of two complementary satellites (Sentinel-2 A/B) launched by European Space Agency (ESA).
The MultiSpectral Instrument (MSI) onboard Sentinel-2
with multiple spectral bands in the visible to short wave
infrared (SWIR) (443–2190 nm) has a short revisit period
of 5-day. Compared to other satellite missions (MODIS,

Environmental Science and Pollution Research

Fig. 1  Locations of study area and positions of sampling sites

SeaWiFS, and Landsat-8/OLI), the MSI has a higher spatial
resolution (10, 20, 60 m) and three special bands of vegetable red edge for monitoring extreme cases such as highly
productive waters. All cloudless Sentinel-2 Level-1C Top
of Atmosphere (TOA) data after geometric precision correction and orthorectification were downloaded from the
ESA Copernicus data center (https://​scihub.​coper​nicus.​eu).
All images have been atmospherically corrected using the
default algorithm (the Dark Spectrum Fitting (DSF)) built
into the ACOLITE software package (https://​github.​com/​
acoli​te, the version of 20210114.0), and we wrote Python
code for batch processing. The Band-2 to Band-8a bands
of the images from 2018 to 2020 are used in this study.

Vanhellemont (2019) and Saberioon et al. (2020) verified
the good performance of ACOLITE in inland waters.

Building machine learning model
Introduction of four machine learning methods
and parameters setting
(i) XGBoost is a lifting ensemble algorithm proposed
by (Chen and Guestrin 2016), which is composed of
several regression trees. It is the optimization of the
gradient lifting decision tree. Each round of training
is based on the previous round. The algorithm con-

13

13

2.11
0.09
7.31
1.84
0.37
7.64
2.64
0.24
7.41
1.57
0.03
9.10
1.50
0.03
8.56
3.57
0.09
8.18
1.64
0.15
8.37
1.57
0.10
8.44
1.96
0.18
8.72
Chl-a (ug ­L−1)
NH3-N (ug ­L−1)
DO (mg ­L−1)

4.46
0.17
8.65

05-09-2020
05-04-2020
04-29-2020
04-24-2020
04-19-2020
Sampling date

Table 1  Sampling date (dd-mm-yyyy) and mean value of estimation water quality parameters

07-23-2020

07-28-2020

10-06-2020

10-11-2020

10-16-2020

Environmental Science and Pollution Research

trols the complexity of the model by introducing a
regularization term, which can prevent the overfitting
of the model, so as to reduce the amount of calculation and obtain the optimal solution in the shortest
time. In this study, XGBoost was implemented by the
SciPy library (v1.7.1) in Python 3.7. The dimensions
of the input data are the number of bands (Band-2 to
Band-8a) multiplied by the matchups (N = 96). The
hyper-parameters of XGBoost included in estimators
(1200), subsample (0,1), learning_rate (0,1), reg_
lambda (np.arange 0,5,0.001), reg_alpha (np.arange
0,5,0.001), and max_depth (np.arange 1,20,1).
(ii) SVR can effectively deal with small sample and
nonlinear problems and is often used in remote
sensing research such as soil moisture and air pollutants prediction. Based on the theory of structural
risk minimization, the optimal classification surface is constructed in the feature space, so that the
learner can get global optimization. SVR was implemented by the Scikit-learn library (1.0.1) in python
3.7. The dimensions of the input data are same as
XGBoost. The hyper-parameters of SVR in the
ensemble models included kernel (“linear”, “poly”,
“rbf”, “sigmoid”), penalty parameters C (np.linspace 0.01,70,1000), gamma (np.logspace -10,1,20),
degree (1,2,3,4,5,6), and cof0 (np.linspace 0,5,10).
(iii) RF is an algorithm based on the classification tree
proposed by (Breiman 2001). It improves the prediction accuracy of the model by summarizing many
classification trees. It is a new model to replace the
traditional machine learning methods such as the
neural network. Random is the core of the algorithm. By randomly selecting sample features, the
correlation between decision trees is reduced, and
the correlation between decision trees is small, so
as to further improve the accuracy of the model. RF
was implemented by the SciPy library (v1.7.1) in
Python 3.7. The hyper-parameters of RF included
n_estimators (1200), criterion (“gini”, “entropy”),
max_leaf_nodes (np.arange 5,50,1), max_depth (np.
arange 1,20,1), and max_features (np.arange 1,30,1).
(iv) ANN is a popular research object in the field of artificial intelligence since the 1980s. It abstracts the
neural network of the human brain from the perspective of information processing, establishes a simple
model, and forms different networks according to different connection modes. ANN is composed of input
layer, output layer, and hidden layer. The input layer
receives data from external sources, one or more
hidden layers process data, and the output layer provides one or more data points with network-based
functions. In this study, ANN was built by Pytorch
(v1.9.0). An activation function named ReLU was

Environmental Science and Pollution Research

added to each layer to implement a nonlinear transformation of data. The adaptive moment estimation
algorithm (Adam) was chosen as the gradient descent
method to update model parameters. The initial
learning rate was set to le-3 and the loop for training
was 1000 epochs.
Steps to build a machine learning model
The machine learning algorithm explores the intricate and
non-linear relationship between remote sensing reflectance
and WQPs. The model training and testing dataset are
obtained by matching the in-situ measured data and the pixel
values of satellite images. Then use the dataset to train the
model and debug the parameters. Finally, the trained model
is extended from the point scale to the surface scale to obtain
retrieval mappings of different WQPs in the study area. The
following steps are used to construct the machine learning
model for this study. To future facilitate understanding, a
technical flow chart was shown in Fig. 2.
(i) Bands selection and pixel values extraction of
images. The Rrs of Band-2 to Band-8a of Sentinel-2 images corresponding to sampling points were
extracted and matched with the water quality data to
generate the dataset (N = 96).
(ii) Dataset division. To fully exploit the potential value
of data, increasing the reusability of data and the
generalization ability of the model, the dataset was
cross-validated. The dataset was divided into 5-fold,
80% of each part served as the training set and
remained as the testing set.

(iii) Built and debug model. We use the training set to
debug the parameters of each model and the testing
set to verify the performance and generalization ability of the model.
(iv) Model output. Accuracy performance indices were
used to evaluate the model and the accuracy performance indices of the model after optimization
is calculated. If the accuracy indices of the model
are excellent, the model will be output. Otherwise,
the model will be replaced, then, the debugging and
accuracy evaluation work will be repeated.
Evaluating model accuracy
To evaluate the performance of the models, the root mean
squared error (RMSE), the mean absolute percentage error
(MAPE), R 2, and Bias were used. RMSE is a standard
way to measure the error of a model in predicting quantitative data. The use of RMSE is very common and it is
considered an excellent general purpose error metric for
numerical predictions (Chai and Draxler 2014). MAPE is
a relative error measure that uses absolute values to prevent positive and negative errors from canceling each other
and uses relative errors to compare performance between
machine learning models (Botchkarev 2018; Kim and Kim
2016). Bias, also known as apparent error, refers to the
difference between the individual measured value and the
average value of the measurement and it can be used to
measure the accuracy of the model’s calculated results.
Generally, the smallest RMSE, MAPE, Bias, and the largest R2 values give the best prediction model. The formulas
of these evaluation indexes were as follows:

Fig. 2  The flowchart of machine learning model construction

13

Environmental Science and Pollution Research

Fig. 3  Performances of models for WQPs (green, red, and yellow represent Chl-a, DO, and ­NH3-N respectively) and N = 96

√
RMSE =

MAPE =

)2
1 ∑N (
xi − yi
N i=1

1 ∑N || xi − yi ||
∗
| ∗ 100%
i=1 || y
N
|
i

Table 2  Model accuracy
analysis statistics of XGBoost,
SVR, RF, and ANN

WQPs
Chl-a
ODO
NH3-N
WQPs
Chl-a
ODO
NH3-N

13

[(

xi − yi

)]

(1)

1 ∑N
∗
Bias =
i=1
N

(2)

where xi represents the in-situ measured value, yi is the predicted value of the model.

XGBoost
RMSE
R2
0.73
0.2558 ug ­L−1
0.90
0.1379 mg ­L−1
0.82
0.0850 ug ­L−1
RF
RMSE
R2
0.67
0.3048 ug ­L−1
0.77
0.3438 mg ­L−1
0.12
0.2233 ug ­L−1

MAPE
7.59
0.71
28.60

Bias
−3.17
0.07
−21.80

MAPE
13.13
3.43
73.53

Bias
5.13
3.26
−27.59

(3)

∗ 100%

yi

SVR
R2
0.46
0.85
0.49
ANN
R2
0.15
0.79
0.25

RMSE
0.3585 ug ­L−1
0.1660 mg ­L−1
0.1452 ug ­L−1

MAPE
14.30
1.38
118.45

Bias
0.38
0.01
−92.44

RMSE
0.4484 ug ­L−1
0.2043 mg ­L−1
0.1742 ug ­L−1

MAPE
17.94
2.04
107.43

Bias
0.25
−0.49
−76.45

Environmental Science and Pollution Research

Fig. 4  Mapping of the annual variation distributions of Chl-a, DO, and ­NH3-N

Description of WQPs spatial‑temporal distribution
mapping
Based on the validated machine learning model, three WQPs
of DO, Chl-a, and ­NH3-N from all Sentinel-2 images between
2018 and 2020 are retrieved. Images from individual years
were averaged as representative of that year and then analyzed
for interannual variation characteristics. Similarly, the seasonal variation characteristics of different WQPs are analyzed
by obtaining the multi-year average value of retrieval results
according to seasons. The spatial analysis is based on the three
areas delineated by the sampling points: the head, middle, and
tail of the reservoir. All WQPs spatial-temporal distribution
mapping was produced using Geographic Information System
(ArcGIS version 10.8).

Results and analysis
Model performances and evaluation
Figure 3 presents the performances of four machine
learning models. In general, XGBoost outperformed the
other algorithms for three WQPs among all accuracy
indices Table 2. For optically active parameters (Chl-a),
XGBoost showed satisfactory results (R 2 = 0.73, RMSE
= 0.2558, MAPE = 7.59, Bias = −3.17). In contrast,
ANN performed worst with R2 of only 0.15, RMSE up
to 0.4484. It may be due to ANN requiring multiple samples for training to achieve better results and the sample
size in this study was not sufficient to support this, which
also indicates that ANN is not suitable for small lakes

13

Environmental Science and Pollution Research

Fig. 5  Mapping of the seasonal variation distributions of Chl-a, DO, and ­NH3-N

Chl-a retrieval with small sample size. For DO, all models
showed high accuracy with R2 above 0.7. In comparison,
the fitting effect of XGBoost is the best, and all matchups
are basically on the 1:1 line. XGBoost also had the optimal
accuracy indices (R2 = 0.90, RMSE = 0.1379, MAPE =
0.71, Bias = 0.07). For ­NH3-N, in the case of poor performance of the other three models, XGBoost was still able to
adequately estimate ­NH3-N (R2 = 0.82, RMSE = 0.0850,
MAPE = 28.6, Bias = −21.8). Consequently, XGBoost
successfully predicted three non-optically/optically active
parameters by using Sentinel-2 data, it was selected as the
final retrieval model to process data obtained from biological systems. Sunglint, water types, whitecaps, adjacency
effects, and bottom sediment can cause the linear relationship between WQPs and Rrs to not hold, thus affecting the
accuracy of the model retrieval. XGBoost uses multiple
CART trees for prediction and adds regularization to the

13

objective function to control the complexity of the model,
which helps to improve the generalization performance of
the model and prevent overfitting, making it ideal for solving complex non-linear regression problems. These may
be the reasons for the excellent performance of XGBoost
(Diaz-Gonzalez et al. 2022; Zhu et al. 2022).

Spatial and temporal distribution analysis of water
quality parameters
Annual variation of three water quality parameters
Regarding the annual variation distribution of water quality
parameters (Fig. 4), from 2018 to 2020, the annual average
values of ­NH3-N were 0.19 ug ­L−1, 0.15 ug ­L−1, and 0.16
ug ­L−1, respectively, and the annual average values of Chl-a
were 2.24 ug ­L−1, 2.21 ug ­L−1, and 2.19 ug ­L−1, respectively.

Environmental Science and Pollution Research
Fig. 6  The daily variation of
rainfall and wind speed in the
study area in 2020

The decreasing trend in ­NH3-N and Chl-a concentration may
be related to the high frequency of rainfall in 2018 mentioned in the Shenzhen climate bulletin. The Q reservoir
borders on fragile geological conditions such as sloping land

and a large amount of soil erosion during frequent rainfall
cause nutrients such as nitrogen and phosphorus to flow
into the reservoir. This has altered the chemical and biological characteristics of the reservoirs, adversely affecting

Fig. 7  Mapping of the spatial distributions of Chl-a, DO, and ­NH3-N

13

Environmental Science and Pollution Research

the security of the water supply. The interannual variation
in DO is the opposite of the interannual variation in Chl-a
concentration, showing an increasing and then decreasing
trend. In 2019, DO concentration rise to a maximum value
of 8.08 mg ­L−1 and decline to 7.93 mg ­L−1 in 2020, which is
generally consistent with the average concentration level of
7.91 mg ­L−1 in 2018. The high DO concentrations in 2019
may be due to the frequency and low amount of rainfall in
the region. Rainfall increases air pressure and reduces the
ability of oxygen to dissolve in water, resulting in relatively
high DO concentrations.
Seasonal variation of three water quality parameters
We mapped the seasonal variation distribution of different
water quality parameters (Fig. 5). The highest concentration
of DO in spring was 8.68 mg ­L−1, and the lowest concentration in autumn and winter was 7.85 mg ­L−1 and 7.91 mg ­L−1,
respectively. The reason may be related to the lower local
temperature and rainfall in spring, resulting in relatively high
DO concentrations in spring. As the temperature increases,
the evaporation rate of oxygen is higher than the evaporation
rate of water molecules, and the oxygen content decreases,
so does the DO concentration in the reservoir. The average
values of ­NH3-N in spring, autumn, and winter were 0.15 ug
­L−1, 0.17 ug ­L−1, and 0.17 ug ­L−1, respectively, with no significant seasonal variation. In contrast, the seasonal variation
of Chl-a was obvious, with the highest in autumn, followed
by winter and the lowest in spring. This may be related to
the increase of water temperature and light intensity in summer, which brings conditions for the growth of blue-green
algae, and the massive growth of blue-green algae causes the
increase of Chl-a concentration in spring.
To elucidate the influence of meteorological factors on
WQPs of the reservoir, we mapped the daily variation of
rainfall and wind speed of the study area in 2020 (Fig. 6).
Daily meteorological data were collected from the National
Oceanic and Atmospheric Administration (NOAA https://​
www.​ncei.​noaa.​gov/​maps-​and-​geosp​atial-​produ​cts) at the

Fig. 8  Mapping of the spatial distributions of TP (a), TN (b), and BGA (c)

13

site named KWU LING, CH. With the increase in the frequency and amount of rainfall in summer, nutrients such
as nitrogen and phosphorus enter the reservoir, leading to
increased Chl-a and ­NH3-N concentrations. At the same
time, the water source of the reservoir is effectively supplemented and pollutants are difficult to accumulate, so
the Chl-a concentration in winter is lower than that in
autumn. In addition, we analyzed the impact of major climatic events in the region on water quality of the reservoir.
Typhoon Sinlaku arrived in Shenzhen on 31 July and then
strengthened to tropical storm force on 1 August. Sinlaku
was widespread, bringing torrential rain to the region with
gusts of magnitude 8–10, during which rainfall exceeded
threshold levels. After typhoon Sinlaku left, typhoon Higos
landed in Shenzhen on August 19, causing maximum rainfall of 115.7 mm near the reservoir and maximum gusts
of over 15 m/s. In general, typhoons are accompanied
by heavy rainfall and strong winds. The torrential rain
causes the water source of the reservoir to be replenished
and dilutes pollutants, while the strong winds induce the
resuspension of reservoir sediments and scrape pollutants
from surrounding cities and industrial agriculture into the
reservoir. The main climatic events are relatively concentrated in stages, occurring at the end of summer and early
autumn, which makes the concentration of pollutants in the
reservoir higher in autumn.
Spatial variation of three water quality parameters
It can be seen from Fig. 7 that DO, Chl-a, and ­NH3-N in the
reservoir show significant spatial heterogeneity. The DO at
the head of the reservoir is relatively higher than that at the
middle and tail of the reservoir, the highest values of ­NH3-N
are basically concentrated in the middle of the reservoir.
The high concentration of DO and ­NH3-N in the reservoir
may be attributed to the fact that the reservoir is mostly
surrounded by sloping land with low vegetation coverage.
Frequent rainfall will cause some soil erosion and nutrients
such as nitrogen and phosphorus to enter the reservoir. The

Environmental Science and Pollution Research

Chl-a at the head of the reservoir is relatively high, which is
closely related to the concentration levels of cyanobacteria
and green algae in the head of the reservoir. The head of the
reservoir is widely distributed in industrial parks and human
activities are relatively strong. We infer that the head of the
reservoir receives more nutrients from urbanization and
industrial activities, which promotes the growth and bloom
processes of algal.
To better clarify the spatial heterogeneity of Chl-a, we
mapped the spatial distribution of TP, TN, and blue-green
algae (BGA) of the reservoir in 2020.TP, TN, and BGA were
determined at the same time as other water quality parameters, where TN and TP were determined in the laboratory
using spectrophotometry, and BGA was determined using
YSI-EXO2. It can be seen from Fig. 8 that the distribution
of TP, TN, and BGA in the reservoir is similar because TP
and TN are closely related to the growth of algae and provide
growth elements for algae. The head of the reservoir has
relatively high concentrations of TP, TN, and BGA, which
therefore accounts for the high Chl-a concentration at the
head of the reservoir.

Discussion
This paper compared the potential of four machine learning
models to retrieve non-optically/optically active parameters.
Machine learning models reflect the intricate and non-linear
relationship between water quality parameters and spectral
reflectance. In other words, if the reflectance of the study
area does not fluctuate significantly, the values of the water
quality parameters in the area do not vary significantly
either. In this study, all data collection was conducted in
2020. Therefore, the applicability of the trained model to
other years needs to be explored in terms of the generalization capability of the model. In this section, we analyze the
annual average change in Rrs from 2018 to 2020 for different
parts of the reservoir. It can be shown in Fig. 9 that the Rrs
from 2018 to 2020 does not fluctuate greatly and is basically
within a fixed interval. Looking at the different spatial locations of the reservoir, except for the head of the reservoir, the
Rrs of all other areas in 2018 and 2019 are basically within
the range of 2020. Therefore, we have reason to believe that
the generalization ability of the model can be guaranteed.

Fig. 9  Interannual variation in
Rrs at different locations in the
reservoir. Green, red, and blue
represent the head, middle, and
tail of the reservoir respectively.
The number of columns corresponds to the number of sampling points and the reflectance
range for each point is averaged
over all atmospherically corrected images for that year

13

Environmental Science and Pollution Research

The Shenzhen water quality management report shows
that eutrophication in the Q reservoir was very serious in
2000. The results of this study showed that the concentrations of ­NH3-N and Chl-a gradually decreased from 2018 to
2020 and were within a reasonable range, indicating that the
water quality restoration policy of the Q Reservoir was effective. Attention still needs to be paid to the adverse effects
of soil erosion and nutrient run-off on reservoirs caused by
heavy rainfall. For example, heavy rainfall causes a large
influx of nutrients into reservoirs, leading to increased concentrations of some water quality parameters. Reservoir
managers should take full account of the local climate and
topography and enhance the construction of tree plantations.
This study confirms the high accuracy of the retrieval of
non-optical active parameters based on machine learning
algorithms, but there are still some shortcomings. Due to
the better water quality of the study area with low turbidity, it cannot reflect the retrieval performance of machine
learning methods for turbid waters. Therefore, in future
studies, different machine learning models should be combined to retrieve inland and coastal waters with higher
turbidity, demonstrating the generalization capability of
machine learning methods to retrieve non-optically active
parameters.

Conclusions
In this study, four popular machine learning models were
compared using Rrs data derived from atmospheric corrected Sentinel-2 images and simultaneous in-situ measurements of water quality data for Chl-a, DO, and ­NH3-N
estimation. The XGBoost adequately estimated Chl-a
(MAPE = 7.59%, RMSE = 0.2558 ug ­L−1, R2 = 0.73), DO
(MAPE = 0.71%, RMSE = 0.1379 mg ­L−1, R2 = 0.90), and
­NH3-N (MAPE = 28.60%, RMSE = 0.0850 ug ­L−1, R2 =
0.82), and outperformed the other three models. It showed
that the water quality parameters obtained by the machine
learning model were very close to the in-situ measurements
and could be well implemented for the retrieval of nonoptically active parameters for small and medium-sized
water. Using XGBoost, the distribution of interannual, seasonal, and spatial variation in the study area was mapped
for the years 2018–2020. It can be seen from the mapping,
the water quality in the Q reservoir is in a good condition,
with a decreasing trend in Chl-a and ­NH3-N. However,
attention should still be paid to the influence of the climate
and topography in which the study area is located and mitigation measures should be sought accordingly. This study
provides an efficient and practical way for optically and
non-optically active parameters monitoring and management at the regional scale.

13

Author contribution Shang Tian: put forward ideas, performed the
experiments, and wrote the draft.
Hongwei Guo: performed the experiments and revised the draft.
Jinhui Jeanne Huang: supervised research activity and revised draft.
Xiaotong Zhu: trained machine learning models.
Bo Wang: processed data.
Wang Xu: provided study materials.
Qinghuai Zeng: provided study materials.
Youquan Mai: provided study materials.
Funding This work was supported by the National Key R&D Program
of China (2021YFC3200400).
Data availability The datasets used or analyzed during the current
study are available from the corresponding author on reasonable
request.

Declarations
Ethics approval and consent to participate Not applicable
Consent for publication Not applicable
Competing interests The authors declare no competing interests.

References
Achmad AR, Syifa M, Park SJ et al (2019) Geomorphological transition research for affecting the coastal environment due to the
volcanic eruption of Anak Krakatau by satellite imagery. J Coast
Res 90:214. https://​doi.​org/​10.​2112/​SI90-​026.1
Alcantara E, Bernardo N, Rodrigues T et al (2017) Modeling the
spatio-temporal dissolved organic carbon concentration in Barra
Bonita reservoir using OLI/Landsat-8 images. Model Earth Syst
Environ 3:11. https://​doi.​org/​10.​1007/​s40808-​017-​0275-2
Barnes BB, Hu C (2016) Dependence of satellite ocean color data
products on viewing angles: a comparison between SeaWiFS,
MODIS, and VIIRS. Remote Sens Environ. https://​doi.​org/​10.​
1016/j.​rse.​2015.​12.​048
Bierman P, Lewis M, Ostendor B et al (2011) A review of methods for
analysing spatial and temporal patterns in coastal water quality.
Ecol Indic 11:103–114. https://​doi.​org/​10.​1016/j.​ecoli​nd.​2009.​
11.​001
Botchkarev A (2018) Performance metrics (error measures) in machine
learning regression, forecasting and prognostics: properties and
typology. Interdiscip J Inf Knowl Manag 14:45–79. https://​doi.​
org/​10.​28945/​4184
Breiman L (2001) Random forests. Mach Learn 45:5–32. https://​doi.​
org/​10.​1023/A:​10109​33404​324
Breitburg D, Levin LA, Oschlies A et al (2018) Declining oxygen in the
global ocean and coastal waters. Science 359:eaam7240. https://​
doi.​org/​10.​1126/​scien​ce.​aam72​40
Chai T, Draxler RR (2014) Root mean square error (RMSE) or mean
absolute error (MAE)?–arguments against avoiding RMSE in the
literature. Geosci Model Dev 7:1247–1250. https://​doi.​org/​10.​
5194/​gmd-7-​1247-​2014
Chawla I, Karthikeyan L, Mishra AK (2020) A review of remote sensing applications for water security: quantity, quality, and extremes.
J Hydrol 585:124826. https://​doi.​org/​10.​1016/j.​jhydr​ol.​2020.​
124826
Chen T, Guestrin C (2016) Xgboost: a scalable tree boosting system. In
Proceedings of the 22nd ACM SIGKDD International Conference

Environmental Science and Pollution Research
on Knowledge Discovery and Data Mining, pp 785–794. https://​
doi.​org/​10.​1145/​29396​72.​29397​85
Chi L, Song X, Yuan Y et al (2020) Main factors dominating the development, formation and dissipation of hypoxia off the Changjiang Estuary (CE) and its adjacent waters, China. Environ Pollut
265:115066. https://​doi.​org/​10.​1016/j.​envpol.​2020.​115066
Diaz-Gonzalez FA, Vuelvas J, Correa CA et al (2022) Machine learning and remote sensing techniques applied to estimate soil indicators–review. Ecol Indic 135:108517. https://​doi.​org/​10.​1016/j.​
ecoli​nd.​2021.​108517
Dong G, Hu Z, Liu X et al (2020) Spatio-temporal variation of total
nitrogen and ammonia nitrogen in the water source of the middle route of the south-to-north water diversion project. Water
12:2615. https://​doi.​org/​10.​3390/​w1209​2615
Fernanda W, Enner A, Thanan R et al (2015) Estimation of chlorophyll-a concentration and the trophic state of the Barra Bonita
hydroelectric reservoir using OLI/Landsat-8 images. Int J Environ Res Public Health 12:10391–10417. https://​doi.​org/​10.​3390/​
ijerp​h1209​10391
Gao Y, Gao J, Yin H et al (2015) Remote sensing estimation of the
total phosphorus concentration in a large lake using band combinations and regional multivariate statistical modeling techniques. J Environ Manag 151:33–43. https://​doi.​org/​10.​1016/j.​
jenvm​an.​2014.​11.​036
Gitelson A (1992) The peak near 700 nm on radiance spectra of
algae and water: relationships of its magnitude and position with
chlorophyll concentration. Int J Remote Sens 13:3367–3373.
https://​doi.​org/​10.​1080/​01431​16920​89041​25
Gons HJ (1999) Optical teledetection of chlorophyll a in turbid
inland waters. Environ Sci Technol 33:1127–1132. https://​doi.​
org/​10.​1021/​es980​9657
Guo H, Huang JJ, Chen B et al (2021a) A machine learningbased strategy for estimating non-optically active water
quality parameters using Sentinel-2 imagery. Int J Remote
Sens 42:1841–1866. https://​d oi.​o rg/​1 0.​1 080/​0 1431​1 61.​2 020.​
18462​2 2
Guo H, Huang JJ, Zhu X et al (2021b) A generalized machine
learning approach for dissolved oxygen estimation at multiple
spatiotemporal scales using remote sensing. Environ Pollut
288:117734. https://​doi.​org/​10.​1016/j.​envpol.​2021.​117734
Hunter PD, Tyler AN, Gilvear DJ et al (2009) Using remote sensing
to aid the assessment of human health risks from blooms of
potentially toxic cyanobacteria. Environ Sci Technol 43:2627–
2633. https://​doi.​org/​10.​1021/​es802​977u
Kaire T, Tiit K, Alo L et al (2016) First experiences in mapping lake
water quality parameters with Sentinel-2 MSI imagery. Remote
Sens 8:640. https://​doi.​org/​10.​3390/​rs808​0640
Kim S, Kim H (2016) A new metric of absolute percentage error
for intermittent demand forecasts. Int J Forecast 32:669–679.
https://​doi.​org/​10.​1016/j.​ijfor​ecast.​2015.​12.​003
Kim YW, Kim T, Shin J et al (2022) Validity evaluation of a
machine-learning model for chlorophyll a retrieval using Sentinel-2 from inland and coastal waters. Ecol Indic 137:108737.
https://​doi.​org/​10.​1016/j.​ecoli​nd.​2022.​108737
Lee Z, Carder KL, Arnone RA (2002) Deriving inherent optical
properties from water color: a multiband quasi-analytical
algorithm for optically deep waters. Appl Opt 41:5755–5772.
https://​doi.​org/​10.​1364/​AO.​41.​005755
Li Y, Zhang Y, Shi K et al (2018) Spatiotemporal dynamics of
chlorophyll-a in a large reservoir as derived from Landsat 8
OLI data: understanding its driving and restrictive factors.
Environ Sci Pollut Res 25:1359–1374. https://​doi.​org/​10.​1007/​
s11356-​017-​0536-7

Liu G, Li L, Song K et al (2020) An OLCI-based algorithm for semiempirically partitioning absorption coefficient and estimating
chlorophyll a concentration in various turbid case-2 waters.
Remote Sens Environ 239:111648. https://​doi.​org/​10.​1016/j.​rse.​
2020.​111648
Lu S, Deng R, Liang Y et al (2020) Remote sensing retrieval of total
phosphorus in the pearl river channels based on the GF-1 remote
sensing data. Remote Sens 12:1420. https://​doi.​org/​10.​3390/​rs120​
91420
Maritorena S, Siegel DA, Peterson AR (2002) Optimization of a semianalytical ocean color model for global-scale applications. Appl
Opt 41:2705–2714. https://​doi.​org/​10.​1364/​AO.​41.​002705
Matthews MW, Odermatt D (2015) Improved algorithm for routine
monitoring of cyanobacteria and eutrophication in inland and
near-coastal waters. Remote Sens Environ 156:374–382. https://​
doi.​org/​10.​1016/j.​rse.​2014.​10.​010
Matthews MW, Bernard S, Robertson L (2012) An algorithm for
detecting trophic status (chlorophyll- a ), cyanobacterial-dominance, surface scums and floating vegetation in inland and coastal
waters. Remote Sens Environ 124:637–652. https://​doi.​org/​10.​
1016/j.​rse.​2012.​05.​032
Mouw CB, Greb S, Aurin D et al (2015) Aquatic color radiometry
remote sensing of coastal and inland waters: challenges and recommendations for future satellite missions. Remote Sens Environ.
https://​doi.​org/​10.​1016/j.​rse.​2015.​02.​001
Neil C, Spyrakos E, Hunter PD et al (2019) A global approach for chlorophyll-a retrieval across optically complex inland waters based on
optical water types. Remote Sens Environ 229:159–178. https://​
doi.​org/​10.​1016/j.​rse.​2019.​04.​027
Nguyen H-Q, Ha N-T, Pham T-L (2020) Inland harmful cyanobacterial bloom prediction in the eutrophic Tri An reservoir using
satellite band ratio and machine learning approaches. Environ Sci Pollut Res 27:9135–9151. https://​d oi.​o rg/​1 0.​1 007/​
s11356-​019-​07519-3
O’Reilly JE, Maritorena S, Mitchell BG et al (1998) Ocean color chlorophyll algorithms for SEAWIFS. J Geophys Res 103:24937.
https://​doi.​org/​10.​1029/​98JC0​2160
Saberioon M, Brom J, Nedbal V et al (2020) Chlorophyll-a and total
suspended solids retrieving and mapping using Sentinel-2 and
machine learning for inland waters. Ecol Indic 113:106236.
https://​doi.​org/​10.​1016/j.​ecoli​nd.​2020.​106236
Sagan V, Peterson KT, Maimaitijiang M et al (2020) Monitoring inland
water quality using remote sensing: potential and limitations of
spectral indices, bio-optical simulations, machine learning, and
cloud computing. Earth-Sci Rev 205:103187. https://​doi.​org/​10.​
1016/j.​earsc​irev.​2020.​103187
Smith B, Pahlevan N, Schalles J et al (2021) A chlorophyll-a algorithm for Landsat-8 based on mixture density networks. Front
Remote Sens 1:623678. https://​d oi.​o rg/​1 0.​3 389/​f rsen.​2 020.​
623678
Song K, Lin L, Li S et al (2012) Hyperspectral remote sensing of total
phosphorus (TP) in three Central Indiana water supply reservoirs.
Water Air Soil Pollut 223:1481–1502. https://​doi.​org/​10.​1007/​
s11270-​011-​0959-6
Vanhellemont Q (2019) Adaptation of the dark spectrum fitting atmospheric correction for aquatic applications of the Landsat and Sentinel-2 archives. Remote Sens Environ 225:175–192. https://​doi.​
org/​10.​1016/j.​rse.​2019.​03.​010
Varol M (2020) Use of water quality index and multivariate statistical
methods for the evaluation of water quality of a stream affected
by multiple stressors: a case study. Environ Pollut 266:115417.
https://​doi.​org/​10.​1016/j.​envpol.​2020.​115417
Wang Z, Wei L, He C et al (2021) Ammonia nitrogen monitoring
of urban rivers with UAV-borne hyperspectral remote sensing

13

Environmental Science and Pollution Research
imagery. In: 2021 IEEE International Geoscience and Remote
Sensing Symposium IGARSS. IEEE, Brussels, pp 3713–3716
Xiao H, Krauss M, Floehr T et al (2016) Effect-directed analysis of
Aryl hydrocarbon receptor agonists in sediments from the three
Gorges reservoir, China. Environ Sci Technol 50:11319–11328.
https://​doi.​org/​10.​1021/​acs.​est.​6b032​31
Xiong Y, Ran Y, Zhao S et al (2019) Remotely assessing and monitoring coastal and inland water quality in China: progress, challenges
and outlook. Crit Rev Environ Sci Technol:1–37. https://​doi.​org/​
10.​1080/​10643​389.​2019.​16565​11
Zhang Y, Fitch P, Vilas MP et al (2019) Applying multi-layer artificial
neural network and mutual information to the prediction of trends
in dissolved oxygen. Front Environ Sci 7:46. https://​doi.​org/​10.​
3389/​fenvs.​2019.​00046

13

Zhu M, Wang J, Yang X et al (2022) A review of the application of
machine learning in water quality evaluation. Eco-Environ Health.
https://​doi.​org/​10.​1016/j.​eehl.​2022.​06.​001
Publisher’s note Springer Nature remains neutral with regard to
jurisdictional claims in published maps and institutional affiliations.
Springer Nature or its licensor holds exclusive rights to this article under
a publishing agreement with the author(s) or other rightsholder(s); author
self-archiving of the accepted manuscript version of this article is solely
governed by the terms of such publishing agreement and applicable law.


```

---

## Referencia BibTeX

```bibtex
@article{tianRemoteSensingRetrieval2023a,
  title = {Remote Sensing Retrieval of Inland Water Quality Parameters Using {{Sentinel-2}} and Multiple Machine Learning Algorithms},
  author = {Tian, Shang and Guo, Hongwei and Xu, Wang and Zhu, Xiaotong and Wang, Bo and Zeng, Qinghuai and Mai, Youquan and Huang, Jinhui Jeanne},
  year = 2023,
  month = feb,
  journal = {Environmental Science and Pollution Research International},
  volume = {30},
  number = {7},
  pages = {18617--18630},
  issn = {1614-7499},
  doi = {10.1007/s11356-022-23431-9},
  abstract = {Remote sensing has long been an effective method for water quality monitoring because of its advantages such as high coverage and low consumption. For non-optically active parameters, traditional empirical and analytical methods cannot achieve quantitative retrieval. Machine learning has been gradually used for water quality retrieval due to its ability to capture the potential relationship between water quality parameters and satellite images. This study is based on Sentinel-2 images and compared the ability of four machine learning algorithms (eXtreme Gradient Boosting (XGBoost), Support Vector Regression (SVR), Random Forest (RF), and Artificial Neural Network (ANN)) to retrieve chlorophyll-a (Chl-a), dissolved oxygen (DO), and ammonia-nitrogen (NH3-N) for inland reservoirs. The results indicated that XGBoost outperformed the other three algorithms. We used XGBoost to reconstruct the spatial-temporal patterns of Chl-a, DO, and NH3-N for the period of 2018-2020 and further analyzed the interannual, seasonal, and spatial variation characteristics. This study provides an efficient and practical way for optically and non-optically active parameters monitoring and management at the regional scale.},
  langid = {english},
  pmid = {36217046},
  keywords = {Algorithms,Environmental Monitoring,Inland waters,Machine learning,Machine Learning,Non-optically active parameters,Remote sensing,Remote Sensing Technology,Sentinel-2,Water quality,Water Quality},
  file = {/home/fernando/Zotero/storage/VBBMC6Y3/Tian et al. - 2023 - Remote sensing retrieval of inland water quality parameters using Sentinel-2 and multiple machine le.pdf}
}
```
