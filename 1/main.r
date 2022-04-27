library(readxl)
library(ggplot2)
library(tidyr)

dados <- read_excel("ResiduosPerCapita.xlsx", col_names = FALSE, range = "A13:C43")
names(dados) <- c("País", "2004", "2018")

dados |>
    subset(País %in% c("PT - Portugal", "NL - Países Baixos", "UK - Reino Unido")) |>
    pivot_longer(c(`2004`, `2018`), names_to = "Ano", values_to = "Valor") |>
    ggplot(aes(x = País, y = Valor, fill = Ano)) +
	geom_bar(stat = "identity", position = "dodge") +
    labs(x = "País", y = "Produção de resíduos per capita (t)")
