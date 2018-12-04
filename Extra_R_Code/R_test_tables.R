
testTable <- function(x, y){
  freq <- table(x, y)
  res <- chisq.test(freq)
  nceldas <- prod(dim(freq))
  if (sum(res$expected < 5) > nceldas*0.2)
    res <- fisher.test(freq)
  res
}

testTable(partoFin$sexo, partoFin$tx) # cumple condiciones -> Chi
testTable(partoFin$sexo, partoFin$tip_par) # no cumple -> Fisher
