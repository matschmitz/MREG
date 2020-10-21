if (!require("pacman")) install.packages("pacman")
pacman::p_load(shiny, ggplot2, data.table, plotly, tidyr, magrittr)

# APA theme (for plots)
apatheme <- theme_bw() + theme(panel.grid.major = element_blank(),
                               panel.grid.minor = element_blank(),
                               panel.border     = element_blank(),
                               axis.line        = element_line(),
                               text             = element_text(size = 17, family = "serif"))

blue <- "#4472C4"
green <- "#548235"
red <- "#C55A11"
redblood <- "#C00000"
grey <- "#BEBEBE"

