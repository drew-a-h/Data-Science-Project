library(ggplot2)
ggplot(data = Pokemon) + geom_point(mapping = aes(x=sp_defense, y=sp_attack, color = is_legendary))