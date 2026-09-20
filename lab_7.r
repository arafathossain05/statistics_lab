# -----------------------------------
# Experiment 8
# Unbiased and Biased Variance
# -----------------------------------

mu <- 5
sigma <- 2
n <- 30
N_sim <- 1000

sample_vars <- numeric(N_sim)
biased_vars <- numeric(N_sim)

set.seed(123)

for (i in 1:N_sim) {
  
  data <- rnorm(n, mean = mu, sd = sigma)
  
  # Unbiased sample variance
  sample_vars[i] <- var(data)
  
  # Biased sample variance
  biased_vars[i] <- sum((data - mean(data))^2) / n
}


# -----------------------------------
# Plot 1: Unbiased vs Biased Variance
# -----------------------------------

par(mfrow = c(1, 2))

hist(sample_vars,
     breaks = 30,
     col = "lightblue",
     main = "Unbiased Sample Variance",
     xlab = "Variance",
     border = "white")

abline(v = sigma^2,
       col = "red",
       lwd = 2)


hist(biased_vars,
     breaks = 30,
     col = "lightgreen",
     main = "Biased Sample Variance",
     xlab = "Variance",
     border = "white")

abline(v = sigma^2,
       col = "red",
       lwd = 2)


# -----------------------------------
# Two-Sample Z-Test
# -----------------------------------

z_test <- function(x, y, sigma_x, sigma_y) {
  
  n1 <- length(x)
  n2 <- length(y)
  
  z <- (mean(x) - mean(y)) /
    sqrt(sigma_x^2 / n1 + sigma_y^2 / n2)
  
  p_value <- 2 * pnorm(-abs(z))
  
  list(
    statistic = z,
    p.value = p_value
  )
}


set.seed(123)

group1 <- rnorm(30, mean = 50, sd = 10)
group2 <- rnorm(30, mean = 55, sd = 10)

z_test_result <- z_test(
  group1,
  group2,
  sd(group1),
  sd(group2)
)


cat("Z statistic:", z_test_result$statistic, "\n")
cat("P-value:", z_test_result$p.value, "\n")


# -----------------------------------
# Plot 2: Group 1 and Group 2
# -----------------------------------

par(mfrow = c(1, 2))

hist(group1,
     breaks = 15,
     col = "lightblue",
     main = "Histogram of Group 1",
     xlab = "Value",
     border = "white")

hist(group2,
     breaks = 15,
     col = "lightgreen",
     main = "Histogram of Group 2",
     xlab = "Value",
     border = "white")


# -----------------------------------
# Final Results
# -----------------------------------

cat("Mean unbiased variance:",
    mean(sample_vars), "\n")

cat("Mean biased variance:",
    mean(biased_vars), "\n")