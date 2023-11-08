# 3.d
install.packages('naivebayes')
library(naivebayes)

class_data<-read.csv("C:\\Users\\antonisk\\Desktop\\DAMA\\DAMA51\\DAMA51 - 5th Assignment\\CLASS_data.csv",head = TRUE, sep = ",")
classifier <- naive_bayes(PlayTennis ~ ., data = class_data)

test1 <- data.frame(Outlook = "Overcast", Temperature = "Mild", Humidity = "Normal", Wind = "Weak")
prediction1 <- predict(classifier, test1, type="prob")
prediction1

test2 <- data.frame(Outlook = "Sunny", Temperature = "Mild", Humidity = "High", Wind = "Strong")
prediction2 <- predict(classifier, test2, type="prob")
prediction2

