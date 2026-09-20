# -----------------------------------
# Experiment 14
# Power of t-test and z-test
# -----------------------------------

mu0 <- 5
mu1 <- 6
sigma <- 2
n <- 30
alpha <- 0.05
N_sim <- 1000

power_t_test <- 0
power_z_test <- 0

set.seed(123)


# -----------------------------------
# Power Comparison
# -----------------------------------

for (i in 1:N_sim) {
  
  data <- rnorm(
    n,
    mean = mu1,
    sd = sigma
  )
  
  
  # t-test
  t_test <- t.test(
    data,
    mu = mu0,
    alternative = "greater"
  )
  
  if (t_test$p.value < alpha) {
    power_t_test <- power_t_test + 1
  }
  
  
  # z-test
  z_stat <- (mean(data) - mu0) /
    (sigma / sqrt(n))
  
  z_critical <- qnorm(1 - alpha)
  
  if (z_stat > z_critical) {
    power_z_test <- power_z_test + 1
  }
}


# -----------------------------------
# Calculate Power
# -----------------------------------

power_t_value <- power_t_test / N_sim
power_z_value <- power_z_test / N_sim

print(
  paste("Power of t-test:", power_t_value)
)

print(
  paste("Power of z-test:", power_z_value)
)


# -----------------------------------
# Power vs Sample Size
# -----------------------------------

set.seed(123)

sample_sizes <- seq(
  10,
  100,
  by = 10
)

power_t <- sapply(
  sample_sizes,
  function(n) {
    
    sum(
      replicate(
        N_sim,
        t.test(
          rnorm(n, mean = mu1, sd = sigma),
          mu = mu0,
          alternative = "greater"
        )$p.value < alpha
      )
    ) / N_sim
  }
)


# -----------------------------------
# Graphs
# -----------------------------------

par(mfrow = c(2, 1))


# Power Comparison
barplot(
  c(power_t_value, power_z_value),
  names.arg = c("t-test", "z-test"),
  col = c("lightblue", "lightgreen"),
  main = "Power Comparison",
  ylab = "Power",
  ylim = c(0, 1)
)


# Power vs Sample Size
plot(
  sample_sizes,
  power_t,
  type = "b",
  col = "blue",
  main = "Power vs. Sample Size",
  xlab = "Sample Size",
  ylab = "Power (t-test)",
  ylim = c(0, 1)
)


# -----------------------------------
# Output
# -----------------------------------

cat("Sample sizes:", sample_sizes, "\n")
cat("Power_t:", power_t, "\n")