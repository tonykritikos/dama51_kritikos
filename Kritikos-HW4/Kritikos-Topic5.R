# 5.a
library(arules)
appstrans <- read.transactions("C:\\Users\\antonisk\\Desktop\\DAMA\\DAMA51\\DAMA51 - 4th Assignment\\application_data.csv", format = "basket", sep = ",", rm.duplicates = FALSE)

apps <- unique(itemLabels(appstrans))
apps


#5.b
library(arules)

num_apps <- colSums(as(appstrans, "matrix"))

result <- data.frame(Number_of_applications_per_student = 1:max(num_apps),
                     Number_of_students = tabulate(num_apps))

print(result)

#5.c
item_freq <- itemFrequency(appstrans)

item_freq_sorted <- sort(item_freq, decreasing = TRUE)

top10_apps <- head(item_freq_sorted, 10)

itemFrequencyPlot(appstrans, topN = 10, type = "relative", main = "Top 10 Applications by Relative Frequency")

#5.d
rules <- apriori(appstrans, parameter = list(support = 0.25, confidence = 0.8, minlen = 2))

rules_df <- as(rules, "data.frame")
rules_df <- rules_df[order(rules_df[, "support"]), ]
antecedents <- as.character(rules_df$support)

item_list <- lapply(antecedents, function(x) unlist(strsplit(x, ", ")))

item_list <- as.list(unique(unlist(item_list)))

print(rules_df)

#5.e
instagram_rules <- subset(rules, rhs(rules) %in% "Instagram")

antecedents <- as(instagram_rules@lhs, "list")

unique_antecedent_apps <- unique(unlist(antecedents))
unique_antecedent_apps


#5.f
library(arulesViz)

plot(rules, method = "paracoord", control = list(alpha = 0.5))

highlight <- subset(rules, rhs(rules) %in% "Instagram")
plot(rules, method = "paracoord", control = list(alpha = 0.5), shading = "confidence", highlight = highlight)
