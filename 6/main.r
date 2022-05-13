library(ggplot2)

set.seed(1836)
vesp <- (19 + 15)/2
var <- (19 - 15)^2/12

grafico <- function(dimensao) {
	medias <- data.frame()

	for (i in seq(1430)) {
		medias <- rbind(medias, c(mean(runif(dimensao, 15, 19))))
	}

	return(ggplot(medias, aes(x = medias[, 1])) +
	       geom_histogram(aes(y = ..density..), fill = "#F8766C", color = "white") +
	       geom_function(fun = dnorm, args = list(mean = vesp, sd = sqrt(var/dimensao)),
	                     color = "#00BEC4", size = 1.5) +
	       labs(x = paste("Médias das amostras de dimensão", dimensao), y = "Densidade"))
}

for (dimensao in c(3, 28, 54)) {
	print(grafico(dimensao))
}
