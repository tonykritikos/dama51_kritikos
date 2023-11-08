#4.a & b
result <- c(0.51, 0.67, 0.88, 0.34, 0.22, 0.01, 0.71, 0.23)
result_new <- factor(c(TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE))
true_state <- factor(c(FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE))

df <- data.frame(result, true_state)
df
library(caret)

cm <- confusionMatrix(true_state, reference = result_new)
cm

#4.c
library(pROC)
actual <- c("N", "N", "I", "N", "N", "N", "I", "N")
roc_curve <- roc(actual, result)

plot(roc_curve, col = "blue", lwd = 2, main = "ROC curve for COVID-19 diagnostic test",
     xlab = "False Positive Rate (FPR)", ylab = "True Positive Rate (TPR)")

abline(a = 0, b = 1, lty = 2, col = "gray")

points(x = 0.12, y = 0.33, col = "red", pch = 19)
points(x = 0.19, y = 0.47, col = "red", pch = 19)
points(x = 0.34, y = 0.68, col = "red", pch = 19)
points(x = 0.64, y = 0.91, col = "red", pch = 19)
points(x = 1, y = 1, col = "red", pch = 19)

text(x = 0.12, y = 0.33, labels = "Threshold = 0.80", pos = 2)
text(x = 0.19, y = 0.47, labels = "Threshold = 0.60", pos = 2)
text(x = 0.34, y = 0.68, labels = "Threshold = 0.40", pos = 2)
text(x = 0.64, y = 0.91, labels = "Threshold = 0.20", pos = 2)
text(x = 1, y = 1, labels = "Threshold = 0.00", pos = 2)

#4.e
auc <- 0.89
p <- (auc - 0.5) / (1 - 0.5)
p

#4.f
total <- 200
infected <- 40
non_infected <- 160
prob <- 0.6
predicted <- ifelse(runif(total) < prob, "N", "I")
expected_infected <- sum(predicted == "I") * (infected / total)
expected_infected
