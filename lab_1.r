df1 <- 5
df2 <- 10
N_sim <- 1000

set.seed(123)

chi2_1 <- rchisq(N_sim, df = df1)
chi2_2 <- rchisq(N_sim, df = df2)

f_data <- (chi2_1 / df1) / (chi2_2 / df2)

par(mfrow = c(2, 2))

hist(f_data, breaks = 30, col = "lightblue",
     probability = TRUE,
     main = "F-Distribution",
     xlab = "Value",
     border = "white")

curve(df(x, df1 = df1, df2 = df2),
      add = TRUE, col = "red", lwd = 2)

plot(density(f_data),
     col = "blue", lwd = 2,
     main = "Density Plot",
     xlab = "Value")

curve(df(x, df1 = df1, df2 = df2),
      add = TRUE, col = "red", lwd = 2)

qqplot(qf(ppoints(N_sim), df1 = df1, df2 = df2),
       f_data,
       main = "Q-Q Plot for F-Distribution",
       col = "blue",
       xlab = "Theoretical Quantiles",
       ylab = "Sample Quantiles")

abline(0, 1, col = "red", lwd = 2)

boxplot(f_data,
        col = "lightgreen",
        main = "Boxplot of F-Distributed Data",
        ylab = "Value")

cat("f_data summary:\n")
print(summary(f_data))

cat("mean/var:",
    mean(f_data), var(f_data), "\n")

cat("theoretical mean (df2/(df2-2)):",
    df2/(df2-2), "\n")