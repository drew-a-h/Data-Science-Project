setwd("~/Tntech/Spring 2020/Fundimentals/Project")
PokemonMaster = read.csv("pokemon.csv")
Pokemon = PokemonMaster
PokemonNormal = subset(Pokemon, Pokemon$is_legendary == 0)
PokemonLegendary = subset(Pokemon, Pokemon$is_legendary == 1)

