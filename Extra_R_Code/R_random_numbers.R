# random number
multi <- read.delim("c:/Juan/CREAL/GitHub/R_course/Data_for_exercises/multicentric.txt")
set.seed(123456)
n <- nrow(multi)
sel <- sample(1:n, 40)

multi.sel <- multi[sel,]
dim(multi)
dim(multi.sel)

# random A, B
set.seed(1234)
sample(c("A", "B"), 40, replace=TRUE)

# ramdom A, B by blocks

....


