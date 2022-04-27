library(dplyr)
library(ggplot2)
library(readxl)
library(tidyr)

anos <- read_excel("EsperancaVida.xlsx", range = "A9:A70")
paises <- c("ES - Espanha", "PT - Portugal", "IT - Itália")

homens <- read_excel("EsperancaVida.xlsx", range = "AJ9:BQ70") |>
	select(all_of(paises)) |> mutate(anos) |> rename(Ano = 4) |>
	subset(Ano %in% 2002:2019) |> cbind(Sexo = "Masculino") |>
	pivot_longer(all_of(paises), names_to = "País", values_to = "Valor")

mulheres <- read_excel("EsperancaVida.xlsx", range = "BR9:CY70") |>
	select(all_of(paises)) |> mutate(anos) |> rename(Ano = 4) |>
	subset(Ano %in% 2002:2019) |> cbind(Sexo = "Feminino") |>
	pivot_longer(all_of(paises), names_to = "País", values_to = "Valor")

homens |>
	rbind(mulheres) |>
	ggplot(aes(x = Ano, y = Valor, color = País, shape = Sexo)) +
	geom_point() +
	labs(x = "Ano", y = "Esperança de vida à nascença (anos)")
