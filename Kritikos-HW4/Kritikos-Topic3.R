# 3.a
library(cluster)
library(factoextra)

seeds <- read.csv("C:\\Users\\antonisk\\Desktop\\DAMA\\DAMA51\\DAMA51 - 4th Assignment\\seeds_dataset.csv", header = TRUE)
seeds_scaled <- scale(seeds[, -c(1, 8)])  # Excluding seeID and seedType columns

set.seed(123)
kmeans_result <- kmeans(seeds_scaled, centers = 3)

perimeter_centroids <- kmeans_result$centers[, "perimeter"]
perimeter_centroids[1]
perimeter_centroids[2]
perimeter_centroids[3]

row_9_cluster <- kmeans_result$cluster[9]
row_9_cluster
row_55_cluster <- kmeans_result$cluster[55]
row_55_cluster
row_189_cluster <- kmeans_result$cluster[189]
row_189_cluster

dist_12 <- sqrt(sum((kmeans_result$centers[1, "perimeter"] - kmeans_result$centers[2, "perimeter"])^2))
dist_12
dist_13 <- sqrt(sum((kmeans_result$centers[1, "perimeter"] - kmeans_result$centers[3, "perimeter"])^2))
dist_13
dist_23 <- sqrt(sum((kmeans_result$centers[2, "perimeter"] - kmeans_result$centers[3, "perimeter"])^2))
dist_23

#3.b
cluster_assignments <- kmeans_result$cluster

cluster_assignments[cluster_assignments == 1] <- 2
cluster_assignments[cluster_assignments == 2] <- 1

confusion <- table(cluster_assignments, seeds$seedType)

false_assignments <- sum(confusion[1, -1])

accuracy <- sum(diag(confusion)) / sum(confusion)

precision_cluster_1 <- confusion[2, 2] / sum(confusion[2, 2:3])
precision_cluster_1
recall_cluster_1 <- confusion[2, 2] / sum(confusion[2:3, 2])
recall_cluster_1
confusion

# 3.c
kmeans_clusters_3 <- kmeans(seeds_scaled[, -c(1, ncol(seeds_scaled))], centers = 3, nstart = 25)
silhouette_avg_3 <- silhouette(kmeans_clusters_3$cluster, dist(seeds_scaled[, -c(1, ncol(seeds_scaled))]))

kmeans_clusters_4 <- kmeans(seeds_scaled[, -c(1, ncol(seeds_scaled))], centers = 4, nstart = 25)
silhouette_avg_4 <- silhouette(kmeans_clusters_4$cluster, dist(seeds_scaled[, -c(1, ncol(seeds_scaled))]))

avg_silhouette_3 <- mean(silhouette_avg_3[, "sil_width"])
avg_silhouette_3
avg_silhouette_4 <- mean(silhouette_avg_4[, "sil_width"])
avg_silhouette_4

fviz_cluster(kmeans_clusters_3, data = seeds_scaled[, -c(1, ncol(seeds_scaled))],
             ellipse.type = "norm", geom = "point", pointsize = 2, title = "K-Means Clustering (k=3)")

fviz_cluster(kmeans_clusters_4, data = seeds_scaled[, -c(1, ncol(seeds_scaled))],
             ellipse.type = "norm", geom = "point", pointsize = 2, title = "K-Means Clustering (k=4)")
