#5.a
library(openintro)
data(fastfood)
summary(fastfood)

#5.b
hist(fastfood$calcium, main="Calcium Histogram")

#5.c
plot(fastfood$calcium, main = "Calcium Scatterplot")
outliers <- (replace(fastfood$calcium, is.na(fastfood$calcium), 0)) >= 100
points(which(outliers), fastfood$calcium[outliers], pch = 19, col = "red")

#5.d
boxplot(fastfood$calcium, main = "Calcium Boxplot")

