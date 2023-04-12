combine_datasets <- function(files) {
  data_list <- list()
  
  for (i in 1:length(csv_files)) {
    data <- read.csv(csv_files[i], header = TRUE)
    data$Source <- i
    data_list[[i]] <- data
  }
  
  combined_data <- do.call(rbind, data_list)
  
  return(combined_data)
}

csv_files <- c("2023-03-23_PhysiologicalCycles.csv", "physiological_cycles_1.csv")
combined_data <- combine_datasets(csv_files)

library(ggplot2)

ggplot(combined_data, aes(x = Heart.rate.variability..ms., y = after_stat(density))) +
  geom_histogram(data = subset(combined_data, Source == 1), aes(fill = "Source 1"),alpha = 0.5) +
  geom_histogram(data = subset(combined_data, Source == 2), aes(fill = "Source 2"), alpha = 0.5) +
  scale_fill_manual(values = c("blue", "red"))