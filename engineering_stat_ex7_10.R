# rsm package

install.packages("rsm")
library(rsm)

data7_10 = data.frame(Time = c(50,60,50,60,48,62,rep(55,7)),
                      Temp = c(160,160,170,170,165,165,158,172,rep(165,5)),
                      Y1 = c(65.3,68.2,66,69.8,64.5,69,64,68.5,68.9,69.7,68.5,69.4,69),
                      Y2 = c(35,39,36,43,30,44,31,45,37,34,35,36,37))

D710 = coded.data(data7_10, x1 ~ (Time - 55)/5, x2 ~ (Temp - 165)/5 )

# linmod = lm(data = data7_10, Y1 ~ Time + Temp)  ; summary(linmod)

# Fit a polynomial linear model by using lm() function
mod = lm(data = D710, Y1 ~ x1 + x2 + I(x1^2) + I(x2^2) + x1*x2 ); summary(mod)

# Fit a first order model
rsm_mod0 = rsm(data = D710, Y1 ~ FO(x1,x2)); summary(rsm_mod0)

# Fit a polynomial linear moredl by using rsm() functiom
rsm_mod = rsm(data = D710, Y1 ~ SO(x1,x2)); summary(rsm_mod)

# Drop the interacton term beacuase it is not sginificant
rsm_mod2 = rsm(data = D710, Y1 ~ FO(x1,x2) + PQ(x1,x2)); summary(rsm_mod2)

?contour

# heli data

heli
heli.rsm = rsm(ave~block + SO(x1,x2,x3,x4),data=heli)
summary(heli.rsm)
contour(heli.rsm, ~x1+x2+x3+x4, at=summary(heli.rsm)$canonical$xs)

# Contour plot for full SO model
contour(rsm_mod, ~x1 + x2, at=summary(rsm_mod)$canonical$xs)

contour(rsm_mod2, ~x1 + x2, at=summary(rsm_mod2)$canonical$xs)
contour(rsm_mod0, ~x1 + x2)

?steepest

steepest(rsm_mod0)

steepest(rsm_mod)


# Need to know better 
# canonical.path(rsm_mod)

# Draw 3-d response surface plot.

persp(rsm_mod, x1~x2, zlab = "Y1", main = "including interaction" )
persp(rsm_mod2,x1~x2, zlab = "Y1", main = "without interaction" )

anova(rsm_mod2,rsm_mod)

?persp
