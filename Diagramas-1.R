library(tidyverse)

diagram_tbl <- read_csv("./data/Diagramas-1.csv")

diagram_tbl %>%
  filter(Tipo != "Pseudocódigo") %>%
  filter(Tipo != "Diagrama Libre") %>%
  arrange(desc(N)) %>%
  slice_head(n = 10) %>%
  ggplot(aes(x = reorder(Tipo,N),
             y = N)) +
  geom_col(colour = "black",
           fill = "#FFFFFF") +
  labs(x= "Diagrama",
       y= "",
       title="Diagramas más utilizados") +
  coord_flip(clip = 'off')+
  theme_minimal()
