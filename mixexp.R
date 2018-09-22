# mixexp package

install.packages("mixexp")
library(mixexp)

# Simplex-Lattice Design
# SLD(q,k) where q is the number of components and k is the degree.

# Generating SLD design
SLD(2,1)
SLD(2,2)
SLD(3,1)
SLD(3,2)
SLD(3,3)
SLD(4,2)


# Simplex-Centroid design (SCD)
# The SCD is a design on the simplex coordinate system that consists of
# mixtures containing 1,2,3,..., or k components, each in equal proportions.

SCD(2)
SCD(3)
SCD(4)


DesignPoints(SCD(3))


# 3.2 Mixture designs in constrained regions

# 0.143 <= x1 <= 0.572
# 0.214 <= x2 <= 0.500
# 0.214 <= x3 <= 0.500

# What is ndm ??????
# an integer representing the highest order of centroids requested. 
# An overall centroid is always included, 0 indicates no other 
# centroids will be created, 1 indicates edge centroids are 
# requested, etc.

Xvert(nfac = 3, 
      lc = c(0.143, 0.214, 0.214), 
      uc = c(0.572, 0.5, 0.5))

Xvert(nfac = 3, 
      lc = c(0.143, 0.214, 0.214), 
      uc = c(0.572, 0.5, 0.5),
      ndm = 0) # ndm = 0 seems to be set by default

Xvert(nfac = 3, 
      lc = c(0.143, 0.214, 0.214), 
      uc = c(0.572, 0.5, 0.5),
      ndm = 1)

Xvert(nfac = 3, 
      lc = c(0.143, 0.214, 0.214), 
      uc = c(0.572, 0.5, 0.5),
      ndm = 2)

Xvert(nfac = 3, 
      lc = c(0.143, 0.214, 0.214), 
      uc = c(0.572, 0.5, 0.5),
      ndm = 3)

Xvert(nfac = 3, 
      lc = c(0.01,0.01,0.01), 
      uc = c(1,1,1),
      ndm = 0)

Xvert(nfac = 3, 
      lc = c(0.01,0.01,0.01), 
      uc = c(1,1,1),
      ndm = 1)

Xvert(nfac = 3, 
      lc = c(0.01,0.01,0.01), 
      uc = c(1,1,1),
      ndm = 2)


?crvtave
??crvtave
?Xvert

DesignPoints(Xvert(nfac = 3, 
                   lc = c(0.143, 0.214, 0.214), 
                   uc = c(0.572, 0.5, 0.5),
                   ndm = 0))

DesignPoints(Xvert(nfac = 3, 
                   lc = c(0.143, 0.214, 0.214), 
                   uc = c(0.572, 0.5, 0.5),
                   ndm = 1))

########

coef = matrix(c(0,1,1,0,0,
                0,0,0,1,1), ncol = 5, byrow = T)

Xvert(nfac = 5,
      lc = c(0.3,0,0,0,0), uc = c(0.7,0.35,0.35,0.35,0.35),
      nlc = 2, lb = c(0.15,0.15), ub = c(0.35,0.35), coef)
