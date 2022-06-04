set.seed(391)
dimensao <- 1025
lambda <- 1.3
confianca <- 0.98
m <- 1350

amplitudes <- c()

for (i in seq(m)) {
	amostra <- rexp(dimensao, lambda)
	media <- mean(amostra)
	b <- qnorm((1 + confianca)/2)
	amplitude <- (2 / media) * (b / sqrt(dimensao))
	amplitudes <- c(amplitudes, amplitude)
}

print(round(mean(amplitudes), 6))
