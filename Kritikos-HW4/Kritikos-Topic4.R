# 4.a
europe_diet_og <- read.csv("C:\\Users\\antonisk\\Desktop\\DAMA\\DAMA51\\DAMA51 - 4th Assignment\\europe_diet.csv")
europe_diet <- read.csv("C:\\Users\\antonisk\\Desktop\\DAMA\\DAMA51\\DAMA51 - 4th Assignment\\europe_diet.csv")

rownames(europe_diet) <- europe_diet$X

europe_diet_og
europe_diet$X <- NULL
europe_diet

# 4.b
greece_row <- europe_diet["Greece", ]
spain_row <- europe_diet["Spain", ]
belgium_row <- europe_diet["Belgium", ]
finland_row <- europe_diet["Finland", ]

distances_to_greece <- sqrt(sum((spain_row - greece_row)^2))
distances_to_belgium <- sqrt(sum((belgium_row - greece_row)^2))
distances_to_finland <- sqrt(sum((finland_row - greece_row)^2))

distances_table <- data.frame(Euclidean_distance = c(distances_to_greece, distances_to_belgium, distances_to_finland),
                              row.names = c("Spain", "Belgium", "Finland"))
distances_table


# 4.c
hc_complete <- hclust(dist_matrix, method = "complete")
hc_single <- hclust(dist_matrix, method = "single")

plot(hc_complete, main = "Hierarchical Clustering with Complete Linkage")
plot(hc_single, main = "Hierarchical Clustering with Single Linkage")

#4.d
clusters_complete <- cutree(hc_complete, k = 7)

switzerland_cluster <- clusters_complete["Switzerland"]
norway_cluster <- clusters_complete["Norway"]

countries_switzerland_cluster <- names(clusters_complete[clusters_complete == switzerland_cluster])
countries_norway_cluster <- names(clusters_complete[clusters_complete == norway_cluster])

cat("Switzerland: ", countries_switzerland_cluster, "\n")
cat("Norway: ", countries_norway_cluster, "\n")

#4.e
max_k <- 1
for (k in 1:length(europe_diet)) {
  clusters <- cutree(hc_complete, k = k)
  if (clusters["Greece"] == clusters["Cyprus"]) {
    max_k <- k
  } else {
    break
  }
}
max_k
