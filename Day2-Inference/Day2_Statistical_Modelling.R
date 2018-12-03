## ----setup, include=FALSE------------------------------------------------
library(knitr)
knitr::opts_chunk$set(echo = TRUE,comment="", message=FALSE, warning=FALSE, cache=TRUE, fig.width = 4, fig.height = 4)
options(width=80)

## ----lm, echo=FALSE------------------------------------------------------
cal <- rnorm(100, 2800, 300)
chol <- -80 + 0.1*cal + rnorm(100, 20, 26)
plot(cal, chol, xlab="Calories consumption", ylab="Cholesterol level")
abline(lm(chol~cal), lwd=2, col="blue")

## ----lm_mod--------------------------------------------------------------
data(airquality)
head(airquality)

## ----lmModS--------------------------------------------------------------
mod <- lm(Ozone ~ Temp, data=airquality)
mod

## ----lmModSumm-----------------------------------------------------------
summary(mod)

## ----lmModF--------------------------------------------------------------
mod.lin <- lm(Ozone ~ Month, data=airquality)  
mod.lin

## ----lmModFac------------------------------------------------------------
mod.fac <- lm(Ozone ~ as.factor(Month), data=airquality)  
mod.fac

## ----lmModFplot, echo=FALSE----------------------------------------------
boxplot(Ozone  ~ Month, data=airquality,
        xlab="Month", ylab="Ozone level")

## ----lmModM--------------------------------------------------------------
mod <- lm(Ozone ~ Solar.R + Wind + 
            Temp + as.factor(Month), data=airquality)
mod

## ----lmModVal------------------------------------------------------------
par(mfrow=c(2,2))
plot(mod)

## ----lmModPlot-----------------------------------------------------------
mod <- lm(Ozone ~ Temp, data=airquality)
plot(airquality$Temp, airquality$Ozone,
     xlab="Temperature", ylab="Ozone", pch=16)
abline(mod, lty=2, col="blue")

## ----find_trans----------------------------------------------------------
library(car)
trans <- powerTransform(mod)
trans

## ----linerization--------------------------------------------------------
Ozone.trans <- bcPower(airquality$Ozone,
                       coef(trans, round=TRUE))

mod.trans <- lm(Ozone.trans ~ Temp, data=airquality)
mod.trans

## ----linerizationFig-----------------------------------------------------
plot(Ozone.trans ~ Temp, data=airquality)
abline(mod.trans)

## ----modGam--------------------------------------------------------------
library(mgcv)
mod.gam <- gam(Ozone ~ s(Temp), data=airquality)
plot(mod.gam, se=TRUE)

## ----modGamSumm----------------------------------------------------------
mod.gam <- gam(Ozone ~ s(Temp), data=airquality)
summary(mod.gam)

## ----lung----------------------------------------------------------------
data(ovarian, package="survival")
head(ovarian)

## ----modL----------------------------------------------------------------
mod2 <- glm(fustat ~ rx, data=ovarian, family="binomial")
mod2

## ----modLsumm------------------------------------------------------------
mod2 <- glm(fustat ~ rx, data=ovarian, family="binomial")
summary(mod2)

## ----modS----------------------------------------------------------------
library(survival)
mod3 <- coxph(Surv(futime, fustat) ~ rx, data=ovarian)
summary(mod3) 

## ----modKM---------------------------------------------------------------
mod4 <- survfit(Surv(futime, fustat) ~ rx, data=ovarian)
plot(mod4, col=c("red", "blue")) 

## ----modLR---------------------------------------------------------------
mod5 <- survdiff(Surv(futime, fustat) ~ rx, data=ovarian)
mod5

## ----modGW---------------------------------------------------------------
mod6 <- survdiff(Surv(futime, fustat) ~ rx, data=ovarian,
                 rho=1)
mod6

## ----modLRT--------------------------------------------------------------
air.ok <- airquality[complete.cases(airquality),]
mod0 <- lm(Ozone ~ Wind, data=air.ok)
mod1 <- lm(Ozone ~ Wind + Solar.R, data=air.ok) 
anova(mod0, mod1, test="F")

## ----modLRT2-------------------------------------------------------------
mod0 <- glm(fustat ~ ecog.ps, data=ovarian, family="binomial")
mod1 <- glm(fustat ~ ecog.ps + rx, data=ovarian, family="binomial")
anova(mod0, mod1, test="Chi")

## ----modStep-------------------------------------------------------------
library(MASS)
modAll <- lm(Ozone ~ ., data=airquality)
modForw <- stepAIC(modAll, direction="forw", trace=0)
modForw

## ----modStep2------------------------------------------------------------
modAll <- lm(Ozone ~ ., data=airquality)
modBack <- stepAIC(modAll, direction="back", trace=0)
modBack

## ----modStep3------------------------------------------------------------
modAll <- lm(Ozone ~ ., data=airquality)
modBoth <- stepAIC(modAll, direction="both", trace=0)
modBoth

## ----summaryStep---------------------------------------------------------
summary(modBoth)

## ----modStep4------------------------------------------------------------
modAll <- lm(Ozone ~ . - Month, data=airquality)
modBoth2 <- stepAIC(modAll, direction="both", trace=0)
modBoth2

## ----summaryStep2--------------------------------------------------------
summary(modBoth2)

## ------------------------------------------------------------------------
sessionInfo()

