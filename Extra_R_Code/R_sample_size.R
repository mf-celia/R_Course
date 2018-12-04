
#### Two proportions

# n: sample size
# p1: proportion group 1
# p2: proportion group 2
# sig.level: type I error
# power: power

# power
power.prop.test(p1=0.2,
                p2=0.3,
                n = 200,
                sig.level = 0.05)

# power
power.prop.test(p1=0.3,
                p2=0.4,
                n = 200,
                sig.level = 0.05)

# sample size
res.n.p <- power.prop.test(p1=0.1,
                           p2=0.2,
                           sig.level = 0.05,
                           power = 0.8)
res.n.p



## Two means

# n: sample size
# delta: expected difference
# sig.level: type I error
# sd: standar deviation
# power: power

# power
res.power <- power.t.test(n=40, 
                          delta=0.5, 
                          sd=0.8, 
                          sig.level=0.05)
res.power

res.n <- power.t.test(power=0.8, 
                      delta=0.3, 
                      sd=1,
                      sig.level=0.05)
res.n


# figure
library(pwr)
plot(res.n)


