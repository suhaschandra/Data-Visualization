# Heat Map

Will create heatmaps of gene expression data or luminex data, with and without hierarchical clustering of row entities.

### Arguments
```
inFile <- args[1]
```
**args[1]** gives the argument for the txt file of the merged genes list **see Getting Started**
```
outprefix <- args[2]
```
**args[2]** gives the argument for the pdf prefix of the heatmap output file 


### Running code

Create a **txt** file in the directory you wish to work in and paste in your genes with specified rows and columns
<img src="https://github.com/suhaschandra/Data-Visualization/blob/master/Screen%20Shot%202018-07-12%20at%203.58.52%20PM.png" width="575" height="350" />

Download the Git repository on the computer 

```
git clone https://url
```
Next, run R from the command line

```
Rscript Repository_Name/Folder_Name/File_Name <Input_file> <Output_Prefix>
```

### Sample Output

2 output files will be generated, a clustered heatmap and an unclustered heatmap

<img src="https://github.com/suhaschandra/Data-Visualization/blob/master/Screen%20Shot%202018-07-24%20at%2011.54.57%20AM.png" width="275" height="50" />

<img src="https://github.com/suhaschandra/Data-Visualization/blob/master/Screen%20Shot%202018-07-24%20at%2011.09.00%20AM.png" width="400" height="600" />

<img src="https://github.com/suhaschandra/Data-Visualization/blob/master/Screen%20Shot%202018-07-24%20at%2011.09.49%20AM.png" width="550" height="550" />

### Testing out the code

To test run the code, see the sample text file located in the repository.
