rstudio <- read.delim("C:/Juan/temp/rstudio.txt")
names(rstudio)

rstudio <- rstudio[ , 1:5]
names(rstudio)

hist(rstudio$OPTICA)
hist(rstudio$IMPE)
hist(rstudio$Cd61)

rstudio$logIMPE <- log(rstudio$IMPE)

hist(rstudio$logIMPE)

mod.impe <- lm(Cd61 ~ IMPE, data=rstudio)
mod.optica<- lm(Cd61 ~ OPTICA, data=rstudio)

mod.logimpe <- lm(Cd61 ~ logIMPE, data=rstudio)

summary(mod.impe)
summary(mod.logimpe)
summary(mod.optica)


mod.impe2 <- lm(Cd61 ~ IMPE*INACTIVADA, data=rstudio)
mod.optica2<- lm(Cd61 ~ OPTICA*INACTIVADA, data=rstudio)

summary(mod.impe2)
summary(mod.optica2)

par(mfrow=c(1,2))
coplot(rstudio$Cd61 ~ rstudio$IMPE | as.factor(rstudio$INACTIVADA))
coplot(rstudio$Cd61 ~ rstudio$OPTICA | as.factor(rstudio$INACTIVADA))


par(mfrow=c(1,1))
plot(rstudio$Cd61 ~ rstudio$IMPE, col="tomato", pch=16,
     xlim=c(min(rstudio$OPTICA), max(rstudio$IMPE)),
     xlab="Predictive variable", ylab="Cd61")
points(rstudio$Cd61 ~ rstudio$OPTICA, col="lightblue", pch=16)

abline(mod.impe, lty=2, lwd=2, col="red")
abline(mod.optica, lty=2, lwd=2, col="blue")

legend("bottomright", pch=16, col=c("red","blue"),
        legend=c("IMPE", "OPTICA"))


