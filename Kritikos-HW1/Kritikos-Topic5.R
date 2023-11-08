#a. Check the data type of the data set and make sure it is a data frame. if not convert it into a data frame
typeof(state.x77)
#returned “double” so we use the following command
myDataFrame <- as.data.frame.matrix(state.x77)

#b.	Create a new attribute called states and assign to it the row names of the data set. Then, remove the row names from the data set. 
myDataFrame <- as.data.frame.matrix(state.x77)
states <- row.names(myDataFrame )
rownames(myDataFrame ) <- NULL

#c. Find out how many states have income (per capita) of more than 4,300$ and population more than 1,000 (in thousands) people
myDataFrame <- as.data.frame.matrix(state.x77)
sum(myDataFrame$Income > 4300 & myDataFrame$Population > 1000)

#d. Print out the top-5 states, which exhibit the highest income, after having ordered the data frame in decreasing order based on attribute Income.
myDataFrame <- as.data.frame.matrix(state.x77)
sorted <- myDataFrame[order(-myDataFrame$Income),]
rownames(head(sorted, n=5))

#e. Create a new ordinal attribute called frost_cat which takes on the values low, intermediate, and high that correspond to the following intervals (-1, 30], (30, 90], and (90, 190]. Print out the states of the low category in the space provided below.
myDataFrame <- as.data.frame.matrix(state.x77)
x <- cut(myDataFrame$Frost, breaks = c(-1, 30, 90, 190), include.lowest = TRUE, labels = c("low", "intermediate", "high"))
myDataFrame$frost_cat <- factor(x)
rownames(myDataFrame[myDataFrame$frost_cat == "low",])


