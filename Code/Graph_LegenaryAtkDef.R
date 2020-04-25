library(ggplot2)
ggplot(data = Pokemon) + geom_point(mapping = aes(x=defense, y=attack, color = is_legendary))