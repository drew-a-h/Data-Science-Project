setwd("C:/Users/elias/Desktop/Spring2020/CSC3220")
library(dplyr)
library(ggplot2)
library(modelr)

PokemonMaster = read.csv("Pokemon.csv")
pokemonNonBinary = PokemonMaster

pokemonNonBinary$capture_rate[774] <- 255
pokemonNonBinary$capture_rate[774]

pokemonNonBinary$percentage_male[is.na(pokemonNonBinary$percentage_male)] <- -1
workingDF <-pokemonNonBinary
workingDF <- select(workingDF,base_egg_steps, base_happiness, base_total, capture_rate,
                    experience_growth,
                    percentage_male, is_legendary, pokedex_number)
mod_linear <- lm(workingDF$is_legendary ~ workingDF$base_egg_steps 
                 + workingDF$base_happiness 
                 + workingDF$base_total 
                 + workingDF$capture_rate 
                 + workingDF$experience_growth 
                 + workingDF$percentage_male)

workingDF <- workingDF%>% add_predictions(mod_linear)

ggplot(workingDF, aes(workingDF$is_legendary, workingDF$pred)) +
  geom_point()


ctab.linearTest<-table(pred=workingDF$pred > 0.3, is_legendary=workingDF$is_legendary)
ctab.linearTest

sensitivity <-100 * (ctab.linearTest[2,2] /sum(ctab.linearTest[2,]))
sensitivity

specificity <- 100 * (ctab.linearTest[1,1] /sum(ctab.linearTest[1,]))
specificity

accuracy = 100 * ((ctab.linearTest[1,1] + ctab.linearTest[2,2])/nrow(workingDF))
accuracy

trainingSplit = nrow(train)/nrow(workingDF)
trainingSplit

testingSplit = nrow(test)/nrow(workingDF)
testingSplit

workingDF <- pokemonNonBinary
workingDF <- select(workingDF,base_egg_steps, base_happiness, base_total, capture_rate,
                    experience_growth,
                    percentage_male, is_legendary, pokedex_number)

train <- workingDF[workingDF$pokedex_number < 500,]
test <- workingDF[workingDF$pokedex_number >= 501,]

model_logit = glm(data = train, is_legendary~
                    base_egg_steps + 
                    #base_happiness + 
                    base_total + 
                    as.numeric(capture_rate) +
                    experience_growth +
                    percentage_male, family=binomial(link="logit"))

train$pred <-predict(model_logit, newdata = train, type = "response")
test$pred <- predict(model_logit, newdata = test, type = "response")

ggplot(train, aes(x = pred, color = is_legendary, linetype = as.logical(is_legendary))) + geom_density()


ctab.test<-table(pred=test$pred>0.2, is_legendary=test$is_legendary)

ctab.test

sensitivity <-100 * (ctab.test[2,2] /sum(ctab.test[2,]))
sensitivity

specificity <- 100 * (ctab.test[1,1] /sum(ctab.test[1,]))
specificity

accuracy = 100 * ((ctab.test[1,1] + ctab.test[2,2])/nrow(test))
accuracy

trainingSplit = nrow(train)/nrow(workingDF)
trainingSplit

testingSplit = nrow(test)/nrow(workingDF)
testingSplit