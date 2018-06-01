# Program takes in 5 input files and creates venn diagrams based on the common elements in all pairwise files based on the first column
# Program also prints a text file with all the gene ids and gene names common among the group comparisons.

# Function to find overlaps. The idea is to iterate over the pairs and create multiple objects, record their lengths and create venn. It also subsets gene information from the common list.
# An update to this would be to automate with functions that take in targets file with information about the files and labels that need to be compared.
# Current format : Rscript venn.R label1 file1 label2 file2 label3 file3 label4 file4

library(VennDiagram)
args <- commandArgs(TRUE)


#Not efficient
label1 <- args[1]
file1  <- args[2]
label2 <- args[3]
file2 <- args[4]
outfile <- args[5]
#Open file handles and save the first columns
f1 <- read.delim(file1, sep="\t", header=FALSE)
#head(f1)
f2 <- read.delim(file2, sep="\t", header=FALSE)


############################################################
############################################################
# Individual sets
n1 <- f1$V1
n2 <- f2$V1

print(length(n1))
print(length(n2))
############################################################
############################################################

# Pairwise comparisons
n12 <- intersect(n1, n2)
n1_unique <- setdiff(n1, n2)
n2_unique <- setdiff(n2, n1)
print(n12)
############################################################
############################################################


write.table(n12, file=paste(outfile, "_common.txt", sep=""), sep="\t", row.names=FALSE, col.names=FALSE, quote=FALSE)
# Draw venn diagram
write.table(n1_unique, file=paste(outfile, "_unique_", label1, ".txt", sep=""), sep="\t", row.names=FALSE, col.names=FALSE, quote=FALSE)

############################################################
# Individual sets
n1 <- f1$V1
n2 <- f2$V1

print(length(n1))
print(length(n2))
############################################################
############################################################

# Pairwise comparisons
n12 <- intersect(n1, n2)
n1_unique <- setdiff(n1, n2)
n2_unique <- setdiff(n2, n1)
print(n12)
############################################################
############################################################


write.table(n12, file=paste(outfile, "_common.txt", sep=""), sep="\t", row.names=FALSE, col.names=FALSE, quote=FALSE)
# Draw venn diagram
write.table(n1_unique, file=paste(outfile, "_unique_", label1, ".txt", sep=""), sep="\t", row.names=FALSE, col.names=FALSE, quote=FALSE)
write.table(n2_unique, file=paste(outfile, "_unique_", label2, ".txt", sep=""), sep="\t", row.names=FALSE, col.names=FALSE, quote=FALSE)

category <- c(label1, label2)
print(category)
output <- paste(outfile, ".pdf", sep="")

fill <- c("#fc9272", "#9ecae1")
cat.col <- rep("black", 2)
pdf(output)
draw.pairwise.venn(length(n1),length(n2),length(n12), cat.col=cat.col, fill=fill, category=category, cat.cex=rep(1,2), cex=rep(1,3), scaled=TRUE)
dev.off()

