library(dplyr)
library(ggplot2)
library(readxl)
library(tidyr)

anos <- read_excel("EsperancaVida.xlsx", range = "A9:A70")
paises <- c("ES - Espanha", "PT - Portugal", "IT - Itália")

process_data <- function(excel_range, sexo) {
	return(read_excel("EsperancaVida.xlsx", range = excel_range) |>
		select(all_of(paises)) |> mutate(anos) |> rename(Ano = 4) |>
		subset(Ano %in% 2002:2019) |> cbind(Sexo = sexo) |>
		pivot_longer(all_of(paises), names_to = "País", values_to = "Valor"))
}

process_data("AJ9:BQ70", "Masculino") |>
	rbind(process_data("BR9:CY70", "Feminino")) |>
	ggplot(aes(x = as.factor(Ano), y = Valor, color = País, shape = Sexo)) +
	geom_point() +
	labs(x = "Ano", y = "Esperança de vida à nascença (anos)")
