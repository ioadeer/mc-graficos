library(tidyverse)
library(plotly)
library(ggpattern)
library(colorspace)
library(ggrepel)

dominio_tbl <- read_csv("./data/Dominio.csv")

dominio_tbl <- dominio_tbl %>%
  #  group_by(Weringa_taxonomy) %>%
  mutate(Ntot = sum(N))

dominio_tbl <- dominio_tbl %>%
  #  group_by(Weringa_taxonomy) %>%
  mutate(Percentage = N/Ntot)

dominio_tbl %>%
  arrange(desc(N)) %>%
  #slice_head(n = 10) %>%
  ggplot(aes(x = reorder(Dominio,N),
             y = N, label = scales::percent(Percentage))) +
  geom_col(colour = "black",
           fill = "#FFFFFF") +
  geom_text(
 #  aes(label = paste0(Percentage)),
    #position = position_stack(vjust=0.5),
    nudge_y = 1.01,
    check_overlap = 'clip') +
  labs(x= "",
       y= "",
       title="") +
  coord_flip(clip = 'off')+
  theme_minimal()

#paste0(format(round(N/Ntot*100,2)))