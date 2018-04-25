# Data-Visualization
Scripts for genomic data visualization
## Clustering
**Disclaimer:**
This section will be written in continuation of the analysis started in the "timecourse" repository, which details a simplified pipeline for the computational statistical package "maSigPro." The following code and tutorial should still be applicable for any pipeline seeking to use the "STEM" visualization tool.

### Creating input file for STEM: Merges and Edits
After obtaining a list of significant genes from "maSigPro," use the merge() function in R twice to merge three objects:
* **sigs$summary:** the list of significant genes stored under the get.siggenes object from the previous analysis
* **Mapping file:** an optional gene conversion table
* **original count data:** the original normalized count data used in the maSigPro analysis; will need to reload this data object without rownames in order for R to access the gene name index for this object
```
merge_obj <- merge(sigs$summary, Mapping_file, by.x="V1", by.y="GeneID")

```
```
badrows <- which(rowMeans(data.obj) < 5)
data.obj <- data.obj[-badrows ,]
```
