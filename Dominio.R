library(tidyverse)

dominio_tbl <- read_csv("./data/Dominio.csv")

pie2 <- ggplot(dominio_tbl, aes(x = "", y=N, fill = factor(Dominio))) + 
  geom_bar(width = 1, stat = "identity") +
  theme(axis.line = element_blank(), 
        plot.title = element_text(hjust=0.5)) + 
  labs(fill="Dominio", 
       x=NULL, 
       y=NULL, 
       title="", 
       caption="") +
  geom_text(aes(label = paste0(N, "%")), position = position_stack(vjust=0.5), check_overlap = 'clip') +
  theme_classic() +
  theme(axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank()) +
  scale_fill_brewer(palette="Pastel1")

pie2 + coord_polar(theta = "y", start=0)

