# ---------------------------------------
# Experiment 7
# Convergence of Sample Mean and Variance
# ---------------------------------------

# Population parameters
mu <- 5
sigma <- 2

# Different sample sizes
sample_sizes <- c(10, 30, 100, 500, 1000)

# Number of simulations
N_sim <- 1000


# Store results
means <- numeric(length(sample_sizes))
vars <- numeric(length(sample_sizes))


# For reproducibility
set.seed(123)


# ---------------------------------------
# Simulation
# ---------------------------------------

for (i in 1:length(sample_sizes)) {
  
  # Current sample size
  n <- sample_sizes[i]
  
  # Generate 1000 sample means
  sample_means <- replicate(
    N_sim,
    mean(rnorm(n,
               mean = mu,
               sd = sigma))
  )
  
  # Average of sample means
  means[i] <- mean(sample_means)
  
  # Variance of sample means
  vars[i] <- var(sample_means)
}


# ---------------------------------------
# Display 2 Graphs
# ---------------------------------------

par(mfrow = c(1, 2))


# ---------------------------------------
# Graph 1: Convergence of Sample Mean
# ---------------------------------------

plot(sample_sizes,
     means,
     type = "b",
     col = "blue",
     pch = 19,
     main = "Convergence of Sample Mean",
     xlab = "Sample Size",
     ylab = "Sample Mean")

# True population mean
abline(h = mu,
       col = "red",
       lwd = 2)

legend("topright",
       legend = c("Sample Mean",
                  "Population Mean"),
       col = c("blue", "red"),
       lwd = 2,
       pch = c(19, NA))


# ---------------------------------------
# Graph 2: Convergence of Sample Variance
# ---------------------------------------

plot(sample_sizes,
     vars,
     type = "b",
     col = "green",
     pch = 19,
     main = "Convergence of Sample Variance",
     xlab = "Sample Size",
     ylab = "Variance")

# True population variance
abline(h = sigma^2,
       col = "red",
       lwd = 2)

legend("topright",
       legend = c("Sample Variance",
                  "Population Variance"),
       col = c("green", "red"),
       lwd = 2,
       pch = c(19, NA))


# Reset plot layout
par(mfrow = c(1, 1))


# ---------------------------------------
# Output
# ---------------------------------------

cat("Sample sizes:",
    sample_sizes,
    "\n\n")

cat("Means:",
    means,
    "\n\n")

cat("Variances:",
    vars,
    "\n")