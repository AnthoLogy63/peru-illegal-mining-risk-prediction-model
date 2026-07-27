# Change Detection of Amazonian Alluvial Gold Mining Using Deep Learning and Sentinel-2 Imagery

**BibTeX Key:** `camalanChangeDetectionAmazonian2022c`  
**Authors:** Camalan, Seda and Cui, Kangning and Pauca, Victor Paul and Alqahtani, Sarra and Silman, Miles and Chan, Raymond and Plemmons, Robert Jame and Dethier, Evan Nylen and Fernandez, Luis E. and Lutz, David A.  

---

## Abstract

Monitoring changes within the land surface and open water bodies is critical for natural resource management, conservation, and environmental policy. While the use of satellite imagery for these purposes is common, fine-scale change detection can be a technical challenge. Difficulties arise from variable atmospheric conditions and the problem of assigning pixels to individual objects. We examined the degree to which two machine learning approaches can better characterize change detection in the context of a current conservation challenge, artisanal small-scale gold mining (ASGM). We obtained Sentinel-2 imagery and consulted with domain experts to construct an open-source labeled land-cover change dataset. The focus of this dataset is the Madre de Dios (MDD) region in Peru, a hotspot of ASGM activity. We also generated datasets of active ASGM areas in other countries (Venezuela, Indonesia, and Myanmar) for out-of-sample testing. With these labeled data, we utilized a supervised (E-ReCNN) and semi-supervised (SVM-STV) approach to study binary and multi-class change within mining ponds in the MDD region. Additionally, we tested how the inclusion of multiple channels, histogram matching, and La*b* color metrics improved the performance of the models and reduced the influence of atmospheric effects. Empirical results show that the supervised E-ReCNN method on 6-Channel histogram-matched images generated the most accurate detection of change not only in the focal region (Kappa: 0.92 (\textpm{} 0.04), Jaccard: 0.88 (\textpm{} 0.07), F1: 0.88 (\textpm{} 0.05)) but also in the out-of-sample prediction regions (Kappa: 0.90 (\textpm{} 0.03), Jaccard: 0.84 (\textpm{} 0.04), and F1: 0.77 (\textpm{} 0.04)). While semi-supervised methods did not perform as accurately on 6- or 10-channel imagery, histogram matching and the inclusion of La*b* metrics generated accurate results with low memory and resource costs. These results show that E-ReCNN is capable of accurately detecting specific and object-oriented environmental changes related to ASGM. E-ReCNN is scalable to areas outside the focal area and is a method of change detection that can be extended to other forms of land-use modification.

---

## Resumen / Notas (Tuyo)

*(Escribe aquí tus notas)*

---

## Texto Completo del Artículo (Extraído del PDF)

```text
remote sensing
Article

Change Detection of Amazonian Alluvial Gold Mining Using
Deep Learning and Sentinel-2 Imagery
Seda Camalan 1, * , Kangning Cui 2 , Victor Paul Pauca 1 , Sarra Alqahtani 1 , Miles Silman 3,4 , Raymond Chan 2 ,
Robert Jame Plemmons 1 , Evan Nylen Dethier 5 , Luis E. Fernandez 3,4,6 and David A. Lutz 5
1

2

3

4
5

6

*



Citation: Camalan, S.; Cui, K.; Pauca,
V.P.; Alqahtani, S.; Silman, M.; Chan,
R.; Plemmons, R.J.; Dethier, E.N.;
Fernandez, L.E.; Lutz, D.A. Change
Detection of Amazonian Alluvial
Gold Mining Using Deep Learning
and Sentinel-2 Imagery. Remote Sens.
2022, 14, 1746. https://doi.org/
10.3390/rs14071746
Academic Editor: Alex Lechner
Received: 2 March 2022
Accepted: 1 April 2022
Published: 5 April 2022
Publisher’s Note: MDPI stays neutral
with regard to jurisdictional claims in
published maps and institutional affiliations.

Copyright: © 2022 by the authors.

Department of Computer Science, Wake Forest University, Winston-Salem, NC 27109, USA;
paucavp@wfu.edu (V.P.P.); alqahtas@wfu.edu (S.A.); plemmons@wfu.edu (R.J.P.)
Department of Mathematics, City University of Hong Kong, 83 Tat Chee Ave., Kawloon, Hong Kong;
kangnicui2-c@my.cityu.edu.hk (K.C.); raymond.chan@cityu.edu.hk (R.C.)
Department of Biology, Wake Forest University, Winston-Salem, NC 27109, USA; silmanmr@wfu.edu (M.S.);
fernanle@wfu.edu (L.E.F.)
Center for Energy, Environment and Sustainability, Wake Forest University, Winston-Salem, NC 27109, USA
Environmental Studies Department, Dartmouth College, Hanover, NH 03755, USA;
evan.nylen.dethier@dartmouth.edu (E.N.D.); david.a.lutz@dartmouth.edu (D.A.L.)
Centro de Innovación Científica Amazónica, (CINCIA), Jr. Cajamarca Cdra. 1,
Puerto Maldonado 17001, Madre de Dios, Peru
Correspondence: camalas@wfu.edu; Tel.: +1-(336)-758-5153

Abstract: Monitoring changes within the land surface and open water bodies is critical for natural
resource management, conservation, and environmental policy. While the use of satellite imagery
for these purposes is common, fine-scale change detection can be a technical challenge. Difficulties
arise from variable atmospheric conditions and the problem of assigning pixels to individual objects.
We examined the degree to which two machine learning approaches can better characterize change
detection in the context of a current conservation challenge, artisanal small-scale gold mining (ASGM).
We obtained Sentinel-2 imagery and consulted with domain experts to construct an open-source
labeled land-cover change dataset. The focus of this dataset is the Madre de Dios (MDD) region in
Peru, a hotspot of ASGM activity. We also generated datasets of active ASGM areas in other countries
(Venezuela, Indonesia, and Myanmar) for out-of-sample testing. With these labeled data, we utilized
a supervised (E-ReCNN) and semi-supervised (SVM-STV) approach to study binary and multi-class
change within mining ponds in the MDD region. Additionally, we tested how the inclusion of
multiple channels, histogram matching, and La*b* color metrics improved the performance of the
models and reduced the influence of atmospheric effects. Empirical results show that the supervised
E-ReCNN method on 6-Channel histogram-matched images generated the most accurate detection
of change not only in the focal region (Kappa: 0.92 (± 0.04), Jaccard: 0.88 (± 0.07), F1: 0.88 (± 0.05))
but also in the out-of-sample prediction regions (Kappa: 0.90 (± 0.03), Jaccard: 0.84 (± 0.04), and F1:
0.77 (± 0.04)). While semi-supervised methods did not perform as accurately on 6- or 10-channel
imagery, histogram matching and the inclusion of La*b* metrics generated accurate results with low
memory and resource costs. These results show that E-ReCNN is capable of accurately detecting
specific and object-oriented environmental changes related to ASGM. E-ReCNN is scalable to areas
outside the focal area and is a method of change detection that can be extended to other forms of
land-use modification.
Keywords: change detection; small water bodies; ASGM; Sentinal-2 imagery; ReCNN; CNN; LSTM;
smoothed total variation; SVM; semi-supervised

Licensee MDPI, Basel, Switzerland.
This article is an open access article
distributed under the terms and
conditions of the Creative Commons
Attribution (CC BY) license (https://
creativecommons.org/licenses/by/
4.0/).

1. Introduction
Artisanal and small-scale gold mining (ASGM) is an emerging threat to the conservation and preservation of tropical riverine systems across the planet [1,2]. This method of

Remote Sens. 2022, 14, 1746. https://doi.org/10.3390/rs14071746

https://www.mdpi.com/journal/remotesensing

Remote Sens. 2022, 14, 1746

2 of 22

mining involves the removal of aboveground biomass and the processing of alluvial soil
sediments for the retrieval of minute historical deposits of gold particles. ASGM typically
involves operations at a much broader spatial scale than pit mining, as the concentration of
gold particles is comparatively low in alluvial fans and historical river channels [3]. As a
result, ASGM is generally associated with land cover/land use (LCLU) change that can
encompass large areas, including the clearing of primary tropical rainforest.
The presence of this type of mining in small pockets of the Amazon Basin is not
new. However, the expansion of ASGM as a driver of land-cover change throughout
Amazonia and in other tropical ecosystems has increased remarkably over the past decade.
For instance, in the Peruvian department of Madre de Dios, ASGM was responsible for
the removal of over 120,000 ha of primary tropical forest from 1984 to 2017 [4]. ASGM
has also taken hold outside the Amazon, including in Nigeria [5], Ghana [6], Laos [7],
and Indonesia [8]. The intensification of ASGM has led to profound impacts on river
biogeochemistry [1], human health [9], and conserved areas [4], making it a significant
driver of land-use change in tropical landscapes and riverine systems. Water is essential
for the mining process, and shallow tropical water tables quickly fill any excavation. As a
result, entire landscapes that were once primary forests have been converted to a mixture
of ponds and bare earth, creating novel hydroscapes and greatly changing restoration
potential [10] (Figure 1).

Figure 1. Mining ponds in La Pampa, Peru, showing a range of activity levels. Deep green ponds
indicate the presence of algae and the cessation of mining activity. Chalky clay-colored ponds contain
high levels of suspended sediment and are currently actively mixed. Light green ponds, such as the
one in the center of the image, are transitioning from active status to inactive status.

As ASGM has intensified globally, monitoring efforts to detect mining activity have
been of significant interest for conservation and governance purposes. Current efforts to
monitor ASGM landscapes, including the presence of mining ponds and water bodies
left over from sediment extraction, generally make use of satellite-based remotely sensed
imagery (e.g., [4,11]). This work often relies on indices that compare reflectance band data
from these sensors to categorize the land surface into broad groups, a technique that is also
used for monitoring small water bodies [12–14]. However, these methods generally work
on a pixel-basis, and do not keep track of temporal change across time series.
Recently, developments in deep learning have led to an increased capacity for monitoring LCLU change more discretely, allowing for segmentation and labeling of individual
features or objects within digital imagery. Among these methods are the use of both convolutional neural networks (CNN) and recurrent neural networks (RNN). A convolutional
neural network (CNN) is a multilayer neural network that is inspired by the model of
the primate visual system [15] and is utilized for learning features [16] and classification
problems [17,18]. Specifically, CNN relies on two-dimensional spatial contexts within im-

Remote Sens. 2022, 14, 1746

3 of 22

agery data to generate edges and identify features. As a result, CNN-based deep learning
is widely used for feature extraction uses such as semantic segmentation [19], landslide
detection [20], object detection [21,22], and change detection [23]. RNNs have the capacity
to re-apply past weights to layers in the neural network. By remembering the spatial
features over time, RNNs utilize temporal contexts and functionality with time-series
data. RNNs have been used for monitoring and estimating land-cover change [24,25] and
crop identification [26,27]. When these two types of neural networks are combined into a
singular network (ReCNN; [28]), time-series multispectral data can be analyzed in a way
that detects features as well as changes in conditions of these features over time.
While it may appear that deep learning only provides a more detailed estimate of
land-cover change when compared to conventional techniques, these new methods may
be transformative in guiding policy and mitigation measures. For instance, in the context
of ASGM, general methods using spectral indices alone describe the area of primary
tropical forest biomass that has been converted [4,29] as well as the presence of new mining
ponds [10]. These mining ponds, or lagoons, are generally 3–4 m deep water bodies
produced as sediment is excavated for processing. The excavated areas are filled with water
via hoses and pumps to hasten the erosion and liquefaction of the soil. When local mining
abates, sediment concentrations in the pond water column decrease while phytoplankton
and algae increase in still water [1,30]. Understanding such changes provides insight into
the effectiveness of mining and conservation policy across a landscape [30]. Ultimately, deep
learning methods that provide time-series data on the reflectance of individual features on
a landscape may provide great utility for land-use change science and analysis.
In this work, we show how deep learning can be used to more thoroughly evaluate
object-oriented LCLU change via satellite imagery. To do so, we utilize ReCNN, a combined form of CNN and RNN, into a singular network [28] to detect and categorize the
changes in mining ponds created by ASGM activities. This ReCNN is compared with a
semi-supervised model, support vector machines with smoothed total variation, SVM-STV.
Specifically, we examine the outcomes from these models, as well as a number of labeling
methods, to understand the applicability of these techniques to land-cover changes associated with ASGM. We focus on mined areas in the Peruvian department of Madre de Dios, a
global hotspot of ASGM activity. We then transfer the model to other international ASGM
sites to showcase its utility. Primary contributions of the study are:

•
•
•
•

The creation of an open-source labeled dataset of water body change pertaining to
ASGM that can be used for training and consistent evaluation of algorithm performance;
An evaluation of labeling methods and approaches for use with supervised
model construction;
An assessment of supervised and semi-supervised methods in the context of detecting
and characterizing mining ponds from ASGM activity;
A test of the best-performing models at a selection of out-of-sample international
ASGM sites to examine universal model utility.

2. Materials and Methods
2.1. ASGM Ponds Dataset and Change Characterization
Our main study region is located within the Peruvian department of Madre de Dios
(MDD), a globally significant hotspot of ASGM activity. We selected 16 distinct smaller
region samples (~70 km2 each) of interest within MDD to highlight locations that had
experienced mining pond surface-area increases as well as notable deforestation (Figure 2;
Table A1 in Appendix A). These regions were selected for two main reasons: firstly, the
regions spanned a gradient of significant mining intensity, techniques, and policy enforcement over the last 15 years. Secondly, the regions were shaped so as to maximize the
number of pixels undergoing change between bi-temporal images, thereby providing a
more thorough test of the models. A total selection of sixteen regions allowed for a fully
representative sample of sites with these two considerations in mind.

Remote Sens. 2022, 14, 1746

4 of 22

We acquired Sentinel-2 top-of-atmosphere reflectance data for these 16 regions via the
Google Earth Engine platform. The Sentinel-2 satellite constellation [31] was developed
for monitoring variability in LCLU conditions at frequent revisit times (5 days at the
equator) and consists of 13 multispectral channels ranging from ultra-blue to shortwave
infrared with pixel resolutions between 10 and 60 m GSD. Sentinel-2 data is widely used
to assess LCLU change in the context of surface water [32,33]. We selected data from two
different years (2019 and 2021) with very low cloud coverage to showcase periods in which
significant land-use change had occurred. We removed the influence of atmospheric effects
by histogram matching of corresponding images of the same region and used Sentinel-2
metadata about cloud cover to remove any residual clouds on the images.

Figure 2. Selected sixteen region samples are shown with different transparent colors in the Madre
de Dios (MDD), Peru area on Google Earth Engine (GEE) seen on 23 July 2021. For more geographical
details about each region sample, see Table A1 in Appendix A and Figure A1 in Appendix B.

LCLU changes due to alluvial gold mining occur across different parts of the world,
so it is crucial that change-detection algorithms generalize from one geographical region to
another. Thus, we included an out-of-sample testing dataset containing instances of similar
alluvial gold mining in Indonesia, Myanmar, and Venezuela that are of similar intensity to
that in MDD (Table A2 in Appendix A).
For the purpose of generating meaningful labeled data, we defined three different
pond states in relation to the recency of mining:

•
•
•

Active state: where mining was ongoing at the time of image collection;
Transition state: where mining was recent but not ongoing;
Inactive state: where mining had ceased longer than 6 months prior to imaging.
Change in mining ponds was then defined as follows:

•
•
•
•

Decrease: change from active to inactive, active to transition, or transition to inactive;
Increase: change from inactive to active, inactive to transition, or transition to active;
Water Existence/Absence: change from water to no-water or no-water to water;
No Change: no state changes between time periods took place.

These basic categories can provide useful information regarding ongoing mining
activities, such as intensification, cessation, and the effect of governance [1,4].
A subgroup of individuals in the research group with expertise in the characterization
of alluvial gold mining manually segmented and labeled each individual pond in the
dataset. Ponds were segmented by manually tracing their edges, and pond status was
determined from side-by-side visual observation of the RGB and shortwave-infrared (SW)

Remote Sens. 2022, 14, 1746

5 of 22

with GB composite images for each region, see Figure 3a–c. These band combinations were
chosen specifically to help discriminate between active sites, in which sediment highly
reflects in the red band, and inactive sites, in which photosynthetic material is present and
influences the shortwave infrared reflectance (Figure 3a). For consistency, we calculated
the color index Cidx = (green − red)/(green + red) distributions of pond pixels and chose
thresholds of 0 and 0.15 to select ponds in a transition state.

Figure 3. We manually labeled the state of each pond using the Labelbox tool using RGB and SWGB
composite images. The composite images (a) RBG and (b) SWGB display a multitude of ponds clearly,
and label categories (c) affixed to these images. Using a color index [(green − red)/(red + green)],
ponds can be differentiated with respect to the presence of sediment and photosynthetic material and
describe (d) active, (e) inactive, and (f) transition ponds.

2.2. Modeling Approaches
We considered two main approaches for modeling and quantifying change in residual
ponds: a supervised deep learning method based on ReCNN [28] and a semi-supervised
method involving a support vector machine and smoothed total variation regularizer [34].
2.2.1. Supervised Deep Learning Approach
We extended the ReCNN model of Mou et al. [28], originally designed to detect
LCLU-type changes in urban areas using satellite imagery, for the detection of large and
subtle changes relative to water bodies. First, we augmented the ReCNN model to include
a second LSTM plus dropout layer between the original two LSTM layers (Figure 4) to
capture subtle pond-state changes. Second, we modified the input layer to receive two
temporal images separately instead of two concatenated images as is done in other studies
(e.g., [35,36]). We refer to this implementation as extended ReCNN (E-ReCNN) throughout
the remainder of this paper.

Remote Sens. 2022, 14, 1746

6 of 22

Figure 4. The E-ReCNN model uses two cloud-free Sentinel 2B images obtained from two different
times (18 August 2019 and 23 July 2021) for the same region. Following histogram matching and
augmentation, we used a convolutional kernel (Conv2d) on 5 × 5-pixel patches across each image to
generate a feature array. These feature arrays then served as the input of the first LSTM layer, and the
second LSTM layer was formed following a dropout of 0.2. The last two layers were fully connected,
and an output layer was applied with sigmoid/softmax functions to recognize the change in the
pond’s status.

2.2.2. Semi-Supervised Learning Approach
Unsupervised and semi-supervised learning methods are widely applied in remote
sensing applications involving small datasets and limited access to high-performance
computing equipment. SVMs are powerful semi-supervised approaches that have been
used to detect LCLU change utilizing spectral information of each pixel separately [37–39].
A recent SVM-STV approach by Chan et al. [34] also utilized spatial information contained
across image regions. We modified this approach to include a lifting option for multispectral
images. Lifting is a preprocessing step that can help aid with the segmentation of RGB
images through the use of color spaces and additional features [40–43]. We combined the
RGB and La*b* color spaces in the images as features and then performed segmentation to
reduce the effects of high correlation in one color space [43].
Figure 5 illustrates the two main steps in SVM-STV. In the first step, we formed the v
feature vectors from the difference in the bi-temporal images. Then we used a pixel-wise
ν-support vector classifier (ν-SVC) with a radial basis function kernel to find a hyperplane
maximizing the margins between each pair of classes, using a one-against-one strategy, and
to assign each pixel a vector of probabilities belonging to each class [44,45]. The difference
in La*b* color space between bi-temporal images is included in feature v if the lifting option
is enabled. In the second step, a smoothed total variation (STV) regularizer smooths the
probability vector and consequently the classification map.

Remote Sens. 2022, 14, 1746

7 of 22

Figure 5. Overview of the SVM-STV method for mining change recognition. Bi-temporal images
from a region were used as inputs. Preprocessing steps utilized histogram matching and lifting with
lab color data for both images. Labeled points using different images were used to train the ν-SVM
in the first stage and then used to generate probability maps. In the second stage, spatial information
was utilized by denoising the probability tensor. The final classification results were obtained by
taking the index of the maximum probability of each pixel to detect change.

2.2.3. Statistical Approaches, Training, and Operation
In order to understand the performance of the proposed approaches and the impact
of spectral information and image preprocessing, we designed a number of test-train
experiments across the 16 numbered regions within Madre de Dios (Figure 2). Additionally,
to examine the generalizability of the approaches to ASGM sites in other locations in the
tropics, we constructed a set of out-of-sample testing regions in Venezuela, Indonesia, and
Myanmar.
Since the supervised and semi-supervised modeling approaches used different quantities and distributions of labels, we used slightly different training approaches for each
model. For the E-ReCNN model, we used a leave-one-region-out cross-validation approach.
This method is often used for classification in medical imaging (e.g., leave-one-patientout) [18,46] to account for class imbalance and region information. Specifically, we left
one of the sixteen MDD regions out for testing and used the remaining fifteen regions
for training and validation. We iterated this process for each individual region, allowing
each region to serve as a testing region once. For each iteration, one region’s image was
selected as a test, and the remaining fifteen regions’ images were used for training (70% of
all patches) and validation (30% of all patches). Because we were examining the influence of
the number of channels included in the model, this process was repeated for each multispectral image in the 3, 6, and 10-Channel image sets. Nesterov Adam [47], an improved Adam
optimizer [48], was used to accelerate adaptive moment estimation and the convergence
of both the Adam and stochastic gradient descent (SGD). The parameters of the model
producing the best average predictive results are listed in Appendix A Table A2. All testing
and training using E-ReCNN were performed on the Wake Forest University DEAC HPC
Cluster [49] (Appendix A Table A3).

Remote Sens. 2022, 14, 1746

8 of 22

To train the SVM-STV semi-supervised model, we first trained the ν-SVC and then
performed denoising on the probability map that ν-SVC produces. In the context of semisupervised learning, less than 1% of labels were randomly selected for training, whereas
over 99% of the labels were unknown. Thus, in the training process of each region, instead
of including all the pixels into the ν-SVC, we only incorporated a subset of randomly
chosen labeled points from each region. Therefore, for each of the 16 MDD regions, we first
specified the number of labeled pixels per class (Nk ) for training the model. Next, we used
the preprocessed randomly selected Nk ∗ K labeled pixels to train the ν-SVC with five-fold
cross-validation, where K was the number of classes. The trained ν-SVC was then applied
to predict the probability tensor. Finally, the denoising parameters were tuned based on the
probability maps of each region. The training procedure for SVM-STV was computationally
feasible and had a rapid training time as it only used a small portion of randomly selected
labeled data (0.004–0.2%). All testing and training of the SVM-STV method were conducted
in the same environment: Intel® Core™ i7-10875H CPU @ 2.30GHz, 8 cores, 64 GB RAM,
Windows 64-bit system, and MATLAB R2021a.
To examine the influence of spectral information on method performance, we constructed three sets of spectral images with varying numbers of spectral bands chosen
specifically for application to water and LCLU change:

•
•
•

A three-band set of images containing red, green, and blue bands (RGB);
A six-band set of images containing red, green, blue, NIR, SWIR1, and SWIR2;
A 10-band set of images containing red, green, blue, NIR, SWIR-1, SWIR-2, ultra-blue,
and bands 5, 6, and 7, which correspond to the vegetation red edge.

To evaluate the overall performance of the methods, we used three metrics: Cohen’s
Kappa coefficient [50], the Jaccard index [51], and the F-1 score [52,53]. Cohen’s Kappa
coefficient provides a measure of consistency and reliability in classification tasks. The
Jaccard index, also referred to as the intersection over union, measures the overlap between
labels and predictions, emphasizing true positives over true negatives. The F1 measure
is the harmonic mean between precision and recall and does not take true negatives into
account. As a result, the changed-area accuracy is not affected by the ‘no change’ area
accuracy, which is high because of the number of pixels. We did not present accuracy
scores, as these can be misleadingly high (as seen in Appendix A Table A4 in the Accuracy
column) and not good indicators relative to other metrics due to severe class imbalance.
3. Results
In this section, we present the results of multi-class change detection on AGM ponds
in multispectral images that were obtained from focal (MDD) and out-of-sample prediction
regions. Results from change detection analyses using binary classes (change/no change)
can be found in Appendix A, Tables A6 and A7.
The overall performance of the two approaches, across testing regions and using all
testing sets with respect to the number of channels, ranged from 0.19 (± 0.06) to 0.92 (± 0.04).
The inclusion of increased spectral information (channels) generally increased performance.
Among all experimental settings, the greatest average result of multi-class change classification by E-ReCNN was a Cohen’s Kappa of 0.92 (± 0.04), a Jaccard value of 0.88 (± 0.07),
and an F1 of 0.88 (± 0.05) for histogram-matched 6-Channel set images (Accuracy value
0.99 ((± 0.04), as seen in Appendix A Table A4). In contrast, the greatest average result of
a multi-class change by SVM-STV was a Cohen’s Kappa value of 0.63 (± 0.07), a Jaccard
value of 0.56 (± 0.06), and an F1 of 0.67 (± 0.06) for original (not preprocessed) 10-Channel
set images. These results were achieved on images from the MDD region training dataset.
The MDD-trained E-ReCNN approach applied to out-of-sample regions (Figure 6, right)
performed similarly to the results obtained in the focal MDD region (Figure 6, left), demonstrating the generalization of E-ReCNN across different spatial regions. The SVM-STV
approach performed less well on out-of-sample prediction, decreasing by 25% on average.

Remote Sens. 2022, 14, 1746

9 of 22

Figure 6. (left) Average scores of model performance across the 16 MDD regions for both E-ReCNN
and SVM-STV. The highest accuracies were generated with the 6-channel set of histogram-matched
data for E-ReCNN and with the 10-channel data for SVM-STV. Blue dots for the Kappa Coefficient
of SEVM-STV results indicate the outliers that are higher and lower than the variance line edges.
(right) Average scores of model performance for out-of-sample test regions in Indonesia, Myanmar,
and Venezuela for both E-ReCNN and SVM-STV. The highest accuracies were generated with the
6-channel set of histogram-matched data for E-ReCNN and with the 6-channel histogram-matched
data for SVM-STV. For both left and right, blue, orange, and gray boxes represent the distribution of
Cohen’s Kappa coefficients, Jaccard coefficient, and F1-scores, respectively.

Overall, the E-ReCNN model performance using the 6-channel histogram-matched
image sets from the 16 MDD regions resulted in outcomes with high levels of precision,
recall, and F1-score (Figure 7, left). Model F1-scores for ‘no change’ and ‘water existence’
classes were 0.99 and 0.96, respectively. F1-scores for ‘increase’ and ‘decrease’ classes were
slightly lower than ‘no change’ and ‘water existence’ classes, although the total quantity
of labeled pixels for those two classes was notably lower. This pattern of F1-scores across
classes was also seen in the out-of-sample regions (Figure 7, right). The total number of
classified pixels in these regions was significantly lower, and F1 values for the ‘decrease’ and
‘increase’ classes were 0.56 and 0.57, respectively. The performance metrics not biased by
smaller sample sizes, including Cohen’s Kappa and Jaccard coefficients, were higher than
0.9 for both the MDD regions as well as international out-of-sample regions. In contrast,
the SVM-STV model results for ‘water existence’, ‘increase’, and ‘decrease’ classes were less
accurate than the E-ReCNN model results, as shown in Figure 8 for the MDD regions (left)
and out-of-sample regions (right). F1-scores for the MDD region ‘increase’ and ‘decrease’
classes were lower using this semi-supervised method than the out-of-sample regions, as
modeled by E-ReCNN. Model results for the out-of-sample regions using SVM-STV were
very low with respect to F1-scores, below 0.15 for the ‘increase’ and ‘decrease’ classes.
Applying the E-ReCNN and SVM-STV models on image sets with a variety of spectral
channels provided inference regarding how each channel of Sentinel-2 influenced model
behavior. The 3-channel RGB image resulted in roughly equivalent F-1 scores for both the
E-ReCNN model and the SVM-STV model across the MDD regions (Figure 9). While the
addition of near-infrared and shortwave infrared channels (1 and 2), which are often used
to define water surfaces with the help of a water index (6 channel image), improved F-1
scores for both models, further including red edge channels (10 channel image), resulted in
no additional improvement. Notably, E-ReCNN results appeared to be more accurate than
SVM-STV for both the 6-channel and 10-channel image sets.

Remote Sens. 2022, 14, 1746

10 of 22

Figure 7. Confusion matrices for the E-ReCNN model for 6-Channel set histogram-matched images
from the MDD focal regions (left) and out-of-sample prediction regions (right). For both (left) and
(right), recall and precision matrices are featured to the right and below the main confusion matrix,
respectively. Arrays at the bottom of both (left) and (right) show the F1-score for each class.

Figure 8. Confusion matrices for the SVM-STV model for 10-Channel image sets from the MDD focal
regions (left) and 6-channel histogram-matched images for the out-of-sample regions (right). For
both (left) and (right), recall and precision matrices are featured to the right and below the main
confusion matrix, respectively. Arrays at the bottom of both (left) and (right) show the F1-score for
each class.

Remote Sens. 2022, 14, 1746

11 of 22

Figure 9. Analysis of multi-class results according to different numbers of channels by F1-score.
Results of histogram-matched images according to 3-, 6-, and 10-Channel sets are shown based on
F1-score. The E-ReCNN model results had higher accuracy than the SVM-STV model. The 6-Channel
results average was more accurate and had less standard deviation than the 3- and 10-Channel results.

4. Discussion
In the context of land-use change, particularly change associated with ASGM, understanding how features across a landscape change in size and reflectance can provide
critically important information for conservation and environmental policy enforcement.
We show that the extension of an existing ReCNN detects multi-temporal change across
landscape features when compared to an existing semi-supervised model (SVM-STV).
E-ReCNN outperformed SVM-STV and unsupervised methods considerably for both the
focal region in Madre de Dios as well as out-of-sample test regions with respect to F1,
precision, and recall. Notably, E-ReCNN generated greater F1, precision, and recall values
for the detection of water occurrence and the multi-temporal change in spectral response
for each pond feature. Estimates of precision and recall for pond sediment decreased (82.8%
and 86.1%) and increased (70.6% and 87.3%) within the MDD, showing that this method is
capable of generating multi-temporal feature-based change maps. These results provide
evidence that this method has wide applicability to the field of environmental change
detection and monitoring.
One ongoing challenge in the use of satellite data for change detection related to
how atmospheric conditions can cause complications when attempting to document finescale feature-oriented change. Although the major remote-sensing platforms, such as
Landsat, Sentinel, and MODIS, are routinely processed and corrected via well-established
and formalized techniques [54–57], persistent variability in surface reflectance from image
to image requires careful consideration when monitoring temporal trends. We tested a
number of data preprocessing approaches to understand how these challenges could be
addressed and to understand how steps can be taken to improve machine learning model
results. We found that histogram matching, which has primarily been used in remote
sensing to denoise atmospheric effects on image mosaics [58,59] and recently in change
detection [60–62], improved outcomes for the supervised model, E-ReCNN. In contrast,
with the Lab color space variables in the semi-supervised model, SVM-STV produced the
most accurate results. Some remote-sensing studies of surface water successfully identified
patterns and trends without using histogram-matching (e.g., [63–65]). However, we note
that these studies focus on large-scale changes in deep surface water extent/presence,
wherein atmospheric noise plays less of a factor. We find that these preprocessing steps
are necessary to achieve optimal results where we attempt to identify more subtle changes
in water reflectance. The preprocessing steps should be considered in land-use change
detection workflows, particularly if top-of-the-atmosphere products are utilized.

Remote Sens. 2022, 14, 1746

12 of 22

In addition to preprocessing methods, decisions regarding the inclusion of specific
channels of remotely sensed data into models for analyzing LCLU change dynamics are
important to ensure accurate outcomes. Critical tradeoffs between sensor spatial resolution,
temporal resolution, and the availability of spectral channels can constrain the scope of landcover change analysis. In the context of ASGM mining pond detection and classification,
where patterns across years and seasons are evident, newly established commercially
available satellite imagery (PlanetScope, DigitalGlobe) provide the temporal and spatial
resolution necessary to detect fine-scale changes; however, these products generally are
only available in a narrow set of channels. We found that the supervised E-ReCNN model
generated the best outcomes in the 6-Channel and 10-Channel datasets after histogram
matching, with significantly lower F1-scores in the 3-Channel dataset. When we applied
lifting using L*a*b color space variables, accuracies were either unchanged (for the 10channel dataset) or slightly decreased (for the 3- and 6-channel datasets). Consequently, we
conclude that the selection of RGB images for this type of change detection may result in
inferior outcomes compared to datasets with a greater number of channels in the infrared
and red-edge spectrum. Commercial satellite data that lack these channels may therefore
be limited in detecting important changes in aquatic systems, at least in comparison to
other options.
Our modeling results showed a notable difference in accuracy between supervised and
semi-supervised methods. Although the novel unsupervised learning methods presented
in the literature show a great deal of potential for change detection [66–68], when we
utilized one such unsupervised learning method [69], model performance results were
substantially weaker than those provided by E-ReCNN and SVM-STV. Thus, we did not
include detailed results regarding using unsupervised learning techniques for this problem.
Our semi-supervised method, SVM-STV, in general, fits the data effectively by making use
of a small fraction of labels, especially when only RGB data is provided. The results indicate
that if a small, labeled set of a mining region in MDD is retrieved, the SVM-STV method
can be trained on a desktop computer in a matter of minutes and produce reasonable
results for both binary and multi-class classification. In practice, users can decide the
number of expert-generated labels to acquire based on their needs, with the caveat that a
fully supervised model may be more accurate and precise. In addition, if RGB images are
necessary for detecting rapid change at localized scales, lifting using the La*b* color space
generates enhanced results compared to data that has not been preprocessed.
Supervised model performance varied across MDD training regions (Appendix A
Table A4) with respect to temporal change but was consistent across regions for detecting
change/no change. Change detection F1-scores were higher in regions using water cannons
relative to regions using earth-moving equipment. For example, Region 4 within La Pampa
is characterized by ovular ponds with distinct edges surrounded by bare ground (Figure 10,
top). This region has been heavily mined using suction pumps to displace water into
mining ponds and small sluices to separate fine sediment from larger stones and pebbles.
Comparatively, Region 12 in Huepetuhe (Figure 10, bottom) features the signature of the
use of bulldozers and excavators to move sediment for processing; consequently, this
region lacks distinct ponds with clear edges as in Region 4. We suspect that the lack of
defined edges of water bodies provided an additional challenge for convolutional filters
within E-ReCNN, leading to a decrease in the F1-score in Region 12. The results indicate
that regions where mechanized mining is more prevalent are modeled with lower values
for detecting increases and decreases in pond reflectance. Consequently, monitoring and
modeling directional pond change may be more difficult in areas with differing mining
typologies. However, outcomes for detecting change/no-change and water existence were
excellent for both methods (Appendix A Tables A6 and A7).

Remote Sens. 2022, 14, 1746

13 of 22

Figure 10. (a) True-color image composites of Region 4 in La Pampa (b) the overlay images of
semi-manual label maps and model-predicted results of Region 4, (c) zoom in the ponds of Region 4,
(d) True-color image composites of Region 12 in Huepetuhe (e) the overlay images of semi-manual
label maps and model-predicted results of Region 12, (f) zoom in the ponds of Region 12, and
(g) results table for two regions 4 and 12. These two different regions show how signatures of mining
using different practices may generate more or less uniform surface water bodies. In (b) and (e),
white and shades of gray represent accurate classification, shades of magenta represent overestimated
sediment, shades of green represent underestimated sediment, and black represents no detected
change. While Region 4 from La Pampa has deeper and more circular ponds that are separated by
sand, Region 12 from Huepetuhe has more shallow, small and intricate ponds mixed with sand and
bare ground, which appears to impact accuracy metrics.

Whereas model outcomes were generally accurate across MDD regions, with slight
differences between areas with different mining types, model results in the out-of-sample
international regions were slightly less accurate with respect to multi-class change detection.
However, the E-ReCNN out-of-sample results were still within 10% of the focal region
results. This method thus retains significant performance in detecting change/no change
and water occurrence in ASGM sites in different contexts and on different continents. With
respect to pond increases and decreases in turbidity, both supervised and semi-supervised
models generated significantly lower recall and precision for international sites compared to
the MDD region results. Semi-supervised results using SVM-STV were extremely inaccurate
(Figure 8, right), indicating that using this method is not advisable for accurate change
detection. Supervised model results were less accurate for these out-of-sample regions, but
still detected binary classes of change quite accurately overall. The construction of regional
label sets may improve performance for detailed questions regarding pond status, but for
general detection of AGM-associated mining ponds, the supervised model appears suitable
for inference worldwide. More thorough investigations at known mined sites across the

Remote Sens. 2022, 14, 1746

14 of 22

tropics would provide greater detail regarding the variability of model performance in
new regions.
5. Conclusions and Future Work
In this paper, we describe the creation of a unique ASGM Residual Ponds dataset
as well as a new supervised method (E-ReCNN) for detecting fine-scale changes in the
environment using satellite imagery. We show how this method compares favorably
to existing semi-supervised (SVM-STV) methods. We applied different preprocessing
operations on three image sets with different quantities of multispectral bands to analyze
their influence on the models’ results. For Sentinel-2 imagery, using a 6-band image
set generated model performance higher than other band combinations, even those that
included more spectral information. Pre-processing was essential to model performance,
even on well-curated Sentinel-2 data, increasing model F1-scores from roughly 0.71 to 0.88
for 6-band images. For fine-scale change detection, we conclude that these images need
noise reduction and calibration, such as histogram matching for E-ReCNN and the addition
of La*b* color space to the SVM-STV model. Given this finding, practitioners using other
change-detection methods on available satellite imagery, particularly with respect to water
detection, may benefit from revisiting their results and investigating whether inaccuracies
were due to preprocessing impacts.
Practitioners wishing to use the methods presented in this manuscript should consider
the practical and computational demands of both change detection models. We found that
classification performance is inverse to the computation demands for the two methods.
Since the SVM-STV model can be trained on local machines, it is an efficient solution under
the conditions of limited channels and resources. In contrast, because the E-ReCNN model
consists of CNN and LSTM subnetworks, the R-ReCNN model requires lengthy training
times on GPUs (Appendix A Table A3). However, it is worth noting that the E-ReCNN
model, once trained a single time, appears to be capable of extension to out-of-sample
regions with minimal loss in performance, and therefore once this process is completed,
this method can be applied globally.
Future work may allow for an improvement of the SVM-STV model, particularly
since the training size of labeled pixels used in this test was small and likely contained
outliers and noisy pixels that could affect the quality of the model. Although histogram
matching reduces radiometric differences in bitemporal images, the disparities among
training regions can be significant and influential. Instead of randomly selecting training
pixels for a generalized model, kernel density estimation may be used as an indicator
that gives information about the “commonness” of each pixel [69,70]. This allows for the
exclusion of outliers by only selecting pixels at high densities, generating more consistent
test results. Furthermore, the SVM-STV model may be improved by including an active
learning scheme, which takes into account the practical condition that there is a restricted
budget for label collection. The diffusion geometry of the data can be used to push the
approach even further by reducing the number of labels needed but producing greater
performance [69–71].
Follow-up work on E-ReCNN may allow for the application of this model to other
landscapes and environmental topics. While we investigated bi-temporal imagery sets
in this analysis, the performance of E-ReCNN across a multitemporal image set may
offer information regarding model transferability for decadal estimates of change across
a landscape. Furthermore, testing E-ReCNN for use with other environmental features
for the detection of change, such as fields, roads, and vegetation patches, may allow for a
broad expansion of this supervised method to help monitor environmental change in other
contexts and locations.

Remote Sens. 2022, 14, 1746

15 of 22

Author Contributions: Conceptualization, V.P.P., D.A.L., M.S., L.E.F. and S.A.; methodology, V.P.P.,
S.A., R.C., S.C. and K.C.; software, S.C. and K.C.; validation, V.P.P., D.A.L., M.S., S.A., S.C. and
K.C.; formal analysis, S.C. and K.C.; investigation, S.C. and K.C.; resources, S.C. and E.N.D.; data
curation, S.C.; writing—original draft preparation, S.C., K.C. and D.A.L.; writing—review and editing,
V.P.P., D.A.L., M.S., S.A., R.C., L.E.F., E.N.D. and R.J.P.; visualization, S.C.; project administration,
D.A.L.; funding acquisition, D.A.L. All authors have read and agreed to the published version of
the manuscript.
Funding: This research was funded by NASA’s Land Cover Land Use Change Program award
80NSSC21K0309, USAID Cooperative Agreement #72052721CA00005, and a Neukom Postdoctoral
Fellowship to E.N.D.
Institutional Review Board Statement: Not applicable.
Informed Consent Statement: Not applicable.
Data Availability Statement: The data that support the findings of this study are openly available in
Zenodo at https://doi.org/10.5281/zenodo.6400211. Uploaded on 31 March 2022.
Acknowledgments: Computations were performed using the Wake Forest University (WFU) High
Performance Computing Facility, a centrally managed computational resource available to WFU
researchers, including faculty, staff, students, and collaborators.
Conflicts of Interest: The authors declare no conflict of interest.

Appendix A
Table A1. The regions in Figure 2 with their sizes in pixel and km2 area and their latitude and
longitude of left bottom and right top.
Region Number

Size in Pixels

Area in Km2

Left Bottom

Right Top

Region-1
Region-2
Region-3
Region-4
Region-5
Region-6
Region-7
Region-8
Region-9
Region-10
Region-11
Region-12
Region-13
Region-14
Region-15
Region-16

667 × 654
667 × 655
556 × 546
556 × 545
1109 × 548
667 × 655
888 × 482
556 × 545
556 × 546
555 × 438
1109 × 657
1333 × 659
894 × 1309
1337 × 1311
1560 × 1748
668 × 655

43.37
43.37
30.12
30.12
60.25
43.38
42.42
30.13
30.13
24.1
86.72
86.12
115.66
173.56
270.11
43.38

13◦ 010 51.900 S 69◦ 550 29.500 W
13◦ 010 21.800 S 69◦ 580 37.300 W
13◦ 000 27.300 S 70◦ 000 54.000 W
13◦ 000 43.600 S 70◦ 030 19.600 W
12◦ 590 42.400 S 70◦ 020 36.000 W
12◦ 590 22.400 S 70◦ 060 47.800 W
12◦ 570 16.300 S 70◦ 040 57.000 W
12◦ 530 31.700 S 70◦ 030 35.800 W
12◦ 550 34.600 S 70◦ 010 14.700 W
12◦ 530 19.300 S 69◦ 590 47.200 W
12◦ 510 48.200 S 69◦ 570 52.100 W
13◦ 050 46.400 S 70◦ 310 00.800 W
13◦ 020 14.200 S 70◦ 390 33.200 W
12◦ 560 48.500 S 70◦ 380 10.100 W
12◦ 490 54.800 S 70◦ 350 44.900 W
12◦ 570 55.200 S 70◦ 160 12.700 W

12◦ 580 15.900 S 69◦ 510 53.500 W
12◦ 570 45.800 S 69◦ 550 01.300 W
12◦ 570 27.300 N 69◦ 570 54.000 W
12◦ 570 43.600 S 70◦ 000 19.600 W
12◦ 530 42.400 S 69◦ 590 36.000 W
12◦ 550 46.400 S 70◦ 030 11.800 W
12◦ 520 28.300 S 70◦ 020 18.600 W
12◦ 500 31.700 S 70◦ 000 35.800 W
12◦ 520 34.600 S 69◦ 580 14.700 W
12◦ 500 19.300 S 69◦ 570 23.200 W
12◦ 450 48.200 S 69◦ 540 16.100 W
12◦ 580 34.400 S 70◦ 270 24.800 W
12◦ 570 26.200 S 70◦ 320 21.200 W
12◦ 490 36.500 S 70◦ 300 58.100 W
12◦ 410 30.800 S 70◦ 260 08.900 W
12◦ 540 19.200 S 70◦ 120 36.700 W

Table A2. Configuration of optimal model parameters for supervised (E-ReCNN) and semisupervised (SVM-STV) models.
E-ReCNN
(TensorFlow Framework)

SVM-STV

Nesterov Adam − β1 = 0.9, β2 = 0.999, ∈= 1 × 10−7
Learning rate − 1 × 10−3
Glorot uniform initializer − uniform distribution
The two parameters of ν-SVC:
Nu: 0–0.2, Gamma: 1/(n + 2) − 1/(n − 2), where n is the number of bands.
The denoising parameters:
Alpha1: 0–1, Alpha2: [0, 0.5, 1, 2], Mu: 5.
The above five parameters are tuned on each of the 16 training regions.

Remote Sens. 2022, 14, 1746

16 of 22

Table A3. Calculated costs of model training.
Number of Epochs:
75
Number of Trials:
10

E-ReCNN
(Wake Forest University DEAC HPC cluster)
SVM-STV
(Local machine)

Total Loss:
0.0208
Training Error:
Controlled by Nu

Time per epoch:
548 s
Time per trial:
3 s to 94 s

Table A4. Accuracies of regions and their areas for the E-ReCNN model for histogram-matched
6-Channel images. Region 4 and Region 12 were analyzed in Discussion section and given as an
example of the difference kind of ponds.
Area

Number of
Regions

Accuracy

Kappa
Coef.

Jaccard
Coef.

F1-Score

No
Change

Decrease

Increase

Water
Existence

La Pampa

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

0.989
0.979
0.978
0.986
0.978
0.979
0.987
0.996
0.986
0.995
0.996

0.932
0.880
0.891
0.945
0.913
0.879
0.951
0.984
0.924
0.983
0.977

0.889
0.814
0.826
0.916
0.863
0.807
0.921
0.974
0.875
0.973
0.961

0.941
0.893
0.918
0.954
0.923
0.868
0.887
0.904
0.914
0.930
0.799

0.995
0.990
0.988
0.993
0.988
0.989
0.993
0.998
0.993
0.997
0.998

0.938
0.911
0.923
0.969
0.924
0.852
0.884
0.774
0.869
0.805
0.460

0.865
0.726
0.813
0.896
0.819
0.660
0.685
0.854
0.847
0.927
0.752

0.965
0.945
0.948
0.956
0.964
0.969
0.985
0.991
0.950
0.990
0.988

Huepetuhe

12
13

0.987
0.994

0.864
0.951

0.776
0.917

0.780
0.848

0.994
0.997

0.450
0.659

0.766
0.754

0.910
0.983

Delta

14
15

0.989
0.985

0.924
0.930

0.884
0.889

0.855
0.839

0.995
0.992

0.686
0.636

0.772
0.740

0.970
0.987

Inambari
Tributary

16

0.987

0.832

0.740

0.795

0.994

0.547

0.786

0.854

Table A5. The regions in the different parts of the world with their sizes in pixels and km2 area and
latitude and longitude of left bottom and right top.
Region
Number

Time1

Time2

Size in
Pixels

Area in
km2

Indonesia-1

20 August 2018

7 April 2019

666 × 667

44.51

Myanmar-2

3 December 2018

20 March 2021

664 × 668

43.54

Venezuela-3

10 December 2018

20 September 2020

666 × 667

44.25

Venezuela-4

10 December 2018

20 September 2020

666 × 667

44.25

Venezuela-5

10 December 2018

20 September 2020

556 × 556

30.73

Venezuela-6

10 December 2018

20 September 2020

887 × 490

43.27

Venezuela-7

10 December 2018

20 September 2020

666 × 667

44.25

Left Bottom

Right Top

0◦ 440 39.400 N
110◦ 420 25.300 E
11◦ 560 19.200 N
99◦ 160 20.400 E
6◦ 110 42.900 N
61◦ 330 15.900 W
6◦ 080 07.300 N
61◦ 290 46.000 W
6◦ 100 19.600 N
61◦ 290 24.800 W
6◦ 080 47.200 N
61◦ 310 18.500 W
6◦ 100 07.400 N
61◦ 270 48.500 W

0◦ 480 15.400 N
110◦ 460 01.300 E
11◦ 590 55.200 N
99◦ 190 56.400 E
6◦ 150 18.900 N
61◦ 290 39.900 W
6◦ 110 43.300 N
61◦ 260 10.000 W
6◦ 130 19.600 N
61◦ 260 24.800 W
6◦ 130 35.200 N
61◦ 280 40.100 W
6◦ 130 43.400 N
61◦ 240 12.500 W

Remote Sens. 2022, 14, 1746

17 of 22

Table A6. Binary Change detection results for the E-ReCNN method. Different channels results
represented with background and the highest result with the minimum channel was 6 Channel results
shown with bold text.

3 Channel
Original Images

6 Channel
10 Channel
3 Channel

Histogram-Matched Images

6 Channel
10 Channel
3 Channel

Histogram-Matched
+ Lab Lifted Images

6 Channel
10 Channel

Average
Std Dev
Average
Std Dev
Average
Std Dev
Average
Std Dev
Average
Std Dev
Average
Std Dev
Average
Std Dev
Average
Std Dev
Average
Std Dev

Kappa Coef.
0.63
0.13
0.71
0.23
0.70
0.25
0.53
0.11
0.92
0.04
0.92
0.04
0.45
0.16
0.92
0.04
0.91
0.04

Jaccard Coef.
0.52
0.12
0.63
0.21
0.62
0.23
0.42
0.11
0.87
0.07
0.87
0.07
0.37
0.14
0.87
0.07
0.86
0.07

F1-Score
0.81
0.07
0.84
0.16
0.83
0.17
0.76
0.06
0.96
0.02
0.96
0.02
0.71
0.10
0.96
0.02
0.96
0.02

Table A7. Binary Change detection results for the SVM-STV method. Different channels results
represented with background.

3 Channel
Original Images

6 Channel
10 Channel
3 Channel

Histogram-Matched Images

6 Channel
10 Channel
3 Channel

Histogram-Matched + Lab-Lifted
Images

6 Channel
10 Channel

Average
Std Dev
Average
Std Dev
Average
Std Dev
Average
Std Dev
Average
Std Dev
Average
Std Dev
Average
Std Dev
Average
Std Dev
Average
Std Dev

Kappa Coef.
0.44
0.10
0.62
0.08
0.67
0.07
0.52
0.09
0.64
0.07
0.62
0.09
0.61
0.07
0.64
0.08
0.62
0.08

Jaccard Coef.
0.60
0.06
0.71
0.05
0.74
0.04
0.65
0.06
0.72
0.04
0.71
0.05
0.71
0.04
0.72
0.04
0.71
0.04

F1-Score
0.72
0.06
0.81
0.04
0.84
0.03
0.76
0.05
0.82
0.03
0.81
0.05
0.80
0.04
0.82
0.04
0.81
0.04

Remote Sens. 2022, 14, 1746

18 of 22

Appendix B

Figure A1. All images in MDD were used for LoRo experiments.

Figure A2. All Test images from Indonesia, Myanmar, and Venezuela.

Remote Sens. 2022, 14, 1746

19 of 22

Figure A3. Binary change detection best performance.

Figure A4. Binary Change Detection F1-Score for different channels.

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

Dethier, E.N.; Sartain, S.L.; Lutz, D.A. Heightened Levels and Seasonal Inversion of Riverine Suspended Sediment in a Tropical
Biodiversity Hot Spot Due to Artisanal Gold Mining. Proc. Natl. Acad. Sci. USA 2019, 116, 23936–23941. [CrossRef] [PubMed]
Alvarez-Berrios, N.L.; Mitchell Aide, T. Global Demand for Gold Is Another Threat for Tropical Forests. Environ. Res. Lett. 2015,
10, 14006. [CrossRef]
Kahhat, R.; Parodi, E.; Larrea-Gallegos, G.; Mesta, C.; Vázquez-Rowe, I. Environmental Impacts of the Life Cycle of Alluvial Gold
Mining in the Peruvian Amazon Rainforest. Sci. Total Environ. 2019, 662, 940–951. [CrossRef] [PubMed]
Caballero Espejo, J.; Messinger, M.; Román-Dañobeytia, F.; Ascorra, C.; Fernandez, L.E.; Silman, M. Deforestation and Forest
Degradation Due to Gold Mining in the Peruvian Amazon: A 34-Year Perspective. Remote Sens. 2018, 10, 1903. [CrossRef]
Taiwo, A.M.; Awomeso, J.A. Assessment of Trace Metal Concentration and Health Risk of Artisanal Gold Mining Activities in
Ijeshaland, Osun State Nigeria–Part 1. J. Geochem. Explor. 2017, 177, 1–10. [CrossRef]
Owusu-Nimo, F.; Mantey, J.; Nyarko, K.B.; Appiah-Effah, E.; Aubynn, A. Spatial Distribution Patterns of Illegal Artisanal Small
Scale Gold Mining (Galamsey) Operations in Ghana: A Focus on the Western Region. Heliyon 2018, 4, e00534. [CrossRef]
[PubMed]
Bounliyong, P.; Itaya, T.; Arribas, A.; Watanabe, Y.; Wong, H.; Echigo, T. K–Ar Geochronology of Orogenic Gold Mineralization
in the Vangtat Gold Belt, Southeastern Laos: Effect of Excess Argon in Hydrothermal Quartz. Resour. Geol. 2021, 71, 161–175.
[CrossRef]
Kimijima, S.; Sakakibara, M.; Nagai, M. Detection of Artisanal and Small-Scale Gold Mining Activities and Their Transformation
Using Earth Observation, Nighttime Light, and Precipitation Data. Int. J. Environ. Res. Public Health 2021, 18, 10954. [CrossRef]
Gonzalez, D.J.X.; Arain, A.; Fernandez, L.E. Mercury Exposure, Risk Factors, and Perceptions among Women of Childbearing
Age in an Artisanal Gold Mining Region of the Peruvian Amazon. Environ. Res. 2019, 179, 108786. [CrossRef] [PubMed]
Gerson, J.R.; Topp, S.N.; Vega, C.M.; Gardner, J.R.; Yang, X.; Fernandez, L.E.; Bernhardt, E.S.; Pavelsky, T.M. Artificial Lake
Expansion Amplifies Mercury Pollution from Gold Mining. Sci. Adv. 2020, 6, eabd4953. [CrossRef] [PubMed]
Swenson, J.J.; Carter, C.E.; Domec, J.-C.; Delgado, C.I. Gold Mining in the Peruvian Amazon: Global Prices, Deforestation, and
Mercury Imports. PLoS ONE 2011, 6, e18875. [CrossRef] [PubMed]

Remote Sens. 2022, 14, 1746

12.
13.
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

32.
33.

34.
35.
36.
37.

20 of 22

Cooley, S.; Smith, L.; Stepan, L.; Mascaro, J. Tracking Dynamic Northern Surface Water Changes with High-Frequency Planet
CubeSat Imagery. Remote Sens. 2017, 9, 1306. [CrossRef]
Zou, Z.; Dong, J.; Menarguez, M.A.; Xiao, X.; Qin, Y.; Doughty, R.B.; Hooker, K.V.; David Hambright, K. Continued Decrease of
Open Surface Water Body Area in Oklahoma during 1984–2015. Sci. Total Environ. 2017, 595, 451–460. [CrossRef] [PubMed]
Wang, C.; Jia, M.; Chen, N.; Wang, W. Long-Term Surface Water Dynamics Analysis Based on Landsat Imagery and the Google
Earth Engine Platform: A Case Study in the Middle Yangtze River Basin. Remote Sens. 2018, 10, 1635. [CrossRef]
Kruger, N.; Janssen, P.; Kalkan, S.; Lappe, M.; Leonardis, A.; Piater, J.; Rodriguez-Sanchez, A.J.; Wiskott, L. Deep Hierarchies in
the Primate Visual Cortex: What Can We Learn for Computer Vision? IEEE Trans. Pattern Anal. Mach. Intell. 2013, 35, 1847–1871.
[CrossRef]
Camalan, S.; Niazi, M.K.K.; Moberly, A.C.; Teknos, T.; Essig, G.; Elmaraghy, C.; Taj-Schaal, N.; Gurcan, M.N. OtoMatch:
Content-Based Eardrum Image Retrieval Using Deep Learning. PLoS ONE 2020, 15, e0232776. [CrossRef] [PubMed]
Morchhale, S.; Pauca, V.P.; Plemmons, R.J.; Torgersen, T.C. Classification of Pixel-Level Fused Hyperspectral and Lidar Data
Using Deep Convolutional Neural Networks. In Proceedings of the 2016 8th Workshop on Hyperspectral Image and Signal
Processing: Evolution in Remote Sensing (WHISPERS), Los Angeles, CA, USA, 21–24 August 2016; pp. 1–5. [CrossRef]
Camalan, S.; Mahmood, H.; Binol, H.; Araújo, A.L.D.; Santos-Silva, A.R.; Vargas, P.A.; Lopes, M.A.; Ali, K.S.; Gurcan, M.N.
Convolutional Neural Network-Based Clinical Predictors of Oral Dysplasia: Class Activation Map Analysis of Deep Learning
Results. Cancers 2021, 13, 1291. [CrossRef] [PubMed]
Yuan, X.; Shi, J.; Gu, L. A Review of Deep Learning Methods for Semantic Segmentation of Remote Sensing Imagery. Expert Syst.
Appl. 2021, 169, 114417. [CrossRef]
Mohan, A.; Singh, A.K.; Kumar, B.; Dwivedi, R. Review on Remote Sensing Methods for Landslide Detection Using Machine and
Deep Learning. Trans. Emerg. Telecommun. Technol. 2021, 32, e3998. [CrossRef]
Hoeser, T.; Kuenzer, C. Object Detection and Image Segmentation with Deep Learning on Earth Observation Data: A Review-Part
I: Evolution and Recent Trends. Remote Sens. 2020, 12, 1667. [CrossRef]
Hoeser, T.; Bachofer, F.; Kuenzer, C. Object Detection and Image Segmentation with Deep Learning on Earth Observation Data: A
Review—Part II: Applications. Remote Sens. 2020, 12, 3053. [CrossRef]
Khelifi, L.; Mignotte, M. Deep Learning for Change Detection in Remote Sensing Images: Comprehensive Review and MetaAnalysis. IEEE Access 2020, 8, 126385–126400. [CrossRef]
Lyu, H.; Lu, H.; Mou, L. Learning a Transferable Change Rule from a Recurrent Neural Network for Land Cover Change
Detection. Remote Sens. 2016, 8, 506. [CrossRef]
Ienco, D.; Gaetano, R.; Dupaquier, C.; Maurel, P. Land Cover Classification via Multitemporal Spatial Data by Deep Recurrent
Neural Networks. IEEE Geosci. Remote Sens. Lett. 2017, 14, 1685–1689. [CrossRef]
Rußwurm, M.; Körner, M. Temporal Vegetation Modelling Using Long Short-Term Memory Networks for Crop Identification
from Medium-Resolution Multi-Spectral Satellite Images. In Proceedings of the IEEE Conference on Computer Vision and Pattern
Recognition Workshops, Venice, Italy, 22–29 October 2017; pp. 11–19.
Zhong, L.; Hu, L.; Zhou, H. Deep Learning Based Multi-Temporal Crop Classification. Remote Sens. Environ. 2019, 221, 430–443.
[CrossRef]
Mou, L.; Bruzzone, L.; Zhu, X.X. Learning Spectral-Spatial-Temporal Features via a Recurrent Convolutional Neural Network for
Change Detection in Multispectral Imagery. IEEE Trans. Geosci. Remote Sens. 2019, 57, 924–935. [CrossRef]
Asner, G.P.; Tupayachi, R. Accelerated Losses of Protected Forests from Gold Mining in the Peruvian Amazon. Environ. Res. Lett.
2016, 12, 094004. [CrossRef]
Dethier, E.N.; Silman, M.; Fernandez, L.E.; Espejo, J.C.; Alqahtani, S.; Pauca, P.V.; Lutz, D.A. Operation Mercury: Impacts of
National-Level Military-Based Enforcement Strategy and COVID-19 on Artisanal Gold Mining and Water Quality in a Biodiversity
Hotspot in the Peruvian Amazon. (under review to the Conservation Letter journal and revision submitted on 26 January 2022).
Drusch, M.; del Bello, U.; Carlier, S.; Colin, O.; Fernandez, V.; Gascon, F.; Hoersch, B.; Isola, C.; Laberinti, P.; Martimort, P.; et al.
Sentinel-2: ESA’s Optical High-Resolution Mission for GMES Operational Services. Remote Sens. Environ. 2012, 120, 25–36.
[CrossRef]
Cordeiro, M.C.R.; Martinez, J.M.; Peña-Luque, S. Automatic Water Detection from Multidimensional Hierarchical Clustering for
Sentinel-2 Images and a Comparison with Level 2A Processors. Remote Sens. Environ. 2021, 253, 112209. [CrossRef]
Pahlevan, N.; Smith, B.; Schalles, J.; Binding, C.; Cao, Z.; Ma, R.; Alikas, K.; Kangro, K.; Gurlin, D.; Hà, N.; et al. Seamless
Retrievals of Chlorophyll-a from Sentinel-2 (MSI) and Sentinel-3 (OLCI) in Inland and Coastal Waters: A Machine-Learning
Approach. Remote Sens. Environ. 2020, 240, 111604. [CrossRef]
Chan, R.H.; Kan, K.K.; Nikolova, M.; Plemmons, R.J. A Two-Stage Method for Spectral–Spatial Classification of Hyperspectral
Images. J. Math. Imaging Vis. 2020, 62, 790–807. [CrossRef]
Peng, D.; Zhang, Y.; Guan, H. End-to-End Change Detection for High Resolution Satellite Images Using Improved UNet++.
Remote Sens. 2019, 11, 1382. [CrossRef]
Chen, L.; Zhang, D.; Li, P.; Lv, P. Change Detection of Remote Sensing Images Based on Attention Mechanism. Comput. Intell.
Neurosci. 2020, 2020, 6430627. [CrossRef]
Melgani, F.; Bruzzone, L. Classification of Hyperspectral Remote Sensing Images with Support Vector Machines. IEEE Trans.
Geosci. Remote Sens. 2004, 42, 1778–1790. [CrossRef]

Remote Sens. 2022, 14, 1746

38.
39.
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
63.
64.
65.
66.
67.

21 of 22

Camps-Valls, G.; Bruzzone, L. Kernel-Based Methods for Hyperspectral Image Classification. IEEE Trans. Geosci. Remote Sens.
2005, 43, 1351–1362. [CrossRef]
Camps-Valls, G.; Gomez-Chova, L.; Muñoz-Marí, J.; Vila-Francés, J.; Calpe-Maravilla, J. Composite Kernels for Hyperspectral
Image Classification. IEEE Geosci. Remote Sens. Lett. 2006, 3, 93–97. [CrossRef]
Rotaru, C.; Graf, T.; Zhang, J. Color Image Segmentation in HSI Space for Automotive Applications. J. Real-Time Image Processing
2008, 3, 311–322. [CrossRef]
Paschos, G. Perceptually Uniform Color Spaces for Color Texture Analysis: An Empirical Evaluation. IEEE Trans. Image Process.
2001, 10, 932–937. [CrossRef]
Cardelino, J.; Caselles, V.; Bertalmío, M.; Randall, G. A Contrario Selection of Optimal Partitions for Image Segmentation. SIAM J.
Imaging Sci. 2013, 6, 1274–1317. [CrossRef]
Cai, X.; Chan, R.; Nikolova, M.; Zeng, T. A Three-Stage Approach for Segmenting Degraded Color Images: Smoothing, Lifting
and Thresholding (SLaT). J. Sci. Comput. 2017, 72, 1313–1332. [CrossRef]
Schölkopf, B.; Smola, A.J.; Williamson, R.C.; Bartlett, P.L. New Support Vector Algorithms. Neural Comput. 2000, 12, 1207–1245.
[CrossRef] [PubMed]
Hsu, C.W.; Lin, C.J. A Comparison of Methods for Multiclass Support Vector Machines. IEEE Trans. Neural Netw. 2002, 13,
415–425. [CrossRef] [PubMed]
Binol, H.; Plotner, A.; Sopkovich, J.; Kaffenberger, B.; Niazi, M.K.K.; Gurcan, M.N. Ros-NET: A Deep Convolutional Neural
Network for Automatic Identification of Rosacea Lesions. Skin Res. Technol. 2020, 26, 413–421. [CrossRef] [PubMed]
Dozat, T. Workshop Track-ICLR 2016 INCORPORATING NESTEROV MOMENTUM INTO ADAM. In Proceedings of the
International Conference on Learning Representations Workshop, San Juan, Puerto Rico, 2–4 May 2016.
Tato, A.; Nkambou, R. Improving ADAM Optimizer. In Proceedings of the Workshop Track-ICLR 2018, Vancouver, BC, Canada,
30 April–3 May 2018.
Information Systems and Wake Forest University. WFU High Performance Computing Facility. Available online: https:
//is.wfu.edu/services/high-performance-computing/ (accessed on 27 February 2022). [CrossRef]
Cohen, J. A Coefficient of Agreement for Nominal Scales. Educ. Psychol. Meas. 1960, 20, 37–46. [CrossRef]
Jaccard, P. Distribution de La Flore Alpine Dans Le Bassin Des Dranses et Dans Quelques Regions Voisines. Bull. De La Société
Vaud. Des Sci. Nat. 1901, 37, 241–272.
Dice, L.R. Measures of the Amount of Ecologic Association Between Species. Ecology 1945, 26, 297–302. [CrossRef]
Sørensen, T. A Method of Establishing Groups of Equal Amplitude in Plant Sociology Based on Similarity. K. Dan. Vidensk. Selsk.
Biol. Skr. 1948, 5, 1–34.
Lyapustin, A.I.; Wang, Y.; Laszlo, I.; Hilker, T.; Hall, F.G.; Sellers, P.J.; Tucker, C.J.; Korkin, S.V. Multi-Angle Implementation of
Atmospheric Correction for MODIS (MAIAC): 3. Atmospheric Correction. Remote Sens. Environ. 2012, 127, 385–393. [CrossRef]
Claverie, M.; Ju, J.; Masek, J.G.; Dungan, J.L.; Vermote, E.F.; Roger, J.C.; Skakun, S.V.; Justice, C. The Harmonized Landsat and
Sentinel-2 Surface Reflectance Data Set. Remote Sens. Environ. 2018, 219, 145–161. [CrossRef]
Vermote, E.; Justice, C.; Claverie, M.; Franch, B. Preliminary Analysis of the Performance of the Landsat 8/OLI Land Surface
Reflectance Product. Remote Sens. Environ. 2016, 185, 46–56. [CrossRef]
Masek, J.G.; Vermote, E.F.; Saleous, N.E.; Wolfe, R.; Hall, F.G.; Huemmrich, K.F.; Gao, F.; Kutler, J.; Lim, T.K. A Landsat Surface
Reflectance Dataset for North America, 1990–2000. IEEE Geosci. Remote Sens. Lett. 2006, 3, 68–72. [CrossRef]
Tai, Y.W.; Jia, J.; Tang, C.K. Local Color Transfer via Probabilistic Segmentation by Expectation-Maximization. In Proceedings of
the 2005 IEEE Computer Society Conference on Computer Vision and Pattern Recognition, CVPR 2005, San Diego, CA, USA,
20–26 June 2005; Volume I. [CrossRef]
Bruzzone, L.; Prieto, D.F.; Serpico, S.B. A Neural-Statistical Approach to Multitemporal and Multisource Remote-Sensing Image
Classification. IEEE Trans. Geosci. Remote Sens. 1999, 37, 1350–1359. [CrossRef]
Wiratama, W.; Lee, J.; Sim, D. Change Detection on Multi-Spectral Images Based on Feature-Level U-Net. IEEE Access 2020, 8,
12279–12289. [CrossRef]
Chen, H.; Wu, C.; Du, B.; Zhang, L.; Wang, L. Change Detection in Multisource VHR Images via Deep Siamese Convolutional
Multiple-Layers Recurrent Neural Network. IEEE Trans. Geosci. Remote Sens. 2020, 58, 2848–2864. [CrossRef]
Kartal, H.; Alganci, U.; Sertel, E. Histogram Matching Based Mosaicking of SPOT 6/7 Satellite Images. In Proceedings of the 9th
International Conference on Recent Advances in Space Technologies, RAST 2019, Istanbul, Turkey, 10–14 June 2019. [CrossRef]
Wieland, M.; Martinis, S. Large-Scale Surface Water Change Observed by Sentinel-2 during the 2018 Drought in Germany. Int. J.
Remote Sens. 2020, 41, 4742–4756. [CrossRef]
Zeng, Y.; Yang, X.; Fang, N.; Shi, Z. Large-Scale Afforestation Significantly Increases Permanent Surface Water in China’s
Vegetation Restoration Regions. Agric. For. Meteorol. 2020, 290, 108001. [CrossRef]
Ji, L.; Gong, P.; Wang, J.; Shi, J.; Zhu, Z. Construction of the 500-m Resolution Daily Global Surface Water Change Database
(2001–2016). Water Resour. Res. 2018, 54, 10–270. [CrossRef]
Shao, P.; Shi, W.; He, P.; Hao, M.; Zhang, X. Novel Approach to Unsupervised Change Detection Based on a Robust SemiSupervised FCM Clustering Algorithm. Remote Sens. 2016, 8, 264. [CrossRef]
Liu, S.; Marinelli, D.; Bruzzone, L.; Bovolo, F. A Review of Change Detection in Multitemporal Hyperspectral Images: Current
Techniques, Applications, and Challenges. IEEE Geosci. Remote Sens. Mag. 2019, 7, 140–158. [CrossRef]

Remote Sens. 2022, 14, 1746

68.
69.
70.
71.

22 of 22

Liu, S.; Du, Q.; Tong, X.; Samat, A.; Bruzzone, L.; Bovolo, F. Multiscale Morphological Compressed Change Vector Analysis for
Unsupervised Multiple Change Detection. IEEE J. Sel. Top. Appl. Earth Obs. Remote Sens. 2017, 10, 4124–4137. [CrossRef]
Maggioni, M.; Murphy, J.M. Learning by Unsupervised Nonlinear Diffusion. J. Mach. Learn. Res. 2019, 20, 1–56.
Murphy, J.M.; Maggioni, M. Unsupervised Clustering and Active Learning of Hyperspectral Images with Nonlinear Diffusion.
IEEE Trans. Geosci. Remote Sens. 2019, 57, 1829–1845. [CrossRef]
Polk, S.L.; Murphy, J.M. Multiscale Clustering of Hyperspectral Images Through Spectral-Spatial Diffusion Geometry. In
Proceedings of the 2021 IEEE International Geoscience and Remote Sensing Symposium IGARSS, Brussels, Belgium, 11–16 July
2021; pp. 4688–4691. [CrossRef]


```

---

## Referencia BibTeX

```bibtex
@article{camalanChangeDetectionAmazonian2022c,
  title = {Change {{Detection}} of {{Amazonian Alluvial Gold Mining Using Deep Learning}} and {{Sentinel-2 Imagery}}},
  author = {Camalan, Seda and Cui, Kangning and Pauca, Victor Paul and Alqahtani, Sarra and Silman, Miles and Chan, Raymond and Plemmons, Robert Jame and Dethier, Evan Nylen and Fernandez, Luis E. and Lutz, David A.},
  year = 2022,
  month = jan,
  journal = {Remote Sensing},
  volume = {14},
  number = {7},
  pages = {1746},
  publisher = {Multidisciplinary Digital Publishing Institute},
  issn = {2072-4292},
  doi = {10.3390/rs14071746},
  urldate = {2026-07-10},
  abstract = {Monitoring changes within the land surface and open water bodies is critical for natural resource management, conservation, and environmental policy. While the use of satellite imagery for these purposes is common, fine-scale change detection can be a technical challenge. Difficulties arise from variable atmospheric conditions and the problem of assigning pixels to individual objects. We examined the degree to which two machine learning approaches can better characterize change detection in the context of a current conservation challenge, artisanal small-scale gold mining (ASGM). We obtained Sentinel-2 imagery and consulted with domain experts to construct an open-source labeled land-cover change dataset. The focus of this dataset is the Madre de Dios (MDD) region in Peru, a hotspot of ASGM activity. We also generated datasets of active ASGM areas in other countries (Venezuela, Indonesia, and Myanmar) for out-of-sample testing. With these labeled data, we utilized a supervised (E-ReCNN) and semi-supervised (SVM-STV) approach to study binary and multi-class change within mining ponds in the MDD region. Additionally, we tested how the inclusion of multiple channels, histogram matching, and La*b* color metrics improved the performance of the models and reduced the influence of atmospheric effects. Empirical results show that the supervised E-ReCNN method on 6-Channel histogram-matched images generated the most accurate detection of change not only in the focal region (Kappa: 0.92 (\textpm{} 0.04), Jaccard: 0.88 (\textpm{} 0.07), F1: 0.88 (\textpm{} 0.05)) but also in the out-of-sample prediction regions (Kappa: 0.90 (\textpm{} 0.03), Jaccard: 0.84 (\textpm{} 0.04), and F1: 0.77 (\textpm{} 0.04)). While semi-supervised methods did not perform as accurately on 6- or 10-channel imagery, histogram matching and the inclusion of La*b* metrics generated accurate results with low memory and resource costs. These results show that E-ReCNN is capable of accurately detecting specific and object-oriented environmental changes related to ASGM. E-ReCNN is scalable to areas outside the focal area and is a method of change detection that can be extended to other forms of land-use modification.},
  copyright = {http://creativecommons.org/licenses/by/3.0/},
  langid = {english},
  keywords = {ASGM,change detection,CNN,LSTM,ReCNN,semi-supervised,Sentinal-2 imagery,small water bodies,smoothed total variation,SVM},
  file = {/home/fernando/Zotero/storage/R3UUL5G2/Camalan et al. - 2022 - Change Detection of Amazonian Alluvial Gold Mining Using Deep Learning and Sentinel-2 Imagery.pdf}
}
```
