# set working directory
setwd("c:/juan/CREAL/GitHub/R_course/Data_for_exercises/")

# load data
multi <- read.delim("multicentric.txt", na.strings = c(" "))
head(multi)

# relevel for interpreting the results (not necessary - it depends
# on your data!!!!)
multi$status2 <- relevel(multi$status, 2)

# load library
library(compareGroups)

# select variables
descr <- compareGroups(status2 ~ edad + niveledu + fumar + edad1sex +
                         nembara + vph, multi)
descr

# create table 1 
table1 <- createTable(descr, show.p.overall = FALSE)
table1

# create table 1 with p-values
table1.p <- createTable(descr, show.p.overall = TRUE)
table1.p

# create table 2
table2 <- createTable(descr, show.ratio = TRUE)
table2

# export to word
export2word(table1, file="table1.doc")
                  