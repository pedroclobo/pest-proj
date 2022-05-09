set.seed(655)

x <- rexp(194, 0.18)
dados <- data.frame(x)
fn <- ecdf(x)

valor_p <- 1 - fn(15)
valor_t <- 1 - pexp(15, 0.18)

print(abs(valor_p - valor_t))
