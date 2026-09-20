# -----------------------------------
# Experiment 9: Maximum Likelihood Estimation
# -----------------------------------
set.seed(123)

# -----------------------------------
# 1. Binomial Distribution
# -----------------------------------

n_binom <- 20
p_true <- 0.6

data_binom <- rbinom(
  100,
  size = n_binom,
  prob = p_true
)

# MLE of p
p_mle <- mean(data_binom) / n_binom

# -----------------------------------
# 2. Poisson Distribution
# -----------------------------------

lambda_true <- 3

data_pois <- rpois(
  100,
  lambda = lambda_true
)
# MLE of lambda
lambda_mle <- mean(data_pois)

# -----------------------------------
# 3. Normal Distribution
# -----------------------------------

mu_true <- 5
sigma_true <- 2

data_norm <- rnorm(
  100,
  mean = mu_true,
  sd = sigma_true
)

# MLE of mu
mu_mle <- mean(data_norm)

# MLE of sigma
sigma_mle <- sqrt(
  mean((data_norm - mu_mle)^2)
)

# -----------------------------------
# Display Results
# -----------------------------------

print(paste("Binomial MLE for p:", p_mle))

print(paste("Poisson MLE for Lambda:", lambda_mle))

print(paste("Normal MLE for mu:", mu_mle))

print(paste("Normal MLE for sigma:", sigma_mle))