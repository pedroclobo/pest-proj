set.seed(970)
dimensao <- 131
m <- 1425
n <- 6
p <- 0.18
vesp <- n * p

amostras <- replicate(1425, rbinom(dimensao, n, p))
medias <- c()

for (i in seq(1425)) {
	medias <- c(medias, mean(amostras[,i]))
}

print(round(abs(mean(medias) - vesp), 6))
