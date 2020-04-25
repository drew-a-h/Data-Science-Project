library(dplyr)
Pokemon$percentage_male[is.na(Pokemon$percentage_male)] <- -1
workingDF <-Pokemon
workingDF <- select(workingDF, -starts_with("against", "type", "cla", "jap", "genera", "abil"))
