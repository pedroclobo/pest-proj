set.seed(970)
dimensao <- 131
m <- 1425
n <- 6
p <- 0.18
vesp <- n * p

medias <- c()

for (i in seq(1425)) {
	medias <- c(medias, mean(rbinom(dimensao, n, p)))
}

print(round(abs(mean(medias) - vesp), 6))
