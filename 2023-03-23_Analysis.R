library('tidyverse')
library('skimr')
library('ggplot2')
library('corrplot')

physCycles <- read.csv("2023-03-23_PhysiologicalCycles.csv", header=TRUE)
head(physCycles)

numerical_data <- physCycles[, c(4:12, 15:25)]

names(numerical_data) <- c("Recovery Score", "Resting Heart Rate", "Heart Rate Variability", "Skin Temp", "Blood Oxygen", "Day Strain", "Calories Burned", "Max Heart Rate", "Average Heart Rate", "Sleep Performance", "Respiratory Rate", "Asleep Duration", "In Bed Duration", "Light Sleep Duration", "Deep Sleep Duration", "REM Duration", "Awake Duration", "Sleep Need", "Sleep Debt", "Sleep Efficiency")

correlation <- round(cor(numerical_data, use = "complete.obs"),2)

png("PhysCycleCorrelationPlot.png", res=300, width=1000, height=1000)

corrplot(
  correlation,
  method = "color",
  order = "FPC",
  type="full",
  diag=TRUE,
  tl.srt=45,
  tl.col="black",
  tl.cex = 0.2,
  cl.cex = 0.4,
  sig.level = 0.15,
  addCoef.col = "black",
  number.digits = 2,
  number.cex = 0.2
)

dev.off()
