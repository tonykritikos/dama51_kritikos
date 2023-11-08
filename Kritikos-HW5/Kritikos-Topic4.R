# 4.a
install.packages('ISLR')
library(ISLR)
data(Auto)
df <- data.frame(Auto$displacement, Auto$mpg)
names(df) <- c("x", "y")

n <- nrow(df)
x_sum <- sum(df$x)
y_sum <- sum(df$y)
xy_sum <- sum(df$x * df$y)
x_sq_sum <- sum(df$x^2)

A <- matrix(c(n, x_sum, x_sum, x_sq_sum), nrow = 2)
b <- matrix(c(y_sum, xy_sum), nrow = 2, ncol = 1)

param <- solve(A, b)
a <- param[1]
b <- param[2]

a
b

# 4.b
x <- c(30, 20, 60, 80, 40, 50, 70, 90)
y <- c(75, 52, 120, 170, 86, 110, 153, 194)

g <- sum(x*y)
k <- sum(x^2)
beta <- sum(x*y) / sum(x^2)

g
k
beta

# 4.c
x <- c(20, 10, 26, 8, 20, 16, 20, 12, 8, 24)
y <- c(706, 550, 790, 517, 694, 634, 715, 571, 529, 754)
n <- length(x)

beta1 <- (n * sum(x*y) - sum(x) * sum(y)) / (n * sum(x^2) - sum(x)^2)
beta0 <- mean(y) - beta1 * mean(x)

beta0
beta1

# 4.d
x <- c(20, 10, 26, 8, 20, 16, 20, 12, 8, 24)
y <- c(706, 550, 790, 517, 694, 634, 715, 571, 529, 754)

plot(x, y, main = "Fertilizer vs Yield ",
     xlab = "amount X of fertilizer ", ylab = "yield Y of the farm",
     pch = 20, frame = FALSE)

abline(lm(y ~ x), col = "red")
