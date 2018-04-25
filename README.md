# Data-Visualization
Scripts for genomic data visualization
## Clustering
**Disclaimer**
This section will be written in continuation of the analysis started in the "timecourse" repository, which details a simplified pipeline for the computational statistical package "maSigPro." The following code and tutorial should still be applicable for any pipeline seeking to use the "STEM" visualization tool.

```
badrows <- which(rowMeans(data.obj) < 5)
data.obj <- data.obj[-badrows ,]
```
