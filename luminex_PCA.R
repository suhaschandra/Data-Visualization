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

pdf("Alcohol_monocytes_LPS_allfactors.pdf")
g <- ggbiplot(pca, obs.scale = 1, var.scale = 1,groups = pheno, ellipse=TRUE)
g <- g+scale_color_manual(values=c("#6baed6", "#08519c", "#fdbe85", "#e6550d"))
g <- g + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_rect(colour = "black", size=2, fill=NA))
print(g)
