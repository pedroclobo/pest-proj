set.seed(139)
dimensao <- 1249
lambda <- 3.58
confianca <- 0.91
m <- 1250

amplitudes <- c()

for (i in seq(m)) {
	amostra <- rexp(dimensao, lambda)
	media <- mean(amostra)
	b <- qnorm((1 + confianca)/2)
	amplitude <- (2/media) * (b/sqrt(dimensao))
	amplitudes <- c(amplitudes, amplitude)
}

print(round(mean(amplitudes), 6))
