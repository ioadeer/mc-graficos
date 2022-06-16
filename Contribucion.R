library(tidyverse)


contribucion_tbl <- read_csv("./data/Contribucion.csv")

pie <- ggplot(contribucion_tbl, aes(x = "", y=N, pattern = factor(Weringa_taxonomy),
                                    fill = factor(Weringa_taxonomy))) +
  geom_bar(width = 1, stat = "identity") +
  theme(axis.line = element_blank(),
        plot.title = element_text(hjust=0.5)) +
  labs(fill="Taxonomía de Weringa",
       x=NULL,
       y=NULL,
       title="",
       caption="Tipo de aporte de acuerdo a taxonomía propuesta por Weringa") +
  geom_text(aes(label = paste0(N, "%")), position = position_stack(vjust=0.5)) +
  theme_classic() +
  theme(axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank()) +
  scale_fill_brewer(palette="Pastel1")

pie + coord_polar(theta = "y", start=0)


