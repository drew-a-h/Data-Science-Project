library(ggplot2)
ggplot(data = Pokemon) + geom_point(mapping = aes(x=weight_kg, y=height_m, color = is_legendary))