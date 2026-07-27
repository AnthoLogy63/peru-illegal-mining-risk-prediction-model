# Why Is Everyone Training Very Deep Neural Network With Skip Connections?

**BibTeX Key:** `oyedotunWhyEveryoneTraining2023`  
**Authors:** Oyedotun, Oyebade K. and Ismaeil, Kassem Al and Aouada, Djamila  

---

## Resumen / Notas (Tuyo)

*(Escribe aquí tus notas)*

---

## Texto Completo del Artículo (Extraído del PDF)

```text
JOURNAL OF LATEX CLASS FILES, VOL. XX, NO. X, APRIL 2020

1

Why is Everyone Training Very Deep Neural
Network with Skip Connections?
Oyebade K. Oyedotun, Student Member, IEEE, Kassem Al Ismaeil, Member, IEEE,
and Djamila Aouada, Senior Member, IEEE,

Abstract—Recent deep neural networks (DNNs) with several
layers of feature representations rely on some form of skip connections to simultaneously circumnavigate optimization problems
and improve generalization performance. However, the operations of these models are still not clearly understood, especially
in comparison to DNNs without skip connections referred to as
PlainNets that are absolutely untrainable beyond some depth. As
such, the exposition of this paper is the theoretical analysis of the
role of skip connections in training very DNNs using concepts
from linear algebra and random matrix theory. In comparison
with PlainNets, the results of our investigation directly unravel
the following (i) why DNNs with skip connections are easier to
optimize (ii) why DNNs with skip connections exhibit improved
generalization. Our investigation results concretely show that the
hidden representations of PlainNets progressively suffer from
information loss via singularity problems with depth increase,
and thus making their optimization difficult. In contrast, as
model depth increases, the hidden representations of DNNs
with skip connections circumnavigate singularity problems to
retain full information that reflects in improved optimization
and generalization. For theoretical analysis, this paper studies in
relation to PlainNets two popular skip-connection based DNNs
that are residual networks (ResNets) and residual network with
aggregated features (ResNeXt).

Fig. 1: The impact of depth on achieved error rate (%) for the
ImageNet-2012 dataset [25]

In the early period of DNNs, most models employed two
to four feature representation layers to achieve improved
results [22], [23]. However, there has been consistent desire
Index Terms—Very deep neural network, skip connection,
ever since to train deeper models, given that there seems to be
optimization, generalization
a positive correlation between model depth and generalization
performance based on empirical studies. In fact, one can
I. I NTRODUCTION
observe the evolution of the state-of-the-art results on the
Deep neural networks (DNNs) have given remarkable results popular ImageNet-2012 classification dataset [24]; better results
on various learning tasks. On one hand, the capability to have been reported by using deeper models; see Fig. 1 [25].
automatically learn relevant features in an end-to-end fashion Interestingly, there are theoretical works [26], [27], [28] that
from different datasets [1], [2] makes DNNs quite appealing as substantiate the impact of depth for function approximation
opposed to the traditional method of handcrafting features, and capacity of DNNs. It is important to note in Fig. 1 that both
then employing a simple classifier. On the other hand, DNNs AlexNet and ZFNet are PlainNets, while both GoogleNet and
are often considered as black-box models due to the limited ResNet use some form of skip connections. Generally, training
knowledge of what has been learned in the different layers [3], PlainNets with few number of layers (i.e. typically one to
[4], [5], and why simple gradient descent is generally able to ten layers) is not problematic. However, when model depth is
find decent solutions for such highly non-convex optimization extended beyond 10 layers, training difficulty can ensue. This
problems [6], [7]. Nevertheless, considerable progress has been problem typically worsens with depth increase, and sometimes
made in different aspects of understanding the operation of the even the training set cannot be fitted [29], [30]. For example, the
DNNs. Some of these include various visualization methods [8], work in [31] reported that though the VGG-11 model (having
[9], [10], [11], saliency tracking and pruning for identifying 11 layers) could be successfully trained from scratch, there was
important parameters [12], [13], analytical studies of model optimization failure for the VGG-13 model (having 13 layers),
representational capacity [14], [15], [16], and works on model VGG-16 model (having 16 layers) and VGG-19 model (having
19 layers) when training from scratch. As such, the VGGoptimization [17], [18] and generalization [19], [20], [21].
13 model was successfully trained by initializing its first 11
O.K. Oyebade, K. Ismaeil and D. Aouada are with the Interdisciplinary layers with the weights of the already trained VGG-11 model.
Centre for Security, Reliability and Trust (SnT), University of Luxembourg, Furthermore, the VGG-16 model was trained by initializing
L-1855 Luxembourg.
its layers with the weights of the already trained VGG-13.
E-mail: {oyebade.oyedotun, kassem.alismaeil, djamila.aouada}@uni.lu.
Manuscript received April 10, 2020; revised XX XX, 20XX.
Similarly, the successful training of the VGG-19 model relied

JOURNAL OF LATEX CLASS FILES, VOL. XX, NO. X, APRIL 2020

2

on initializing its layers with the weights of the already trained
II. R ELATED WORK
VGG-16 model. Therefore, recent architectures with over 15
layers employ some form of skip connections, where the outputs
Training PlainNets with several layers usually results in
of preceding layers are connected (e.g. via summation or optimization problems [29], [30]. Generally, training problems
concatenation) to later layers for tackling training problems. In can be observed when model depth exceeds 10 layers depending
fact, the success of this approach has resulted in a proliferation on the specific task [38]. Although various weights initialization
of DNN models with different forms of skip connections, as schemes [39], [40] and batch normalization [41] alleviate
seen in Residual Network (ResNet) [29], [32], FractalNet [33], the training problems, they do not resolve it, as optimizing
ResNeXt [34], PolyNet [35], DenseNet [36] and Inception- PlainNets becomes absolutely impossible beyond a certain
ResNet [37]. Although there is abundant empirical evidence depth [38]; that is, very poor performance is obtained even
that skip connections alleviate training problems and improve on the training set. Interestingly, it has become well-known
model generalization, a concrete explanation for this success that the training problems of very deep PlainNets can be
is still lacking in the deep learning community. Moreover, it is resolved by employing skip connections that connect the
arguable that simply observing that ‘model A’ performs better outputs of preceding layers to the later layers [29], [30]. Some
than ‘model B’ fosters an incomplete knowledge; it is crucial of the popular DNNs, which rely on skip connections for
to understand the unique characteristics of ‘model A’ that result successful training include, the ResNet [29], ResNeXt [34],
in performance improvement as compared to ‘model B’.
highway network (HwNet) [30], densely connected network
In this paper, our main exposition is the theoretical and (DenseNet) [36], resnet of resnet (RoR) [42], dual path network
experimental analysis of DNNs that employ skip connections (DPN) [43], PolyNet [35] and Inception-ResNet [37]. It is
for successful training in relation to PlainNets. Namely, we surprising that despite the success of the aforementioned models
borrow several concepts from linear algebra and random on different challenging tasks, a concrete account of their
matrix theory to posit new interpretations for the role of skip operation in relation to how they circumnavigate optimization
connections in circumnavigating optimization problems and problems, and on top of that achieve improved generalization
improving model generalization. In our theoretical treatment, as compared to PlainNets is still lacking in the deep learning
we consider a class of DNNs that employ skip connections community.
of identity mappings, and the summation of preceding layers’ The learning attributes of the ResNet were studied in [44],
outputs with the current layer. Specifically, we consider two where the problem of shattered gradients was investigated
popular and extremely successful models in the literature, which based on carefully designed experiments. Using auto correlation
are the ResNet [29] and residual network with aggregated function results, the gradients of the 1-layer (i.e. shallow)
features (ResNeXt) [34]. Our main contributions in this paper PlainNet was found to resemble brown noise, and thus allow
are the following:
successful optimization. In contrast, the gradients of the
24-layer (i.e. very deep) PlainNet was found to resemble
1) Analyse theoretically the optimization characteristics of
white noise, and hence very problematic for optimization.
very deep DNNs based on the singularity of the hidden
Fascinatingly, it was observed that the gradients of the 50representations. Our approach leverages several aspects
layer (i.e. very deep) ResNet falls between the brown noise
of linear algebra and random matrix theory.
and white noise. As such, [44] concluded that the gradients
2) Establish the connection between the singularity of
of ResNet are resistant to shattering; that is, they are wellhidden representations and the singularity of computed
structured, and therefore the ResNet is trainable even with
error gradients and weight updates that contribute to the
several layers. Furthermore, it was found that the training of
optimization condition of DNNs during backpropagation.
DNNs become more difficult as the gradients’ structure transit
3) Show that the condition of hidden representations of very
from brown noise to white noise; this occurred as the DNNs
deep DNNs reflects on their generalization capabilities.
became deeper. The work in [45] used an unrolled view to
In addition, we show concretely for the first time in
argue that the ResNet operates like an ensemble of shallow
the literature why the ResNeXt [34] mostly generalizes
neural networks, suggesting that their true depths are much
better than the ResNet [29].
lesser than their topological depths. Furthermore, [45] argued
4) Provide extensive experiments to corroborate theoretical
that paths via the ResNet are of varying lengths and have
results by using benchmarking datasets such as MNIST,
limited dependence on one another. This revelation indeed
CIFAR-10, CIFAR-100 and ImageNet.
suggests that the ResNet seems to depart from the strictly
The remainder of this paper is organized as follows. Section hierarchical operation of classical DNNs, i.e., PlainNets. In
II discusses related works. In Section III, the relevance of addition, [45] showed that the effective depth through which
studying linear DNNs is discussed as background, and a error gradients flow in the ResNet is far smaller than the
formal introduction to PlainNet, ResNet and ResNeXt models is architectural depth; for instance, only 17 layers for a 110provided as preliminaries. The proposed theoretical study of the layer ResNet. The same work [45] found that removing any
role of skip connections for optimizing the different DNNs is single block of layers in a trained ResNet does not result in
presented in Section IV. Section V relates how skip connections a catastrophic testing performance; the performance of the
impact model generalization. Extensive experimental results ResNet was observed to remain mostly the same. In contrast, it
along with discussions are given in Section VI. Finally, the was seen that removing any single block in the VGG model (i.e.
paper is concluded in Section VII.
PlainNet) resulted in a catastrophic testing performance that

JOURNAL OF LATEX CLASS FILES, VOL. XX, NO. X, APRIL 2020

is expected in a DNN, where the hidden representations are
strictly hierarchical and sequential. Finally, it was posited that
the ResNet circumnavigates training problems by employing
mostly short paths to propagate error gradients.
In a different line of investigative work, [46] proposed the
unrolled iterative estimation view of features at different DNN
layer stages. The work posited that the different layers in
the ResNet do not compute entirely new representations as
in the PlainNet. Furthermore, it was argued that the ResNet
representations can be divided into stages, and groups of
residual blocks mostly perform iterative refinement of similar
of features in a specific stage. Subsequently, new hidden
representations are computed at other stages in the ResNet. In
a following work [47], it was observed that the ResNet mostly
concentrate representation learning in the first few layers, and
employ the later layers for iterative refinement of already
extracted representations.
The discretized dynamical systems view for the ResNet was
proposed in [48], [49]. Basically, each time step was viewed as
a transformation, akin to the layer transformation in the classical
neural network. Additional works [50], [51] in this direction
explored the concept of energy conservation via Hamilton
systems and other constraints for analysing the ResNet.
Similar to the aforementioned works, this paper is dedicated
to studying the unique properties of the DNNs that use
skip connections. Specifically, we take the ResNet [29] and
ResNeXt [34] as our case studies. However, the perspective of
investigation, analysis and interpretation of results are different
to the discussed related works [44], [45], [46]. Furthermore,
we provide explanations and new insights into the improved
generalization capacity of the ResNet and ResNeXt. This is a
key contribution that is missing in the literature.
III. P RELIMINARIES
A. Relevance of linear models
It is well known that strict theoretical analysis of practical
DNNs is problematic, and various simplifications are often
necessary for analytical tractability. Some of these problems
stem from the compositional structure of DNNs, and especially
the non-linear activation functions that they employ such
that theoretical analysis entails treating highly non-convex
optimization problems. Consequently, many works assume
the linear activation function (i.e. linear units) amongst other
simplifications [52], [53], [54], [55], [56]. In fact, both linear
activation function and convex loss are assumed in [57], and
stricter assumptions based on the number of hidden units, data
points and layers are found in [58].
Subsequently, for the ease of theoretical analysis, the linear
activation function is also assumed in this paper. Interestingly,
this assumption has been found to be of negligible impact, since
obtained results are quite relatable to models that assume the
non-linear activation functions. For instance, the relevance of
the theoretical results obtained from linear DNNs is discussed
in [55]. Furthermore, [54] notes that the empirical observations
made in DNNs with linear activation functions generally agree
with those obtained using non-linear activation functions. These
observations are not surprising given that the loss function of

3

the DNN (having 2 or more layers) with a linear activation
is non-convex, similar to the DNN (having 2 or more layers)
with non-linear activation function. Notwithstanding, we show
that the theoretical results in this paper, which are based on
linear activation function clearly agree with practical DNNs
by employing the non-linear activation function (i.e. Rectified
linear function) for all experiments. Interestingly, assuming a
linear activation function for our theoretical analysis has the
advantage of decoupling the training problems of very DNNs
from the popular problem of activation function saturation [39].

B. DNNs without and with skip Connections
In this section, the transformation learned by the DNN
without skip connections, PlainNet, is presented. Furthermore,
the different transformations learned by the DNNs with skip
connections in this paper, ResNet and ResNeXt, are given. The
formalization of the distinct transformations learned by the
different DNNs would be useful for the main analyses in the
following sections.
1) Plain network (PlainNet): This class of DNNs are the
strictly hierarchical models, where only a single path connects
a current layer to the succeeding one, and there is no skip
connection of any sort; see Fig. 2. Considering the input,
h(x)l−2 ∈ Rn (where x ∈ Rn is the input to the DNN), for
l−1
l
the two consecutive layer weights in Fig. 2, Wpb
and Wpb
,
the block’s output can be expressed as
l−1
l
h(x)l = Wpb
Wpb
h(x)l−2 ,

(1)

l−1
l
where Wpb
, Wpb
∈ Rn×n , and pb indicates the weights in
a PlainNet block. For simplicity, the result of transformation
l−1
l
Wpb
Wpb
in the PlainNet block in (1) is lumped as Wpl =
l−1
l
Wpb Wpb , where Wpl ∈ Rn×n , so that we now obtain

h(x)l = Wpl h(x)l−2 .

(2)

2) Residual network (ResNet): The Residual network
(ResNet) block [29] is shown in Fig. 2, and mainly relies
on skip connections of identity mappings, which connect every
residual block (having 2 or 3 weight layers) to the preceding
one. Given the ResNet block, we can write
l−1
l
h(x)l = Wrb
Wrb
h(x)l−2 + h(x)l−2 ,

(3)

l−1
l
where Wrb
, Wrb
∈ Rn×n , and rb indicates the weights in
the ResNet block. In addition, considering the identity matrix
I ∈ Rn×n , factorizing (3) yields


l−1
l
h(x)l = Wrb
Wrb
+ I h(x)l−2 .

(4)

l−1
l
Again, the result of the transformation Wrb
Wrb
in the residual
l−1
l
l
block in (4) is lumped as Wr = Wrb Wrb , where Wrl ∈ Rn×n ,
such that (4) becomes


h(x)l = Wrl + I h(x)l−2 .

(5)

JOURNAL OF LATEX CLASS FILES, VOL. XX, NO. X, APRIL 2020

4

Fig. 2: Models with skip connections considered in this paper. ⊕ denotes addition operation. Left: PlainNet block. Middle:
ResNet block. Right: ResNeXt block. Full DNNs are constructed by stacking several blocks

3) Residual network with features aggregation (ResNeXt):
straightforward. The theoretical study relies on the following
Residual network with features aggregation (ResNeXt) definition, lemma, proposition and corollary.
block [34] aggregates as output the summation of features
Definition 1: If the vector set, {wi ∈ Rn }ni=1 , are the
learned via the different s paths of the ResNeXt block as in columns of a non-singular matrix W ∈ Rn×n , then the vectors
l,k
l−1,k
Fig. 2, where Wgb
, Wgb
∈ Rq×q with k = 1, · · · , s, and {wi }ni=1 are linearly independent and span Rn .
gb indicates the weights in the ResNeXt block. Importantly, For remaining parts of this paper, we clarify the notations
we observe from the construction of the PlainNet, ResNet [29] relating to DNN weight matrices, W m and (W )m . Note that
and ResNeXt [34] blocks in Fig. 2 that q < n. That is, the W m is used to refer to the weight matrix at layer m, while
PlainNet and ResNet blocks use one large matrix for every (W )m is used to refer to a weight matrix W raised to power
transformation, as in Wpl ∈ Rn×n and Wrl ∈ Rn×n , respec- m. That is, (W )m means the weight matrix W multiplied m
tively; see (2) and (5). In contrast, the ResNeXt block uses times.
many smaller s number of matrices for every transformation,
Lemma 1: (Alexeev-Götze-Tikhomirov [59]) Given the
as in Wgl,k ∈ Rq×q given in Fig. 2. Note that the condition entries of the matrix W l ∈ Rn×n : 1 ≤ l ≤ m are
q < n will be important for analysing the subtle difference randomly drawn from a Gaussian distribution and W ∈
between the ResNet and ResNeXt in relation to generalization Q
{W 1 , · · · , W l , · · · , W m } so that we have the products Y =
m
l−2
q
l
m
in Section V. For an input h(x)
∈ R , the output of the
l=1 W and Z = (W ) , the asymptotic behaviour of the
l
q
ResNeXt block, h(x) ∈ R , is
singular spectrum of Y is the same as that of the singular
spectrum of Z.
l
l,s
l−1,s
l−2
l,k
l−1,k
l−2
Proof.
See [59] for the proof that the limit distributions of
h(x) =Wgb Wgb h(x)
+ · · · + Wgb Wgb h(x)
(6) the singular spectrum of both Y and Z is the Fuss-Catalan
l,1
l−1,1
l−2
l−2
+ · · · + Wgb Wgb h(x)
+ h(x) .
distribution.
l,k
l−1,k
l,k
Proposition 1: Given a matrix W ∈ Rn×n whose column
Similarly, for compactness, we let Wg = Wgb Wgb
in (6), where Wgl,k ∈ Rq×q . Finally, using I ∈ Rq×q and vectors, wi , are drawn from a uniform distribution or a
Gaussian distribution, the probability that W is non-singular,
factorizing (6) gives
span
P (wi ∈
/ W−i
), is
span
l
l,s
l,k
l,1
l−2
P (wi ∈
/ W−i
)=1 :1≤i≤n
(9)
h(x) = (Wg + · · · + Wg + · · · + Wg + I)h(x) , (7)
which in a compact form is
h(x)l = (

s
X

Wgl,k + I)h(x)l−2 .

(8)

k=1

IV. T HEORETICAL A NALYSIS OF S KIP C ONNECTIONS FOR
O PTIMIZATION
Herein, we study the role of skip connections (discussed
in Section III) for mitigating information loss and the resulting
singularity problems that ensue in the training of very deep
DNNs. However, optimization properties of the PlainNet are
first given so that comparison with ResNet and ResNeXt is

Proof. See Section A1 in the appendix.
Corollary 1: For an m-layer DNN, the initialization [39],
[40] of all the layer weight matrices, {W l ∈ Rn×n }m
l=1 ,
follows Proposition 1, and thus are all non-singular; using
Definition 1 shows that every W l is of rank n.
Consequently, any W ∈ {W l }m
l=1 admits a singular value
decomposition (SVD) of the form
n
X
W =
σi ui viT , σi ∈ R, σi > 0,
(10)
i=1

where σi are the singular values of W ; ui ∈ Rn and vi ∈ Rn
are the left and right singular vectors of W , respectively; and
T denotes vector transpose.

JOURNAL OF LATEX CLASS FILES, VOL. XX, NO. X, APRIL 2020

It is known that singularity, where at least one singular value of
W is exactly zero is not necessary for optimization problems
to ensue. The near-singularity scenario, where the smallest
singular value is extremely small is sufficient. This reflects in
the condition number κ of W given as

κ(W ) = σmax (W ) σmin (W ),
(11)

5

Since we are ultimately interested in studying the singular
values of h(x)m : m −→ ∞, Lemma 1 simplifies (16) to
h(x)m = (Wp )m x.

(17)

From Lemma 2, putting (Wp )m in (17) yields
h(x)m =

n
X

σp2m
ui uTi . x,
i

(18)
where σmax (W ) and σmin (W ) are the maximum and minii=1
mum singular values of W , respectively. Problems that have where writing out (18) gives
κ(W )  1 are commonly referred to as ill-conditioned, and


n
X
m
2m
T
2m
T
the solutions obtained are typically quite unstable. The Eckarth(x) = σp1 u1 u1 +
σpi ui ui x.
(19)
Young theorem [60], [61] specifically addresses this as follows.
i=2
Theorem 1: (Eckart-Young [60], [61]) For a normalized
Subsequently, (19) is factorized so that we obtain
non-singular matrix M (i.e. k M k= 1), its distance, d, to the
 X

n
σp2m
set of ill-posed problems, S, is
i
m
2m
T
T −1
T
h(x) = σp1 u1 u1 I+
(u1 u1 ) ui ui x. (20)
1
σmin (M )
σ 2m
d(M, S) =
=
.
(12)
i=2 p1
κ(M )
σmax (M )
Given that m −→ ∞ and σp1 > σpi : 2 ≤ i ≤ n as expected
n×n
Lemma 2: For a matrix W ∈ R
, using SVD as in (10), for singular values, (20) becomes
m
(W ) (i.e. W raised to the power of m) can be written as
h(x)m = σp2m
u1 uT1 x.
(21)
n
1
X
m
2m
T
(W ) =
σi ui ui .
(13) Putting (14) in (21) gives
i=1

Proof. See Section A2 in the appendix.
Furthermore, given {ui }ni=1 is a set of orthonormal vectors as
in (10) so that they form a basis in Rn , we can express any
x ∈ Rn as
n
X
x=
αi ui , αi ∈ R,
(14)

h(x)m = σp2m
u1 uT1
1

n
X

αi ui .

(22)

i=1

Finally, applying uTi uj = 0 for i 6= j and uTi ui = 1 to (22)
concludes the proof of Theorem 2.

Remark 1: Considering the input, x, only the first basis
i=1
vector, u1 , contributes to the computation of h(x)m for
m −→ ∞ due to repeated multiplication by {Wpl }m
i=1 . Hence,
Definition 2: A collection of N individual hidden layer
m
n
h(x)
∈
R
for
the
PlainNet
incurs
considerable
information
representations at layer l, h(x)li ∈ Rn , compose the hidden
loss. From Definition 2 and Theorem 2, the columns of a data
representations data batch, H(x)l ∈ Rn×N . Specifically,
n×N
batch for the PlainNet, H(x)m
, are colinear and
p ∈ R
H(x)l = [h(x)l1 , · · · , h(x)li , · · · , h(x)lN ].
m
thus H(x)p exhibits singularity.
Our analysis starts first on the forward-pass and then on the
We note that using deep Gaussian process along with some
backpropagation in relation to optimization conditions.
assumptions, [62] arrived at a similar result as in Theorem 2.
Namely, [62] concluded that the representational capacity of
A. Forward-pass: hidden representations basis loss
DNNs collapses to a single degree of freedom as m −→ ∞.
This section studies the condition of the basis of the hidden In addition, the catastrophic peformance of the PlainNet from
representations learned by the different DNN models in the layer deletion as noted in [45] can be related to Theorem 2. For
forward-pass phase. Particularly, we are interested in observing the worst case, where the deletion of all the m layer weights
m
the loss or preservation of the input data basis as it is forward- sets σp1 = 0 in Theorem 2, we obtain h(x) = 0 so that
there is an absolute collapse of the PlainNet’s performance.
propagated in the hidden layers.
2) Residual network (ResNet): The next theorem relates the
1) Plain network (PlainNet): Given the PlainNet in Section
features conditioning of the ResNet as in Section III.B.2.
III.B.1, we state the following theorem.
Theorem 3: For an input vector x ∈ Rn to a linear m-layer
Theorem 2: For an input x ∈ Rn to a linear m-layer
m
n×n
, · · · , Wrl ∈
PlainNet parameterized by θp = {Wpm ∈ Rn×n , · · · , Wpl ∈ ResNet parameterized by θr = {Wr ∈ R
n×n
2
n×n
1
n×n
, · · · , Wr ∈ R
, Wr ∈ R
}, the hidden layer
Rn×n , · · · , Wp2 ∈ Rn×n , Wp1 ∈ Rn×n }, the hidden layer R
output, h(x)m : m −→ ∞, is
output, h(x)m : m −→ ∞, is
n
X
m
h(x)m = α1 σp2m
u1 ,
(15)
1
h(x)m = α1 u1 [(σr21 + 1) − 1] +
αi ui ,
(23)
i=1
where σp1 and u1 are the first singular value component and
first singular vector of Wpl , respectively; the scalar α1 is the where σr1 and u1 are the first singular value component and
first component of {αi }ni=1 as in (14).
first singular vector of Wrl , respectively.
Proof. The output of the PlainNet in the last layer m can be Proof. Using (5), the final output of the ResNet can be written
written as
as
m
m
Y
Y
m
l
h(x) =
Wp x.
(16)
h(x)m =
(Wrl + I)x.
(24)
l=1

l=1

JOURNAL OF LATEX CLASS FILES, VOL. XX, NO. X, APRIL 2020

6

Again, applying Lemma 1 to (24) simplifies it to
m

h(x)
Expanding (Wr + I)
have

m

Xs ∼ N (

m

= (Wr + I) x.

(25)

in (25) using binomial theorem, we

h(x)m = ((Wr )m + m(Wr )(m−1) + m(m − 1)(Wr )(m−2) /2
+ · · · + I)x.
(26)
Furthermore, using Lemma 2 for (26) gives
 n
n
X
X
m
T
h(x) =
σr2m
u
u
+
m
σr2(m−1)
ui uTi +
i
i
i
i
i=1

m(m − 1)

i=1
n
X

σr2(m−2)
ui uTi /2 + · · · + I
i


x.

i=1

(27)
Given m −→ ∞ and σr1 > σri : 2 ≤ i ≤ n, and
using (14), (27) becomes
m

h(x)


=

σr2m
u1 uT1 + mσr2(m−1)
u1 uT1 +
1
1

X
(28)
n
T
m(m − 1)σr2(m−2)
u
u
/2
+
·
·
·
+
I
α
u
.
i
1
i
1
1
i=1

Applying uTi uj = 0 for

i 6= j and uTi ui = 1 to (28) yields

h(x)m = α1 σr2m
u1 + mα1 σr2(m−1)
u1 +
1
1
m(m − 1)α1 σr2(m−2)
u1 /2 + · · · +
1

n
X

αi ui .

i=1

(29)
Factorizing out α1 u1 gives

m
/2
h(x) = α1 u1 σr2m
+ mσr2(m−1)
+ m(m − 1)σr2(m−2)
1
1
1

n
X
αi ui .
+ · · · + 1 − α1 u1 +
i=1

(30)
Finally, applying binomial theorem again so that (30) can be
compactly written completes the proof of Theorem 3.

Remark 2: Considering the input, x, all the basis, {ui }ni=1
contribute to the computation of h(x)m ∈ Rn for m −→ ∞;
repeated multiplication by {Wrl }m
i=1 does not cause any basis
to vanish. Subsequently, h(x)m for the ResNet retains full
information. From Definition 2 and Theorem 3, the columns
n×N
of a data batch from the ResNet H(x)m
are distinct,
r ∈R
m
and thus H(x)r is non-singular.
Furthermore, the invulnerability of ResNet performance to layer
deletion as noted in [45] can be explained by Theorem 3. In
the worst case, where the deletion of all the m layer
Pnweights
sets σr1 = 0 in Theorem 3, we obtain h(x)m = i=1 αi ui .
Hence, h(x)m = x, and there is no catastrophic performance.
3) ResNeXt: The ResNeXt analysis is based on the discussion in Section III.B.3, and will employ the following lemmas.
Lemma 3: Let the set of s independent Gaussian random
matrices be {X1 ∼ N (µ1 , β12 ), X2 ∼ N (µ2 , β22 ), ·P
· · , Xk ∼
s
N (µk , βk2 ), · · · , Xs ∼ N (µs , βs2 )}, and Xs =
k=1 Xk ;
2
where µk and βk are the mean and variance of Xk , respectively.
Then, it can be shown that

s
X

k=1

µk ,

s
X

βk2 ),

(31)

k=1

Proof. See Section A3 in the appendix.P
s
Namely, Lemma 3 allows us to replace k=1 Wgl,k in (8) with
l
a single matrix Wc . As such, we can expresses (8) compactly
as
h(x)l = (Wcl + I)h(x)l−2 ,
(32)
P
P
s
s
where Wcl ∼ N ( k=1 µlk , k=1 βk2 ), and µlk and βk2 are the
mean and variance of the distribution of Wgl,k , respectively .
Note that Wcl ∈ Rq×q similar to Wgl,k . Equipped with (32) for
the ResNeXt, the next theorem is stated as follows.
Theorem 4: For the input x ∈ Rn to a linear m-layer
ResNeXt parameterized by θc = {Wcm ∈ Rq×q , · · · , Wcl ∈
Rq×q , · · · , Wc2 ∈ Rq×q , Wc1 ∈ Rq×n }, the hidden layer output,
h(x)m : m −→ ∞, is
q
X
m
h(x)m = α1 u1 [(σc21 + 1) − 1] +
αi ui ,
(33)
i=1

where σc1 and u1 are the first singular value component and
first singular vector of Wcl , respectively.
Proof. From (32), following a similar proof for the ResNet
given in Theorem 3, we arrive at an analogous expression for
the ResNeXt.

Remark 3: Similar to the ResNet, it is seen that {ui }ni=1
contributes to the computation of h(x)m ∈ Rq for m −→ ∞,
as repeated multiplication by {Wcl }m
i=1 does not cause any
basis to vanish. Hence, the ResNeXt retains full information.
Again, using Definition 2 and Theorem 4, the columns of a
q×N
data batch for the ResNeXt H(x)m
are different,
c ∈ R
and therefore there is no singularity.
Although the vulnerability of ResNeXt’s performance to layer
deletion has not been empirically studied in any work to the best
of our knowledge, Theorem 4 that is analogous to Theorem 3,
theoretically shows that the ResNeXt behaves in a similar way
to the ResNet. Therefore, the ResNeXt circumnavigates catastrophic performance resulting from deleting m layer
Pq weights.
That is, σc1 = 0 in Theorem 4, so that h(x)m = i=1 αi ui ,
and thus h(x)m = x.
B. Backpropagation: singularity of error gradients
DNN training generally relies on the gradient descent
algorithm, where local error gradients are responsible for
driving optimization. As such, the condition of computed error
gradients impact the successful convergence of DNN optimization. Specifically, if the error gradients are ill-conditioned, then
optimization almost certainly fails. Successful optimization
relies on well-conditioned error gradients. This section studies
the conditions of error gradients and weights’ updates of the
PlainNet, ResNet and ResNeXt during the backpropagation
phase. For the analysis, we rely on the previous remarks for
the different DNN models and the following lemmas, which
are straightforward.
Lemma 4: Considering matrices A ∈ Rm×n and B ∈ Rn×p .
If B is singular, then the product, C = AB, is singular.
Lemma 5: Considering matrices A ∈ Rm×n and B ∈ Rn×p .
If A and B are non-singular, then the product, C = AB, is
non-singular.

JOURNAL OF LATEX CLASS FILES, VOL. XX, NO. X, APRIL 2020

7

Definition 3: Considering the output of a hypothetical DNN
layer m with linear activation function is H(x)m , the local
error gradient at layer m, ∆m , is given by

∆m = H(x)m W m+1 ∆m+1 .
(34)
It is straightforward to obtain Definition 3 from the conventional
backpropagation algorithm, given the hidden units employ the
linear activation function.
Definition 4: Assuming the cost function of a DNN is C,
the weight update at iteration t for a layer parameterized by
W m , and with input H(x)m−1 is
∆W m (t) = −η

∂C
= η∆m H(x)m−1 ,
∂W m

(35)

where η is the learning rate.
1) PlainNet: The characteristics of the error gradient and
weight updates during backpropagation for the PlainNet are
discussed in the following remark.
Remark 4: The PlainNet’s hidden representation H(x)m
p
for m −→ ∞ is singular from Remark 1, so it can be
concluded using Lemma 4 and Definition 3 that the error
gradient, ∆m , is singular too. Similarly, the weight update,
∆W m , in
Definition 4 is singular. Hence, the singularity
of error gradients and weight updates collaborate to plague
optimization.
The consequence of Remark 4 is the loss of precision of
computed results via numerical instability [63], [64]. Ultimately,
the accumulation of precision errors can cause serious erratic
weights updates, and thus optimization failure. This position
is fascinating, considering that the study of error gradients of
very deep PlainNet in [44] observed them as white noise (i.e.
lacking structure). Interestingly, this finding is further validated
by the results of our experiments.
2) ResNet and ResNeXt: Again, relying on previous remarks,
lemma, corollary and definitions, we describe the characteristics
of the error gradients and weights’ updates of the ResNet and
ResNeXt models are follows.
Remark 5: From Remark 2 and Corrollary 1, the ResNet’s
m+1
hidden representation H(x)m
for m −→
r and weight W
∞ are both non-singular for the ResNet, respectively. Therefore,
we can conclude from Lemma 5 and Definition 3 that the
error gradient, ∆m , is non-singular. Finally, from Lemma 5
and Definition 4, it is seen that ∆W m is also non-singular.
Remark 5 shows that the error gradients in the ResNet are
well-conditioned during training, as the hidden representations
and model weights do not exhibit singularity.
Remark 6: We note for the ResNeXt the non-singularity
of both the hidden layer representation H(x)m
c and weight
W m+1 for m −→ ∞ from Remark 3 and Corrollary
1, respectively. Subsequently, the error gradient, ∆m , is
non-singular given Lemma 5 and Definition 3. In addition, the non-singularity of ∆W m reflects in Lemma 5
and
Definition 4.
Overall, it is observed that both ResNet and ResNeXt circumnavigate singularity problems during backpropagation, and thus
allow successful optimization.

V. T HEORETICAL A NALYSIS OF S KIP CONNECTIONS FOR
M ODEL G ENERALIZATION
In this section, we build on the findings in Section IV for
discussing how the learning characteristics of the PlainNet and
models with skip connections, ResNet and ResNeXt, relate to
model generalization. It is seen that the conditions of hidden
layer representations not only contribute to the successful
optimization of the models (as seen in Section IV), but also
impact their generalization capacities. Namely, the relationship
between the condition of the hidden representations and stability
of solutions learned by the DNNs is given in the following
proposition.
Proposition 2: Assuming that the already learned optimal
solution for a DNN is θ. A relative change of the hidden
representation at layer l, ∆H(x)l , translates to a relative
solution change, ∆θ, as follows
k ∆θ k
k ∆H(x)l k
≤ κ(H(x)l )
: 0 ≤ l ≤ m,
(36)
kθk
k H(x)l k
0
where θ = {W l }m
l=1 and H(x) = [x1 , ..., xN ] for l = 0 is
the input to the DNN.
Proof. See Section A4 in the appendix for proof sketch.
Proposition 2 shows that the robustness of the already learned
solution, θ, depends on κ(H(x)l ). That is, for good generalization, H(x)l with small condition numbers are favoured. We
note that ∆H(x)l is analogous to the change, which manifests
when a trained DNN is tested with novel data. Our expectation
is that the solution already learned by the DNN gives good
performance on the novel data, given that the novel data comes
from the same distribution as the data used for training the
DNN. That is, the novel data for testing can be seen as only
small changes in the individual data samples that constitute
the training data.

A. PlainNet
The following remark summarizes the generalization behaviour of very deep PlainNets.
Remark 7: From Remark 1, the singularity of H(x)m
for m −→ ∞ for the PlainNet, translates to a theoretically
infinite κ(H(x)m ) in (36). Hence, very small changes in
the input data translates to extremely large changes in the
solution. Importantly, the convergence of the PlainNet even on
the training data, where data samples of the same class are
slightly different is not guaranteed. Finally, model optimization
almost certainly fails so that generalization is subsequently
impossible.
The optimization failures for the PlainNet on different datasets,
which corroborates Remark 7 are reported in the experiment
section.
B. ResNet and ResNeXt
Remark 8: For the ResNet and ResNet, the non-singularity
of the hidden representation H(x)m for m −→ ∞
from
Remark 2 and Remark 3 means a theoretically
finite κ(H(x)m ) in (36). Therefore, for moderate values of
κ(H(x)m ), we expect that small changes in the input data
result in negligible changes in the solution.

JOURNAL OF LATEX CLASS FILES, VOL. XX, NO. X, APRIL 2020

Interestingly, experimental results show that both ResNet and
ResNeXt operate with moderate condition numbers.
Furthermore, we study why the ResNeXt [34] mostly generalizes better than the ResNet [29]. For characterizing the
subtle attribute of the ResNeXt that contributes to its improved
generalization, we state the following theorem that relates the
condition of a matrix to its dimension.
Theorem 5: (Rudelson-Vershynin [65]) Given a standard
Gaussian random matrix, B ∈ Rs×z , with independent entries,
the√bounds
√ on the distribution of its singular√values√is
z − s ≤ E σmin (B) ≤ E σmax (B) ≤ z + s, (37)
where σmin (B) and σmax (B) are the minimum and maximum
singular values of B, respectively; E denotes expectation, and
s < z.
Proof. See Theorem 2.6 in [65] for proof.
When s = z so that the bound on σmin (B) in Theorem 5
becomes problematic,
√ [65] further showed that the relation
√
σmin (B) ∼ s − s − 1 suffices. Importantly, considering
that both ResNet and ResNeXt do not suffer optimization
problems as seen in Remark 5 and Remark 6, the following
corollary is particularly useful for characterizing the improved
generalization capacity of the ResNeXt over the ResNet as
observed in the literature [34].
Corollary 2: For an m-layer DNN, the condition numbers
of the hidden representations at layer l in the ResNet and
ResNeXt, H(x)lr and H(x)lc , respectively, have the relation
κ(H(x)lr ) > κ(H(x)lc ) : 1 ≤ l ≤ m.
(38)
Proof. We can deduce H(x)lr ∈ Rn×N and H(x)lc ∈ Rq×N
from Remark 2 and Remark 3 for the ResNet and ResNeXt,
respectively. Furthermore, the discussion in Section III.B.3
shows that by construction q < n. Consequently, applying Theorem 5 to H(x)lr and H(x)lc with q < n < N shows the
following relations (i) E σmax (H(x)lr ) > E σmax (H(x)lc ),
and (ii) E σmin (H(x)lr ) < E σmin (H(x)lc ). Finally, the proof
concludes by using (11) for the condition numbers of H(x)lr
and H(x)lc .
Remark 9: Considering the ResNet and ResNeXt with
H(x)lr ∈ Rn×N and H(x)lc ∈ Rq×N , respectively, where
q < n. Applying (38) to (36) shows that the ResNeXt exhibits
a more stable solution than the ResNet.
In the section of experiments, it is seen that the the ResNeXt
generalizes better than the ResNet, and the hidden representations of the ResNeXt have smaller condition numbers than the
hidden representations of the ResNet.
VI. E XPERIMENTS
A. Datasets and settings

8

Model

Train accuracy

Test accuracy

# of param.

PlainNet-164
ResNet-164
ResNeXt-164

11.38%
99.58%
100%

11.35%
99.60%
99.72%

2.5M
2.6M
2.5M

TABLE I: Results on MNIST dataset
Model

Train accuracy

Test accuracy

# of param.

PlainNet-164
ResNet-164
ResNeXt-164

10.26%
99.93%
99.96%

10.16%
93.53%
93.89%

2.5M
2.6M
2.5M

TABLE II: Results on CIFAR-10 dataset
Model

Train accuracy

Test accuracy

# of param.

PlainNet-164
ResNet-164
ResNeXt-164

1.00%
99.83%
99.94%

1.12%
75.72%
76.64%

2.5M
2.6M
2.5M

TABLE III: Results on CIFAR-100 dataset
Model

Train accuracy

Test accuracy

# of param.

PlainNet-101
ResNet-101
ResNeXt-101

15.37%
88.56%
89.74%

14.94%
77.32%
78.48%

44.1M
44.5M
44.3M

TABLE IV: Top-1 results on ImageNet dataset

to the enormous computational requirement for the ImageNet2012 dataset, PlainNet, ResNet [29] and ResNeXt [34] having
101-layers are trained. All the DNN models are CNNs that
solely rely on several convolution layers and the softmax
layer as the final (i.e. output) layer. Specifically, the trained
model configurations follow the standard building blocks as
proposed in the literature. The ResNet and ResNeXt follow
the construction configurations in [29] and [34], respectively.
For the PlainNets, the trained configurations are obtained
by eliminating the skip connections from the corresponding
ResNet configurations. The mini-batch gradient descent is used
for optimization. Training hyperparameters include an initial
learning rate of 0.1 that is annealed to a final value of 0.0001
during training, momentum rate of 0.9, weight decay of 10−4
and batch size of 128. All the models employ a maximum
of 200 training epochs. Furthermore, all experiments use the
rectified linear activation function. The experiments on the
MNIST dataset use no data augmentation. The experiments
on CIFAR-10, CIFAR-100 and ImageNet datasets use the
standard data augmentation found in [32]. For our experiments,
the configurations of the ResNet and ResNeXt models follow
those in [29] and [34], respectively; the PlainNet models are
obtained by simply eliminating the skip connections from the
corresponding ResNet models that have been constructed.

In contrast to many analysis works [57], [52] on DNN
that are mainly theoretical, we corroborate our theoretical B. Model Evaluations
analysis with extensive experiments using MNIST [66], CIFARFor assessing the training characteristics of the different
10 [67], CIFAR-100 [67] and ImageNet-2012 [24] datasets. The DNN models, we particularly focus on observing the following
experiments on CIFAR-10, CIFAR-100 and ImageNet datasets aspects (i) growth of units’ activations with model depth
use the common data augmentation techniques as in [68]. In (ii) weights updates in training (iii) conditions of the model
order to clearly demonstrate the training problems of very deep weights with depth using the condition numbers obtained
PlainNets, we train PlainNet, ResNet and ResNeXt having 164 from singular values and (iv) conditions of hidden layer
layers on MNIST, CIFAR-10 and CIFAR-100 datasets. Due representations with model depth. Condition numbers are

JOURNAL OF LATEX CLASS FILES, VOL. XX, NO. X, APRIL 2020

Fig. 3: Training curves for models on MNIST dataset. Left:
Training loss. Right: Training accuracy

Fig. 4: Training curves for models on CIFAR-10 dataset. Left:
Training loss. Right: Training accuracy

computed using equation (11). For the aforementioned aspects
of interest, we focus on the early and later layers in the
different models for investigation. Although our theoretical
analyses use fully connected models where layer weights and
hidden representations are both 2-dimensional arrays, it is
straightforward to extend model evaluations to CNNs where
layer weights and hidden representations are 4-dimensional and
3-dimensional tensors, respectively. Precisely, for obtaining the
singular values of model tensors in the CNNs, we adopt the
Higher Order SVD (HOSVD) [69] method that generalizes the
SVD of matrices to tensors.
C. Results and discussion
Herein, the results of experiments are presented, along with
discussions comparing and contrasting the different training
properties of the DNNs.
Tables 1, 2, 3 & 4 show the obtained accuracies on the different
datasets. It is noted that for all the datasets, the PlainNet models
are clearly untrainable; there is an obvious optimization failure
in learning, given the very poor accuracies on the training sets.
For example, the PlainNet achieves 1% training accuracy on
CIFAR-100 dataset; see Table 3. In contrast, the ResNet and
ResNeXt exhibit no optimization problems, and on top of this
generalize well on the datasets. Furthermore, the ResNeXt is
seen to outperform ResNet on the datasets. This observation
can be linked to our analysis, which is summarized in Remark 9.
The training curves for the different models on the MNIST and
CIFAR-10 datasets are shown in Fig. 3 and Fig. 4, respectively.
Note that the training losses on both dataset are plotted to log
scale, as the PlainNet models have extremely high training
losses, which reflect the severity of the optimization problem.
The ResNet and ResNeXt models have significantly smaller
training losses that show successful optimization.

9

The units’ activations (i.e. outputs) and weights for the PlainNet
are shown in Fig. 5 and Fig. 6, respectively. From Fig. 5, it
is seen that units’ activations in the first layer are extremely
high; the range of units’ activations is 1.7 million. This is very
chaotic for optimization. At the one hundred and sixtieth layer
(i.e. layer 160), units’ activations have decreased to reasonable
values. In Fig. 6, it is again seen that units’ have extremely
high weight values so that optimization is difficult; most weight
values are between -200,000 and 200,000. We posit that the
extremely high units’ activations and weights values stem from
the singularity of hidden representations and weights updates
of the PlainNet discussed in Section IV.A.1 and Section IV.B.1.
Units’ activations and weights of the ResNet are given in Fig.
7 and Fig. 8, respectively. From Fig. 7, it is observed that
the units operate with reasonable values in the first and one
hundred and sixtieth layers; the range of units’ activations is 6.
Furthermore, units are seen to have reasonable weight values
in the early and later layers, as in Fig. 8. These observations
show why optimization is successful in the ResNet.
Furthermore, Fig. 9 and Fig. 10 show the units’ activations
and weights for the ResNeXt. Similar to the ResNet, it is
seen in the early and later layers that the units activations and
weights values are within reasonable ranges. Consequently,
optimization is successful.
The condition number of the layer weights for the different
models trained on MNIST and CIFAR-10 datasets are shown
in Fig. 11. Fig. 12 shows the condition numbers of the layer
weights using CIFAR-100 and ImageNet datasets. It is observed
that the layer weights of the ResNet and ResNeXt have
very small condition numbers, while the layer weights of the
PlainNet have significantly higher condition numbers. These
observations support theoretical results obtained in Section IV.
In addition, to validate the theoretical results in Section IV and
Section V, the condition numbers of the hidden representations
of the different models on CIFAR-10 and CIFAR-100 datasets
are reported in Fig. 13. The PlainNet trained on CIFAR10 dataset, starting from the eightieth layer, have hidden
representations with infinite condition numbers; on CIFAR100 dataset, starting from the hundredth layer, the PlainNet’s
hidden representations have infinite condition numbers. This
observation depicts the worst scenario of the singularity
problem for optimization such that model generalization is
impossible as given in Remark 8. In contrast, the hidden
representations of the ResNet and ResNeXt never have infinite
condition numbers; the condition numbers, which are high in
the early layers quickly reduce to reasonable values so that
optimization converges successfully. In addition, the hidden
representations of the ResNeXt have smaller conditions than
the ResNet. This observation aligns with our analysis that is
summarized in Remark 9 for the improved generalization of
the ResNeXt over ResNet.
Note that the MNIST dataset, which is generally considered
an easy dataset to learn has been used for the analytical
experiments, where the focus is observe the difficulty of
optimizing very deep PlainNets; that is Fig.5 to Fig.10 .
Otherwise, one might be curious as to if very deep PlainNets
are trainable on easy datasets. Our results remove this curiosity,
and directly suggest that the optimization conditions of units

JOURNAL OF LATEX CLASS FILES, VOL. XX, NO. X, APRIL 2020

10

Fig. 5: PlainNet units’ activations for 164 layer models trained on MNIST dataset

Fig. 6: PlainNet units’ weights for 164 layer models trained on MNIST dataset

Fig. 7: ResNet units’ activations for 164 layer models trained on MNIST dataset

activations (outputs), weights and gradients would be also
chaotic, when training on harder datasets such as the CIFAR
and Imagenet; this follows from the results in Tables I-IV. This
position is reasonable since, it is well known that models, which
cannot be properly optimized cannot generalize well. Contrary
to expectation, our experiments clearly show that very deep
PlainNets cannot be trained successfully even on the MNIST
dataset. Additional results of the optimization conditions of

PlainNet-164, ResNet-164 and ResNeXt-164 models trained
on CIFAR-10 dataset in Table II are reported in Appendix A5
to further corroborate the positions given in this work. It will
be seen that the optimization conditions of the different models
trained on CIFAR-10 dataset that are discussed in Appendix
A5 are similar to the same models trained on MNIST dataset.

JOURNAL OF LATEX CLASS FILES, VOL. XX, NO. X, APRIL 2020

11

Fig. 8: ResNet units’ weights for 164 layer models trained on MNIST dataset

Fig. 9: ResNeXt units’ activations for 164 layer models trained on MNIST dataset

Fig. 10: ResNeXt units’ weights for 164 layer models trained on MNIST dataset

VII. T RAINING S CHEMES AND SIMILAR N ETWORKS
This section discusses recent weight initialization schemes [70],
[71] that claim to eliminate the need for skip connections for
the succecssful training of very deep networks. Subsequently,
we discuss the relationship between our results and the highway
network [72]. Finally, we relate our findings with the results
of Neural Architecture Search (NAS) with skip connections.

A. Weight Initialization
We refute the claims in [70], [71] that the special weight
initializations suffice for training very deep models without skip
connections. The results in [70], [71] does not match the stateof-the-art that are obtained from models with skip connections,
and the proposal in [70] is even somewhat misleading.
1) Dirac weight initialization: the Dirac initialization in [70]
for training very deep models is setup to imitate the

JOURNAL OF LATEX CLASS FILES, VOL. XX, NO. X, APRIL 2020

12

Fig. 11: Model weights condition number. Left: MNIST dataset.
Right: CIFAR-10 dataset

Fig. 12: Model weights condition number. Left: CIFAR-100
dataset. Right: ImageNet dataset

Fig. 13: Model hidden layer condition number; layers with
missing condition numbers have infinite values. Left: CIFAR-10
dataset. Right: CIFAR-100 dataset

operation of the ResNet. Specifically, the model weights
are reparameterized at initialization so that it behaves
like it has skip connections as in
c l = diag(a)I + W l ,
W

(39)

where W is a random Gaussian or Uniform matrix;
diag(a)I is the diagonal matrix with the vector a in the
leading diagonal. Subsequently, the output of the Dirac
model block, h(x)ld , is
c lW
c l−1 h(x)l−2 .
h(x)ld = W
d

(40)

It is stated in the work [70] that the ‘the skip-connection
in Dirac parameterization is implicit’; this is evident
from (39) and (40), and dispels the conception that
the Dirac initialization method has no basis in skip
connections.
We observe that the initialization method shows some
promise, as interesting results were obtained on small
models, which are far from the state-of-the-art. However,
the Dirac initialization results lagged the ResNet on large

practical models. The problem that we observe with the
Dirac parameterization is that the entries in a are free
parameters so that diag(a)I can undesirably become a
non-identity matrix during optimization. Consequently,
the interesting properties of skip connections for training
discussed in Sections IV & V are lost. In contrast, the
identity matrices (from the explicit skip connections)
in the parameterization of the ResNet and ResNeXt
in (5) and (8), respectively, are always identity matrices
(i.e. fixed) during training, so that the benefits of skip
connections are always realized.
2) Delta-orthogonal weight initialization: the Deltaorthogonal initialization method in [71] is based on a
mean field theory dynamical for information propagation
via several model layers, so that dynamic isometry of
the input-output Jacobian matrix is achieved. In this
initialization method, the kernel weights are initialized
as orthognal matrices with variance in the spatial center of
the kernel and zero variance elsewhere. However, similar
to the problem of Dirac initialization, this nice property
may not persist during training so that optimization
can become problematic. Although interesting results
on the training accuracies were reported for DNNs with
over 20 layers, the test accuracies obtained were so
poor that the benefit of having several layers become
questionable. For instance, the 32-layer and 128-layer
models trained using the initialization method on CIFAR10 dataset achieved uninspiring test accuracies of about
80% and 77%, respectively. We note that test accuracies
of over 90% are readily obtained from much shallower
models such as All-CNN [73], maxout networks [74] and
Network-in-Network [75] models that all have less than
ten layers. Interestingly, we find that the ResNet [29]
with 110 layers achieved a good test accuracy of 93.57%.
B. Highway Network
We note that the analytical results align with the results of [72]
in that the gating mechanism in the skip connections of the
highway network allow some portion of the input data to be
carried over to the different hidden layers so that the highway
network operates similar to the ResNet. For instance, by
setting the transform and carry gates T (x, WT ) and C(x, WC ),
respectively both to the value of one in [72], the highway
network exactly becomes the ResNet. As such, although our
work did not directly analyze the highway network with a
complicated architecture, our results provide an interesting
basis for understanding the operation of the highway network
as well.
C. Skip connections and neural architecture search
Recent works [76], [77] in NAS, where skip-connection is a
candidate operator, have shown that the discovered DNNs are
typically dominated by skip connections. Our results, which
show that the incorporation of skip connections ensures a
stable optimization for very deep neural network due to the
non-singularity of the hidden representations can be used to
explain why NAS has preference for many skip connections.

JOURNAL OF LATEX CLASS FILES, VOL. XX, NO. X, APRIL 2020

Subsequently, the model weights and gradients are wellbehaved so that training is successful.
In fact, restriction on the number of skip connections that can
be leveraged by NAS has been seen in the literature [77], [78];
this can be seen as a form of architecture regularization [77].
This is to enforce the participation of parameterized paths
or operations during NAS. This architecture regularization is
observed to improve the generalization performance of the
discovered architectures [77], [78].
VIII. M AIN FINDINGS ON SKIP CONNECTIONS

13

paper. However, it would be interesting as a future work to study
models that instead employ the concatenation of the preceding
layer outputs with the current layer. A good example is the
popular densely connected network (i.e. DenseNet) [36]. The
DenseNet has been shown to perform extremely well on several
tasks, and sometimes even outperforming the ‘forerunner
model’, ResNet [29]. Surprsingly, little to no work has been
carried out in understanding why the DenseNet that employs
over 100 layers is trainable, and on top of that generalizes
well.

ACKNOWLEDGMENT
1) We find that very deep PlainNets suffer optimization
problems due to the singularity of hidden representations This work was funded by the National Research Fund (FNR),
that results from repeated multiplication of the input data Luxembourg, under the project references R-AGR-0424-05with several layer weights. It is further seen that the D/Bjorn Ottersten and CPPP17/IS/11643091/IDform/Aouada
singularity of the hidden representations reflects in the and BRIDGES2020/IS/14755859/MEET-A/Aouada.
bad condition of the gradients and weight updates.
A PPENDIX
2) The ResNet and ResNeXt are easy to optimize because
A1.
P
ROOF
OF P ROPOSITION 1
the skip connections eliminate the singularity of hidden
n
representations. Subsequently, it is observed that the
Considering W = {wi }i=1 , where wi is the i-th vector in
gradients and weight updates in the ResNet and ResNeXt W , and its elements are randomly sampled from a continuous
are well conditioned so that training is successful.
distribution (i.e. uniform or Gaussian). Given wi , the matrix W
span
3) We identify the better condition of the hidden repre- excluding wi is denoted W−i ; thus, the span of Wi is W−i
=
sentations of the ResNeXt as the reason why it usually span(w1 , .., wn−1 ). Consequently, validating Proposition 1
generalizes better than the ResNet. By relating the size translates to showing that any given wi does not lie in the span
span
span
of random matrices and their conditions, we show that of W−i
; that is, wi and W−i
are linearly independent.
the smaller size of weights seen in the ResNeXt as First, it is easy to note that P (w1 6= 0) = 1, since the
compared to the ResNet is responsible for the improved Lebesgue measure of a singleton set is zero [79]; thus,
span
generalization of the ResNeXt. To the best our knowledge, P (w1 ∈
/ W−i
) = 1. Furthermore, for p ∈ {2, ..., n − 1}, let
this observation is the first in the literature.
W−1,p = {w1 , ..., wp } be the set of first p vectors, excluding
4) Our study of the special weight initialization tech- vector i, such that W−1,p is linearly independent with a
niques [70], [71] for alleviating the problem of training probability of 1. Therefore, we can state with a probablity
very deep PlainNets show that they considerably lag of 1 that W−1,p spans the p-dimensional subspace of Rn , and
in performance when compared to models with skip thus also has a Lebesgue measure of zero. Interestingly, wp+1
connections. The main problem is that the weights can resides on Rn , and hence is on the exterior of the subspace
deviate from the desired operation regime during training with a probability of 1.

so that optimization becomes problematic. A possible
A2. P ROOF OF L EMMA 2
solution is to restrict the space of solution.
Pn
First, let W = BB T , and B = i=1 σi ui viT so that
 n
 n

IX. C ONCLUSION AND FUTURE WORK
X
X
T
T
W =
σi ui vi
σ j vj u j ,
(41)
Astounding results on different learning tasks have been
i=1
j=1
reported using very DNNs that employ skip connections. However, the optimization of very DNNs without skip connections where an expansion gives
referred to as PlainNet is very problematic; sometimes, very
n
X
deep PlainNets are absolutely untrainable. Despite the extreme
W =
σi σj ui (viT vj )uTj .
(42)
success of DNNs with skip connections, a concrete report of
i,j=1
the distinct properties that allow their successful optimization
Given, viT vj = 0 for i 6= j, and viT vi = 1, we have
and good generalization is lacking in the literature. We select
n
X
two popular and very successful DNNs, ResNet and ResNeXt,
W
=
σi2 ui uTi .
(43)
as the focus of this study. Specifically, this paper investigates
i
crucial model properties such as the singularity of hidden
representations, error gradients and weights’ updates, which From repeated multiplication, we can arrive at the general and
are important for the successful optimization and generalization compact expression
n
of DNNs. The provided analyses are confirmed by extensive
X
m
(W ) =
σi2m ui uTi .
(44)
experiments on four benchmarking datasets.
i=1
ResNet and ResNeXt models that both use the summation of
preceding layer outputs with the current layer are studied in this This concludes the proof.


JOURNAL OF LATEX CLASS FILES, VOL. XX, NO. X, APRIL 2020

14

A3. P ROOF OF L EMMA 3

A5. A DDITIONAL E XPERIMENTS USING CIFAR-10
DATASET

We rely on the method of characteristic functions [80] that
This section presents additional experiments using CIFAR-10
sufficiently defines the probability distributions of real-valued
dataset
to further support the positions given in Section VIC of
random variables for this proof. Particularly, we leverage the
the
paper.
We train the PlainNet, ResNet and ResNeXt models
fact that different random variables have distinct characteristic
with
164
layers
on CIFAR-10 dataset. The units’ activation
functions as supported by the Inversion Formulae [81], [82].
(output)
values
and
weights for the PlainNet are given in Fig.
The characteristic function of an independent random variable
A1
and
Fig.
A2,
respectively.
It is seen in Fig. A1 that the
X, ϕ(u), is given as
units’ outputs are extremely large for the first layer so that
ϕX (u) = E(eiuX ),
(45) optimization is very unstable. Similarly, Fig. A2 shows that the
units’ weights for the first layer are well outside a reasonable
√
where i = −1 as in the imaginary unit, u ∈ R is a parameter range so that optimization is chaotic. As expected, the units’
of the function, and E denotes expectation. Furthermore, it activations and weights in Fig. A1 and Fig. A2 are much
can be shown that the characteristic function of a normally larger than the PlainNet trained on MNIST dataset, which is a
distributed random variable X ∼ N (µ, β 2 ) is
simpler dataset as shown in Fig. 5 and Fig. 6. This reflects a
more chaotic optimization condition, since CIFAR-10 dataset

2 2
ϕX (u) = exp iuµX − βX
u /2 .
(46) is harder to learn than MNIST dataset; see Table I and Table II.
Fig. A3 and Fig. A4 show the units’ activations and weights
Subsequently, the sum of the sequence of s independent for the ResNet, respectively. In contrast, it is observed that the
random Gaussian variables {X1 ∼ N (µ1 , β12 ), X2 ∼ units activations and weights have reasonable values so that
N (µ2 , β22 ), · · · , Xk ∼ N (µk , βk2 ), · · · , Xs ∼ N (µs , βs2 )}, optimization is not problematic. Finally, Fig. A5 and Fig. A6
Y , can be expressed as the product of their respective show the the units’ activations and weights for the ResNeXt,
characteristic functions as in
respectively. Again, the units’ have activations and weights
s
values
that are reasonable for successful optimization.
Y

ϕY (u) =
exp iuµk − βk2 u2 /2 ,
(47)
k=1

ϕY (u) = exp iu

R EFERENCES
s
X
k=1

µk −

s
X


βk2 u2 /2 .

(48)

k=1

The resulting characteristic function of Y shows that it is also
a normally distributed variable as withPany of its constituents
s
X
(µk , βk2 ), but with mean
k=1 µk and variance
Pks ∼ N
2
β
.

k=1 k
A4. S KETCH OF P ROOF FOR P ROPOSITION 2
First, let θ ∈ Rc×n , X ∈ Rn×r and Y ∈ Rc×r . Now,
let us consider the simple problem, Y = θX : X † is the
pseudoinvrese of X. The objective is to estimate the solution,
θ, given X and Y . Furthermore, let a small perturbation of
∆X result in a small solution perturbation, ∆θ, so that
Y = (θ + ∆θ)(X + ∆X).

(49)

Noting that ∆θ∆X ≈ 0 and Y = θX, (49) becomes
∆θ
= −X † ∆X.
θ

(50)

Using Cauchy-Schwarz inequality for (50) yields
k ∆θ k
kXk
≤ k X † kk ∆X k ≤ k X † kk ∆X k
.
kθk
kXk
(51)
Finally, considering κ(X) ≈k X † kk X k, we obtain
k ∆θ k
k ∆X k
≤ κ(X)
.
kθk
kXk

(52)

[1] L. Nanni, S. Ghidoni, and S. Brahnam, “Handcrafted vs. non-handcrafted
features for computer vision classification,” Pattern Recognition, vol. 71,
pp. 158–172, 2017.
[2] J. Zhang, Y. Xia, Y. Xie, M. Fulham, and D. D. Feng, “Classification
of medical images in the biomedical literature by jointly using deep
and handcrafted visual features,” IEEE journal of biomedical and health
informatics, vol. 22, no. 5, pp. 1521–1530, 2017.
[3] S. J. Oh, B. Schiele, and M. Fritz, “Towards reverse-engineering
black-box neural networks,” in International Conference on Learning
Representations, 2018.
[4] M. Alber, S. Lapuschkin, P. Seegerer, M. Hagele, K. T. Schutt,
G. Montavon, W. Samek, K.-R. Muller, S. Dahne, and P.-J. Kindermans,
“innvestigate neural networks,” Journal of Machine Learning Research,
vol. 20, no. 93, pp. 1–8, 2019.
[5] A. Ghorbani, A. Abid, and J. Zou, “Interpretation of neural networks is
fragile,” in Proceedings of the AAAI Conference on Artificial Intelligence,
vol. 33, 2019, pp. 3681–3688.
[6] S. S. Du, X. Zhai, B. Poczos, and A. Singh, “Gradient descent
provably optimizes over-parameterized neural networks,” in International
Conference on Learning Representations, 2019.
[7] S. Du, J. Lee, H. Li, L. Wang, and X. Zhai, “Gradient descent finds
global minima of deep neural networks,” in International Conference on
Machine Learning, 2019, pp. 1675–1685.
[8] P.-J. Kindermans, K. T. Schutt, M. Alber, K.-R. Muller, D. Erhan, B. Kim,
and S. Dahne, “Learning how to explain neural networks: Patternnet and
patternattribution,” in International Conference on Learning Representations, 2018.
[9] W. Samek, A. Binder, G. Montavon, S. Lapuschkin, and K.-R. Müller,
“Evaluating the visualization of what a deep neural network has learned,”
IEEE transactions on neural networks and learning systems, vol. 28,
no. 11, pp. 2660–2673, 2016.
[10] L. M. Zintgraf, T. S. Cohen, T. Adel, and M. Welling, “Visualizing deep
neural network decisions: Prediction difference analysis,” 2017.
[11] F. Wang, H. Liu, and J. Cheng, “Visualizing deep neural network by
alternately image blurring and deblurring,” Neural Networks, vol. 97, pp.
162–172, 2018.
[12] Z. Wang, C. Li, X. Wang, and D. Wang, “Towards efficient convolutional
neural networks through low-error filter saliency estimation,” in Pacific
Rim International Conference on Artificial Intelligence. Springer, 2019,
pp. 255–267.

JOURNAL OF LATEX CLASS FILES, VOL. XX, NO. X, APRIL 2020

15

Fig. A1: PlainNet units’ activations for 164 layer models trained on CIFAR-10 dataset

Fig. A2: PlainNet units’ weights for 164 layer models trained on CIFAR-10 dataset

Fig. A3: ResNet units’ activations for 164 layer models trained on CIFAR-10 dataset

[13] J. Zou, T. Rui, Y. Zhou, C. Yang, and S. Zhang, “Convolutional neural
network simplification via feature map pruning,” Computers & Electrical
Engineering, vol. 70, pp. 950–958, 2018.

[16] M. Raghu, B. Poole, J. Kleinberg, S. Ganguli, and J. S. Dickstein, “On
the expressive power of deep neural networks,” in Proceedings of the
34th International Conference on Machine Learning-Volume 70. JMLR.
org, 2017, pp. 2847–2854.

[14] P. L. Bartlett, N. Harvey, C. Liaw, and A. Mehrabian, “Nearly-tight
vc-dimension and pseudodimension bounds for piecewise linear neural
networks.” Journal of Machine Learning Research, vol. 20, no. 63, pp.
1–17, 2019.

[17] X. Cui, W. Zhang, Z. Tüske, and M. Picheny, “Evolutionary stochastic
gradient descent for optimization of deep neural networks,” in Advances
in neural information processing systems, 2018, pp. 6048–6058.

[15] H. Lin and S. Jegelka, “Resnet with one-neuron hidden layers is a
universal approximator,” in Advances in neural information processing
systems, 2018, pp. 6169–6178.

[18] L. Wang, Y. Yang, R. Min, and S. Chakradhar, “Accelerating deep neural
network training with inconsistent stochastic gradient descent,” Neural
Networks, vol. 93, pp. 219–229, 2017.

JOURNAL OF LATEX CLASS FILES, VOL. XX, NO. X, APRIL 2020

16

Fig. A4: ResNet units’ weights for 164 layer models trained on CIFAR-10 dataset

Fig. A5: ResNeXt units’ activations for 164 layer models trained on CIFAR-10 dataset

Fig. A6: ResNeXt units’ weights for 164 layer models trained on CIFAR-10 dataset

[19] Z. Allen-Zhu, Y. Li, and Y. Liang, “Learning and generalization
in overparameterized neural networks, going beyond two layers,” in
Advances in neural information processing systems, 2019, pp. 6155–
6166.
[20] Y. Cao and Q. Gu, “Generalization bounds of stochastic gradient descent
for wide and deep neural networks,” in Advances in Neural Information
Processing Systems, 2019, pp. 10 835–10 845.
[21] Y. Jiang, D. Krishnan, H. Mobahi, and S. Bengio, “Predicting the
generalization gap in deep networks with margin distributions,” in
International Conference on Learning Representations, 2019.

[22] O. K. Oyedotun and A. Khashman, “Deep learning in vision-based static
hand gesture recognition,” Neural Computing and Applications, vol. 28,
no. 12, pp. 3941–3951, 2017.
[23] D. CireşAn, U. Meier, J. Masci, and J. Schmidhuber, “Multi-column
deep neural network for traffic sign classification,” Neural networks,
vol. 32, pp. 333–338, 2012.
[24] H. S. J. K. S. S. S. M. Z. H. A. K. A. K. M. B. A. C. B. Olga Russakovsky,
Jia Deng* and L. Fei-Fei, “Imagenet large scale visual recognition
challenge,” International Journal of Computer Vision (IJCV), pp. 211–
252, December 2015.

JOURNAL OF LATEX CLASS FILES, VOL. XX, NO. X, APRIL 2020

[25] O. K. Oyedotun, A. El Rahman Shabayek, D. Aouada, and B. Ottersten,
“Highway network block with gates constraints for training very deep
networks,” in Proceedings of the IEEE Conference on Computer Vision
and Pattern Recognition Workshops, 2018, pp. 1658–1667.
[26] M. Bianchini and F. Scarselli, “On the complexity of neural network
classifiers: A comparison between shallow and deep architectures,” IEEE
transactions on neural networks and learning systems, vol. 25, no. 8,
pp. 1553–1565, 2014.
[27] O. Delalleau and Y. Bengio, “Shallow vs. deep sum-product networks,” in
Advances in Neural Information Processing Systems, 2011, pp. 666–674.
[28] Z. Wu, C. Shen, and A. Van Den Hengel, “Wider or deeper: Revisiting
the resnet model for visual recognition,” Pattern Recognition, vol. 90,
pp. 119–133, 2019.
[29] K. He, X. Zhang, S. Ren, and J. Sun, “Deep residual learning for image
recognition,” in Proceedings of the IEEE conference on computer vision
and pattern recognition, 2016, pp. 770–778.
[30] R. K. Srivastava, K. Greff, and J. Schmidhuber, “Training very deep
networks,” in Advances in neural information processing systems, 2015,
pp. 2377–2385.
[31] K. Simonyan and A. Zisserman, “Very deep convolutional networks for
large-scale image recognition,” in International Conference on Learning
Representations, 2015, pp. 1–14.
[32] K. He, X. Zhang, S. Ren, and J. Sun, “Identity mappings in deep residual
networks,” in European conference on computer vision. Springer, 2016,
pp. 630–645.
[33] G. Larsson, M. Maire, and G. Shakhnarovich, “Fractalnet: Ultra-deep
neural networks without residuals,” in International Conference on
Learning Representations, 2017, pp. 1–11.
[34] S. Xie, R. Girshick, P. Dollár, Z. Tu, and K. He, “Aggregated residual
transformations for deep neural networks,” in Proceedings of the IEEE
conference on computer vision and pattern recognition, 2017, pp. 1492–
1500.
[35] X. Zhang, Z. Li, C. Change Loy, and D. Lin, “Polynet: A pursuit of
structural diversity in very deep networks,” in Proceedings of the IEEE
Conference on Computer Vision and Pattern Recognition, 2017, pp.
718–726.
[36] G. Huang, Z. Liu, L. Van Der Maaten, and K. Q. Weinberger, “Densely
connected convolutional networks,” in Proceedings of the IEEE conference on computer vision and pattern recognition, 2017, pp. 4700–4708.
[37] C. Szegedy, S. Ioffe, V. Vanhoucke, and A. A. Alemi, “Inception-v4,
inception-resnet and the impact of residual connections on learning,” in
Thirty-First AAAI Conference on Artificial Intelligence, 2017.
[38] O. K. Oyedotun, A. E. R. Shabayek, D. Aouada, and B. Ottersten,
“Training very deep networks via residual learning with stochastic input
shortcut connections,” in International Conference on Neural Information
Processing. Springer, 2017, pp. 23–33.
[39] K. He, X. Zhang, S. Ren, and J. Sun, “Delving deep into rectifiers:
Surpassing human-level performance on imagenet classification,” in
Proceedings of the IEEE international conference on computer vision,
2015, pp. 1026–1034.
[40] X. Glorot and Y. Bengio, “Understanding the difficulty of training
deep feedforward neural networks,” in Proceedings of the thirteenth
international conference on artificial intelligence and statistics, 2010,
pp. 249–256.
[41] S. Ioffe and C. Szegedy, “Batch normalization: Accelerating deep network
training by reducing internal covariate shift,” in International Conference
on Machine Learning, 2015, pp. 448–456.
[42] K. Zhang, M. Sun, T. X. Han, X. Yuan, L. Guo, and T. Liu, “Residual
networks of residual networks: Multilevel residual networks,” IEEE
Transactions on Circuits and Systems for Video Technology, vol. 28,
no. 6, pp. 1303–1314, 2017.
[43] Y. Chen, J. Li, H. Xiao, X. Jin, S. Yan, and J. Feng, “Dual path networks,”
in Advances in Neural Information Processing Systems, 2017, pp. 4467–
4475.
[44] D. Balduzzi, M. Frean, L. Leary, J. Lewis, K. W.-D. Ma, and
B. McWilliams, “The shattered gradients problem: If resnets are
the answer, then what is the question?” in Proceedings of the 34th
International Conference on Machine Learning-Volume 70. JMLR. org,
2017, pp. 342–350.
[45] A. Veit, M. J. Wilber, and S. Belongie, “Residual networks behave
like ensembles of relatively shallow networks,” in Advances in neural
information processing systems, 2016, pp. 550–558.
[46] K. Greff, R. K. Srivastava, and J. Schmidhuber, “Highway and residual
networks learn unrolled iterative estimation,” in International Conference
on Learning Representations, 2017.

17

[47] S. Jastrzebski, D. Arpit, N. Ballas, V. Verma, T. Che, and Y. Bengio,
“Residual connections encourage iterative inference,” in International
Conference on Learning Representations, 2018.
[48] E. Haber, L. Ruthotto, E. Holtham, and S.-H. Jun, “Learning across
scales—multiscale methods for convolution neural networks,” in ThirtySecond AAAI Conference on Artificial Intelligence, 2018.
[49] B. Chang, L. Meng, E. Haber, F. Tung, and D. Begert, “Multi-level
residual networks from dynamical systems view,” in International
Conference on Learning Representations, 2018.
[50] E. Haber and L. Ruthotto, “Stable architectures for deep neural networks,”
Inverse Problems, vol. 34, no. 1, p. 014004, 2017.
[51] B. Chang, L. Meng, E. Haber, L. Ruthotto, D. Begert, and E. Holtham,
“Reversible architectures for arbitrarily deep residual neural networks,”
in Thirty-Second AAAI Conference on Artificial Intelligence, 2018.
[52] Y. Zhou and Y. Liang, “Critical points of linear neural networks:
Analytical forms and landscape properties,” in International Conference
on Learning Representations, 2019.
[53] S. Sonoda and N. Murata, “Transport analysis of infinitely deep neural
network,” JMLR, vol. 20, no. 1, pp. 31–82, 2019.
[54] A. M. Saxe, J. L. McClelland, and S. Ganguli, “Exact solutions to
the nonlinear dynamics of learning in deep linear neural networks,” in
International Conference on Learning Representations, 2014, pp. 1–21.
[55] K. Kawaguchi, “Deep learning without poor local minima,” in Advances
in neural information processing systems, 2016, pp. 586–594.
[56] Q. Nguyen and M. Hein, “Optimization landscape and expressivity of
deep cnns,” in International Conference on Machine Learning, 2018, pp.
3727–3736.
[57] T. Laurent and J. Brecht, “Deep linear networks with arbitrary loss:
All local minima are global,” in International Conference on Machine
Learning, 2018, pp. 2902–2907.
[58] S. Sonoda and N. Murata, “Transport analysis of infinitely deep neural
network,” The Journal of Machine Learning Research, vol. 20, no. 1,
pp. 31–82, 2019.
[59] N. Alexeev, F. Götze, and A. Tikhomirov, “On the singular spectrum
of powers and products of random matrices,” in Doklady mathematics,
vol. 82, no. 1. SP MAIK Nauka/Interperiodica, 2010, pp. 505–507.
[60] C. Eckart and G. Young, “The approximation of one matrix by another
of lower rank,” Psychometrika, vol. 1, no. 3, pp. 211–218, 1936.
[61] J. W. Demmel, “The geometry of iii-conditioning,” Journal of Complexity,
vol. 3, no. 2, pp. 201–229, 1987.
[62] D. Duvenaud, O. Rippel, R. Adams, and Z. Ghahramani, “Avoiding
pathologies in very deep networks,” in Artificial Intelligence and Statistics,
2014, pp. 202–210.
[63] L. Elden, “Algorithms for the regularization of ill-conditioned least
squares problems,” BIT Numerical Mathematics, vol. 17, no. 2, pp. 134–
145, 1977.
[64] S. Chen, “Local regularization assisted orthogonal least squares regression,” Neurocomputing, vol. 69, no. 4-6, pp. 559–585, 2006.
[65] M. Rudelson and R. Vershynin, “Non-asymptotic theory of random
matrices: extreme singular values,” in Proceedings of the International
Congress of Mathematicians 2010 (ICM 2010) (In 4 Volumes) Vol. I:
Plenary Lectures and Ceremonies Vols. II–IV: Invited Lectures. World
Scientific, 2010, pp. 1576–1602.
[66] Y. LeCun and C. Cortes, “Mnist handwritten digit database,” http://yann.
lecun.com/exdb/mnist/, Last accessed, October. 2019.
[67] A. Krizhevsky, V. Nair, and G. Hinton, “Cifar-10, cifar-100 (canadian
institute for advanced research),” http://www.cs.toronto.edu/∼kriz/cifar.
html, Last accessed, October. 2019.
[68] S. Zagoruyko and N. Komodakis, “Wide residual networks,” in British
Machine Vision Conference, 2016, pp. 35–67.
[69] G. Bergqvist and E. G. Larsson, “The higher-order singular value
decomposition: Theory and an application [lecture notes],” IEEE Signal
Processing Magazine, vol. 27, no. 3, pp. 151–154, 2010.
[70] S. Zagoruyko and N. Komodakis, “Diracnets: Training very deep neural
networks without skip-connections,” arXiv preprint arXiv:1706.00388,
2017.
[71] L. Xiao, Y. Bahri, J. Sohl-Dickstein, S. Schoenholz, and J. Pennington,
“Dynamical isometry and a mean field theory of cnns: How to train
10,000-layer vanilla convolutional neural networks,” in International
Conference on Machine Learning, 2018, pp. 5393–5402.
[72] R. K. Srivastava, K. Greff, and J. Schmidhuber, “Highway networks,”
arXiv preprint arXiv:1505.00387, 2015.
[73] J. T. Springenberg, A. Dosovitskiy, T. Brox, and M. Riedmiller, “Striving
for simplicity: The all convolutional net,” in International Conference
on Learning Representations Workshop, 2015.

JOURNAL OF LATEX CLASS FILES, VOL. XX, NO. X, APRIL 2020

[74] I. Goodfellow, D. Warde-Farley, M. Mirza, A. Courville, and Y. Bengio,
“Maxout networks,” in International conference on machine learning,
2013, pp. 1319–1327.
[75] M. Lin, Q. Chen, and S. Yan, “Network in network,” arXiv preprint
arXiv:1312.4400, 2013.
[76] H. Liu, K. Simonyan, and Y. Yang, “Darts: Differentiable architecture
search,” in International Conference on Learning Representations, 2019.
[77] X. Chen, L. Xie, J. Wu, and Q. Tian, “Progressive differentiable architecture search: Bridging the depth gap between search and evaluation,”
in Proceedings of the IEEE/CVF International Conference on Computer
Vision, 2019, pp. 1294–1303.
[78] T. E. Arber Zela, T. Saikia, Y. Marrakchi, T. Brox, and F. Hutter,
“Understanding and robustifying differentiable architecture search,” in
International Conference on Learning Representations, 2020.
[79] J. M. Briggs and T. Schaffter, “Measure and cardinality,” The American
Mathematical Monthly, vol. 86, no. 10, pp. 852–855, 1979.
[80] R. B. Davies, “Numerical inversion of a characteristic function,”
Biometrika, vol. 60, no. 2, pp. 415–417, 1973.
[81] N. G. Shephard, “From characteristic function to distribution function: a
simple framework for the theory,” Econometric theory, vol. 7, no. 4, pp.
519–529, 1991.
[82] J. Gil-Pelaez, “Note on the inversion theorem,” Biometrika, vol. 38, no.
3-4, pp. 481–482, 1951.

Oyebade Oyedotun is a Research Associate at
the Interdisciplinary Centre for Security, Reliability,
and Trust (SnT), University of Luxembourg since
October 2020. He received the Ph.D. degree from
the Computer Vision, Imaging and Machine Intelligence (CVI2) Research Group at the Interdisciplinary
Centre for Security, Reliability and Trust (SnT),
University of Luxembourg, L-1855 Luxembourg with
a focus on deep learning, machine learning and
vision applications. He received the M.Sc. degree
in electrical and electronic engineering from Near
East University, Lefkosa, N. Cyprus, in 2015. He has authored and co-authored
many scientific articles in leading IEEE conferences and journals, including
Transactions on Neural Networks and Learning Systems. He reviews for several
journals, including IEEE TNNLS, IEEE TKDE, IEEE GRSL, IEEE Access,
IEEE TAFFC, Neural Computing and Applications. His current research
interests include machine learning and vision applications, neural networks,
cognition modeling and neuroscience.

Dr. Kassem Al Ismaeil is a Research Associate at
SnT. Kassem has received the BSc degree in electronic engineering and the MSc degree in computer
science both from the University of Aleppo, Aleppo,
Syria, in 2006 and 2008, respectively. He received
the MSc degree in computer vision and robotics from
the University of Burgundy, Le Creusot, France, in
2011, and the PhD degree in computer science from
Interdisciplinary Centre for Security, Reliability, and
Trust (SnT), University of Luxembourg, Luxembourg,
in 2015. Later on, Kassem has joined the MunichRe
group as an IT project manager where he was managing the middleware system
implementation. His research interests include 3D computer vision, image and
video processing, machine learning, with a focus on depth super-resolution,
3D reconstruction, and structure from motion.

18

Djamila Aouada is Senior Research Scientist and
Assistant Professor at the Interdisciplinary Centre for
Security, Reliability, and Trust (SnT), University of
Luxembourg. She is Head of the Computer Vision,
Imaging and Machine Intelligence (CVI2) Research
Group at SnT, and Head of the SnT Computer
Vision Laboratory. Dr. Aouada received the State
Engineering degree in electronics in 2005, from the
cole Nationale Polytechnique (ENP), Algiers, Algeria,
and the Ph.D. degree in electrical engineering in
2009 from North Carolina State University (NCSU),
Raleigh, NC, USA. Dr. Aouada has worked as a consultant for multiple
renowned laboratories (Los Alamos National Laboratory, Alcatel Lucent Bell
Labs., and Mitsubishi Electric Research Labs.). She has been leading the
computer vision activities at SnT since 2009. Her research interests span
the areas of image processing, computer vision, pattern recognition and data
modelling. Dr. Aouada is Senior Member of the IEEE, member of the IEEE
Signal Processing Society, IEEE WIE, INSTICC and the Eta Kappa Nu honor
society (HKN). She has served as the Chair of the IEEE Benelux Women
in Engineering Affinity Group from 2014 to 2016, Chair of the ECCV 2020
SHARP workshop, Area Chair at 3DV 2020, Chair of the CVPR 2021 SHARP
workshop and Program Chair at 3DV 2021. She is the recipient of four IEEE
best paper awards.


```

---

## Referencia BibTeX

```bibtex
@article{oyedotunWhyEveryoneTraining2023,
  title = {Why {{Is Everyone Training Very Deep Neural Network With Skip Connections}}?},
  author = {Oyedotun, Oyebade K. and Ismaeil, Kassem Al and Aouada, Djamila},
  year = 2023,
  month = sep,
  journal = {IEEE Transactions on Neural Networks and Learning Systems},
  volume = {34},
  number = {9},
  pages = {5961--5975},
  issn = {2162-237X, 2162-2388},
  doi = {10.1109/TNNLS.2021.3131813},
  urldate = {2026-07-10},
  copyright = {https://ieeexplore.ieee.org/Xplorehelp/downloads/license-information/IEEE.html},
  file = {/home/fernando/Zotero/storage/CMRN2RI2/Oyedotun et al. - 2023 - Why Is Everyone Training Very Deep Neural Network With Skip Connections.pdf}
}
```
