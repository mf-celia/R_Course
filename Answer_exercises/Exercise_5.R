# Task 1
retinol <- read.delim("Data_for_exercises/retinol.txt")
retinol$logretplas <- log(retinol$retplas)

# Task 2
par(mfrow=c(1,2))
hist(retinol$logretplas, col="red", main="Histogram", 
     xlab="Retinol plasmático \n (log-scale)")
boxplot(retinol$logretplas, col="blue", main="Boxplot")
par(mfrow=c(1,1)) #volver al inicial


# Task 3
plot(retinol$retdiet, retinol$logretplas, main="Retinol",
     xlab="Diet retinol", ylab="Plasma retinol (log-scale)")

# Task 4
mod <- lm(logretplas ~ retdiet, data=retinol)
plot(retinol$retdiet, retinol$logretplas, main="Retinol",
     xlab="Diet retinol", ylab="Plama retinol", pch=21,
     col="darkblue", bg="lightblue")
abline(mod, lwd=2, col="red")

# Task 5
resids <- resid(mod)
qqnorm(resids, pch=21, col="darkred", bg="tomato")
qqline(resids, col="gray10", lty=2, lwd=3)

# Task 6
coplot(retinol$logretplas ~ retinol$retdiet | retinol$fumador,
       xlab="Diet retinol", ylab="Plama retinol", pch=21,
       col="darkblue", bg="lightblue")


library(lattice)
xyplot(retinol$logretplas ~ retinol$retdiet | retinol$fumador,
       xlab="Diet retinol", ylab="Plama retinol",
       col="darkblue")




# Task 7
library(lattice)
xyplot(retinol$retdiet ~ retinol$retplas | retinol$sexo,
       xlab="Diet retinol", ylab="Plama retinol", 
       col="red")

# Task 8
y <- retinol$calorias
hist(y, freq = FALSE)
x <- seq(0, max(y), length=100)
lines(x, dnorm(x, mean(y), sd(y)), col="darkgreen", lwd=2)

# Task 9
par(mfrow=c(2,1))
hist(retinol$calorias[retinol$sexo=="Mujer"], main="Mujer", xlab="")
hist(retinol$calorias[retinol$sexo=="Hombre"], main="Hombre", xlab="")
