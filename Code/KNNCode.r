nPoints <- 800
samplingRate <- .7
numTestSetLabels <- nPoints * (1-samplingRate)
training <- sample(1:nPoints, samplingRate * nPoints, replace = FALSE)
train <- subset(data[training, ], select = c(percent_male, base_egg_steps)
testing <- setdiff(1:nPoints, training)
test <- subset(data[testing, ] select = c(percent_male, base_egg_steps)
cl <- pokemonNonBinary$is_legendary[training]
trueLabels <- pokemonNonBinary$is_legendary[testing]
for ( k in 1:20)
	{
		print(k)
		predictedLabels <- knn(train, test, cl, k)
		numIncorrectLabels <- sum(predictedLabels != trueLabels)
		misclassificationRate <- numIncorrectLabels / numTestSetLabels
		print(misclassificationRate)
	}