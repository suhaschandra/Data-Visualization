args <- commandArgs(TRUE)

options(warnPartialMatchDollar = TRUE)

library(ggplot2)
library(ggrepel)
library(gdata)

infile <- args[1]
comparison <- args[2]

genes <- read.delim(infile, sep="\t", header=TRUE)

fdr <- toString(paste(comparison, "_FDR", sep=""))
fc <- paste(comparison, "_logFC", sep="")
outfile <- paste(comparison, "_volcano.pdf", sep="")

genes$Significant <- ifelse(genes[[fdr]] < 0.05, "Significant", "Not Sig")
attach(genes)

pdf(outfile)
ggplot(genes, aes(x = fc, y = -log10(genes[[fdr]]))) + geom_point(aes(color = genes[[Significant]]), shape=17) + scale_color_manual(values = c("#E7298A", "#decbe4")) +
theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_rect(colour = "black", size=2, fill=NA)) +
geom_text_repel(data = genessubset(genes, genes[[fdr]] < 0.05),aes(label = genes[[GENE]]),size = 5,box.padding = unit(0.35, "lines"), point.padding = unit(0.3, "lines"))
dev.off() 
