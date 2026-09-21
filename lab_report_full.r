E1-1: Simulation of F-distributed Data and Its Relationship with χ²-distribution
Objectives
1.	To simulate random data from an F-distribution using R. 
2.	To understand the relationship between F-distribution and χ²-distribution. 
3.	To observe the effect of numerator and denominator degrees of freedom. 
4.	To compare the simulated F-distribution with its theoretical properties. 
5.	To visualize the distribution using histogram and density plots. 
Theory
The F-distribution is a continuous probability distribution commonly used in statistical inference, especially in ANOVA and variance comparison.
If X1 and X2 are independent chi-square random variables with d_1 and d_2 degrees of freedom, then
F=(X1/d1)(X2/d2) 
follows an F-distribution with d_1 and d_2 degrees of freedom.
Thus, the F-distribution is directly related to the ratio of two independent χ²-distributed variables divided by their respective degrees of freedom.
In R, rf() is used to generate F-distributed random data.
Pseudocode
1.	Start. 
2.	Set numerator degrees of freedom d1d_1. 
3.	Set denominator degrees of freedom d2d_2. 
4.	Set the number of simulations. 
5.	Generate χ² random variables X_1 and X_2. 
6.	Calculate F=(X_1/d_1)/(X_2/d_2). 
7.	Generate F-distributed data directly using rf(). 
8.	Compare the two generated distributions. 
9.	Calculate summary statistics. 
10.	Plot histogram and density curve. 
11.	Stop. 
________________________________________
E1-2: Generation and Analysis of χ²-distributed Data
Objectives
1.	To generate random samples from a χ²-distribution using R. 
2.	To calculate the mean and variance of the simulated data. 
3.	To compare simulated values with theoretical properties. 
4.	To study the shape of the χ²-distribution. 
5.	To visualize the distribution using histogram, density and Q-Q plots. 
Theory
The chi-square (χ²) distribution is a continuous probability distribution with kk degrees of freedom.
If Z1,Z2,…,Zk are independent standard normal variables, then
X=Z1^2+Z2^2+⋯+Zk^2
follows a chi-square distribution with kk degrees of freedom.
The theoretical mean and variance are:
E(X)=kE(X)=k Var(X)=2kVar(X)=2k 
As the degrees of freedom increase, the χ²-distribution becomes more symmetric and approaches a normal distribution.
Pseudocode
1.	Start. 
2.	Set degrees of freedom kk. 
3.	Set the number of simulations. 
4.	Generate χ²-distributed data using rchisq(). 
5.	Calculate sample mean. 
6.	Calculate sample variance. 
7.	Compare them with theoretical mean kk and variance 2k2k. 
8.	Plot histogram. 
9.	Add density curve. 
10.	Create Q-Q plot. 
11.	Stop. 
________________________________________
E1-3: Comparison of t-distribution with Normal Distribution for Small Sample Sizes
Objectives
1.	To generate data from t-distribution and normal distribution. 
2.	To compare their shapes for small sample sizes. 
3.	To understand the heavier tails of the t-distribution. 
4.	To observe the effect of degrees of freedom. 
5.	To determine why t-distribution is useful for small samples. 
Theory
The Student's t-distribution is used when the population standard deviation is unknown and the sample size is small.
The t-statistic is
t=X−μ/(S/root(n)) 
where S is the sample standard deviation.
Compared with the standard normal distribution, the t-distribution has heavier tails because it accounts for additional uncertainty caused by estimating the population standard deviation.
As the degrees of freedom increase, the t-distribution approaches the standard normal distribution.

Pseudocode
1.	Start. 
2.	Choose a small sample size. 
3.	Set degrees of freedom. 
4.	Generate random observations from t-distribution. 
5.	Generate random observations from normal distribution. 
6.	Plot both distributions. 
7.	Compare their center and tails. 
8.	Repeat for larger degrees of freedom if required. 
9.	Observe that t-distribution approaches normal distribution. 
10.	Stop. 
________________________________________
E1-4: Distribution of Medians and Ranges from Samples
Objectives
1.	To generate repeated samples from a population. 
2.	To calculate the median of each sample. 
3.	To calculate the range of each sample. 
4.	To study the sampling distributions of median and range. 
5.	To visualize the variability of these statistics. 
Theory
A sample statistic is a numerical value calculated from sample observations.
The sample median is the middle value after arranging observations in ascending order.
For a sample,
Range=Maximum−Minimum
When many random samples are taken from the same population, their medians and ranges form sampling distributions.
The distribution of sample medians helps us understand the variability of the median as an estimator of the population center. Similarly, the distribution of ranges describes the variability of sample spread.
Pseudocode
1.	Start. 
2.	Define the population distribution. 
3.	Set sample size nn. 
4.	Set the number of samples. 
5.	Generate one random sample. 
6.	Calculate its median. 
7.	Calculate its range. 
8.	Repeat steps 5–7 for all samples. 
9.	Store all medians and ranges. 
10.	Plot their distributions. 
11.	Calculate mean and standard deviation. 
12.	Stop. 
________________________________________
E1-5: Estimation of Population Parameters from Sample Data
Objectives
1.	To generate or obtain sample data from a population. 
2.	To estimate the population mean from sample data. 
3.	To estimate the population variance and standard deviation. 
4.	To compare sample estimates with population parameters. 
5.	To understand the concept of point estimation. 
Theory
A population parameter is a numerical characteristic of the entire population.
Examples include:
•	Population mean: μ\mu 
•	Population variance: σ2\sigma^2 
•	Population standard deviation: σ\sigma 
Since it is usually difficult to observe the entire population, a sample is used to estimate these parameters.
The sample mean is
Xˉ=1/n∑ Xi
and the sample variance is
S^2=∑i=1n(Xi−Xˉ)^2/(n−1) 
These statistics are commonly used as estimators of population parameters.
Pseudocode
1.	Start. 
2.	Define population parameters. 
3.	Generate a random sample. 
4.	Calculate sample mean. 
5.	Calculate sample variance. 
6.	Calculate sample standard deviation. 
7.	Compare estimates with true population values. 
8.	Display the results. 
9.	Stop. 
________________________________________
E2 — Properties of Estimators
E2-1: Demonstration of Consistency by Increasing Sample Size
Objectives
1.	To understand the concept of consistency of an estimator. 
2.	To generate samples with different sample sizes. 
3.	To calculate the estimator for each sample. 
4.	To observe convergence toward the true population parameter. 
5.	To demonstrate consistency graphically. 
Theory
An estimator is called consistent if it approaches the true population parameter as the sample size increases.
For example, the sample mean Xˉ\bar X is a consistent estimator of the population mean μ\mu.
As
n→∞ 
we expect
Xˉ→μ 
Thus, increasing the sample size generally reduces sampling variability and makes the estimator closer to the true parameter.
Pseudocode
1.	Start. 
2.	Set the true population parameter. 
3.	Select several increasing sample sizes. 
4.	Generate a random sample for each sample size. 
5.	Calculate the estimator. 
6.	Store the estimated values. 
7.	Compare estimates with the true parameter. 
8.	Plot estimator versus sample size. 
9.	Observe convergence toward the true value. 
10.	Stop. 
________________________________________
E2-2: Comparison of Biased and Unbiased Estimators
Objectives
1.	To understand biased and unbiased estimation. 
2.	To generate repeated samples from a population. 
3.	To calculate biased and unbiased estimators. 
4.	To compare their expected values with the true parameter. 
5.	To demonstrate estimator bias through simulation. 
Theory
An estimator θ^\hat\theta is unbiased if
E(θ^)=θ 
where θ\theta is the true population parameter.
The bias of an estimator is
Bias(θ^)=E(θ^)−θ 
For example, for population variance, the estimator using denominator nn,
1/n∑(Xi−Xˉ)^2 
is biased downward.
The estimator using n−1,
S2=1/(n−1)∑(Xi−Xˉ)^2 
is unbiased for population variance under the usual assumptions.
Pseudocode
1.	Start. 
2.	Define population parameters. 
3.	Generate many random samples. 
4.	Calculate biased estimator for every sample. 
5.	Calculate unbiased estimator for every sample. 
6.	Find the average of both estimators. 
7.	Compare their averages with the true parameter. 
8.	Calculate bias. 
9.	Plot the results. 
10.	Stop. 
________________________________________
E2-3: Calculation of Efficiency of Estimators
Objectives
1.	To understand the concept of estimator efficiency. 
2.	To generate repeated samples from a population. 
3.	To calculate two or more estimators of the same parameter. 
4.	To calculate their variances. 
5.	To compare their relative efficiency. 
Theory
Efficiency measures the variability of an estimator.
For two unbiased estimators θ^1\hat\theta_1 and θ^2\hat\theta_2, relative efficiency can be expressed as
RE(θ^1,θ^2)=Var(θ^2)\Var(θ^1) 
An estimator with smaller variance is generally more efficient among unbiased estimators of the same parameter.
Thus, efficiency is related to the precision of an estimator.
Pseudocode
1.	Start. 
2.	Define the population and parameter. 
3.	Generate many repeated samples. 
4.	Calculate estimator 1 for each sample. 
5.	Calculate estimator 2 for each sample. 
6.	Calculate variance of both estimators. 
7.	Calculate relative efficiency. 
8.	Compare the variances. 
9.	Display the result. 
10.	Stop. 
________________________________________
E2-4: MLE for Binomial, Poisson and Normal Distributions
Objectives
1.	To understand the concept of Maximum Likelihood Estimation (MLE). 
2.	To generate simulated data from Binomial, Poisson and Normal distributions. 
3.	To derive parameter estimates using likelihood functions. 
4.	To calculate MLEs from simulated observations. 
5.	To compare estimated parameters with the true parameters. 
Theory
Maximum Likelihood Estimation (MLE) is a method of estimating unknown parameters by maximizing the likelihood of observing the given sample.
For a parameter θ\theta, the likelihood function is
L(θ)=f(xi∣θ)
The MLE is the value of θ\theta that maximizes L(θ)L(\theta).
Binomial
For X∼Binomial(n,p)X\sim Binomial(n,p), the MLE of p is
p^=∑xi\Nn 
where NN is the number of observations.
Poisson
For X∼Poisson(λ)X\sim Poisson(\lambda), the MLE is
λ^=Xˉ\hat\lambda=\bar X 
Normal
For X∼N(μ,σ2)X\sim N(\mu,\sigma^2),
μ^=Xˉ\hat\mu=\bar X 
and the MLE of variance is
σ^2=1n∑i=1n(xi−Xˉ)2\hat\sigma^2=\frac{1}{n}\sum_{i=1}^{n}(x_i-\bar X)^2 
Pseudocode
1.	Start. 
2.	Generate Binomial data. 
3.	Estimate pp using MLE. 
4.	Generate Poisson data. 
5.	Estimate λ\lambda using MLE. 
6.	Generate Normal data. 
7.	Estimate μ\mu and σ2\sigma^2. 
8.	Compare estimated values with true parameters. 
9.	Display results. 
10.	Stop. 
________________________________________
E3 — Hypothesis Testing
E3-1: Simulation of Decision-Making Using Hypothesis Testing
Objectives
1.	To understand statistical decision-making. 
2.	To formulate null and alternative hypotheses. 
3.	To generate sample data under a specified hypothesis. 
4.	To calculate test statistics and p-values. 
5.	To make decisions based on a significance level. 
Theory
Hypothesis testing is a statistical procedure used to determine whether sample evidence provides sufficient evidence against a null hypothesis.
Two hypotheses are generally considered:
•	H0H_0: Null hypothesis 
•	H1H_1: Alternative hypothesis 
A significance level α\alpha, commonly 0.05, is selected.
Decision rule:
p-value<α⇒Reject H0p\text{-value}<\alpha \Rightarrow Reject\ H_0 p-value≥α⇒Fail to Reject H0p\text{-value}\geq\alpha \Rightarrow Fail\ to\ Reject\ H_0 
Pseudocode
1.	Start. 
2.	Define H0H_0 and H1H_1. 
3.	Set significance level α\alpha. 
4.	Generate sample data. 
5.	Perform the appropriate statistical test. 
6.	Calculate test statistic and p-value. 
7.	Compare p-value with α\alpha. 
8.	Make the statistical decision. 
9.	Repeat the simulation if required. 
10.	Stop. 
________________________________________
E3-2: Best Critical Region for Simple vs Composite Hypotheses
Objectives
1.	To understand critical and acceptance regions. 
2.	To distinguish between simple and composite hypotheses. 
3.	To simulate test statistics under different hypotheses. 
4.	To identify a critical region based on a significance level. 
5.	To study how the critical region affects hypothesis-testing decisions. 
Theory
A critical region is the set of values of a test statistic for which the null hypothesis is rejected.
For a simple null hypothesis, the distribution of the test statistic under H0H_0 is specified.
For a composite hypothesis, the hypothesis contains multiple possible parameter values.
For example:
H0:μ=μ0H_0:\mu=\mu_0 
is a simple hypothesis, while
H1:μ>μ0H_1:\mu>\mu_0 
is a composite hypothesis when μ\mu can take multiple values greater than μ0\mu_0.
The critical region is selected so that the probability of rejecting H0H_0 when H0H_0 is true is controlled by α\alpha.
Pseudocode
1.	Start. 
2.	Define H0H_0 and H1H_1. 
3.	Select the significance level α\alpha. 
4.	Determine the distribution of the test statistic under H0H_0. 
5.	Determine the critical value. 
6.	Define the critical region. 
7.	Generate simulated test statistics. 
8.	Count observations falling in the critical region. 
9.	Evaluate the rejection behavior. 
10.	Stop. 
________________________________________
E3-3: Simulation of Type I and Type II Errors
Objectives
1.	To understand Type I and Type II errors. 
2.	To simulate samples under the null hypothesis. 
3.	To simulate samples under the alternative hypothesis. 
4.	To estimate the probabilities of Type I and Type II errors. 
5.	To study the relationship between significance level and statistical power. 
Theory
In hypothesis testing, two major errors can occur.
Type I Error
Rejecting H0H_0 when H0H_0 is actually true.
P(Type I Error)=αP(Type\ I\ Error)=\alpha 
Type II Error
Failing to reject H0H_0 when H1H_1 is actually true.
P(Type II Error)=βP(Type\ II\ Error)=\beta 
The power of a test is
Power=1−βPower=1-\beta 
Increasing sample size or increasing the difference between the null and alternative parameters generally affects statistical power.
Pseudocode
1.	Start. 
2.	Set significance level α\alpha. 
3.	Define H0H_0 and H1H_1. 
4.	Generate many samples under H0H_0. 
5.	Perform the hypothesis test. 
6.	Count incorrect rejections → Type I errors. 
7.	Generate many samples under H1H_1. 
8.	Perform the same test. 
9.	Count failures to reject H0H_0 → Type II errors. 
10.	Estimate Type I and Type II error probabilities. 
11.	Calculate power. 
12.	Stop. 
________________________________________
E3-4: Step-by-Step Hypothesis Testing Using Real or Simulated Data
Objectives
1.	To perform hypothesis testing systematically. 
2.	To formulate null and alternative hypotheses. 
3.	To select an appropriate statistical test. 
4.	To calculate the test statistic and p-value. 
5.	To make a statistical decision and interpret the result. 
Theory
Hypothesis testing generally follows a sequence of steps.
The major steps are:
1.	State H0H_0 and H1H_1. 
2.	Select significance level α\alpha. 
3.	Select an appropriate statistical test. 
4.	Calculate the test statistic. 
5.	Calculate the p-value or critical value. 
6.	Make the decision. 
7.	State the conclusion in the context of the problem. 
For example, a one-sample t-test can be used to test whether a population mean differs from a specified value when the population standard deviation is unknown.
Pseudocode
1.	Start. 
2.	Obtain or generate sample data. 
3.	State H0H_0. 
4.	State H1H_1. 
5.	Choose α\alpha. 
6.	Select the appropriate test. 
7.	Calculate the test statistic. 
8.	Calculate the p-value. 
9.	Compare p-value with α\alpha. 
10.	Reject or fail to reject H0H_0. 
11.	State the conclusion. 
12.	Stop. 
________________________________________
E3-5: Comparison of Power of Different Tests
Objectives
1.	To understand the concept of statistical power. 
2.	To simulate data under the same alternative hypothesis. 
3.	To apply different statistical tests to the same problem. 
4.	To estimate the power of each test. 
5.	To compare the test results using simulation. 
Theory
Statistical power is the probability that a test correctly rejects the null hypothesis when the alternative hypothesis is true.
Power=P(Reject H0∣H1 is true)Power=P(Reject\ H_0|H_1\ is\ true) 
It is also related to Type II error:
Power=1−βPower=1-\beta 
Power depends on several factors, including:
•	Sample size 
•	Effect size 
•	Significance level 
•	Population variability 
•	Type of statistical test 
In simulation, many samples are generated under a specified alternative hypothesis. Each test is applied, and the proportion of significant results estimates its power.
Pseudocode
1.	Start. 
2.	Define H0H_0 and H1H_1. 
3.	Set significance level α\alpha. 
4.	Choose sample size and population parameters. 
5.	Generate many samples under H1H_1. 
6.	Apply Test 1 to each sample. 
7.	Record whether H0H_0 is rejected. 
8.	Apply Test 2 to the same simulated samples. 
9.	Record whether H0H_0 is rejected. 
10.	Calculate power for each test. 
11.	Compare the estimated powers. 
12.	Stop.

