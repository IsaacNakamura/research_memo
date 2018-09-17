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
