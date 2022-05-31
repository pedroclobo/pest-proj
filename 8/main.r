set.seed(139)
dimensao <- 1249
lambda <- 3.58
confianca <- 0.91

amplitudes <- data.frame()

for (i in seq(1250)) {
    amostra <- rexp(dimensao, lambda)
    media <- mean(amostra)
    b <- qnorm((1 + confianca)/2)
    amplitude <- 2 * ((b * media)/sqrt(dimensao))
    amplitudes <- rbind(amplitudes, amplitude)
}

print(mean(amplitudes[, 1]))
