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
Scatter plots can be useful for comparing gene expression of two different observation points. By plotting the control observation on the x axis and the non-control observation on the y axis, up and down regulation of genes can be easily seen. Genes that do not vary in expression between the two observations should lie upon or at least close to the y=x line. Up regulated genes will be located above the y=x line. Down regulated genes will be located below the y=x line. 

To create scatter plots in R, we will use the "ggplot2" package, a commonly used data visualization package that can render highly customizable graphs. For this tutorial, we will use gene expression data from a standard rpkm data file. For more details on the scatter plot function in "ggplot2," see (http://www.sthda.com/english/wiki/ggplot2-scatter-plots-quick-start-guide-r-software-and-data-visualization)
```
ggplot(data.obj, aes(x =___, y =___)) + geom_point() + geom_abline() + geom_smooth(method = lm)
```
The "ggplot2" package uses a modular design that organizes different customizable features such as points and trace-lines into separate functions that can be added to the graph initialization. For scatterplots, we will focus on using the geom_point, geom_abline, and geom_smooth modules.

### Graph Initialization Module
```
ggplot(data.obj, aes(x =___, y =___))
```
This function initializes the graph space and properly sizes the axis depending on the inputs selected. This function also supports separation by a group dimension if specified, but is not important for this specific application.
1. **data.obj**: the data frame that vectors x and y will correspond; ie. the rpkm file
2. **x**: desired x-axis; ie. one observation column that belongs to the control group
3. **y**: desired y-axis; ie. one observation column that belongs to a non-control group

### Data Point Module
```
+ geom_point(shape =___, size =___, colour =___)
# or
+ geom_point()
```
This function creates the data points for the different combinations of x and y. Aesthetic features can be specified or omitted.
1. **shape**: any integer from (0:25); http://www.sthda.com/english/wiki/ggplot2-point-shapes 
2. **size**: numeric value; default size is 0.5
3. **colour**: character value; ie. "red"

### Reference 0 Change line
```
+ geom_abline()
```
This function creates a 0 expression change, reference line along the function y=x. We can customize the intercept and slope of the line produced by this function, but these options do not need to be considered for this application.

### Regression Line Module
```
+ geom_smooth(method = lm, se = TRUE, fullrange = FALSE, level = 0.95)
# or
+ geom_smooth(method = lm)
```
This function creates a regression line through the scatter plot. Regression lines can help identify trends in expression.
1. **method**: indicates what line, function, or model to fit to the data; "lm" = linear model
2. **se**: boolean value indicating whether to include a confidence interval visualized by a shaded region around the line
3. **fullrange**: boolean value indicating whether to fit to the full range of the plot
4. **level**: confidence interval level

### Additional Modules (axis transformations, names)
```
+ scale_x_continuous(trans = 'log2')
+ scale_y_continuous(trans = 'log2')
```
These functions will scale the axis logarithmically.

```
+ geom_text(label = rownames(data.obj))
```
This function will label each data point on the scatter plot.
