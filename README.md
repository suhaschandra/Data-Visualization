# Data-Visualization
Scripts for genomic data visualization
## Clustering
```
badrows <- which(rowMeans(data.obj) < 5)
data.obj <- data.obj[-badrows ,]
```
