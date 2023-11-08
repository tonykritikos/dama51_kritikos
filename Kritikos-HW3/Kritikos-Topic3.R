#3.b
x <- mtcars$disp
y <- mtcars$mpg
model <- lm(y ~ x, data = mtcars)
summary(model)

#3.c
plot(x, y, main = "Main title",
     xlab = "X axis title", ylab = "Y axis title",
     pch = 19, frame = FALSE)
abline(model, col = "red")
sse <- sum((fitted(model) - x)^2)
sse

#3.d.1
library(caret)
process <- preProcess(as.data.frame(mtcars), method=c("range"))
norm_scale <- predict(process, as.data.frame(mtcars))
norm_scale

#3.d.2
gradientDesc <- function(x, y, learn_rate, n, max_iter) {
  a <- 0.650
  b <- 0.350
  yhat <- a * x + b
  SSE <- sum((y - yhat) ^ 2)
  yhat <- a * x + b
  SSE_new <- sum((y - yhat) ^ 2)
  a_new <- a - learn_rate * ((1 / n) * (sum((yhat - y) * x)))
  b_new <- b - learn_rate * ((1 / n) * (sum(yhat - y)))
  a <- a_new
  b <- b_new
  yhat <- a * x + b
  SSE_new <- sum((y - yhat) ^ 2)
}

disp_norm <- norm_scale$disp
mpg_norm <- norm_scale$mpg
gradientDesc(disp_norm, mpg_norm, 0.001, 4, 2)
