set.seed(655)

dimensao <- 194
lambda <- 0.18
ponto <- 15

x <- rexp(dimensao, lambda)
fn <- ecdf(x)

valor_p <- 1 - fn(ponto)
valor_t <- 1 - pexp(ponto, lambda)

print(round(abs(valor_p - valor_t), 6))
