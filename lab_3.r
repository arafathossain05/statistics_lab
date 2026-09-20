# ---------------------------------------
# Experiment 3: t-Distribution vs Normal
# ---------------------------------------

# Sample size
n <- 10

# Number of simulations
N_sim <- 1000

# Set seed for reproducibility
set.seed(123)

# Generate t-distribution data
# Degrees of freedom = n - 1 = 9
t_data <- rt(N_sim, df = n - 1)

# Generate standard normal distribution data
normal_data <- rnorm(N_sim)


# ---------------------------------------
# Display 4 Graphs in RStudio
# ---------------------------------------

par(mfrow = c(2, 2))


# ---------------------------------------
# Graph 1: t-Distribution
# ---------------------------------------

hist(t_data,
     breaks = 30,
     col = "lightblue",
     probability = TRUE,
     main = "t-Distribution",
     xlab = "Value",
     border = "white")

curve(dt(x, df = n - 1),
      add = TRUE,
      col = "red",
      lwd = 2)


# ---------------------------------------
# Graph 2: Normal Distribution
# ---------------------------------------

hist(normal_data,
     breaks = 30,
     col = "lightgreen",
     probability = TRUE,
     main = "Normal Distribution",
     xlab = "Value",
     border = "white")

curve(dnorm(x),
      add = TRUE,
      col = "blue",
      lwd = 2)


# ---------------------------------------
# Graph 3: Density Comparison
# ---------------------------------------

plot(density(t_data),
     col = "red",
     lwd = 2,
     main = "Density Comparison",
     xlab = "Value",
     ylim = c(0, 0.4))

lines(density(normal_data),
      col = "blue",
      lwd = 2)

legend("topright",
       legend = c("t-Distribution",
                  "Normal Distribution"),
       col = c("red", "blue"),
       lwd = 2)


# ---------------------------------------
# Graph 4: Q-Q Plot
# ---------------------------------------

qqplot(qt(ppoints(N_sim), df = n - 1),
       t_data,
       main = "Q-Q Plot for t-Distribution",
       col = "red",
       xlab = "Theoretical Quantiles",
       ylab = "Sample Quantiles")

abline(0, 1,
       col = "blue",
       lwd = 2)


# ---------------------------------------
# Reset Plot Layout
# ---------------------------------------

par(mfrow = c(1, 1))


# ---------------------------------------
# Summary Statistics
# ---------------------------------------

cat("t_data summary:\n")
print(summary(t_data))

cat("\nnormal_data summary:\n")
print(summary(normal_data))


# ---------------------------------------
# Mean and Variance
# ---------------------------------------

cat("\nt_data mean/variance:",
    mean(t_data),
    var(t_data),
    "\n")

cat("normal_data mean/variance:",
    mean(normal_data),
    var(normal_data),
    "\n")
