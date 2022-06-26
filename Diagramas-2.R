library(tidyverse)

diagram_tbl <- read_csv("./data/Diagramas-1.csv")

dia_2 <- diagram_tbl %>%
   mutate(DiagramaClase= case_when(
    UML == 1 ~ "UML",
    UML == 0 ~ "No UML"
  ))
#%>%
 # group_by(DiagramaClase)

dia_3 <- dia_2 %>% 
  group_by(DiagramaClase)  %>% 
  summarise(Ntot = sum(N))

diagram_tbl %>%
#  filter(Tipo != "Pseudocódigo") %>%
#  filter(Tipo != "Diagrama Libre") %>%
  mutate(DiagramaClase= case_when(
    UML == 1 ~ "UML",
    UML == 0 ~ "No UML"
  )) %>%
  group_by(UML)  %>%
  ggplot(aes(x = DiagramaClase,
             y = N)) +
 # scale_x_discrete(labels= c("No UML","UML")) +
  geom_col(colour = "black",
           fill = "#FFFFFF") +
  labs(x= "",
       y= "Aparaciones en literatura",
       title="") +

#  coord_flip(clip = 'off')+
  theme_minimal()

dia_3 <- dia_2 %>% 
  group_by(DiagramaClase)  %>% 
  summarise(Ntot = sum(N))


dia_3 %>%
  mutate(pct = Ntot/sum(Ntot)) %>%
  ggplot(aes(x = DiagramaClase,
             y = Ntot, label = scales::percent(pct))) +
  # scale_x_discrete(labels= c("No UML","UML")) +
  geom_col(colour = "black",
           fill = "#FFFFFF") +
  geom_text(
    #  aes(label = paste0(Percentage)),
    position = position_stack(vjust=0.5),
    #nudge_x = 1.01,
    check_overlap = 'clip') +
  labs(x= "",
       y= "Aparaciones en literatura",
       title="") +
  #  coord_flip(clip = 'off')+
  theme_minimal()
