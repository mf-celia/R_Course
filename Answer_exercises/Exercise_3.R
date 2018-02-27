# get data
setwd("c:/Juan/CREAL/GitHub/R_course/Data_for_exercises/")
multi <- read.delim("multicentric.txt", na.strings = c(" ", "", NA))

# normalidad
hist(multi$edademba)
hist(log(multi$edademba))

ks.test(log(multi$edademba), "pnorm")

# test
wilcox.test(edademba ~ status, data=multi)
wilcox.test(nembara ~ status, data=multi)

# test
tt <- with(multi, table(vph, status))
tt
chisq.test(tt)

tt <- with(multi, table(pais, status))
tt
chisq.test(tt)


# confusión
wilcox.test(nembara ~ vph, data=multi)
