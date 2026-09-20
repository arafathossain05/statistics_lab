# -----------------------------------
# Experiment 10: Hypothesis Testing
# -----------------------------------

mu0 <- 5
mu1 <- 6
sigma <- 2
n <- 30
alpha <- 0.05

set.seed(123)

# Generate sample data
sample_data <- rnorm(
  n,
  mean = mu1,
  sd = sigma
)


# -----------------------------------
# One-Sample t-Test
# H0: mu = 5
# H1: mu > 5
# -----------------------------------

t_test_result <- t.test(sample_data,mu = mu0,alternative = "greater")

# -----------------------------------
# Decision
# -----------------------------------

if (t_test_result$p.value < alpha) {
  
  decision <- "Reject H0"
  
} else {
  
  decision <- "Fail to Reject H0"
}


# -----------------------------------
# Output
# -----------------------------------

print(paste("Test statistic:",t_test_result$statistic))

print(paste("P-value:",t_test_result$p.value))

print(paste("Decision:",decision))

# -----------------------------------
# Graphs
# -----------------------------------

par(mfrow = c(1, 2))

# Histogram
hist(sample_data,
     breaks = 30,
     col = "lightblue",
     main = "Sample Data",
     xlab = "Value",
     border = "white")

abline(v = mu0,
       col = "red",
       lwd = 2)

abline(v = mean(sample_data),
       col = "blue",
       lwd = 2)

legend("topright",
       legend = c("H0 Mean", "Sample Mean"),
       col = c("red", "blue"),
       lwd = 2)


# Density plot
plot(density(sample_data),
     col = "blue",
     lwd = 2,
     main = "Density Plot",
     xlab = "Value")

abline(v = mu0,
       col = "red",
       lwd = 2)

abline(v = mean(sample_data),
       col = "blue",
       lwd = 2)