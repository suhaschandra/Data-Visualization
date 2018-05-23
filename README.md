# Data-Visualization
Tutorials for various genomic data visualization approaches
## Clustering
**Disclaimer:**
This section will be written in continuation of the analysis started in the "timecourse" repository, which details a simplified pipeline for the computational statistical package "maSigPro." The following code and tutorial should still be applicable for any pipeline seeking to use the "STEM" visualization tool.

### Creating input file for STEM: Merges and Edits
After obtaining a list of significant genes from "maSigPro," use the merge() function in R twice to merge three objects:
* **sigs$summary:** the list of significant genes stored under the get.siggenes object from the previous analysis
* **Mapping file:** an optional gene conversion table
* **original count data:** the original normalized count data used in the maSigPro analysis; will need to reload this data object without rownames in order for R to access the gene name index for this object
```
merge_obj <- merge(x, y, by.x="V1", by.y="GeneID")
```
Parameters
1. **x:** first object to be merged
2. **y:** second object to be merged
3. **by.x:** name of column to be merged in x
4. **by.y:** name of column to be merged in y

The final object should be a data frame of only significant genes with their normalized count data. This object may also contain extraneous data from the mapping file that will need to be deleted in Excel after exporting as a tab delimited text file. 
```
write.table(merge_obj2, "Documents/file name", sep = "\t", quote = FALSE)
```
Edits in excel:
* correctly align column names by inserting blank cell in front of A1
* delete any columns that are not gene names, count data, or spot index
* optionally for documentation practices, name column A "SPOT"

From the first column to the last, the data file should now consist of the spot index, gene names, and the count data. The spot index is optional and should not be included if further filtering needs to be applied to the data.

### Filtering STEM input file for better clusters
While the genes in the newly created STEM input file are all signifcantly dynamic expression profiles, the level of overall expression may not be significant. Better clusters can be derived if these "bad genes" are filtered out of the input file.

Load the STEM input file back into R with the gene names as row names. Execute the following code to apply a row means cutoff filter. Re-export the filtered data set using the write.table function.
```
badgenes <- which(rowMeans(data.obj) < n)
data.obj <- data.obj[-badgenes ,]
```
Parameters
1. **data.obj:** input data file
2. **n:** integer value arbitrated as the cutoff threshold

### Operating STEM



## Scatter Plot
To create scatter plots in R, we will use the "ggplot2" package, a commonly used data visualization package that can render highly customizable graphs. For this tutorial, we will use gene expression data from a standard rpkm data file. For more details on the scatter plot function in "ggplot2," see [this guide] (http://www.sthda.com/english/wiki/ggplot2-scatter-plots-quick-start-guide-r-software-and-data-visualization)
