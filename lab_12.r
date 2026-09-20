# -----------------------------------
# Experiment 13
# Type I Error, Type II Error and Power
# -----------------------------------

mu0 <- 5
mu1 <- 6
sigma <- 2
n <- 30
alpha <- 0.05
N_sim <- 1000

type_I_errors <- 0
type_II_errors <- 0

set.seed(123)


# -----------------------------------
# Simulation for Type I and Type II Error
# -----------------------------------

for (i in 1:N_sim) {
  
  # Data under H0
  data_H0 <- rnorm(
    n,
    mean = mu0,
    sd = sigma
  )
  
  t_test_H0 <- t.test(
    data_H0,
    mu = mu0,
    alternative = "greater"
  )
  
  if (t_test_H0$p.value < alpha) {
    type_I_errors <- type_I_errors + 1
  }
  
  
  # Data under H1
  data_H1 <- rnorm(
    n,
    mean = mu1,
    sd = sigma
  )
  
  t_test_H1 <- t.test(
    data_H1,
    mu = mu0,
    alternative = "greater"
  )
  
  if (t_test_H1$p.value >= alpha) {
    type_II_errors <- type_II_errors + 1
  }
}


# -----------------------------------
# Error Rates and Power
# -----------------------------------

type_I_rate <- type_I_errors / N_sim
type_II_rate <- type_II_errors / N_sim
power <- 1 - type_II_rate


print(paste("Type I Error Rate:", type_I_rate))
print(paste("Type II Error Rate:", type_II_rate))
print(paste("Power:", power))


# -----------------------------------
# Generate P-values
# -----------------------------------

set.seed(123)

pvals_H0 <- replicate(
  N_sim,
  t.test(
    rnorm(n, mean = mu0, sd = sigma),
    mu = mu0,
    alternative = "greater"
  )$p.value
)

pvals_H1 <- replicate(
  N_sim,
  t.test(
    rnorm(n, mean = mu1, sd = sigma),
    mu = mu0,
    alternative = "greater"
  )$p.value
)


# -----------------------------------
# P-value Histograms
# -----------------------------------

par(mfrow = c(1, 2))


# P-values under H0
hist(
  pvals_H0,
  breaks = 30,
  col = "lightblue",
  main = "P-values under H0",
  xlab = "P-value",
  border = "white"
)

abline(
  v = alpha,
  col = "red",
  lwd = 2
)


# P-values under H1
hist(
  pvals_H1,
  breaks = 30,
  col = "lightgreen",
  main = "P-values under H1",
  xlab = "P-value",
  border = "white"
)

abline(
  v = alpha,
  col = "red",
  lwd = 2
)