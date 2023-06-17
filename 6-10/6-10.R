# Projeto de PE: 6-10

benford_dist <- function(x) {
  return(log10(1 + 1/x))
}

b1 <- benford_dist(1)
b6 <- benford_dist(6)

b <- b1 + b6
# Probabilidade de 1º algarismo = (1 || 6) é b1+b6 = 0.3679768

# Potências de 2 que começem em 1 ou 6 entre 2^10 e 2^20

fr6.2 <- 5/11

ans <- round(abs(b - fr6.2), 4)

#ans <- round(ans, 4)