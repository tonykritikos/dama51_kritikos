# 4.b
#install.packages('caret')
library(caret)
true_value <- factor(c(1,0,1,0,1,1,1,0,0,1))
predicted_value <- factor(c(1,0,0,0,1,1,0,0,0,1))
confusionMatrix(data=predicted_value,reference=true_value) 
