library(ggplot2)
library(readxl)

dados <- read_excel("Utentes.xlsx", range = "A1:D77")

dados |>
	ggplot(aes(Idade, Colesterol)) +
	geom_point() + geom_smooth() +
	labs(x = "Idade", y = "Colesterol")
