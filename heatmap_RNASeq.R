#Input one file  (which is the merged dataset)

args <- commandArgs(TRUE)
library("RColorBrewer")
library(gplots)
library(lattice)

#Define the colors
hmcol <- colorRampPalette(brewer.pal(9, "RdBu"))(100)

# file1 is the list of merged genes
file1  <- args[1]
# Output name - heatmap pdf prefix
outprefix <- args[2]

#Open file handles and save the first columns
f1 <- read.delim(file1, sep="\t", header=TRUE, row.names=1)

############################################################
y <- t(scale(t(as.matrix(f1))))

#Printing the heatmap
pdf(paste(outprefix, "_heatmap.pdf", sep=""))
levelplot(t(y), height=0.3, col.regions=rev(hmcol), main="", colorkey=list(space="top"), xlab="", ylab="", pretty=TRUE, width=0.5, cexRow=0.1, cexCol=0.1, aspect=2.5)
dev.off()


pdf(paste(outprefix, "_clustered_heatmap.pdf", sep=""))
heatmap.2(as.matrix(f1), col=rev(hmcol), scale="row", key=T, keysize=1.5, density.info="density", cexRow=0.1, cexCol=0.9, Colv=FALSE, distfun=function(x) as.dist(1-cor(t(x))), hclustfun=function(x) hclust(x, method="average"))
dev.off()
