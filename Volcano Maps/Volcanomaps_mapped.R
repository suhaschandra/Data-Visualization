library(ggplot2)

library(ggrepel)



infile <- args[1]

genes <- read.delim(infile, sep="\t", header=TRUE)

head(genes)

comparison <- args[2]



fdr <- paste(comparison, "_FDR", sep="")

fc <- paste(comparison, "_logFC", sep="")

outfile <- paste(comparison, "_volcano.pdf", sep="")



genes$Significant <- ifelse(genes$fdr < 0.05, "Significant", "Not Sig")

head(genes)



pdf(outfile)

ggplot(genes, aes(x = fc, y = -log10(fdr))) + geom_point(aes(color = Significant), shape=17) + scale_color_manual(values = c("#E7298A", "#decbe4")) +

theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_rect(colour = "black", size=2, fill=NA)) +

geom_text_repel(data = subset(genes, fdr < 0.05),aes(label = GENE),size = 5,box.padding = unit(0.35, "lines"), point.padding = unit(0.3, "lines"))

dev.off()
