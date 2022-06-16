library(tidyverse)
library(ggpattern)
library(colorspace)
library(ggrepel)


contribucion_tbl <- read_csv("./data/Contribucion.csv")

ggplot(contribucion_tbl, aes(x="", y = N, pattern_angle = Weringa_taxonomy))+
  geom_bar_pattern(
    aes(pattern_type = Weringa_taxonomy, pattern_fill = Weringa_taxonomy),
    pattern                  = 'magick',
    pattern_scale            = 2,
    width                    = 1,
    stat                     = "identity",
    fill                     = 'white',
    colour                   = 'black',
    pattern_aspect_ratio     = 1,
    pattern_density          = 0.3
  ) +

  theme_void(20) +
  theme(legend.key.size = unit(0.75, 'cm')) +
  scale_pattern_type_discrete(choices = gridpattern::names_magick_stripe) +
  scale_fill_brewer(palette = "Pastel1") +
  geom_text(aes(label = paste0(N, "%")), position = position_stack(vjust = 0.5)) +
  coord_polar(theta="y", start=0) +
  labs(
    title    = "ggpattern::geom_bar_pattern()",
    subtitle = "pattern='magick'"
  )

pie + coord_polar(theta = "y", start=0)


# geom_bar_pattern(stat= "identity", position = position_dodge(preserve = "Weringa_taxonomy"),
#                  color = "black",
#                  pattern= 'stripe',
#                  pattern_fill = "black",
#                  pattern_angle = 45,
#                  pattern_density = 0.1,
#                  pattern_spacing = 0.025,
#                  pattern_key_scale_factor = 0.6) +
