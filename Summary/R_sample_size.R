
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

# sample size
power.prop.test(p1=0.1,
                p2=0.2,
                sig.level = 0.05,
                power = 0.8)



## Two means

# n: sample size
# delta: expected difference
# sig.level: type I error
# sd: standar deviation
# power: power

# power
res.power <- power.t.test(n=40, 
                          delta=0.3, 
                          sd=0.8, 
                          sig.level=0.05)
res.power

res.n <- power.t.test(power=0.8, 
                      delta=0.3, 
                      sd=1,
                      sig.level=0.05)
res.n
plot(res.n)

# figure

