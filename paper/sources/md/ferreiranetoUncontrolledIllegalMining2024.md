# Uncontrolled Illegal Mining and Garimpo in the Brazilian Amazon

**BibTeX Key:** `ferreiranetoUncontrolledIllegalMining2024`  
**Authors:** Ferreira Neto, L. C. and Diniz, C. G. and Maretto, R. V. and Persello, C. and Pinheiro, M. L. S. and Castro, M. C. and others  

---

## Resumen / Notas (Tuyo)

*(Escribe aquí tus notas)*

---

## Texto Completo del Artículo (Extraído del PDF)

```text
Article

https://doi.org/10.1038/s41467-024-54220-2

Uncontrolled Illegal Mining and Garimpo in
the Brazilian Amazon
Received: 22 April 2024
Accepted: 1 November 2024

1234567890():,;

1234567890():,;

Check for updates

Luiz Cortinhas Ferreira Neto 1,2 , Cesar Guerreiro Diniz 1,3,4 ,
Raian Vargas Maretto 5, Claudio Persello 5, Maria Luize Silva Pinheiro 1,
Marcia C. Castro 4, Luis Waldyr Rodrigues Sadeck1,6,
Alexandre Fernandes Filho7, Julia Cansado 1,
Arlesson Antonio de Almeida Souza1,6, Jeremias Pinto Feitosa6,
Diogo Corrêa Santos3,8, Marcos Adami 7, Pedro Walﬁr M. Souza-Filho 3,8,
Alfred Stein 5, Andre Biehl9 & Aldebaro Klautau2

Mining has played an important role in the economies of South American
countries. Although industrial mining prevails in most countries, the expansion of garimpo activity has increased substantially. Recently, Brazil exhibited
two moments of garimpo dominance over industrial mining: 1989–1997 and
2019–2022. While industrial mining sites occupied ~ 360 km2 in 1985 but
increased to 1800 km2 in 2022, a 5-fold increase, garimpo mining area
increased by ~ 1200%, from ~ 218 km2 in 1985 to ~ 2627 km2 in 2022. More than
91% of this activity is concentrated in the Amazon. Where almost 40% of the
sites are ﬁve years old or younger, this proportion increases to 62% within
Indigenous lands (ILs). Regarding the legal aspect, at least 77% of the 2022
extraction sites showed explicit signs of illegality. Particular attention must be
given to the Kayapo, Munduruku, and Yanomami ILs. Together, they concentrate over 90% of the garimpo across ILs.

Mining entails the extraction of economically valuable minerals or
other geological materials from the Earth’s crust. This activity plays a
pivotal role in the economies of South American nations and remains
important to this day1,2. Similar to many other countries, Brazil has
embraced the economic potential of the industrial mining sector.
However, there has been a notable increase in the occurrence of a
speciﬁc type of mineral extraction method, traditionally referred to as
artisanal small-scale mining (ASM) and denoted hereinafter as garimpo, which primarily encompasses illegal activities3–5 and is fueled by
the latest surge in gold prices6.
Many garimpo sites, particularly (but not exclusively) those where
gold is extracted, exhibit activities that are not only harmful to human

health due to the use of mercury (Hg) in the gold amalgamation process but also leave behind a disastrous trail of ecosystem service
depletion, especially in the Amazon, where, in addition to deforestation and forest degradation, garimpo notably disrupts ﬁshing, hunting,
and freshwater availability7–11. Within this context, it is common for
municipalities adjacent to mining regions to exhibit high deforestation
rates, elevated methyl mercury (MeHg) concentrations in inhabitants
and fauna, low human development index (HDI) values, and increased
suspended sediment discharge into river courses and their
surroundings12–14.
Mineral extraction is an economic activity safeguarded by the
federal constitution of almost all pan-Amazonian countries15. However,

1

Solved - Solutions in Geoinformation, Belem, PA, Brazil. 2Federal University of Para, UFPA, Technology Institute, PPGEE, Belem, PA, Brazil. 3Federal University
of Para, UFPA, Geoscience Institute, PPGG, Belem, PA, Brazil. 4Harvard TH Chan School of Public Health, Harvard, Boston, MA, USA. 5University of Twente, UT,
Department of Earth Observation Science, Faculty of Geo-Information Science and Earth Observation (ITC), University of Twente, Enschede, The Netherlands.
6
National Institute for Space Research, INPE, Amazon Regional Center, Belém, PA, Brazil. 7National Institute for Space Research, INPE, São José do Campos,
SP, Brazil. 8Vale Research Institute, ITV, Belem, PA, Brazil. 9Princeton University, Department of Computer Science, Princeton, NJ, USA.
e-mail: luiz.cortinhas@solved.eco.br; cesar.diniz@solved.eco.br

Nature Communications | (2024)15:9847

1

Article
illegal mining activities, in general, are characterized by the invasion of
protected areas (indigenous lands (ILs) and conservation units (CUs) –
in Brazil, protected areas are referred to as CUs), a lack of formal
mining documentation and environmental licensing, the improper
disposal of chemical contaminants, the illegal acquisition and use of
mercury, the absence of environmental recovery plans, the existence
of a parallel market for mineral assets, adverse effects on population
health (e.g., malaria, intestinal infections, and chronic conditions due
to mercury exposure), and social disruption of local communities and
indigenous people16–18. In Brazil, any mining activity within the limits of
ILs, fully protected CUs, and some of sustainable use constitutes an
unrestricted illegal activity19. Law No. 9.98520, which institutes the
National System of Conservation Units (SNUC), states that inside fully
protected CUs and CUs of sustainable use, designated as extractive
reserves (RESEXs) and private natural heritage reserves (RPPNs),
mining of any kind is strictly prohibited, either garimpo or industrial
mining.
Despite crucial efforts to map mining footprints globally21,22,
knowledge gaps must still be resolved regarding distinguishing extraction patterns derived from more comprehensive time series data,
whether at industrial mining or garimpo sites. The analysis proposed
here addresses extensive spatiotemporal mining mapping (spanning
four decades) on a nearly continental scale (the entire territory of Brazil)
while simultaneously distinguishing two distinct extraction types. The
use of extensive Landsat-derived (30 m resolution) time series data is
essential for obtaining a more precise spatial and temporal understanding of the development of mining in Brazil, especially in the Brazilian Amazon. An in-depth understanding of the evolution of mining in
time and space supports more accurate identiﬁcation of the ILs, CUs,
and inhabitant groups most impacted by this activity.
The spatialization of such land use provides a better understanding of Brazil’s evolution of industrial mining and garimpo. Speciﬁcally, this geospatial dataset supports scientiﬁc developments in
diverse cross-related areas, such as assisting in the estimation of the
ﬁnancial loss inherent to illegal mining19,23, spatial and temporal correlation analyzes between mining expansion and increases in methyl
mercury levels in the trophic chain24 and consequent human mercury
exposure25, creation and calibration of epidemiological models
regarding the spread of mosquito-related diseases26, changes in the
physical-chemical12 and biological characteristics of water courses
surrounding mining operations27, and associated morphometric
changes due to excessive silting of river courses28.
Therefore, using a deep learning-based classiﬁer and cloud computing infrastructure, we mapped the evolution of mineral extraction
in Brazil from 1985 to 2022. Here, we tracked industrial mining and
garimpo extraction sites in time and space to determine the distribution, predominance, age, and signs of illegality associated with the
detected Brazilian garimpo sites. Furthermore, we discussed the suitability of the classic ASM terminology, as it no longer reﬂects reality. All
the data produced here have already been transferred to the MapBiomas initiative—as part of our multi-institutional scientiﬁc agreement (Solved/UFPA/MapBiomas)—and are publicly available for
download within its Collection 829,30.

Results
Mining area Evolution: industrial mining and Garimpo
The extent of Brazilian surface mining was monitored systematically
and continuously, producing maps and annual statistics from 1985 to
2022. Moreover, the data produced allow the classiﬁcation of two
distinct mining extraction patterns: garimpo (generally referred to as
ASM) and industrial mining (Fig. 1). These data provide a better
understanding of the dynamics of mining extraction in Brazil, paving
the way toward a greater comprehension of its social-environmental
impacts and updating the status of this economic activity through 38
years of data.

Nature Communications | (2024)15:9847

https://doi.org/10.1038/s41467-024-54220-2

In terms of extraction patterns, Brazil has exhibited a mostly
industrial mining exploitation proﬁle for almost four decades. However, the recent pattern of mining extraction has changed, and the area
occupied by garimpo activities in 2022 was already 1.46 times larger
than that used for industrial extraction. Over nearly four decades,
Brazil exhibited two distinct periods when the garimpo extraction area
exceeded the industrial extraction area, from 1989–1997 and
2020–2022 (Fig. 1C).
At the beginning of the time series, in 1985, the area occupied by
industrial mining operations reached approximately 360 km2, while
the area occupied by garimpo extraction operations reached
approximately 220 km2. In addition to the reversal of industrial mining
dominance from 2020 to 2022, there was a notable acceleration in
garimpo expansion. Such extraction notably increased in space,
dominating northern Brazil, mainly in Pará, Mato Grosso, Rondônia,
and Amazonas. Moreover, industrial activity was concentrated in the
southeastern region of Brazil, especially in Minas Gerais (Fig. 1).
In 2022, the garimpo extraction area reached 2630 km2, 12 times
larger than that in 1985, an increase of nearly 1200%. In addition to this
increase, in 2022, 91.75% (2410 km2) of the garimpo area occurred
within the Amazon biome boundary (Fig. 1). Importantly, the area
associated with industrial mining also increased in Brazil, but more
gradually and at a much lower intensity than that in the most recent
years of the time series. In 1985, the industrial mining area reached
360 km2 but increased to 1800 km2 in 2022, representing a 5-fold
increase.
Nevertheless, the rate of increase in recent years is the most
alarming aspect of this growth. In the last four years of the series,
namely, from 2019–2022, there was almost no relevant expansion of
the industrial mining area, which increased from 1730 km2 in 2019 to
1800 km2 in 2022, an absolute increase of approximately 4%. In contrast, if stability is a recent hallmark of industrial extraction, the exact
opposite applies to the garimpo extraction area. From 2019 to 2022,
the garimpo extraction area increased from 1720 km2 in 2018 to
2670 km2 in 2022—an absolute increase of 55%. Furthermore, in the last
year of the series, namely, from 2021 to 2022, the garimpo extraction
area increased by 350 km2, rising from 2280 to 2630 km2.
The state of Pará is centrally relevant to the expansion observed in
Amazonia. The state of Para contains four of the ﬁve largest municipalities in Brazil in terms of garimpo extension. Notably, Itaituba
(710 km2), Jacareacanga (195 km2), São Feliz do Xingu (101 km2), and
Ourilandia do Norte (91 km2) jointly constitute 41.7% of the national
garimpo area, with an area of 1097 km2. In third place, the only municipality outside Pará is Peixoto de Azevedo, in Mato Grosso (MT), with
126 km2 of garimpo activities in 2022.

Signs of illegality and temporal persistence of garimpo sites
Recently, garimpo activity has spread throughout the Amazon. Initially
concentrated in the southern region of Pará and in the northern parts
of the states of Mato Grosso and Rondônia (Fig. 1), garimpo extraction
has reached the border of neighboring countries (French Guiana,
Venezuela, and Colombia), the interior of fully protected CUs, CUs of
sustainable use, natural heritage reserves (RPPNs), extractive reserves
(RESEXs) and ILs, as shown in Fig. 2 and Supplementary Material S.5. In
2022, 780 km2 of garimpo extension occurred within CUs, while
250 km2 occurred within ILs, although its distribution, in both cases,
was not homogeneous. When ranked by extension, ﬁve CUs accounted
for 85.5% of the total garimpo area: APA do Tapajos (environmental
protection area - APA), FLONA do Amana (national forest - FLONA),
ESEC Juami-Japura (ecological station - ESEC), FLONA do Crepori, and
PARNA do Rio Novo (national park - PARNA). Similarly, signs of garimpo activity were not evenly distributed across Brazil’s ILs. The
Kayapo, Munduruku, and Yanomami ILs accounted for more than 90%
of the total garimpo extraction area within indigenous territories (Fig. 2C).
2

Article

https://doi.org/10.1038/s41467-024-54220-2

Fig. 1 | Spatial-temporal distribution of mining extraction patterns in Brazil.
A Spatial distribution in 1985. B Spatial distribution in 2022. C The total area of
mining extraction patterns per type per year. D Top 5 states by mining distribution
in 2022. E Top 5 municipalities by garimpo distribution in 2022. In every section,
yellow denotes garimpo, while red denotes industrial mining. The abbreviations

RO, AM, MG, MT, and PA denote the states of Rondônia, Amazonas, Minas Gerais,
Mato Grosso, and Pará, respectively. The Amazon biome delimitation is represented by a light green boundary in maps A and B. The states and Amazonian
delineations were downloaded from the IBGE.

In 2022, at least 15% (390 km2) of the garimpo mining area, as
shown in Fig. 2D, occurred within regions with restrictions set in place
to limit this activity. Mineral extraction activity of any type is constitutionally prohibited within ILs, fully protected CUs, RPPNs, and
RESEXs. Furthermore, proportional to the area detected over the last

decade (2013–2022), the expansion of garimpo within both ILs and
CUs was 462% greater in 2022 than in 2013. Within ILs alone, the garimpo area in 2022 was 625% larger than that in 2013, an absolute gain of
210 km2, jumping from 40 to 250 km2. Within CUs, the garimpo mining
area was 300% larger in 2022 than in 2013, with an absolute gain of

Nature Communications | (2024)15:9847

3

Article

https://doi.org/10.1038/s41467-024-54220-2

Fig. 2 | Garimpo sites in restricted areas. A Garimpo area in indigenous lands and
conservation units per year. B Spatial distribution of the garimpo area in 2022. On
the map, gray denotes the location of the conservation units. Red denotes the
location of indigenous lands. Yellow denotes the garimpo sites. C The top 5 ILs and

CUs per garimpo area in 2022. D The bar graph shows the absolute and percent
values inside and outside mining-restricted areas. In the graph, yellow denotes
garimpo extension outside restricted areas, while dark red denotes mining sites
within restricted areas (indigenous lands, fully protected CUs, RPPNs, and RESEXs).

520 km2, jumping from 260 to 780 km2. Combined, the mining
expansion on ILs and CUs reached 730 km2 in one decade. Crossreferencing garimpo locations with the national bases of miningrestricted regions is a simple way to verify spatial illegality. However,
spatial violations are not the most common sign of illegality. A mining
operation may exhibit signs of illegality even when it is not located
within a restricted region. One way to verify this is by using the SIGMINE platform. Developed and updated by the Brazilian National
Mining Agency (ANM), this platform provides the location and details
of active mining processes throughout Brazil. The SIGMINE platform
adds an essential degree of transparency to ANM information, allowing
public veriﬁcation of formal records of mineral extraction in Brazil.
Even if registered in the SIGMINE platform as a formal holder of a
garimpo permit (PLG) or a mining concession (CL), the absence of a
preexisting environmental license issued by an ofﬁcial Brazilian
environmental institute (Brazilian Institute of Environment and
Renewable Natural Resources—IBAMA—or the State Secretary of the
Environment—SEMA—and in the case of Para state, the Municipal
Secretary of the Environment—SEMA)) may also categorize operators
as engaging in illegal activity. In this sense, all detected garimpo sites
were classiﬁed as either showing explicit signs of illegality or no
explicit signs of illegality, relying exclusively on the garimpo extraction
site position versus the geolocation and license type recorded on the
SIGMINE platform (Fig. 3A). A more in-depth veriﬁcation of environmental licensing, guaranteeing the preexistence of an environmental
authorization for each SIGMINE-registered plot, could not be conducted, as no centralized or digital database allows public access to all
environmental licenses issued for mining activities.
In 2022, considering the 2630 km2 of garimpo mined area, 77%
(2024 km2) exhibited explicit signs of illegality, 58% (1522 km2) was not
associated with the appropriate mining permit (PLG or CL), 4.2%

(112.27 km2) occurred outside SIGMINE boundaries, and 15% (390 km2)
occurred within restricted areas (ILs, fully protected CUs, RPPNs and
RESEXs). Notably, the analysis considered every mining license currently
available in SIGMINE as an a priori holder of an environmental license.
Thus, some extraction sites, despite falling within the category of showing
no explicit signs of illegality, may still be environmentally irregular but
could not be further assessed. Nonetheless, even assuming that every
SIGMINE plot exhibited appropriate environmental conformity, only 23%
of the garimpo area in Brazil did not show explicit signs of illegality.
Regarding temporal persistence, the Amazonian garimpo explosion is unequivocally very recent; 41% (980 km2) of the exploited area
in the Brazilian Amazon is less than ﬁve years old. In terms of size, the
area occupied by very young sites is equivalent to the extent of Los
Angeles, the United States, or Rio de Janeiro, Brazil. The recent
increase in activity within ILs or CUs is even worse. Mining sites less
than ﬁve years old account for 62.3% (157 km2) of the total mining area
within ILs. Within CUs, the conditions are similar, and 42.8% (334 km2)
of the mining area is ﬁve years old or younger. If the timeframe refers
to mines that have existed for up to 10 years, the conditions worsen.
More than 58% (1408 km2) of the mines in the Brazilian Amazon were
opened between 2012 and 2022. Within ILs, the proportion of mining
areas opened within the last 10 years, namely, 2012–2022, is approximately 84.2% (212 km2) of the total illegal mining area. In CUs, mines
that are 10 years old or younger account for 66.8% (552 km2) of the
total mining area.

Nature Communications | (2024)15:9847

Error assessment analysis
In this study, a two-stage stratiﬁed random sampling approach was
used to assess the accuracy of the artiﬁcial intelligence (AI)-based
model, categorizing 52,320 samples based on a human/visual interpretation as belonging to the mining or non-mining category.
4

Article

https://doi.org/10.1038/s41467-024-54220-2

Fig. 3 | Illegality and timing of garimpo activities. A Signs of illegality and nature
of garimpo in 2022. At the top, the yellow bar denotes the total area in 2022. In the
middle, the area is visualized according to signs of illegality and is classiﬁed as
showing explicit signs of illegality or no explicit sign of illegality. At the bottom, the
nature of illegality is provided, as are three distinct signs of illegality: occurring
inside restricted areas, exhibiting inappropriate permits, and occurring outside the

SIGMINE demarcation. B Temporal persistence of garimpo sites. The bar graphs
show the proportion of the detected garimpo area as a function of its age [time].
The ages of the extraction sites within indigenous lands, conservation units, and the
Brazilian Amazon are shown from top to bottom. The tonal variations (red) indicate
age ≥ 18 years, < 18 and ≥ 10 years, < 10 and ≥ 5 years, or < 5 years. The redder the
tone is, the younger the mining area.

Furthermore, the adopted strategy was weighted by a per grid-per-area
approach (the proportion of the classes within the 62.5-km2 grid), as
provided in S.1 in the Supplementary Material. Nevertheless, mining is
a statistically rare land use within the Brazilian context, given the size
of the country. Thus, the reported error analysis must always account
for this nature.
Traditionally, the overall accuracy (OA) metric is derived using a
single error matrix generated over a speciﬁc period and by aggregating
a complete set of validation samples to illustrate the amount of
agreement or disagreement between the reference and categorized
pixels. However, without a ﬁner spatial constraint to account for the
mining class rarity, the OA metric would be statistically inﬂated to the
point where a nonlocally constrained method would quickly yield OA
levels greater than 99% while statistically inﬂating the producer and
consumer accuracy (PA and CA, respectively) metrics. Table 1 shows
the annual OA metric and mining and non-mining PA and CA metrics
[PA(Mi), CA(Mi), and PA(N-Mi), CA(N-Mi), respectively].

In Fig. 4, the per grid-per-area weighted approach demonstrated
that in 2022, every grid exhibited an OA value greater than 97%
throughout Brazil’s territory. Moreover, most grids exhibited PA(Mi)
and CA(Mi) values greater than 90%. Of the 182 possible grids, PA(Mi)
was greater than 90% in 164 (90%) of the grids, while CA(Mi) was
greater than 90% in 144 (79%) of the grids. In most evaluated years, the
PA(Mi) rate was above 70%, except for the three years with the highest
age, namely, 1985, 1990, and 1995, where the PA(Mi) value was
approximately 65% (Table 1). Moreover, Fig. 4 shows how statistical
inﬂation or deﬂation of the error metrics signiﬁcantly affects the map
accuracy (in particular, but not exclusively, the OA metric). If nonweighted/nonlocally constrained methods were used to assess rare,
non-homogeneously distributed events, the local variation in error
metrics would not be possible to capture.
Therefore, regardless of which error metrics are displayed, the
ability to locally diagnose such inaccuracies is far greater than the mere
presentation of simply inﬂated or deﬂated global metrics. A per-grid-

Nature Communications | (2024)15:9847

5

Article

https://doi.org/10.1038/s41467-024-54220-2

Table 1 | Aggregated annual error metrics and conﬁdence intervals
Year

OA

PA(Mi)

CA(Mi)

PA(N-Mi)

2022

99.85 ( ± 0.33)

91.42 ( ± 6.18)

91.95 ( ± 19.61)

99.93 ( ± 0.006)

CA(N-Mi)
99.92 ( ± 0.33)

2020

99.92 ( ± 0.33)

90.32 ( ± 7.67)

91.57 ( ± 21.83)

99.99 ( ± 0.005)

99.92 ( ± 0.33)

2015

99.74 ( ± 0.58)

75.37 ( ± 7.06)

91.25 ( ± 21.19)

99.99 ( ± 0.004)

99.75 ( ± 0.60)

2010

99.70 ( ± 0.59)

77.95 ( ± 4.66)

91.67 ( ± 17.81)

99.99 ( ± 0.005)

99.70 ( ± 0.63)

2005

99.66 ( ± 0.64)

73.09 ( ± 4.93)

91.36 ( ± 18.44)

99.99 ( ± 0.004)

99.66 ( ± 0.67)

2000

99.64 ( ± 0.64)

70.12 ( ± 4.93)

90.56 ( ± 23.37)

99.99 ( ± 0.005)

99.65 ( ±0.68)

1995

99.59 ( ± 0.58)

64.40 ( ± 2.94)

92.74 ( ± 21.08)

99.99 ( ± 0.003)

99.59 ( ± 0.72)

1990

99.64 ( ± 0.58)

66.08 ( ± 4.18)

93.41 ( ± 21.58)

99.99 ( ± 0.003)

99.64 ( ± 0.68)

1985

99.70 ( ± 0.43)

69.45 ( ± 2.16)

93.60 ( ± 15.85)

99.99 ( ± 0.001)

99.70 ( ± 0.61)

The columns provide distinct error assessment metrics: overall accuracy (OA), mining producer accuracy (PA(Mi)), non-mining producer accuracy (PA(N-Mi)), mining consumer accuracy (CA(Mi)),
and non-mining consumer accuracy (CA(N-Mi)). All values were calculated based on a per grid-per-area weighted approach.

per-area weighted approach was applied to evaluate nine distinct years
of the time series. Notably, the local distribution of each annual error
metric is available in the Supplementary Material section, S.2 and S.3.
The high accuracy rates obtained by this extensive error analysis
conﬁrm the general effectiveness and precision of the adopted AIbased method while indicating that regional training improvements
remain necessary.

Discussion
In 5 years, from 2018–2022, 40% (1063 km2) of the garimpo sites
detected in Brazil started and developed, as shown in Figs. 1, 4. Within
ILs, where mining restrictions apply, this rate was even higher, with
62% (157 km2) of the mining area being ﬁve years old or younger.
Notably, garimpo essentially occurs in the Amazon. More than 91%
(2410 km2) of such extraction patterns occur in that biome (Fig. 1), and
41% (981 km2) of such sites are ﬁve years old or younger (Fig. 3) and
expanding rapidly (Figs. 2, 3).
In academic parlance, we classiﬁed garimpo as ASM or artisanal
small-scale gold mining (ASGM). However, in 2022 alone, the garimpo
area increased by 341 km2 and surpassed the industrial mining area by
848 km2 (an industrial mining area of 1779 km2 and a garimpo area of
2627 km2). In the same year, within the Kaypó IL, where mining activity
of any kind is restricted, a single garimpo conglomerate covered an
area of 50 km2, reaching linear extensions of 20 km (Fig. 5). Thus, the
small-scale concept no longer applies since such lengths and areas
cannot represent small-scale measures. Likewise, there is nothing
artisanal associated with the workforce size and transportation volume
of several tons of sediments excavated via the use of dozens, sometimes hundreds, of backhoe loaders and hydraulic diggers, which are
often combined with the use of helicopters, clandestine landing strips,
and dredging ferries31–35, to increase production and ﬂow capacity of
the Amazonian garimpos. Such sizes and expanding velocities are
incompatible with the alleged artisanal and small-scale concept.
Additionally, almost 77% (2030 km2) of the sites detected in 2022
showed explicit signs of illegality. The use of inappropriate mining
licenses, any but not a Garimpo Permit (PLG) or a Mining Concession
(CL), constituted 57.8% (1520 km2) of the illegality signs, while the
invasion of mining restricted areas (ILs and CUs, as deﬁned by Law No.
9.98520) responded to 15.2% (399 km2), and other 4.2%, (111.27 km2)
were lacking mining licenses of any kind (as implemented outside of
SIGMINE’s demarcations). Several factors contribute to this scenario.
First, a centralized and digital database is necessary to ensure
public access to environmental licenses issued in favor of individuals
or garimpo cooperatives. The lack of transparency in environmental
licensing prevents accurate assessment of the levels of documentary
legality, which could render the observed proportion of activities
considered to present no explicit sign of illegality to levels that are
even smaller than the reported 23% (603 km2).

Nature Communications | (2024)15:9847

Second, the state of Pará (PA), which alone accounts for 56% of the
total activity (Fig. 1), is the only state where the environmental licensing
of mining operations has been transferred to the municipal level. In
2015, the state delegated this role to municipal entities through
Resolution No. 120/201536 of the State Council for the Environment
(COEMA-PA), which classiﬁed mining operations up to 500 hectares as
“small-scale activities with local environmental impacts.” In response
to the COEMA Resolution, the Federal Public Ministry (MPF) stated
through Recommendation No. 01/202337 that a city hall shall not grant
environmental licensing for garimpo activities since the environmental
damage associated with such far outweighs the concept of local
activity-related impacts. While a ﬁnal decision revoking garimpo
licensing at municipal level has not yet been issued, four of the ﬁve
municipalities with the largest garimpo areas occur in the state of Pará:
Itaituba, PA (710 km2); Jacareacanga, PA (200 km2); Peixoto de Azevedo, MT (130 km2); São Felix do Xingu, PA (100 km2); and Ourilândia
do Norte, PA (91 km2).
Third, there is a lack of processes to mitigate the impacts of garimpo, and efforts to rehabilitate the mining sites are even less common. In this sense, the widespread use of mercury (Hg) in the Amazon
poses far-reaching human health and ecological concerns. This is
particularly alarming given that Brazil is not a mercury-producing
country, and owing to its character, both Hg import and use are controlled—an indication of fraudulent mercury acquisition38,39. Globally,
Hg release from tailings and vaporized mercury is estimated to exceed
1000 tons yearly40. Once available as an organic compound, methyl
mercury (MeHg) can easily enter the aquatic food chain12,41–43. In this
sense, riverine communities in the Amazon biome are particularly
vulnerable to MeHg since they mostly rely on ﬁsh as their primary
protein source12,44. Amazonian populations have demonstrated critical
neuropathological symptoms associated with mercury exposure, particularly cognitive45,46, vision47–50, motor45,46,51,52, somatosensory45,48,53,
and emotional deﬁcits51. Speciﬁcally, in pediatric populations, mercury
poisoning is associated with neurodevelopmental and motor deﬁcits,
including delayed milestone achievements, language problems, and
low mental and psychomotor scores54–56.
Way before long-term chronic exposure, food security and hunger were acute short-term conditions among indigenous and riverine
populations. The environmental depletion of ecosystem services
triggered by garimpo operations causes notable disruptions in ﬁshing,
hunting, and freshwater availability. Consequently, once-abundant
resources have become scarce and unsuitable for human consumption. Prevented from eating and properly hydrating, indigenous and
riverine communities, especially newborns and children, experience
malnutrition, dehydration, and anemia9–11,25,57,58, subsequently, even if
infant mortality does not increase10,11, these communities will suffer
long-term problems related to cognitive45,46, motor45,46,51,52, visual47–50
and neurological deﬁcits45,48,51,53.

6

Article

https://doi.org/10.1038/s41467-024-54220-2

Fig. 4 | Error matrix and locally distributed accuracy metrics for 2022. The
accuracy assessment approach was weighted by the area of each category/class
according to the 250 × 250 km grid (62,500 km2). A total of 182 grids were regularly

distributed throughout Brazil. The metrics for 2022 revealed an OA value of 99%
(A), a CA(Mi) value of 91% (B), and a PA(Mi) value of 91% (C). Error matrix and
associated metrics (D).

In all territorial sections analyzed, whether within restricted areas
(ILs, fully protected UCs, RESEXs, and RPPNs) or outside, the garimpo
mining area substantially increased over the years. Nevertheless, the
progression of the increase in recent years is worrisome. From 2018 to
2022, the garimpo mining area expanded by nearly 1000 km2, representing a short-term expansion of 60% within only ﬁve years (Fig. 1).
The recent expansion is also reﬂected inside ILs and CUs. In the past
decade, for ILs combined with CUs, the garimpo area was 440% larger
in 2022 than in 2018 (Fig. 2). Within ILs alone, the area in 2022 was
250% larger than that in 2018, which ranged from 100 to 250 km2

(Fig. 2). Within CUs, the extraction extent was 190% greater in 2022
than in 2018, expanding from 410 to 780 km2 (Fig. 2). Overall, the
increase within ILs and CUs reached 520 km2 in just ﬁve years. This fast
and spatially persistent expansion, inside and outside miningrestricted areas, either ILs or CUs, indicates Brazil’s lack of control of
illegal mining in the Amazon. Notably, ILs and CUs are the territorial
units facing an urgent need of assistance59,60. While there are 48 CUs
with garimpo extraction signals, only ﬁve CUs account for 85.5% of the
total garimpo area within such units: APA do Tapajos, FLONA do
Amana, ESEC Juami-Japura, FLONA do Crepori, and PARNA do Rio

Nature Communications | (2024)15:9847

7

Article

https://doi.org/10.1038/s41467-024-54220-2

Fig. 5 | Garimpo legislation and expansion inside indigenous lands. In the upper
right corner, a Landsat 8 annual mosaic from 2022 is shown. In the top left, a
Kayapo garimpo conglomerate, highlighted in red, extends for more than 20 km. At
the bottom, the yellow bars show the evolution of Amazonian extraction within
indigenous lands from 1985–2022, expressed in km2. The red line denotes the

annual volatility of international gold prices, expressed in USD per troy ounce
(World Gold Council). Each black line denotes the year a speciﬁc law, resolution, or
bill was ratiﬁed, directly impacting the recent garimpo spread in the Brazilian
Amazon. The annual composites are derived from the Landsat 8, Collection 2, Tier
1, TOA dataset, which is courtesy of the U.S. Geological Survey.

Novo. Similarly, 22 ILs with signs of garimpo activity were detected.
However, three ILs alone—Kayapo, Munduruku, and Yanomami—
accounted for more than 90% of the total mining area in such protected regions (Fig. 2).
Since 2000, the international gold market has shown signs of
persistent growth. Concurrently, changes in the Brazilian legislation
facilitated the expansion of garimpo61. In 2008, Law No. 11.685/200862
created the Garimpeiro Statute, differentiating garimpo from industrial
mining, considering the former small-scale technology and able to be

practiced individually or collectively through cooperatives. This law,
based once more on the small-scale argument, deregulated garimpo
operators from the necessity of presenting a mining research authorization (an ANM authorization anterior to the mine opening, which
aims to demonstrate the economic and environmental viability of the
proposed operation). Today, this regulatory mechanism applies only
to industrial mining sites, contrary to the ordinances formally
expressed in CONAMA Resolution No. 237/199763. Furthermore, in
2013, Law No. 12.844/201364 expanded mining deregulation by

Nature Communications | (2024)15:9847

8

Article
presuming those legal entities buying and selling gold act in good
faith. From a legal perspective, the good faith law allowed the
presumption of legality of mining documents, which in turn excluded
routine inspection of their legitimacy and veracity. Ten years later, on
May 5, 2023, the Federal Supreme Court overturned the validity of
such a law.
In 2019, 2020, and 2022, three bills emerged, which are still
awaiting a deﬁnitive decision but demonstrate that the deregulation of
garimpo activity is still active in a part of the Brazilian political body
seeking to further expand the permissibility of Amazonian mining. Bills
No. 5822/201965, 191/202066, and 571/202267 could provide the possibility of mining ventures to be implemented inside national forests
(FLONA), establish conditions for the research and exploitation of
mineral resources and hydrocarbons in ILs, and enable the President of
the Republic to release mineral extraction in any area of the country in
times of economic crisis, including IL and CUs.
An enormous number of validation samples supported the statistical ﬁndings reported here. There were more than 52 thousand
human-validated samples, distributed over nine different years of the
time series (from 1985 to 2022), in which reasonably favorable error
metrics, considering the rare characteristic of the class of interest,
were systematically achieved (OA > 98%, PA > 65%, and CA > 90%). In
turn, omission errors were more abundant than commission errors,
which is a positive aspect from a map user perspective, as it reveals
that every mention of a mining site on the map generally matches the
reality of the Earth’s surface. However, as a social-environmental
indicator, some mining is still undetected, exacerbating this disastrous
scenario’s seriousness. Nevertheless, the high accuracy rates obtained
in this extensive error analysis conﬁrm the general effectiveness and
suitability of the adopted AI-based method while indicating that local
training improvements remain necessary, particularly considering the
ﬁrst three years of the time series, namely, 1985, 1990, and 1995. In
turn, error metrics cannot serve as quality guarantees. Error/accuracy
metrics are mechanisms for ﬁnding, understanding, and ﬁxing a
categorical unconformity, whether in time or space, thus supporting
the future production of better versions of Earth’s surface representations. Due to the rare nature of the target of interest (considering
Brazil’s continental scale), without the local spatialization and weighted approaches applied here, the error metrics would be quickly
inﬂated or deﬂated and thus miss the central usage concept as an
analytical tool that allows a better ﬁt between the cartographic
representation and reality. The error analysis allowed us to locally
reduce spatial and temporal inconsistencies, which will be publicly
available within Collection 9 of the MapBiomas initiative.
The technical characteristics of the adopted methodology limit its
detection capability and analytical accomplishments. In this sense, the
current Brazilian structural architecture and remote sensing-related
technicalities constrain our research. Structurally, as it is impractical to
obtain environmental licenses, it was acknowledged that all mining
licensing present in SIGMINE platform also includes prior environmental licensing. This condition may need to be further veriﬁed.
Nevertheless, this task is insurmountable as the country still needs to
establish a public and centralized database of environmental licenses.
From a spatial perspective, as in any remote sensing-based analysis, the
earth’s surface reality may differ from its cartographic categorization.
Our results were based on Landsat data (30 m), so undetected sites are
undoubtedly smaller than the Landsat detection resolution, pointing
to larger mining areas than reported here. On the other hand, some
commission errors still exist, as reported by the Error Assessment
section. Finally, there are latent illegalities within garimpo activities
that are not spatial nor documented and, therefore, are outside
the scope of our method, such as the quantiﬁcation of the irregular use
of mercury and arsenic in the amalgamation of gold and other metals,
the veriﬁcation of the associated labor conditions, the economic
and logistical relationships between garimpo and drug trafﬁcking

Nature Communications | (2024)15:9847

https://doi.org/10.1038/s41467-024-54220-2

activities, and the mechanism by which vast amounts of illegal gold are
sold and bought on the formal national and international markets
(gold laundering).

Methods
Reference data and study area
Brazil, especially the Brazilian Amazon, is associated with many publicly available datasets, ranging from geological surveys and change
detection platforms to deforestation early warning systems. Thus, data
availability is highly diverse in scale, type, and timeframe. Spatially
explicit data may exhibit varying resolutions, with a varying degree of
human intervention, for scientiﬁc or journalistic use. Despite these
variations, a notable set of spatial references for garimpo and industrial
mining sites can be acquired or inferred. The reference dataset
adopted here resulted from aggregating data from multiple
sources22,68–74.
The research encompasses all of Brazil’s territory. Due to its size,
the region was divided into a grid of 100 × 100 km cells, i.e., 10,000-km2
grids. As a result, if reference sample data existed in a given position, the
corresponding cell was activated. These cells limited the execution of a
deep learning U-Net-based algorithm75, which only operates within
active grid cells. Figure 6 shows the distribution of all 535 cells.

Image Processing
Data processing and analysis were performed in a cloud computing
environment combining the use of the Google Earth Engine (GEE)
platform and the TensorFlow framework (Fig. 5). All raster data and
subproducts were obtained from USGS Landsat Collection 2 Tier 1 top
of atmosphere (TOA) data, including Level-1 precision terrain (L1TP)
data76–78.
For each year, Landsat Collection 2, Tier 1, TOA data ranging from
the 1st of January to the 31st of December were used to obtain annual
cloud-free composites. In the cloud/shadow removal routine, the
quality assessment (QA) band and the GEE median reducer are combined to eliminate too-bright or too-dark values (e.g., clouds and
shadows, respectively), and the median of the pixel value in each band
over time was determined79,80. Subsequently, the annual median
mosaics were subset to the area that comprises the 535 searching
grids, excluding areas where mining sites are not expected to exist
(e.g., open water bodies/ocean). Next, the training dataset was generated. The U-Net-based supervised approach relies on human-labeled
data as training samples, categorized as mining (Mi) or non-mining
(N-Mi) samples. Guided by the reference dataset, the mining and nonmining samples were visually delineated. Importantly, the U-Net classiﬁer does not differentiate between garimpo or industrial patterns.
The distinction between these two patterns is a human-dependent task
performed by visual interpretation as part of a post classiﬁcation
process (Supplementary Material S.4).
Once the sample acquisition task is ﬁnished, the U-Net-based
classiﬁer is run, resulting in a preﬁltered classiﬁcation product. The
classiﬁed data were entered into the GEE, where spatial-temporal ﬁltering and visual inspection were performed. This phase was employed
to correct misclassiﬁed data and ensure the necessity of acquiring (or
not) more training samples. Table 2 provides the U-Net algorithm
hyperparameters.
Due to the pixel-based classiﬁcation method and the extended
temporal series, a chain of post classiﬁcation ﬁlters was implemented.
In a long time series of severely cloud-affected regions, such as Brazilian tropical forests, no-data values are expected to persist in the
annual median composites. In this ﬁlter, no-data values (gaps) are
theoretically not allowed and are replaced by the temporally nearest
valid class pixel80,81. If no future valid position is available in this procedure, the no-data value is then replaced by its previous valid class.
Up to three prior years can be used to replace persistent no-data
positions. Therefore, gaps should only exist if a given pixel has been
9

Article

https://doi.org/10.1038/s41467-024-54220-2

Fig. 6 | Activation grids and processing ﬂowchart. In the map, 535 search grids
were activated according to the existence of a mining reference sample. In yellow,
the squares function as U-Net search grids. The mining site references are marked
in red. The white lines denote the ofﬁcial boundaries of Brazilian states. The right
side shows the mining detection Earth Engine–TensorFlow pipeline. The pipeline is
structured in 5 steps. First, the GEE generates cloud-free composites and creates

the initial training dataset. Second, mosaics and training data are downloaded and
stored locally. Third, patchwise training and classiﬁcation are initiated. Fourth, the
classiﬁed product is spatiotemporally ﬁltered. The ﬁltered product is visually and
statistically inspected. Multiple iterations are executed until a satisfactory spatial
and temporal quality is achieved. Fifth, the accuracy assessment is performed.

permanently classiﬁed as a no-data pixel throughout the entire temporal domain.
After gap ﬁlling, a temporal ﬁlter was applied. The temporal ﬁlter
involves the use of sequential classiﬁcations in a three-year unidirectional moving window for identifying temporally nonpermitted transitions. Based on a single generic rule, the temporal ﬁlter aims to
inspect the central position in three consecutive years (ternary). If the
extremities of the ternary are identical but the center position is not,

the central pixel is then reclassiﬁed to match its temporal neighbor
class80,81.
Finally, a spatial ﬁlter was applied. This ﬁlter aims to locate connected neighbor pixels (based on a 3 × 3 square kernel) if they share
the same pixel value. This spatial postprocessing aims to remove disconnected/isolated pixels (salt and pepper effect) classiﬁed as mining
(M) pixels. This ﬁlter needs at least ten connected pixels to reach the
minimum connection value. Consequently, the minimum mapping
unit is directly affected by the spatial ﬁlter applied, which was deﬁned
as 10 pixels ( ~ 1 ha).

Table 2 | Classiﬁer attributes and classiﬁcation parameters
Parameters

Values

Classiﬁer

U-Net

Tile-Size

256 × 256 pixels

Optimizer

Nadam

Learning-Rate

0.01

Decay Rate

0.1

Samples

35,000 (17.500–1985, 17.500–2022)

Attributes

Swir1, Nir1, Red, modiﬁed normalized difference water index
(MNDWI)88, normalized difference vegetation index (NDVI)89,
and normalized difference soil index (NDSI)90

Classes

2 (mining and non-mining)

In total, six (6) distinct attributes were used.

Nature Communications | (2024)15:9847

Protected areas and mining activity: Indigenous lands (ILs),
Conservation Units (CUs), mining permits (PLGs), and mining
concessions (CLs)
Protected areas, in Brazil referred to as CUs, are instruments created to
safeguard the integrity of ecosystems and associated environmental
services, such as soil conservation, biodiversity preservation, watershed protection, nutrient recycling, and thermal balance. Creating and
implementing protected areas also contribute to ensuring the right of
permanence and the culture of previously existing traditional populations and indigenous peoples82. Constitutionally, by several legal
mechanisms, mining activity within the limits of ILs and fully protected
CUs constitutes an unrestricted illegal activity19. Additionally, Law No.
9.98520, which institutes the National System of Conservation Units
10

Article

https://doi.org/10.1038/s41467-024-54220-2

Table 3 | Spatially restricted protected areas
Spatially Restricted Areas
Fully Protected CUs (All)

CUs of Sustainable Use

Ecological Stations (ESEC)

Extractive Reserves (RESEXs)

Indigenous Lands (All)
All

Biological Reserve (REBIO)

Private Natural Heritage Reserves (RPPNs)

—

National Parks (PARNA)

—

—

Natural Monuments (MONAT)

—

—

Wildlife Refuges (RVS)

—

—

All mining sites geographically established within fully protected CUs, ILs, or CUs of sustainable use, designated as extractive reserves (RESEXs) and private natural heritage reserves (RPPNs),
constitute undeniable violations of the Federal Constitution.

Fig. 7 | Flowchart demonstrating the data sources, analytical phases, and criteria for categorizing an ore extraction site as showing explicit signs of illegality or no explicit sign of illegality. Among all possible operational licenses or

licensing phases within the ANM’s SIGMINE platform, PLGs and CLs are considered
garimpo-appropriated permits. In contrast, any other license type or phase is
regarded as inappropriate.

(SNUC), stated that in all the fully protected CUs and CUs of sustainable use, designated as extractive reserves (RESEXs) and private natural heritage reserves (RPPNs), mining of any kind is strictly
prohibited, either garimpo or industrial mining. Thus, mining is prohibited within the areas of ecological stations (ESEC), extractive
reserves (RESEXs), biological reserves (REBIO), private natural heritage
reserves (RPPNs), national parks (PARNA), natural monuments
(MONAT), and wildlife refuges (RVS). All mining extraction operations
geographically established in the areas described above are undeniably in violation of the Brazilian Federal Constitution, as indicated in
Table 3 and Supplementary Material S.5. Nevertheless, even those
mines that are outside restricted regions can also be considered illegal
if they operate without proper environmental licenses and proper
mining permits, either garimpo permits (PLGs) or mining concessions (CLs).
According to Decree No. 227/196783, a mining concession (CL) is a
mineral exploitation regime designed for exploiting minerals on
an industrial scale. The issuance of a CL is always preceded by a mineral
research request and its subsequent research authorization, which
are necessary phases of ANM licensing procedures seeking to determine the economic and environmental viability of the proposed
mining operation. This concession regime requires proper environmental licensing. In contrast, the garimpo permit (PLG) regime,
established by Law No. 7.805/198984, is the most suitable exploitation
regime for individual Brazilian citizens (garimpeiros) or garimpo
cooperatives. Individual permits are limited to 50 hectares, whereas
cooperative permits are limited to 10,000 hectares. Gold, diamond,

cassiterite, columbite, tantalite, and wolframite are legally recognized
as mineable substances in alluvial, eluvial, and colluvial deposits.
Different substances are subject to mining extraction in various
forms, but only with a prior license from the National Mining
Agency (ANM), as stated by Law No. 7.805/198984. This use regime is
excluded from the mineral research request but is also subject to
the crucial requirement of proper environmental licensing, to be
issued by the appropriate environmental instance. Thus, no mineral
exploration mechanism in Brazil is exempt from previous
environmental licensing.
Thus, a sequence of spatial operations and license/permit
veriﬁcations was employed to identify possible signs of illegality
among the garimpo sites in Brazil, in which a set of spatial operations
was executed (Fig. 7), to determine whether the mining site showed
explicit signs of illegality or if no explicit sign of illegality was found.
The mining evidence produced here was cross-referenced with
the ofﬁcial spatial boundaries of CUs (Ministry of Environment–MMA)
and ILs (National Foundation of Indigenous People–FUNAI) and the
demarcation processes for mineral extraction licenses (National
Mining Agency–ANM; SIGMINE platform). The signs of legality or
illegality attributed to each detected mining site were derived from
analyzing these spatial relationships. Acquired in November 2023, the
SIGMINE dataset was divided per license type, and all personal information was removed from the resulting analysis.
Explicit signs of illegality were considered any mining activity that
occurs 1) within mining-restricted areas (ILs, fully protected CUs,
extractive reserves, and private natural heritage reserves), 2) outside

Nature Communications | (2024)15:9847

11

Article
the delimitations provided in the SIGMINE platform, and 3) within the
delimiting geometries of SIGMINE but without the appropriate licensing permit, either PLG or CL. In contrast, any mining sites that 1) occur
outside mining-restricted areas may show no explicit signs of illegality
if 2) they occur within the SIGMINE-delimited geometries and 3) they
exhibit the appropriate licensing regime, either PLG or CL.
Even though Brazil is a global reference in the production and
use of geospatial data to control, survey, and manage several internal
aspects of its territory, it is not feasible to conﬁrm the legality or
illegality of a given mining site exclusively through the aforementioned
spatial analysis. Thus, the categories of probable irregularities
adopted here include explicit signs of illegality and no explicit signs of
illegality.
Most of this incapacity stems from the lack of a national and
centralized system of environmental licenses to safeguard Brazil’s
native natural conditions and prevent their unnatural suppression. The
environmental licensing of a mining extraction activity can involve any
of the three levels of public organization: federal, state, or municipal.
Each level operates through its individual executing bodies, which are
still to be integrated. Moreover, these bodies rarely, if ever, offer the
option of digital consultation for their environmental processes.
At the federal level, the responsibility for issuing and advertising
mining licenses is reserved for the Brazilian Institute of the Environment and Renewable Resources—IBAMA. If inside a CU, the license may
be issued by the Chico Mendes Institute for Biodiversity Conservation
—ICMBio. At the state level, the state environmental secretariats
(SEMAs) are responsible for this task. Brazil has one environmental
secretariat, or a relative environment instance, for each of its 26 states,
as well as one speciﬁc to the federal district. Finally, all 144 Para state
municipalities are authorized to issue and publish environmental
authorizations at the municipal level. This contradictory condition was
put in place in 2015 through resolution No. 120/201536 issued by the
State Council for the Environment (COEMA-PA), which allegedly
categorized garimpo operations up to 500 hectares as “small-scale
operations with local environmental impacts.” Regretfully, within this
complex and multilayered administrative framework, no central
database is integrated among the different organizational levels and is
accessible to the public via digital means, granting transparency to the
environmental licensing of mining operations.

Error assessment and area estimation
Despite the traditional importance and economic relevance of mining
in Brazil, this extraction activity is considered a statistically rare landuse pattern due to the vast geographical area. Consequently, the
training and error assessment sampling design must consider the
infrequent distribution of mining sites across the country. If dependent upon a simple, randomly stratiﬁed approach, omission errors
could signiﬁcantly impact the map accuracy. Thus, to avoid this scenario, a two-stage stratiﬁed random sampling approach was used to
constrain (weight) the impact of possible omission errors on a preexisting grid cell. A mesh of grids was created over Brazil, encompassing 250 km × 250 km cells, for a total of 182 cells. Importantly, the
error assessment grid is independent of the U-Net activation grid
shown in Fig. 6 and Supplementary Material S.1.
The double-stage stratiﬁcation approach considers that the existence of the grid, by itself, demands a simple and random distribution
of a given number of samples per grid, even when a speciﬁc cell shows
no sign of mining pixels. The second branch of the dual stratiﬁcation
structure considers the area proportions of mining and non-mining
strata. Here, the area of each class serves as a weighting factor that
forces the distribution of varying samples within each of the two
possible classes, whether mining or non-mining. In this way,
52,320 samples were distributed throughout the Brazilian territory, S.1
Supplementary Material.

Nature Communications | (2024)15:9847

https://doi.org/10.1038/s41467-024-54220-2

The mathematical model that governs the number of mining
and non-mining samples to be distributed per grid can be described
as follows:
P
N=

i W i Si

!2

Sð ^
OÞ

^ is the admitted standard error of the estimated OA, which is
where SðOÞ
set to 0.005 in our case, W i is the mapped area proportion of class i,
and Si is the standard deviation of stratum i85. Summation was performed over the different classes.
Once calculated and distributed, this layer of samples was
manually validated. In this step, three specialists visually interpreted
the same orbital inputs to which the contextual classiﬁcation algorithm
was subjected. In addition to Landsat data, human evaluators can
access higher-resolution images from Google and Planet (when spatially and temporarily available) as inputs to facilitate decision-making.
During the validation routine, human interpreters choose only two
categorical options for each sample point/pixel: a) mining (Mi) and b)
non-mining (N-Mi). In addition to categorical labels, it was possible to
report technical difﬁculties that prevented visual interpretation: a)
clouds or shadows, b) no data, c) edge/border pixels, and d) isolated
pixel clusters.
In the case of possible divergence between human interpretations, the golden rule (majority decision) was used as a ﬁnal decision
strategy. Once ﬁnished, each validated sample was cross-compared
with its corresponding annual map, and an error matrix was computed.
The following error metrics were extracted from the generated contingency tables: overall accuracy (OA) and per-class PA [PA(Mi) and
[PA(N-Mi)] and CA [CA(Mi) and CA(N-Mi)] measures86,87.
It is essential to mention that the error analysis stage focused on
evaluating the classiﬁer’s effectiveness, trained to identify mining
areas, regardless of whether they are industrial mining or garimpo
sites. Thus, the error evaluation process involved two stages of stratiﬁed random sample design based on the binary probability density
function, allocating samples to the mining (Mi) and non-mining (N-Mi)
classes. Furthermore, it considered the cost and effort of assessing the
accuracy of a cartographic product on a continental and multitemporal scale of rare events such as mining. As a result, the binary
assessment path was chosen, limited by the output of U-Net used in
labeling the Landsat pixels.

Reporting summary
Further information on research design is available in the Nature
Portfolio Reporting Summary linked to this article.

Data availability
The classiﬁer outputs, high resolution ﬁgures and other ancillary ﬁles
are all available in the informed GitLab repository. Please visit https://
gitlab.com/luizcf14/brazil-mining.

Code availability
The backbone code of the article is available in a Git-lab repository.
Please visit https://gitlab.com/luizcf14/brazil-mining.

References
1.

2.

Cypher, J. M. South America’s commodities boom: developmental
opportunity or path dependent reversion? Can. J. Dev. Stud. / Rev.
canadienne d. ’études du d. éveloppement 30, 635–662 (2010).
Paiva, P. H. de A. & Bacha, C. J. C. The gross domestic product (GDP)
shares of the agriculture sector and the hydrocarbon and mining
sector in the countries of South America between 1960 and 2014.
CEPAL Review (2019).

12

Article
3.

Machado, I. F. & de M. Figueirôa, S. F. 500 years of mining in Brazil: a
brief review. Resour. Policy 27, 9–24 (2001).
4. Bruno, D. E. et al. Artisanal and small-scale gold mining, meandering tropical rivers, and geological heritage: evidence from Brazil
and Indonesia. Sci. Total Environ. 715, 136907 (2020).
5. Fritz, M., McQuilken, J., Collins, N. & Weldegiorgis, F. Global Trends
in Artisanal and Small-Scale Mining (ASM): A Review of Key Numbers
and Issues. (International Institute for Sustainable Development
Winnipeg, MB, Canada, 2018).
6. Gautam, R., Kim, Y., Topal, E. & Hitch, M. Correlation between
COVID-19 cases and gold price ﬂuctuation. Int. J. Min., Reclam.
Environ. 36, 574–586 (2022).
7. Lobo, F. D. L., Souza-Filho, P. W. M., Novo, E. M. L. d. M., Carlos, F. M.
& Barbosa, C. C. F. Mapping Mining Areas in the Brazilian Amazon
Using MSI/Sentinel-2 Imagery (2017). Remote. Sens. 10, 1178 (2018).
8. Crespo-Lopez, M. E. et al. Mercury: what can we learn from the
Amazon? Environ. Int. 146, 106223 (2021).
9. Macklin, M. G. et al. Impacts of metal mining on river systems: a
global assessment. Science 381, 1345–1350 (2023).
10. Watts, J. Health emergency over Brazil’s Yanomami people. Lancet
401, 631 (2023).
11. Da Luz Scherf, E. & Viana da Silva, M. V. Brazil’s Yanomami
health disaster: addressing the public health emergency
requires advancing criminal accountability. Front. Public
Health 11, 1166167 (2023).
12. Telmer, K., Costa, M., Simões Angélica, R., Araujo, E. S. & Maurice, Y.
The source and fate of sediment and mercury in the Tapajós River,
Pará, Brazilian Amazon: Ground- and space-based evidence. J.
Environ. Manag. 81, 101–113 (2006).
13. Berzas Nevado, J. J. et al. Mercury in the Tapajós River basin, Brazilian Amazon: a review. Environ. Int. 36, 593–608 (2010).
14. Dethier, E. N. et al. A global rise in alluvial mining increases sediment load in tropical rivers. Nature 620, 787–793 (2023).
15. Marques, F. & Guzman, E. R. Mining in Latin America. an overview of
mining law in Argentina, Brazil, Chile, and Peru. trends and main
challenges. McCarthy Tétrault http://mccarthy.ca/pubs/MINING_
LAW_Latin_America-McCarthy-Tetrault-2017.pdf (2017).
16. Urkidi, L. & Walter, M. Dimensions of environmental justice in antigold mining movements in Latin America. Geoforum 42, 683–695
(2011).
17. Helwege, A. Challenges with resolving mining conﬂicts in Latin
America. Extractive Industries Soc. 2, 73–84 (2015).
18. Haslam, P. A. & Ary Tanimoune, N. The determinants of social
conﬂict in the Latin American mining sector: new evidence with
quantitative data. World Dev. 78, 401–419 (2016).
19. MPF. Mineração Ilegal de Ouro Na Amazônia: Marcos Jurídicos e
Questões Controversas. 4ª Câmara de Coordenação e Revisão do
Ministério Público Federal. Série Manuais de Atuação, 7 (2020).
20. Congresso Nacional. Lei No. 9.985/2000: Regulamenta o Art. 225, §
1o, Incisos I, II, III e VII Da Constituição Federal, Institui o Sistema
Nacional de Unidades de Conservação Da Natureza e Dá Outras
Providências. (2000).
21. Tang, L. & Werner, T. T. Global mining footprint mapped from highresolution satellite imagery. Commun. Earth Environ. 4, 134 (2023).
22. Maus, V. et al. An update on global mining land use. Sci. Data 9,
433 (2022).
23. Manzolli, B. et al. Legalidade da Produção de Ouro no Brasil. IGC/
UFMG (2021).
24. Swenson, J. J., Carter, C. E., Domec, J.-C. & Delgado, C. I. Gold
Mining in the Peruvian Amazon: Global Prices, Deforestation, and
Mercury Imports. PLOS ONE 6, e18875 (2011).
25. Vega, C. M., Orellana, J. D. Y., Oliveira, M. W., Hacon, S. S. & Basta, P.
C. Human mercury exposure in Yanomami Indigenous villages from
the Brazilian Amazon. Int. J. Environ. Res. Public Health 15,
1051 (2018).

Nature Communications | (2024)15:9847

https://doi.org/10.1038/s41467-024-54220-2
26. Castro, M. C. & Peterka, C. Malaria is increasing in Indigenous and
artisanal mining areas in the Brazilian Amazon. Nat. Med. 29,
762–764 (2023).
27. Lobo, F. L., Costa, M. P. F. & Novo, E. M. L. M. Time-series analysis of
landsat-MSS/TM/OLI images over Amazonian waters impacted by
gold mining activities. Remote Sens. Environ. 157, 170–184 (2015).
28. Lobo, F. D., Costa, M., Novo, E. M. & Telmer, K. Distribution of artisanal and small-scale gold mining in the tapajós river basin (Brazilian Amazon) over the past 40 years and relationship with water
siltation. Remote Sens. 8, 579 (2016).
29. MapBiomas. Projeto MapBiomas – Coleção 8 da Série Anual de
Mapas de Cobertura e Uso da Terra do Brasil. Entre (1985 e 2022).
[https://www.mapbiomas.org/] acessado em [26/06/2023].
(2023).
30. Souza, C. M. et al. Reconstructing three decades of land use and
land cover changes in Brazilian biomes with Landsat archive and
earth engine. Remote Sensing 12, 2735 (2020).
31. MapBiomas. Mapeamento das Pistas de Pouso e Garimpo na Amazônia. (2023).
32. Basso, G. Ibama: garimpo ilegal perde R$ 1 bilhão em máquinas
com operações na Amazônia. Reporter Brasil (2023).
33. IBAMA. Governo federal anuncia presença permanente e investimentos de R$ 1,2 bi na TI Yanomami. https://www.gov.br/ibama/ptbr/assuntos/noticias/2024/governo-federal-anuncia-presencapermanente-e-investimentos-de-r-1-2-bi-na-ti-yanomami (2024).
34. Andreoni, M., Migliozzi, B., Robles, P. & Lu, D. The illegal airstrips
bringing toxic mining to Brazil’s indigenous land. The New York
Times (2022).
35. Diniz, C. et al. Nota Técnica sobre Garimpo no Rio Madeira. (2021).
36. COEMA. Resol. No. 120/2015: Dispõe Sobre as Atividades de
Impacto Ambiental Local, de Competência Dos Municípios, e dá
Outras Providências. (2015).
37. MPF. Recom. No 01/2023: Recomendação Para Que Não Se Admita
o Licenciamento Ambiental Municipal Para Empreendimentos de
Garimpo Considerando-Se a Regionalidade Dos Impactos. (2023).
38. INSTITUTO ESCOLHAS. Where does so much mercury come from?
São Paulo, Brasil (2024).
39. Gonzales, O. C. The Business of mercury in Bolivia: a study about
the commercialization of mercury for gold mining in Bolivia. LA
LIBRE Editorial Project, Cochabamba, Bolivia, (2020).
40. Seccatore, J., Veiga, M., Origliasso, C., Marin, T. & De Tomi, G. An
estimation of the artisanal small-scale production of gold in the
world. Sci. Total Environ. 496, 662–667 (2014).
41. Passos, C. J. S. et al. Daily mercury intake in ﬁsh-eating populations
in the Brazilian Amazon. J. Expo. Sci. Environ. Epidemiol. 18,
76–87 (2008).
42. Gimenes, T. C., Penteado, J. O., dos Santos, M. & da Silva Júnior, F.
M. R. Methylmercury in Fish from the Amazon Region—a Review
Focused on Eating Habits. Water, Air, & Soil Pollution 232, 199 (2021).
43. Hacon, SdeS. et al. Mercury exposure through ﬁsh consumption in
traditional communities in the Brazilian Northern Amazon. Int. J.
Environ. Res. Public Health 17, 5269 (2020).
44. Begossi, A. et al. Fish consumption on the Amazon: a review of
biodiversity, hydropower and food security issues. Braz. J. Biol. 79,
345–357 (2019).
45. Peplow, D. & Augustine, S. Neurological abnormalities in a mercury
exposed population among indigenous Wayana in Southeast Suriname. Environ. Sci.: Process. Impacts 16, 2415–2422 (2014).
46. Harada, M. et al. Mercury pollution in the Tapajos River basin,
Amazon. Environ. Int. 27, 285–290 (2001).
47. Lacerda, E. M. D. C. B. et al. Comparison of visual functions of two
Amazonian populations: possible consequences of different mercury exposure. Front. Neurosci. 13, 1428 (2020).
48. Beneﬁce, E., Luna-Monrroy, S. & Lopez-Rodriguez, R. Fishing
activity, health characteristics and mercury exposure of Amerindian
13

Article
women living alongside the Beni River (Amazonian Bolivia). Int. J.
Hyg. Environ. Health 213, 458–464 (2010).
49. Fillion, M. et al. Neurotoxic sequelae of mercury exposure: an
intervention and follow-up study in the Brazilian Amazon. EcoHealth
8, 210–222 (2011).
50. Fillion, M. et al. Visual acuity in ﬁsh consumers of the Brazilian
Amazon: risks and beneﬁts from local diet. Public Health Nutr. 14,
2236–2244 (2011).
51. Costa Junior, J. M. F. et al. Manifestações emocionais e motoras de
ribeirinhos expostos ao mercúrio na Amazônia. Rev. Brasileira de.
Epidemiologia 20, 212–224 (2017).
52. Dolbec, J., Mergler, D., Sousa Passos, C.-J., Sousa de Morais, S. &
Lebel, J. Methylmercury exposure affects motor performance of a
riverine population of the Tapajós river, Brazilian Amazon. Int. Arch.
Occup. Environ. Health 73, 195–203 (2000).
53. Khoury, E. D. T. et al. Manifestações neurológicas em ribeirinhos de
áreas expostas ao mercúrio na Amazônia brasileira. Cad. Saúde.
Pública 29, 2307–2318 (2013).
54. Chevrier, C. et al. Qualitative assessment of visuospatial errors in
mercury-exposed Amazonian children. NeuroToxicology 30, 37–46
(2009).
55. Santos-Lima, C. D. et al. Neuropsychological effects of mercury
exposure in children and adolescents of the Amazon Region, Brazil.
NeuroToxicology 79, 48–57 (2020).
56. Reuben, A. et al. Elevated hair mercury levels are associated with
neurodevelopmental deﬁcits in children living near artisanal and
small‐scale gold mining in Peru. GeoHealth 4, e2019GH000222
(2020).
57. Aska, B., Franks, D. M., Stringer, M. & Sonter, L. J. Biodiversity conservation threatened by global mining wastes. Nat. Sustain. https://
doi.org/10.1038/s41893-023-01251-0 (2023).
58. Montaña, C. G., Liverpool, E., Taphorn, D. C. & Schalk, C. M. The cost
of gold: Mercury contamination of ﬁshes in a Neotropical river food
web. Neotrop. ichthyol. 19, e200155 (2021).
59. Silva-Junior, C. H. L. et al. Brazilian Amazon indigenous territories
under deforestation pressure. Sci. Rep. 13, 5851 (2023).
60. Qin, Y. et al. Forest conservation in Indigenous territories and protected areas in the Brazilian Amazon. Nat. Sustainability 6,
295–305 (2023).
61. Fellows, M. et al. Scars of Mining in Indigenous Lands of the Brazilian Amazon. (2024).
62. Congresso Nacional. Lei No. 11.685/2008: Institui o Estatuto Do
Garimpeiro. (2008).
63. CONAMA. Resol. No. 237/1997: Dispõe Sobre a Revisão e Complementação Dos Procedimentos e Critérios Utilizados Para o
Licenciamento Ambiental. (1997).
64. Congresso Nacional. Lei No. 12.844/2013: Regula a Compra, Venda
e Transporte de Ouro e Dá Outras Providências. (2013).
65. Mauro, E. PL No. 5822/2019: Acrescenta Redação à Lei No 9.985, de
18 de Julho de 2000, Para Viabilizar o Licenciamento Ambiental de
Lavras Garimpeiras de Pequeno Porte Em Unidades de Conservação
de Uso Sustentável Do Tipo Floresta Nacional. (2019).
66. Poder Executivo. PL No. 191/2020: Regulamenta o § 1o Do Art. 176 e o
§ 3o Do Art. 231 Da Constituição Para Estabelecer as Condições
Especíﬁcas Para a Realização Da Pesquisa e Da Lavra de Recursos
Minerais e Hidrocarbonetos e Para o Aproveitamento de Recursos
Hídricos Para Geração de Energia Elétrica Em Terras Indígenas e
Institui a Indenização Pela Restrição Do Usufruto de Terras Indígenas. (2020).
67. Medeiros, J. PL No. 571/2022: Acrescenta o Art. 82-A Ao Decreto-Lei
No 227, de 28 de Fevereiro de 1967, “Código de Minas”, Para Criar
Condições Especiais Ao Exercício de Atividade Minerária Em Caso de
Interesse à Soberania Nacional, Assim Declarado Pelo Presidente da
República. (2022).

Nature Communications | (2024)15:9847

https://doi.org/10.1038/s41467-024-54220-2
68. Diniz, C. G. et al. DETER-B: The New Amazon Near Real-Time
Deforestation Detection System. IEEE J. Sel. Top. Appl. Earth
Observations Remote Sens. 8, 3619–3628 (2015).
69. MapBiomas Alerta. Projeto MapBiomas Alerta - Sistema de Validação e Reﬁnamento de Alertas de Desmatamento com Imagens de
Alta Resolução: [https://alerta.mapbiomas.org/] acessado em [26/
06/2023]. 2023 (2023).
70. RAISG. Rede Amazônca de Informação Socioambiental Georreferenciada - RAISG: [https://www.raisg.org/] acessado em [26/06/
2023] (2023).
71. ISA. Instituto Socioambiental - ISA: [https://www.socioambiental.
org/] acessado em [26/06/2023]. (2023).
72. CPRM. Sistema de Geociências do Serviço Geológico do Brasil CPRM - GeoSGB: [https://geoportal.cprm.gov.br/] acessado em
[26/06/2023] (2023).
73. Ahkbrasilien. Mapa da Mineração Brasileira - Câmara de Comercio e
Industria Brasil-Alemanha: [www.ahkbrasilien.com.br/projetos/
mineracao/mapa-da-mineracao-brasileira/] acessado em [26/06/
2023] (2023).
74. AMW. Amazon Mining Watch: [https://amazonminingwatch.org/]
acessado em [26/06/2023] (2023).
75. Ronneberger, O., Fischer, P. & Brox, T. U-Net: Convolutional Networks for Biomedical Image Segmentation. CoRR abs/1505.0,
(2015).
76. USGS. LANDSAT Collection 1 Level 1 Product Deﬁnition. (Earth
Resources Observation and Science (EROS) Center, 2017).
77. Storey, J., Choate, M. & Lee, K. Landsat 8 operational land imager
on-orbit geometric calibration and performance. Remote Sens. 6,
11127–11152 (2014).
78. Teillet, P. M. et al. Radiometric cross-calibration of the Landsat-7
ETM+ and Landsat-5 TM sensors based on tandem data sets.
Remote Sens. Environ. 78, 39–54 (2001).
79. Gorelick, N. et al. Google Earth Engine: Planetary-scale geospatial
analysis for everyone. Remote Sens. Environ. 202, 18–27 (2017).
80. Diniz, C. et al. Brazilian Mangrove Status: Three Decades of Satellite
Data Analysis. Remote Sens. 11, 808 (2019).
81. Diniz, C. et al. A Large-Scale Deep-Learning Approach for MultiTemporal Aqua and Salt-Culture Mapping. Remote Sens. 13,
1415 (2021).
82. Veríssimo, A., Rolla, A., Vedoveto, M. & Futada, S. de M. Áreas
Protegidas na Amazônia Brasileira: avanços e desaﬁos. Imazon/
Instituto Socioambiental (2011).
83. Presidência da República. Del No. 227/1967: Dá Nova Redação Ao
Decreto-Lei No 1.985, de 29 de Janeiro de 1940. (Código de
Minas). (1967).
84. Congresso Nacional. Lei No. 7.805/1989: Altera o Decreto-Lei No
227, de 28 de Fevereiro de 1967, Cria o Regime de Permissão de
Lavra Garimpeira, Extingue o Regime de Matrícula, e Dá Outras
Providências. (1989).
85. Cochran, W. G. Sampling Techniques. (john wiley & sons, 1977).
86. Pontius, R. G. & Millones, M. Death to Kappa: birth of quantity disagreement and allocation disagreement for accuracy assessment.
Int. J. Remote Sens. 32, 4407–4429 (2011).
87. Pontius, R. G. & Santacruz, A. Quantity, exchange, and shift components of difference in a square contingency table. Int. J. Remote
Sens. 35, 7543–7554 (2014).
88. Xu, H. Modiﬁcation of normalised difference water index (NDWI) to
enhance open water features in remotely sensed imagery. Int. J.
Remote Sens. 27, 3025–3033 (2006).
89. Tucker, C. J. Red and photographic infrared linear combinations for
monitoring vegetation. Remote Sens. Environ. 8, 127–150 (1979).
90. Rogers, A. S. & Kearney, M. S. Reducing signature variability in
unmixing coastal marsh Thematic Mapper scenes using spectral
indices. Int. J. Remote Sens. 25, 2317–2335 (2004).

14

Article

Acknowledgements
The authors thank the Brazilian National Council for Scientiﬁc and
Technological Development (CNPq) and Harvard University as partial
funders of this research. The Junior Post-Doc Funding (PDJ-152722/20220), the CNPq Research Productivity grant (309045/2023-1), and the
Harvard Data Science Initiative (HDSI) were essential for the ﬁnancial
support of some of the authors. We acknowledge the Faculty of GeoInformation Science and Earth Observation (ITC), University of Twente,
for the long-term hosting of the authors as a counterpart of a scientiﬁc
cooperation agreement. The authors also thank the MapBiomas Network
and the GEE team. Together, the GEE and MapBiomas initiative constitute the structural foundation of this study.

Author contributions

https://doi.org/10.1038/s41467-024-54220-2
Correspondence and requests for materials should be addressed to
Luiz Cortinhas Ferreira Neto or Cesar Guerreiro Diniz.
Peer review information Nature Communications thanks Luis Enrique
Sánchez and the other, anonymous, reviewer(s) for their contribution to
the peer review of this work. A peer review ﬁle is available.
Reprints and permissions information is available at
http://www.nature.com/reprints
Publisher’s note Springer Nature remains neutral with regard to jurisdictional claims in published maps and institutional afﬁliations.

The authors declare no competing interests.

Open Access This article is licensed under a Creative Commons
Attribution-NonCommercial-NoDerivatives 4.0 International License,
which permits any non-commercial use, sharing, distribution and
reproduction in any medium or format, as long as you give appropriate
credit to the original author(s) and the source, provide a link to the
Creative Commons licence, and indicate if you modiﬁed the licensed
material. You do not have permission under this licence to share adapted
material derived from this article or parts of it. The images or other third
party material in this article are included in the article’s Creative
Commons licence, unless indicated otherwise in a credit line to the
material. If material is not included in the article’s Creative Commons
licence and your intended use is not permitted by statutory regulation or
exceeds the permitted use, you will need to obtain permission directly
from the copyright holder. To view a copy of this licence, visit http://
creativecommons.org/licenses/by-nc-nd/4.0/.

Additional information

© The Author(s) 2024

Conceptualization, C.G.D., L.C.F.N. and P.W.M.S.-F.; methodology,
C.G.D. and L.C.F.N.; software development, L.C.F.N., and M.L.P.; sampling design, L.C.F.N. and M.A.; validation, L.W.R.S, A.F.F, J.C, A.A.A.S,
J.P.F, D.C.S.; formal analysis, C.G.D, L.C.F.N and M.A.; investigation,
C.G.D and L.C.F.N.; resources, C.G.D, L.C.F.N, M.C.C and P.W.M.S.-F.;
data curation, C.G.D, L.C.F.N and M.A.; writing—original draft preparation, C.G.D and L.C.F.N.; writing—review and editing, C.G.D., R.V.M.,
C.P., M.C.C., M.A., J.C., P.W.M.S.-F., A.S., A.B. and A.K.; visualization,
C.G.D., L.W.R.S. and J.C.; supervision, A.K., C.P., R.V.M. and M.C.C.;
project administration, C.G.D. and L.C.F.N.; funding acquisition, C.G.D.,
L.C.F.N., P.W.M.S.-F. and M.C.C.

Competing interests

Supplementary information The online version contains
supplementary material available at
https://doi.org/10.1038/s41467-024-54220-2.

Nature Communications | (2024)15:9847

15


```

---

## Referencia BibTeX

```bibtex
@article{ferreiranetoUncontrolledIllegalMining2024,
  title = {Uncontrolled {{Illegal Mining}} and {{Garimpo}} in the {{Brazilian Amazon}}},
  author = {Ferreira Neto, L. C. and Diniz, C. G. and Maretto, R. V. and Persello, C. and Pinheiro, M. L. S. and Castro, M. C. and others},
  year = 2024,
  journal = {Nature Communications},
  volume = {15},
  doi = {10.1038/s41467-024-54220-2},
  file = {/home/fernando/Zotero/storage/U34C54R5/Ferreira Neto et al. - 2024 - Uncontrolled Illegal Mining and Garimpo in the Brazilian Amazon.pdf}
}
```
