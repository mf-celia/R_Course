# Task 1
retinol <- read.delim("Data_for_exercises/retinol.txt")

# Task 2
par(mfrow=c(1,2))
hist(retinol$retplas, col="red", main="Histogram")
boxplot(retinol$retplas, col="blue", main="Boxplot")

# Task 3
par(mfrow=c(1,1))
plot(retinol$retdiet, retinol$retplas, main="Retinol",
     xlab="Diet retinol", ylab="Plama retinol")

# Task 4
mod <- lm(retplas ~ retdiet, data=retinol)
plot(retinol$retdiet, retinol$retplas, main="Retinol",
     xlab="Diet retinol", ylab="Plama retinol", pch=21,
     col="darkblue", bg="lightblue")
abline(mod, lwd=2, col="red")

# Task 5
resids <- resid(mod)
qqnorm(resids, pch=21, col="darkred", bg="tomato")
qqline(resids, col="gray30", lty=2)

# Task 6
coplot(retinol$retdiet ~ retinol$retplas | retinol$fumador,
       xlab="Diet retinol", ylab="Plama retinol", pch=21,
       col="darkblue", bg="lightblue")

# Task 7
library(lattice)
xyplot(retinol$retdiet ~ retinol$retplas | retinol$sexo)

# Task 8
y <- retinol$calorias
hist(y, freq = FALSE)
x <- seq(0, max(y), length=100)
lines(x, dnorm(x, mean(y), sd(y)), col="darkgreen", lwd=2)

# Task 9
par(mfrow=c(2,1))
hist(retinol$calorias[retinol$sexo=="Mujer"], main="Mujer", xlab="")
hist(retinol$calorias[retinol$sexo=="Hombre"], main="Hombre", xlab="")
