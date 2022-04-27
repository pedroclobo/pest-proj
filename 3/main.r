library(dplyr)
library(ggplot2)
library(readxl)
library(tidyr)

dados <- read_excel("QualidadeARO3.xlsx", range = "A1:J8785", col_types = "numeric")
regioes <- c("Paio-Pires", "Restelo")

dados |>
	select(all_of(regioes)) |>
	pivot_longer(all_of(regioes), names_to = "Região", values_to = "Valor") |>
	ggplot(aes(x = Valor, fill = Região)) +
	geom_histogram(aes(y = ..density..)) +
	labs(x = expression("Observações horárias de níveis de ozono" ~ bold(µgm^-3)),
	     y = "Densidade")
