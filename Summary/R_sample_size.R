
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
power.prop.test(p1=0.2,
                p2=0.4,
                sig.level = 0.05,
                power = 0.8)


## Two means

# n1: n group 1
# n2: n group 2
# d: effect size
# sig.level: type I error
# power: power

# power
power.t.test(n=40, 
             delta=2, 
             sd=3.5)

power.t.test(power=0.8, 
             delta=2, 
             sd=3.5)
