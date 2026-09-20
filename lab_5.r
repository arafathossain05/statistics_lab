# ---------------------------------------
# Experiment 6
# Estimation of Population Mean and Variance
# ---------------------------------------

# Population parameters
mu <- 5
sigma <- 2

# Sample size
n <- 30

# For reproducibility
set.seed(123)


# ---------------------------------------
# Generate Sample Data
# ---------------------------------------

sample_data <- rnorm(n,
                     mean = mu,
                     sd = sigma)


# ---------------------------------------
# Calculate Sample Mean
# ---------------------------------------

sample_mean <- mean(sample_data)


# ---------------------------------------
# Calculate Sample Variance
# ---------------------------------------

sample_var <- var(sample_data)


# ---------------------------------------
# 95% Confidence Interval for Mean
# ---------------------------------------

conf_int_mean <- t.test(sample_data)$conf.int


# ---------------------------------------
# 95% Confidence Interval for Variance
# ---------------------------------------

conf_int_var <- c(
  (n - 1) * sample_var /
    qchisq(0.975, df = n - 1),
  
  (n - 1) * sample_var /
    qchisq(0.025, df = n - 1)
)


# ---------------------------------------
# Print Results
# ---------------------------------------

print(paste("Sample Mean:", sample_mean))

print(paste("Sample Variance:", sample_var))

print(paste("95% CI for Mean:",
            conf_int_mean[1],
            "to",
            conf_int_mean[2]))

print(paste("95% CI for Variance:",
            conf_int_var[1],
            "to",
            conf_int_var[2]))


# ---------------------------------------
# Graphs
# ---------------------------------------

par(mfrow = c(1, 2))


# ---------------------------------------
# Graph 1: Histogram
# ---------------------------------------

hist(sample_data,
     breaks = 30,
     col = "lightblue",
     main = "Sample Data with Mean",
     xlab = "Value",
     border = "white")

# Sample mean
abline(v = sample_mean,
       col = "red",
       lwd = 2)

# Confidence interval for mean
abline(v = conf_int_mean[1],
       col = "blue",
       lty = 2,
       lwd = 2)

abline(v = conf_int_mean[2],
       col = "blue",
       lty = 2,
       lwd = 2)

legend("topright",
       legend = c("Sample Mean",
                  "95% CI"),
       col = c("red", "blue"),
       lwd = 2,
       lty = c(1, 2))


# ---------------------------------------
# Graph 2: Boxplot
# ---------------------------------------

boxplot(sample_data,
        col = "lightgreen",
        main = "Boxplot of Sample Data",
        ylab = "Value")


# Reset plot layout
par(mfrow = c(1, 1))