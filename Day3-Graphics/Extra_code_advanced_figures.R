#
# Figure two y-axes
#

x <- 1:300
y1 <- rnorm(300, sd=0.4)
y2 <- c(runif(100, 0.9, 1), runif(100, 0.45, 0.55), runif(100, 0, 0.1)) 


par(mar=c(5, 4, 4, 4))
plot(x, y1, ylim=c(-2,2), las=1, pch=16, cex=0.5, 
     col="black", ylab="", xlab="", main="")

par(new=TRUE)
plot(x, y2, col="red", pch=1, cex=0.5, ylab="", xlab="", main="",
     ylim = c(0, 1),  axes=FALSE) 

mtext("Y1",side=2, col="black", line=2.5, adj=0.5)
mtext("Y2",side=4, col="red", line=2.5, adj=0.5)
axis(4,at=c(0,0.25,0.5,0.75,1),labels=c("0.0",0.25,0.5,0.75,"1.0"), 
     las=1, col="red", col.axis="red")


#
# Layout
#
mm <- matrix(c(1,1,2,3), 2, 2, byrow = TRUE)
mm
layout(mm)
layout.show(5)

par(mar=c(5, 4, 2, 2))
hist(Cars93$Weight, main="Histogram", col="blue")
boxplot(Cars93$EngineSize, col="red", main="Boxplot")
plot(Cars93$Weight, Cars93$EngineSize, xlab="Weight", ylab="Size",
     main="Regression", pch=16, col="tomato")



#
# complex 
#

mm <- matrix(c(1,1,1,1,1,1,2,
               1,1,1,1,1,1,2,
               1,1,1,1,1,1,2,
               3,3,3,3,4,4,4,
               3,3,3,3,4,4,4,
               5,5,5,5,5,5,5), 6, 7, byrow = TRUE)


mm
layout(mm)
layout.show(5)