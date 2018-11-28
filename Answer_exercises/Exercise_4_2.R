reti <- read.delim("Data_for_exercises/retinol.txt")

mod.retdiet <- lm(retplas ~ retdiet, data=reti)
summary(mod.retdiet)

mod.colest <- lm(retplas ~ colest, data=reti)
summary(mod.colest)

mod.retdiet <- lm(retplas ~ fibra, data=reti)
summary(mod.fibra)

mod.retdiet <- lm(retplas ~ grasa, data=reti)
summary(mod.grasa)

mod.retdiet <- lm(retplas ~ calorias, data=reti)
summary(mod.calorias)

mod.retdiet <- lm(retplas ~ vitamin, data=reti)
summary(mod.vitamin)

mod.retdiet <- lm(retplas ~ fumador, data=reti)
summary(mod.fumador)

# Task 2


# Task 3
library(MASS)
modAll <- lm(retplas ~ ., data=reti)

summary(modAll)

modBack <- stepAIC(modAll, direction="back", trace=0)
summary(modBack)

modBoth <- stepAIC(modAll, direction="both", trace=0)
summary(modBoth)


#
# Transformation
#

hist(reti$retplas)
ks.test(reti$retplas, "pnorm")
hist(log(reti$retplas))

reti$logretplas <- log(reti$retplas)

modAll.log <- lm(logretplas ~ . -retplas, data=reti)
modForw.log <- stepAIC(modAll.log, direction="forward", trace=0)
summary(modForw.log)


# Extra

modFinal <- lm(logretplas ~ sexo + edad + fumador + fibra +
                 betaplas, data=reti)
summary(modFinal)

library(Design)
?nomogram


modFinal2 <- lrm(logretplas ~ sexo + edad + fumador + fibra +
                 betaplas, data=reti)
summary(modFinal2)
nomo <- nomogram(modFinal)
