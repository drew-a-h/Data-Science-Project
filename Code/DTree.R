library(party)
set.seed(86487)
ind <- sample(2,nrow(Pokemon), replace=TRUE, prob=c(0.6,0.4))
trainData <- Pokemon[ind==1,]
testData <- Pokemon[ind==2,]
myFormula <- is_legendary ~ attack + base_egg_steps + base_happiness + base_total + capture_rate + defense + experience_growth + height_m +hp +percentage_male + sp_attack + sp_defense + speed + weight_kg

train_predict <- predict(pokemon_ctree,trainData,type="response")
table(train_predict,trainData$is_legendary)
plot(pokemon_ctree)
