# Make sure to have used the load.R program to get the names right
boxplot(PokemonLegendary$capture_rate, PokemonNormal$capture_rate,col=c("Gold", "Purple"),main="Boxplot Comparisons(Capture Rate)",names=c("Legendary","Normal"),las = 2, horizontal =TRUE)
