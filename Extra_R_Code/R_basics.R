# change working directory
setwd("C:/Juan/CREAL/GitHub/R_course/Day1-Introduction/")

# load data
parto <- read.delim("data/parto2.dat", sep=";", header=FALSE)
head(parto)
View(parto)

# el indivuo 1 de la variable 6 hay que cambiarlo
parto[1,6] <- 1

# create a new variable
parto$newVar <- parto$V7/(parto$V8^2)
head(parto)

# create a new variable
parto$newVar2 <- cut(parto$V7, c(-Inf, 20, 35, Inf),
                     labels = c("bajo", "medio", "alto"))

table(parto$newVar2)

# quantiles
parto$newVar3 <- cut(parto$V7, quantile(parto$V7),
                     labels = c("1st", "2nd", "3th", "4h"))

table(parto$newVar3)

# subset (option 1)

parto.sel <- subset(parto, parto$V9 == 2 & parto$V10 == 1)

head(parto.sel)  

dim(parto)
dim(parto.sel)

# subset (option 2)

sel <- parto$V9 == 2 & parto$V10 == 1
parto.sel2 <- parto[  sel ,  ]


ls()

table(parto$V9)

tt <- table(parto$V9)

class(tt)
  
