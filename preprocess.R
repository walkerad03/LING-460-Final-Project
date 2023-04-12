data_block_1 <- read.csv("2023-03-23_PhysiologicalCycles.csv", header = TRUE)
data_block_2 <- read.csv("physiological_cycles_1.csv", header = TRUE)

source_col <- data.frame(Source = rep(1, nrow(data_block_1)))
data_block_1 <- cbind(data_block_1, source_col)

source_col_2 <- data.frame(Source = rep(2, nrow(data_block_2)))
data_block_2 <- cbind(data_block_2, source_col_2)

full_data <- rbind(data_block_1, data_block_2)

library(ggplot2)

ggplot(full_data, aes(x = Heart.rate.variability..ms., y = after_stat(density))) +
  geom_histogram(data = subset(full_data, Source == 1), aes(fill = "Source 1"),alpha = 0.5) +
  geom_histogram(data = subset(full_data, Source == 2), aes(fill = "Source 2"), alpha = 0.5) +
  scale_fill_manual(values = c("blue", "red"))
