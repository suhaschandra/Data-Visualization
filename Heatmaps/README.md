# Heat Map

Will create heatmaps of gene expression data

## Code Overview

### Libraries
Library() loads the pre-installed packages on your device
```
library("RColorBrewer")
library(gplots)
library(lattice)
```
**RColorBrewer:** provides color schemes for maps and other graphics

**gplots:** provides various R programming tools for plotting data

**lattice:** implements a data visualization system to produce Trellis plots

If these packages have not yet been installed, run the command:
```
install.packages(package_name)
```
### Defining Colors
```
hmcol <- colorRampPalette(brewer.pal(9, "RdBu"))(100)
```
hmcol is the variable being defined

brewer.pal is the function that generates different colors from color palettes while colorRampPalette combines the colors to yield an entire color spectrum. 

Here, we are using 9 colors from the "Red-Blue" color palette with a specified range of 100 colors within the spectrum. 

### Arguments
```
inFile <- args[1]
```
args[1] gives the argument for the txt file of the merged genes list **see Getting Started**
```
outprefix <- args[2]
```
args[2] gives the argument for the 


### 

## Getting Started

Create a **txt** file in the directory you wish to work in and paste in your genes with specified rows and columns
![image](https://github.com/suhaschandra/Data-Visualization/blob/master/Screen%20Shot%202018-07-12%20at%203.58.52%20PM.png)

### Installation

Download the Git repository on your computer 

```
git clone https://url
```
This will open the gplots package from the provided github url


Next, run R from the command line

```
Rscript Repository_Name/Folder_Name/File_Name filename.txt
```

Once finished, a heat map of the genes in the txt file will have been created and saved in your specified directory.
