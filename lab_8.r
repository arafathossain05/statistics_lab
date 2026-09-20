# -----------------------------------
# Experiment 9
# Efficiency of Mean and Median
# -----------------------------------

mu <- 5
sigma <- 2
n <- 30
N_sim <- 1000

means <- numeric(N_sim)
medians <- numeric(N_sim)

set.seed(123)

for (i in 1:N_sim) {
  
  data <- rnorm(n, mean = mu, sd = sigma)
  
  means[i] <- mean(data)
  medians[i] <- median(data)
}


# -----------------------------------
# Efficiency Calculation
# -----------------------------------

efficiency <- var(medians) / var(means)

print(paste("Efficiency (median/mean):", efficiency))


# -----------------------------------
# Graphs
# -----------------------------------

par(mfrow = c(1, 2))

hist(means,
     breaks = 30,
     col = "lightblue",
     main = "Distribution of Sample Means",
     xlab = "Value",
     border = "white")

hist(medians,
     breaks = 30,
     col = "lightgreen",
     main = "Distribution of Sample Medians",
     xlab = "Value",
     border = "white")