# 5.a
str(myDataSet)
myDataSet$Size_sepal <- myDataSet$Size_sepal <- as.factor(ifelse(myDataSet$Sepal.Length <median(myDataSet$Sepal.Length), 'small', 'big'))
str(myDataSet)

#5.b
addmargins(table(myDataSet$Species,myDataSet$Size_sepal),c(1,2))
ggplot(myDataSet, aes(x=Species, y=Size_sepal, fill=Size_sepal)) + geom_bar(position="stack", stat="identity") + ggtitle("Species to size")

#5.c
chisq.test(myDataSet$Size_sepal, myDataSet$Species)

#5.d
(chisq.test(myDataSet$Species, myDataSet$Size_sepal))$observed
(chisq.test(myDataSet$Species, myDataSet$Size_sepal))$expected
