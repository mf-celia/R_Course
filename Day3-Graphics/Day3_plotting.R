## ----setup, include=FALSE------------------------------------------------
library(knitr)
knitr::opts_chunk$set(echo = TRUE,comment="", message=FALSE, warning=FALSE, cache=TRUE, fig.width = 4, fig.height = 4)
options(width=80)

## ----eval=FALSE----------------------------------------------------------
## demo(graphics)

## ------------------------------------------------------------------------
library(MASS)
head(Cars93)

## ------------------------------------------------------------------------
plot(Cars93$Weight, Cars93$EngineSize)

## ------------------------------------------------------------------------
# Colour points and choose plotting symbols according to 
# a levels of a factor
plot(Cars93$Weight, Cars93$EngineSize, 
     col=as.numeric(Cars93$Type),
     pch=as.numeric(Cars93$Type))

## ------------------------------------------------------------------------
# Add x and y axes labels and a title.
plot(Cars93$Weight, Cars93$EngineSize, ylab="Engine Size",
xlab="Weight", main="My plot")

## ------------------------------------------------------------------------
plot(Cars93$Weight, Cars93$EngineSize, ylab="Engine Size",
xlab="Weight", main="My plot")

# Add lines to the plot.
lines(x=c(min(Cars93$Weight), max(Cars93$Weight)),
      y=c(min(Cars93$EngineSize),
      max(Cars93$EngineSize)), lwd=4, lty=3, col="green")
abline(h=3, lty=2)
abline(v=1999, lty=4)

## ------------------------------------------------------------------------
plot(Cars93$Weight, Cars93$EngineSize, ylab="Engine Size",
xlab="Weight", main="My plot")

# Add points to the plot
points(x=min(Cars93$Weight), y=min(Cars93$EngineSize), pch=16, col="red")

## ----plotLegend, fig.show='hide'-----------------------------------------
plot(Cars93$Weight, Cars93$EngineSize, ylab="Engine Size",
xlab="Weight", main="My plot")

# Add text to the plot.
text(x=2000, y=5, "some text")

# Add text under main title.
mtext(side=3, "sub-title", line=0.45)

# Add a legend
legend("bottomright", legend=c("Data Points"), pch="o")

## ------------------------------------------------------------------------
plot(Cars93$Weight, Cars93$EngineSize, ylab="Engine Size",
xlab="Weight", main="My plot")

# Add regression line
mod <- lm(EngineSize ~ Weight, data=Cars93)
abline(mod)

## ----regOrgin, fig.show='hide'-------------------------------------------
levels(Cars93$Origin)
plot(Cars93$Weight, Cars93$EngineSize, 
     pch = (1:2)[Cars93$Origin],
     col = (2:3)[Cars93$Origin], 
     xlab="Weight", ylab="Engine Size")
legend("topleft", legend=levels(Cars93$Origin), 
       pch=1:2, col=2:3)

fm1 <- lm(EngineSize ~ Weight, Cars93, subset = Origin == "USA")
abline(coef(fm1), lty=4, col="blue")

fm2 <- lm(EngineSize ~ Weight, Cars93, subset = Origin == "non-USA")
abline(coef(fm2), lty=4, col="black")

## ----multiple, fig.show='hide'-------------------------------------------
# Will create 4 plots on the same page.
# Two in each row and two in each column.
par(mfrow=c(2,2))       

plot(Cars93$Weight, Cars93$EngineSize, 
     xlab="Weight", ylab="Engine Size")

plot(sqrt(Cars93$Weight), sqrt(Cars93$EngineSize),
     xlab=expression(sqrt(Weight)), 
     ylab=expression(sqrt("Engine Size")))

plot(log(Cars93$Weight), log(Cars93$EngineSize),
     xlab=expression(log(Weight)), 
     ylab=expression(log("Engine Size")))

plot(Cars93$Weight^0.1, Cars93$EngineSize^0.1,
     xlab=expression(Weight^0.1), 
     ylab=expression("Engine Size"^0.1) )

par(mfrow=c(1,1))     # Resets to create a single plot per page.

## ----multiple2, fig.show='hide'------------------------------------------
par("mar")
par(mar=c(5,4,1,2))
par(mfrow=c(2,2))       
plot(Cars93$Weight, Cars93$EngineSize, 
     xlab="Weight", ylab="Engine Size")
plot(sqrt(Cars93$Weight), sqrt(Cars93$EngineSize),
     xlab=expression(sqrt(Weight)), 
     ylab=expression(sqrt("Engine Size")))
plot(log(Cars93$Weight), log(Cars93$EngineSize),
     xlab=expression(log(Weight)), 
     ylab=expression(log("Engine Size")))
plot(Cars93$Weight^0.1, Cars93$EngineSize^0.1,
     xlab=expression(Weight^0.1), 
     ylab=expression("Engine Size"^0.1) )

## ------------------------------------------------------------------------
hist(Cars93$Weight, xlab="Weight", 
     main="Histogram of Weight", col="red")

## ------------------------------------------------------------------------
hist(Cars93$Weight, breaks=8, xlab="Weight", 
     main="Histogram of Weight", col="blue")

## ----histnorm------------------------------------------------------------
y <- Cars93$Weight # put here your variable of interest
hist(y, freq=FALSE)
lines(density(y), col="red")
x <- seq(min(y), max(y), length=100)
lines(x, dnorm(x, mean(y), sd(y)), col="blue")

## ----histgroups, fig.show='hide'-----------------------------------------
USA.weight <- Cars93$Weight[Cars93$Origin == "USA"]
nonUSA.weight <- Cars93$Weight[Cars93$Origin == "non-USA"]

par(mfrow=c(2,1))
par(mar=c(5,4,1,2))
hist(USA.weight, breaks=10, xlim=c(1500,4500), col="grey")
hist(nonUSA.weight, breaks=10, xlim=c(1500,4500))
par(mfrow=c(1,1))

## ------------------------------------------------------------------------
boxplot(Cars93$Weight)

## ------------------------------------------------------------------------
boxplot(Cars93$Weight ~ Cars93$Origin, 
        col="blue", ylab="Weight")

## ------------------------------------------------------------------------
qqnorm(Cars93$Weight)
qqline(Cars93$Weight)

## ------------------------------------------------------------------------
pairs(Cars93[,1:7])

## ------------------------------------------------------------------------
coplot(Cars93$MPG.city~Cars93$Price|Cars93$Type)

## ------------------------------------------------------------------------
library(lattice)
xyplot(Cars93$MPG.city~Cars93$EngineSize|Cars93$Type)

## ------------------------------------------------------------------------
xyplot(Cars93$MPG.city~Cars93$EngineSize|Cars93$Type*Cars93$Origin)

## ------------------------------------------------------------------------
xyplot(Cars93$MPG.city~Cars93$EngineSize|Cars93$Type,
       panel=panel.superpose, groups=Cars93$Origin)

## ------------------------------------------------------------------------
# Adds a key
pars <- trellis.par.get("superpose.symbol")
xyplot(Cars93$MPG.city~Cars93$EngineSize|Cars93$Type,
       panel=panel.superpose, groups=Cars93$Origin, 
       key = list(columns = 2, text = list(levels(Cars93$Origin)),
                               points = Rows(pars,1:2)))

## ----plot2d, fig.show='hide'---------------------------------------------
data(volcano)
x <- 10*(1:nrow(volcano))
y <- 10*(1:ncol(volcano))

# Creates a 2-D image of x and y co-ordinates.
image(x, y, volcano, col = terrain.colors(100),
      axes = FALSE)

# Adds contour lines to the current plot.
contour(x, y, volcano, levels = seq(90, 200, by=5),
        add = TRUE, col = "peru")

# Adds x and y axes to the plot.
axis(1, at = seq(100, 800, by = 100))
axis(2, at = seq(100, 600, by = 100))

# Draws a box around the plot.
box()

# Adds a title.
title(main = "Maunga Whau Volcano", font.main = 4)

## ------------------------------------------------------------------------
sessionInfo()

