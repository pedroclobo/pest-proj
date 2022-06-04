set.seed(970)
dimensao <- 131

medias <- data.frame()

for (i in seq(1430)) {
	medias <- rbind(medias, c(mean(rbinom(dimensao, 6, 0.18))))
}

print(abs(mean(medias[, 1]) - 6 * 0.18))
