library(tidyverse)
library(plotly)


contribucion_tbl <- read_csv("./data/Contribucion.csv")

p <- ggplot(contribucion_tbl, aes(x="", y = N, pattern = Weringa_taxonomy, 
                                  pattern_angle = Weringa_taxonomy))+
  geom_bar_pattern(
    width                = 1, 
    stat                 = "identity", 
    fill                 = 'white', 
    colour               = 'black',
    pattern_aspect_ratio = 1, 
    pattern_density      = 0.3
  ) +
  coord_polar("y", start=0) + 
  theme_void(20) + 
  #geom_text(aes(label = paste0(N, "%")), position = position_stack(vjust = 0.5)) +
  geom_label_repel(data = contribucion_tbl, position = position_stack(vjust = 0.55),
                   aes(label = paste0(N, "%"),
                   size = 4.5), show.legend = FALSE) +
  theme(
    legend.key.size = unit(0.75, 'cm')
  ) + 
  labs(title= "Weringa", fill="Taxonomia de Weringa")

p
