# 5.d
p_dec <- read.table("C:\\Users\\antonisk\\Desktop\\DAMA\\DAMA51\\DAMA51 - 5th Assignment\\Tennis.csv", header = TRUE, sep = ",")
p_dec

install.packages('data.tree')
library('data.tree')

# Define the ID3 algorithm
IsPure <- function(data) {
  length(unique(data[, ncol(data)])) == 1
}

Entropy <- function(vls) {
  res <- vls / sum(vls) * log2(vls / sum(vls))
  res[vls == 0] <- 0
  -sum(res)
}

InformationGain <- function(tble) {
  tble <- as.data.frame.matrix(tble)
  entropyBefore <- Entropy(colSums(tble))
  s <- rowSums(tble)
  entropyAfter <- sum(s / sum(s) * apply(tble, MARGIN = 1, FUN = Entropy))
  informationGain <- entropyBefore - entropyAfter
  return(informationGain)
}

TrID3 <- function(node, data) {
  node$obsCount <- nrow(data)
  
  if (IsPure(data)) {
    child <- node$AddChild(unique(data[, ncol(data)]))
    node$feature <- tail(names(data), 1)
    child$obsCount <- nrow(data)
    child$feature <- ''
  } else {
    ig <- sapply(
      colnames(data)[-ncol(data)],
      function(x) InformationGain(table(data[, x], data[, ncol(data)]))
    )
    feature <- names(ig)[ig == max(ig)][1]
    node$feature <- feature
    childObs <- split(data[, !(names(data) %in% feature)], data[, feature], drop = TRUE)
    for (i in 1:length(childObs)) {
      child <- node$AddChild(names(childObs)[i])
      TrID3(child, childObs[[i]])
    }
  }
}

# Create the root node and build the decision tree
root <- Node$new("Root")
TrID3(root, p_dec)

# Print the decision tree
print(root, "feature", "obsCount")
      