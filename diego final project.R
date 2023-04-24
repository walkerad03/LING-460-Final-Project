
sleep <- read.csv("/Users/diegolopezrecio/Documents/BIG DATA/FINAL PROJECT/sleep.csv")
View (sleep)

summary (sleep)
head (sleep )
typeof(sleep)
as.numeric (sleep)





library(ggplot2)
library(dplyr)


# Convert "Cycle.start.time" to date format
sleep$Cycle.start.time <- as.Date(sleep$Cycle.start.time)

# Filter the lines without any data 
sleep_filtered <- sleep[!is.na(sleep$Resting.heart.rate..bpm.),]


# Graphic for the evolution of the resting heart rate over time
ggplot(sleep_filtered, aes(x = Cycle.start.time, y = Resting.heart.rate..bpm.)) +
  geom_line() +
  geom_point() +
  theme_minimal() +
  labs(
    title = "Resting heart rate over time",
    x = "Dates",
    y = "Resting heart rate (bpm)"
  )

sleep_filtered <- sleep[!is.na(sleep$Asleep.duration..min.) & !is.na(sleep$Blood.oxygen..),]



# Evolution of Asleep time and In bed time

graphic_asleep_in_bed <- ggplot(sleep_filtered) +
  geom_line(aes(x = Cycle.start.time, y = Asleep.duration..min., color = "Asleep Duration (min)")) +
  geom_line(aes(x = Cycle.start.time, y = In.bed.duration..min., color = "In bed Duration (min)")) +
  theme_minimal() +
  labs(
    title = "Evolution of Asleep time and In bed time",
    x = "Date",
    y = "Value"
  ) +
  scale_color_manual(
    values = c("Asleep Duration (min)" = "blue", "In bed Duration (min)" = "red"),
    name = "Variable"
  )

ggsave("grafico.png", grafico, width = 15, height = 6, dpi = 300)
print(grafico)


# Evolution of Skin temperature and Blood oxygen (celsius)


head (sleep )
graphic_skintemp_blood_oxigen <- ggplot(sleep_filtered) +
  geom_line(aes(x = Cycle.start.time, y = Skin.temp..celsius., color = "Skin temperature")) +
  geom_line(aes(x = Cycle.start.time, y = Blood.oxygen.., color = "Blood oxygen")) +
  theme_minimal() +
  labs(
    title = "Evolution of Skin temperature and Blood oxygen",
    x = "Date",
    y = "Value"
  ) +
  scale_color_manual(
    values = c("Skin temperature" = "blue", "Blood oxygen" = "red"),
    name = "Variable"
  )

ggsave("grafico.png", graphic_skintemp_blood_oxigen , width = 15, height = 6, dpi = 300)
print(graphic_skintemp_blood_oxigen)


# Evolution of Skin temperature and Blood oxygen (fahrenheit)

sleep$Skin.temp..fahrenheit. <- sleep$Skin.temp..celsius. * (9/5) + 32
sleep_filtered <- sleep[!is.na(sleep$Asleep.duration..min.) & !is.na(sleep$In.bed.duration..min.),]
graphic_skintemp_blood_oxigen_fa <- ggplot(sleep_filtered) +
  geom_line(aes(x = Cycle.start.time, y = Skin.temp..fahrenheit., color = "Skin temperature")) +
  geom_line(aes(x = Cycle.start.time, y = Blood.oxygen.., color = "Blood oxygen")) +
  theme_minimal() +
  labs(
    title = "Evolution of Skin temperature and Blood oxygen",
    x = "Date",
    y = "Value"
  ) +
  scale_color_manual(
    values = c("Skin temperature" = "blue", "Blood oxygen" = "red"),
    name = "Variable"
  )

ggsave("grafico.png", graphic_skintemp_blood_oxigen_fa , width = 15, height = 6, dpi = 300)
print(graphic_skintemp_blood_oxigen_fa)


# Evolution of Asleep duration, In bed duration and Light sleep duration



sleep_filtered <- sleep[!is.na(sleep$Asleep.duration..min.) & !is.na(sleep$In.bed.duration..min.) & !is.na(sleep$Light.sleep.duration..min.),]
graphic_three <- ggplot(sleep_filtered) +
  geom_line(aes(x = Cycle.start.time, y = Asleep.duration..min., color = "Asleep duration (min)")) +
  geom_line(aes(x = Cycle.start.time, y = In.bed.duration..min., color = "In bed duration (min)")) +
  geom_line(aes(x = Cycle.start.time, y = Light.sleep.duration..min., color = "Light sleep duration (min)")) +
  theme_minimal() +
  labs(
    title = "Evolution of Asleep duration, In bed duration and Light sleep duration",
    x = "Date",
    y = "Value"
  ) +
  scale_color_manual(
    values = c("Asleep duration (min)" = "blue", "In bed duration (min)" = "red", "Light sleep duration (min)" = "green"),
    name = "Variable"
  )

ggsave("grafico.png", graphic_three , width = 15, height = 6, dpi = 300)
print(graphic_three)


# Evolution of Recovery score, Resting heart rate and heart rate variability


sleep_filtered <- sleep[!is.na(sleep$Recovery.score..) & !is.na(sleep$Resting.heart.rate..bpm.) & !is.na(sleep$Heart.rate.variability..ms.),]
graphic_four <- ggplot(sleep_filtered) +
  geom_line(aes(x = Cycle.start.time, y = Recovery.score.., color = "Recovery score")) +
  geom_line(aes(x = Cycle.start.time, y = Resting.heart.rate..bpm., color = "Resting heart rate")) +
  geom_line(aes(x = Cycle.start.time, y = Heart.rate.variability..ms., color = "Heart rate variablity")) +
  theme_minimal() +
  labs(
    title = "Evolution of Recovery score, Resting heart rate and heart rate variability",
    x = "Date",
    y = "Value"
  ) +
  scale_color_manual(
    values = c("Recovery score" = "blue", "Resting heart rate" = "red", "Heart rate variablity" = "green"),
    name = "Variable"
  )

ggsave("grafico.png", graphic_four , width = 15, height = 6, dpi = 300)
print(graphic_four)



# Evolution over time of Heart rate, Skin temperature and Blood oxygen


sleep_filtered <- sleep[!is.na(sleep$Heart.rate.variability..ms.) & !is.na(sleep$Skin.temp..celsius.) & !is.na(sleep$Blood.oxygen..),]
graphic_five <- ggplot(sleep_filtered) +
  geom_line(aes(x = Cycle.start.time, y = Heart.rate.variability..ms., color = "Heart rate")) +
  geom_line(aes(x = Cycle.start.time, y = Skin.temp..celsius., color = "Skin temperature")) +
  geom_line(aes(x = Cycle.start.time, y = Blood.oxygen.., color = "Blood oxygen")) +
  theme_minimal() +
  labs(
    title = "Evolution of Heart rate, Skin temperature and Blood oxygen",
    x = "Date",
    y = "Value"
  ) +
  scale_color_manual(
    values = c("Heart rate" = "blue", "Skin temperature" = "red", "Blood oxygen" = "green"),
    name = "Variable"
  )

ggsave("grafico.png", graphic_five , width = 15, height = 6, dpi = 300)
print(graphic_five)


# In the next section we are going to try to find correlations between different variables. 

# In our final project we try to determine the factors that may influence the sleep. 

#Pearson Correlation: measures the linear relationship between two continuous variables. The Pearson correlation coefficient 
#ranges from -1 to +1, -1 indicates a perfect negative linear relationship, +1 indicates a 
#perfect positive linear relationship, 0 indicates no linear relationship. Pearson correlation is sensitive to 
#outliers and assumes that both variables are normally distributed.

#Spearman Correlation: Calculates the correlation based on the ranks of the data rather than the actual values. Spearman's ranges from -1 to +1. This method is 
#less sensitive to outliers and does not require the assumption of normal distribution. It is suitable when dealing with ordinal data or when the relationship 
#between variables is not linear.

#Kendall Correlation:  It assesses the similarity in the orderings of the data when ranked by 
#each of the variables. Kendall's Tau ranges from -1 to +1 as well. It is less sensitive to outliers and is suitable for small sample sizes or ordinal data. 



# To calculate the correlations we define a function 

calculate_correlations <- function(dataframe, column_name) {
  x <- as.numeric(dataframe[[column_name]][!is.na(dataframe[[column_name]])])
  y <- dataframe$Sleep.performance..[!is.na(dataframe$Sleep.performance..)]
  
  # Remove rows with missing data
  valid_indices <- !is.na(x) & !is.na(y)
  x <- x[valid_indices]
  y <- y[valid_indices]
  
  # Correlations
  pearson_correlation <- cor(x, y, method = "pearson")
  spearman_correlation <- cor(x, y, method = "spearman")
  kendall_correlation <- cor(x, y, method = "kendall")
  
  # Results
  cat("Pearson correlation for", column_name, ":", pearson_correlation, "\n")
  cat("Spearman correlation for", column_name, ":", spearman_correlation, "\n")
  cat("Kendall correlation for", column_name, ":", kendall_correlation, "\n")
}

variable_list <- c("Recovery.score..", "Resting.heart.rate..bpm.", "Heart.rate.variability..ms.", "Day.Strain", "Energy.burned..cal.", "Average.HR..bpm.")

for (variable_name in variable_list) {
  calculate_correlations(sleep, variable_name)
  cat("\n")  
}


# Results


#Pearson correlation for Recovery.score.. : 0.2705701 
#Spearman correlation for Recovery.score.. : 0.2495144 
#Kendall correlation for Recovery.score.. : 0.171458 

#Pearson correlation for Resting.heart.rate..bpm. : -0.02053031 
#Spearman correlation for Resting.heart.rate..bpm. : 0.03336471 
#Kendall correlation for Resting.heart.rate..bpm. : 0.02348016 

#Pearson correlation for Heart.rate.variability..ms. : 0.04179044 
#Spearman correlation for Heart.rate.variability..ms. : 0.02112721 
#Kendall correlation for Heart.rate.variability..ms. : 0.01434093 

#Pearson correlation for Day.Strain : -0.2099666 
#Spearman correlation for Day.Strain : -0.2059227 
#Kendall correlation for Day.Strain : -0.1404817 

#Pearson correlation for Energy.burned..cal. : -0.2366182 
#Spearman correlation for Energy.burned..cal. : -0.23031 
#Kendall correlation for Energy.burned..cal. : -0.1563439 

#Pearson correlation for Average.HR..bpm. : -0.1696299 
#Spearman correlation for Average.HR..bpm. : -0.18477 
#Kendall correlation for Average.HR..bpm. : -0.1280305 


# We can see that in all cases the correlation is very weak 