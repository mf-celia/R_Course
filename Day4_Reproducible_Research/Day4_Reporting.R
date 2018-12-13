## ----setup, include=FALSE------------------------------------------------
library(knitr)
knitr::opts_chunk$set(echo = TRUE,comment="", message=FALSE, warning=FALSE, cache=TRUE, fig.width = 4, fig.height = 4)
options(width=80)

## ---- results="hide"-----------------------------------------------------
library(compareGroups)
data(predimed)
# ?predimed

## ------------------------------------------------------------------------
head(predimed)

## ------------------------------------------------------------------------
descr <- compareGroups(group ~ sex + age + smoke, predimed,
                       method=1) # method = 1 default
descr

## ------------------------------------------------------------------------
descr <- compareGroups(group ~ sex + age + smoke, predimed,
                       method=NA)
descr

## ------------------------------------------------------------------------
descr <- compareGroups(group ~ ., predimed)
descr

## ------------------------------------------------------------------------
descr2 <- compareGroups(group ~ . -sex -age -event, predimed)
descr2

## ------------------------------------------------------------------------
descrtable <- createTable(descr)
descrtable

## ------------------------------------------------------------------------
update(descrtable, hide.no='no')

## ------------------------------------------------------------------------
update(descrtable, hide.no='no', show.n = TRUE)

## ------------------------------------------------------------------------
update(descrtable, hide.no='no', show.n = TRUE, type=1)

## ------------------------------------------------------------------------
descr <- update(descr, method=2)
createTable(descr, hide.no="no")

## ------------------------------------------------------------------------
update(descrtable, hide.no='no', digits=1, digits.p=5)

## ------------------------------------------------------------------------
descr <- update(descr, method=c(age=2, p14=2))
createTable(descr, hide.no="no")

## ------------------------------------------------------------------------
table(predimed$hyperchol)

## ------------------------------------------------------------------------
descr <- compareGroups(hyperchol ~ ., predimed)
createTable(descr, hide.no="no", show.ratio=TRUE, 
            show.p.overall=FALSE, show.p.trend = FALSE)

## ------------------------------------------------------------------------
predimed$tevent <- with(predimed, Surv(toevent, event=="Yes"))

## ------------------------------------------------------------------------
descr <- compareGroups(tevent ~ .- toevent-event, predimed)
createTable(descr, hide.no="no", show.ratio=TRUE, 
            show.p.overall=FALSE)

## ------------------------------------------------------------------------
Hmisc::label(predimed$age) <- "Age of participant"

## ------------------------------------------------------------------------
descrtable <- createTable(compareGroups(group ~ ., predimed))
varinfo(descrtable)

## ------------------------------------------------------------------------
descrtable <- createTable(compareGroups(group ~ ., predimed))
descrtable[c('age','bmi')]
descrtable[c(1,4)]

## ------------------------------------------------------------------------
descr <- compareGroups(group ~ ., predimed)
plot(descr['bmi'])

## ------------------------------------------------------------------------
plot(descr['bmi'], bivar=TRUE)

## ------------------------------------------------------------------------
plot(descr['sex'])

## ------------------------------------------------------------------------
plot(descr['sex'], bivar=TRUE)

## ---- eval=FALSE---------------------------------------------------------
## # CSV
## export2csv(descrtable, file="tabla.csv", sep=";")
## # Excel
## export2xls(descrtable, file="tabla.xlsx")
## # Word
## export2word(descrtable, file="tabla.docx")
## # Latex
## export2tex(descrtable, file="tabla.tex")

## ------------------------------------------------------------------------
export2md(descrtable)

## ------------------------------------------------------------------------
sessionInfo()

