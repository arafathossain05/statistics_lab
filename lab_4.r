# ---------------------------------------
# Experiment
# Distribution of Medians and Ranges
# ---------------------------------------

# Population parameters
mu <- 0
sigma <- 1

# Sample size
n <- 20

# Number of simulations
N_sim <- 1000


# Store results
medians <- numeric(N_sim)
ranges <- numeric(N_sim)


# For reproducibility
set.seed(123)


# ---------------------------------------
# Simulation
# ---------------------------------------

for (i in 1:N_sim) {
  
  # Generate random sample
  data <- rnorm(n,
                mean = mu,
                sd = sigma)
  
  # Calculate median
  medians[i] <- median(data)
  
  # Calculate range
  ranges[i] <- max(data) - min(data)
}


# ---------------------------------------
# Display 4 Graphs
# ---------------------------------------

par(mfrow = c(2, 2))


# ---------------------------------------
# Graph 1: Distribution of Medians
# ---------------------------------------

hist(medians,
     breaks = 30,
     col = "lightblue",
     probability = TRUE,
     main = "Distribution of Medians",
     xlab = "Median",
     border = "white")

curve(dnorm(x,
            mean = mu,
            sd = sigma / sqrt(n)),
      add = TRUE,
      col = "red",
      lwd = 2)


# ---------------------------------------
# Graph 2: Distribution of Ranges
# ---------------------------------------

hist(ranges,
     breaks = 30,
     col = "lightgreen",
     probability = TRUE,
     main = "Distribution of Ranges",
     xlab = "Range",
     border = "white")


# ---------------------------------------
# Graph 3: Density Plot of Medians
# ---------------------------------------

plot(density(medians),
     col = "blue",
     lwd = 2,
     main = "Density Plot of Medians",
     xlab = "Median")

curve(dnorm(x,
            mean = mu,
            sd = sigma / sqrt(n)),
      add = TRUE,
      col = "red",
      lwd = 2)

legend("topright",
       legend = c("Sample Density",
                  "Normal Curve"),
       col = c("blue", "red"),
       lwd = 2)


# ---------------------------------------
# Graph 4: Boxplot
# ---------------------------------------

boxplot(list(Medians = medians,
             Ranges = ranges),
        col = c("lightblue",
                "lightgreen"),
        main = "Boxplot of Medians and Ranges",
        ylab = "Value")


# Reset plot layout
par(mfrow = c(1, 1))


# ---------------------------------------
# Output
# ---------------------------------------

cat("Sample Input and Output:\n")

cat("Since this code generates random data,",
    "the exact numerical results will vary.\n")

cat("However, the graphical outputs will have",
    "a clear pattern.\n\n")


# Mean and SD of medians
cat("Mean of medians:",
    mean(medians),
    " SD of medians:",
    sd(medians),
    "\n")


# Mean and SD of ranges
cat("Mean of ranges:",
    mean(ranges),
    " SD of ranges:",
    sd(ranges),
    "\n")