## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,comment="", message=FALSE, warning=FALSE, cache=TRUE, fig.width = 4, fig.height = 4)
options(width=80)

## ------------------------------------------------------------------------
library(Hmisc)
df <- spss.get("data/partoFin.sav", allow="_", 
               datevars=c("dia_nac", "dia_entr", "ulti_lac"))

## ------------------------------------------------------------------------
t.test(df$peso, mu=4)

## ------------------------------------------------------------------------
t.test(peso ~ sexo, data=df)

## ------------------------------------------------------------------------
t.test(df$horas_an, df$horas_de, paired = TRUE)

## ------------------------------------------------------------------------
mod <- aov(peso ~ naci_ca, data=df)
summary(mod)

## ------------------------------------------------------------------------
mod <- aov(peso ~ naci_ca + sexo, data=df)
summary(mod)

## ------------------------------------------------------------------------
with(df, pairwise.t.test(peso, naci_ca , p.adjust="none"))

## ------------------------------------------------------------------------
with(df, pairwise.t.test(peso, naci_ca, p.adjust="bonf"))

## ------------------------------------------------------------------------
with(df, pairwise.t.test(peso, naci_ca, p.adjust="holm"))

## ------------------------------------------------------------------------
TukeyHSD(mod)

## ------------------------------------------------------------------------
library(outliers) 
grubbs.test(df$peso)

## ------------------------------------------------------------------------
wilcox.test(peso ~ sexo, data=df)

## ------------------------------------------------------------------------
kruskal.test(peso ~ naci_ca, data=df)

## ------------------------------------------------------------------------
freq <- with(df, table(sexo, tip_par))
chisq.test(freq)

## ------------------------------------------------------------------------
freq <- with(df, table(sexo, tip_par))
fisher.test(freq)

## ------------------------------------------------------------------------
cor.test(df$peso, df$edad)

## ------------------------------------------------------------------------
cor.test(df$peso, df$edad, method="spearman")

## ------------------------------------------------------------------------
B <- 10000
stat.ref <- mad(df$sem_lac[df$tx=="Intensivo"]) - 
            mad(df$sem_lac[df$tx=="Estándar"])
stat <- rep(NA, B)
for (i in 1:B) {
 tx.r <- sample(df$tx, nrow(df), replace=FALSE)
 stat[i] <- mad(df$sem_lac[tx.r=="Intensivo"]) - 
            mad(df$sem_lac[tx.r=="Estándar"])
}

## ------------------------------------------------------------------------
df$tx
tx.r
pvalue <- sum(stat>stat.ref)/(B+1)
pvalue

## ------------------------------------------------------------------------
hist(stat)
abline(v=stat.ref, col="red")

## ------------------------------------------------------------------------
t.test(sem_lac ~ tx, data=df)

## ------------------------------------------------------------------------
hist(df$sem_lac, col="blue")

## ------------------------------------------------------------------------
sessionInfo()

