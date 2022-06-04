library(ggplot2)
set.seed(797)

amplitude_ic <- function(amostra, dimensao) {
	b <- qnorm((1 + 0.94)/2)
	amplitude <- (2/mean(amostra)) * (b/sqrt(dimensao))
}

dados <- data.frame(n = numeric(), Valor = numeric(), Tipo = character())

for (dimensao in seq(100, 2500, by = 100)) {
	amostra <- replicate(n = 900, rexp(dimensao, 1.66))
	amostra_c <- data.frame(amostra)
	contaminacao <- replicate(n = 900, rexp(dimensao * 0.2, 0.01))
	amostra_c[seq(1, dimensao * 0.2), seq(1, 900)] <- contaminacao

	amplitudes <- amplitudes_c <- c()
	for (i in seq(1, 900)) {
		amplitudes <- c(amplitudes, amplitude_ic(amostra[, i], dimensao))
		amplitudes_c <- c(amplitudes_c, amplitude_ic(amostra_c[, i], dimensao))
	}

	dados[nrow(dados) + 1, ] <- list(dimensao, mean(amplitudes), "Não contaminada")
	dados[nrow(dados) + 1, ] <- list(dimensao, mean(amplitudes_c), "Contaminada")
}

ggplot(dados, aes(n, Valor, color = Tipo)) + geom_point() +
	labs(x = "Dimensão da amostra", y = "Médias das amplitudes dos IC")
