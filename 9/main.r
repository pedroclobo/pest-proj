set.seed(391)
dimensao <- 1025
lambda <- 1.3
confianca <- 0.98

amplitudes <- data.frame()

for (i in seq(1350)) {
    amostra <- rexp(dimensao, lambda)
    media <- mean(amostra)
    b <- qnorm((1 + confianca)/2)
    amplitude <- 2 * ((b * media)/sqrt(dimensao))
    amplitudes <- rbind(amplitudes, amplitude)
}

print(mean(amplitudes[, 1]))
