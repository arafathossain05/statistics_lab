# -----------------------------------
# Experiment 11
# Likelihood Ratio / Decision Rule
# -----------------------------------

mu0 <- 5
mu1 <- 6
sigma <- 2
n <- 30
alpha <- 0.05

set.seed(123)


# -----------------------------------
# Generate Data under H0 and H1
# -----------------------------------

sample_data_H0 <- rnorm(
  n,
  mean = mu0,
  sd = sigma
)

sample_data_H1 <- rnorm(
  n,
  mean = mu1,
  sd = sigma
)


# -----------------------------------
# Likelihood Ratio Function
# -----------------------------------

likelihood_ratio <- function(data, mu0, mu1, sigma) {
  
  exp(
    sum(dnorm(data,
              mean = mu1,
              sd = sigma,
              log = TRUE)) -
      
      sum(dnorm(data,
                mean = mu0,
                sd = sigma,
                log = TRUE))
  )
}


# -----------------------------------
# Critical Value
# -----------------------------------

critical_value <- qnorm(
  1 - alpha,
  mean = mu0,
  sd = sigma / sqrt(n)
)


# -----------------------------------
# Decision
# -----------------------------------

decision_H0 <- mean(sample_data_H0) > critical_value

decision_H1 <- mean(sample_data_H1) > critical_value


# -----------------------------------
# Output
# -----------------------------------

print(paste("Critical value:", critical_value))

print(paste("Decision under H0:", decision_H0))

print(paste("Decision under H1:", decision_H1))


# -----------------------------------
# Density Plots
# -----------------------------------

par(mfrow = c(1, 2))


# Density under H0
plot(
  density(sample_data_H0),
  col = "blue",
  lwd = 2,
  main = "Density under H0",
  xlab = "Value"
)

abline(
  v = critical_value,
  col = "red",
  lty = 2,
  lwd = 2
)


# Density under H1
plot(
  density(sample_data_H1),
  col = "green",
  lwd = 2,
  main = "Density under H1",
  xlab = "Value"
)

abline(
  v = critical_value,
  col = "red",
  lty = 2,
  lwd = 2
)