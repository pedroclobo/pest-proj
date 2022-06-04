library(dplyr)
library(ggplot2)
library(readxl)
library(tidyr)

anos <- read_excel("EsperancaVida.xlsx", range = "A9:A70")
paises <- c("ES - Espanha", "PT - Portugal", "IT - Itália")

processa_dados <- function(excel_range, sexo) {
	return(read_excel("EsperancaVida.xlsx", range = excel_range) |>
		select(all_of(paises)) |> mutate(anos) |> rename(Ano = 4) |>
		subset(Ano %in% 2002:2019) |> cbind(Sexo = sexo) |>
		pivot_longer(all_of(paises), names_to = "País", values_to = "Valor"))
}

processa_dados("AJ9:BQ70", "Masculino") |>
	rbind(processa_dados("BR9:CY70", "Feminino")) |>
	ggplot(aes(Ano, Valor, color = País, shape = Sexo)) + geom_point() +
	labs(x = "Ano", y = "Esperança de vida à nascença [anos]")
