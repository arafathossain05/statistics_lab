# -----------------------------------
# Experiment 13
# One-Sample t-Test
# Manual Calculation
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
# Hypotheses
# -----------------------------------

print("H0: mu = 5")
print("H1: mu > 5")

print(
  paste("Significance level (alpha):", alpha)
)


# -----------------------------------
# Test Statistic
# -----------------------------------

t_stat <- (mean(sample_data) - mu0) /
  (sd(sample_data) / sqrt(n))

print(
  paste("Test statistic (t):", t_stat)
)


# -----------------------------------
# Critical Value
# -----------------------------------

critical_value <- qt(
  1 - alpha,
  df = n - 1
)

print(
  paste("Critical value:", critical_value)
)


# -----------------------------------
# P-value
# -----------------------------------

p_value <- pt(
  t_stat,
  df = n - 1,
  lower.tail = FALSE
)

print(
  paste("P-value:", p_value)
)


# -----------------------------------
# Decision
# -----------------------------------

if (t_stat > critical_value) {
  
  decision <- "Reject H0"
  
} else {
  
  decision <- "Fail to reject H0"
}

print(
  paste("Decision:", decision)
)


# -----------------------------------
# Graphs
# -----------------------------------

par(mfrow = c(1, 2))


# Histogram
hist(
  sample_data,
  breaks = 30,
  col = "lightblue",
  main = "Sample Data",
  xlab = "Value",
  border = "white"
)

abline(
  v = mu0,
  col = "red",
  lwd = 2
)

abline(
  v = mean(sample_data),
  col = "blue",
  lwd = 2
)

legend(
  "topright",
  legend = c("H0 Mean", "Sample Mean"),
  col = c("red", "blue"),
  lwd = 2
)


# Density Plot
plot(
  density(sample_data),
  col = "blue",
  lwd = 2,
  main = "Density Plot",
  xlab = "Value"
)

abline(
  v = mean(sample_data),
  col = "blue",
  lwd = 2
)