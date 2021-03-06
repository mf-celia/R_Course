setwd("c:/Juan/CREAL/GitHub/R_course/Data_for_exercises/")
multi <- read.delim("multicentric.txt")
levels(multi$status)

# reorder caso/control
multi$status2 <- relevel(multi$status, 2)
levels(multi$status2)

# vph

mod.vph <- glm(status2 ~ vph, data=multi, family="binomial")
summary(mod.vph)
or <- exp(coef(mod.vph))
ci <- exp(confint(mod.vph))
round(cbind(or, ci),2)[-1,]

# numembara

mod.num <- glm(status2 ~ nembara, data=multi, family="binomial")
summary(mod.num)
or <- exp(coef(mod.num))
ci <- exp(confint(mod.num))
round(cbind(or, ci),2)[-1,]

# Task 2

modAll <- glm(status2 ~ vph + edad1sex + niveledu + fumar + 
                nembara + edademba, data=multi,
              family="binomial")
summary(modAll)

# Task 3

library(MASS)
multi.comp <- multi[complete.cases(multi),]

modAll <- glm(status2 ~ edad + niveledu + fumar + edad1sex 
               + nembara + vph, data=multi.comp, family="binomial")
summary(modAll)

modBack <- stepAIC(modAll, direction="back", trace=0)
summary(modBack)

modBoth <- stepAIC(modAll, direction="both", trace=0)
summary(modBoth)


#
# Extra
#


names(multi)

getOR <- function(i){
 mod <- glm(status2 ~ multi[,i], data=multi, family="binomial")
 or <- exp(coef(mod))
 ci <- exp(confint(mod))
 round(cbind(or, ci),2)[-1,]
}

getOR(4)
ans <- matrix(unlist(sapply(4:21, getOR)), ncol=3, byrow=TRUE)
ans
