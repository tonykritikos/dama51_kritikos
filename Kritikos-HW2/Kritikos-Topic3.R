# 3.a 
myDataFrame <- as.data.frame(USArrests)
str(myDataFrame)
mean(myDataFrame$Murder)
sd(myDataFrame$Murder)
mean(myDataFrame$Assault)
sd(myDataFrame$Assault)
mean(myDataFrame$UrbanPop)
sd(myDataFrame$UrbanPop)
mean(myDataFrame$Rape)
sd(myDataFrame$Rape)

# 3.b
prcomp(myDataFrame, scale=TRUE)

# 3.c
pca <- prcomp(myDataFrame, scale=TRUE)
summary(pca)

# 3.d
pca$rotation

# 3.3
plot(c(1:4), pca$sdev^2 / sum(pca$sdev^2))