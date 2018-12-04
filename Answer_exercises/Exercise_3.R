# get data
setwd("c:/Juan/CREAL/GitHub/R_course/Data_for_exercises/")
multi <- read.delim("multicentric.txt")
head(multi)

# normalidad
hist(multi$edademba)
ks.test(multi$edademba, "pnorm")

hist(log(multi$edademba))
ks.test(log(multi$edademba), "pnorm")

# test
wilcox.test(edademba ~ status, data=multi)
wilcox.test(nembara ~ status, data=multi)
t.test(durco ~ status, data=multi)


# test
tt <- with(multi, table(vph, status))
tt
chisq.test(tt)

tt <- with(multi, table(pais, status))
tt
chisq.test(tt)

tt <- with(multi, table(fumar, status))
tt
chisq.test(tt)

tt <- with(multi, table(pap, status))
tt
chisq.test(tt)

tt <- with(multi, table(niveledu, status))
tt
chisq.test(tt)



  
  