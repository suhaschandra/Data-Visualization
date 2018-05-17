#Input one file  (which is the merged dataset)

args <- commandArgs(TRUE)
library("RColorBrewer")
library(gplots)
library(lattice)

#Define the colors
hmcol <- colorRampPalette(brewer.pal(9, "RdBu"))(100)

# file1 is the list of gene names with no header
file1  <- args[1]
# file2 is the mastersheet with RPKM values
file2 <- args[2]
# Output name - heatmap pdf prefix
outprefix <- args[3]

#Open file handles and save the first columns
f1 <- read.delim(file1, sep="\t", header=FALSE, row.names=1)
f2 <- read.delim(file2, sep="\t", header=TRUE, row.names=1)

# Select column names for RPKM
colnames = c("Add columns to be selected")
merge <- merge(f1, f2, by.x="V1", by.y="GENE")
merge_subset <- subset(merge, select = colnames)
rownames(merge_subset) <- merge$V1

############################################################
y <- t(scale(t(as.matrix(merge_subset))))

#Printing the heatmap
pdf(paste(outprefix, "_heatmap.pdf", sep=""))
levelplot(t(y), height=0.3, col.regions=rev(hmcol), main="", colorkey=list(space="top"), xlab="", ylab="", pretty=TRUE, width=0.5, cexRow=0.1, cexCol=0.1, aspect=2.5)
dev.off()


pdf(paste(outprefix, "_clustered_heatmap.pdf", sep=""))
heatmap.2(as.matrix(merge_subset), col=rev(hmcol), scale="row", key=T, keysize=1.5, density.info="density", cexRow=0.1, cexCol=0.9)
dev.off()
