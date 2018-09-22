# rsm package

install.packages("stats")
library(stats)

install.packages("rsm")
library(rsm)

D = ChemReact
class(D)

CR = coded.data(D, x1 ~ (Time - 85)/5, x2 ~ (Temp - 175)/5 )
CR[1:7,]
CR$x1

# 3. Generating a design

D2 = bbd(3, n0=2, coding = list(x1~(Force-20)/3, x2~(Rate-50)/10, x3~Polish-4))

?bbd

BBD = bbd(k=3, n0=2, coding = list(x1 ~ (Force-20/3), x2 ~ (Rate - 50)/10, x3 ~ Polish -4 ))

# k: A formula, or an integer giving the number of variables. 
# n0: Number of center points in each block.
# coding: Optional list of formulas. If this is provided, 
#        it overrides the default coding formulas.

?ccd.pick

ccd.pick(5,n.c=c(8,16),blks.c = c(1,2,4),wbr.s=1:2,restrict="N<=65")


# Fitting the response-surface model

CR.rsm1 = rsm(Yield ~ FO(x1, x2), data = CR, subset = (Block == "B1"))
summary(CR.rsm1)
anova(CR.rsm1)

CR.rsm1.5 = update(CR.rsm1,.~.+TWI(x1,x2))
summary(CR.rsm1.5)

CR.rsm1.6 = rsm(Yield ~ FO(x1, x2) + TWI(x1, x2), data = CR, subset = (Block == "B1"))
summary(CR.rsm1.6)

CR.rsm2 = rsm(Yield ~ Block + SO(x1,x2), data=CR)
summary(CR.rsm2)

# 3rd order

CR2 = D
CR2$x1 = (CR2$Time - 85)/5
CR2$x2 = (CR2$Temp - 175)/5

lm1st = lm(Yield ~ x1 + x2, data=CR2) 
lm_const = lm(Yield ~ 1, data=CR2) 
summary(lm_const)

anova(lm1st,lm_const)


lm3rd = lm(Yield ~ x1 + x2 + I(x1^2) + I(x2^2) + I(x1^3) + I(x2^3) + x1*x2  , data=CR2) 
summary(lm3rd)
anova(lm3rd,lm_const)
