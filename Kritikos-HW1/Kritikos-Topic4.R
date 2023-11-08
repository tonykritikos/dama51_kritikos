#a. calculate the correlation between a and w using the Pearson correlation coefficient
round(cor(c(11, 15, 23, 46, 52, 75), c(34, 49, 58, 62, 69, 64), method = "pearson"), digits=3)

#b. calculate the correlation between a and w using the Spearman’s rank correlation coefficient
round(cor(c(11, 15, 23, 46, 52, 75), c(34, 49, 58, 62, 69, 64), method = "spearman"), digits=3)

#c. Draw a scatter plot in R to visually check if there exists a relationship between a (x-axis) and w (y-axis). Include the labels of both axes. 
plot(c(11, 15, 23, 46, 52, 75), c(34, 49, 58, 62, 69, 64), main="Scatter Plot", xlab="Age", ylab="Weight", pch=19, frame= FALSE)    