library(ggplot2)
library(readxl)

dados <- read_excel("Utentes.xlsx", range = "A1:D77")

dados |>
	ggplot(aes(x = Idade, y = Colesterol)) +
	geom_point() +
	labs(x = "Idade", y = "Colesterol")
