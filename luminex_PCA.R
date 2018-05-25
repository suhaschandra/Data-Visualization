# Install the following packages
library(devtools)
install_github("vqv/ggbiplot", force=TRUE)
library(ggbiplot)

# Read the input file
immune_mediators <- read.delim("Allfactors.txt", sep="\t", header=T, row.names=1)

# Read the phenotype file
pheno <- c(as.matrix(read.delim("phenotype.txt", sep="\t", header=F)))

# Generate PCA
pca <- prcomp(t(immune_mediators), center=TRUE, scale.=TRUE)
