# This function converts a data object's format from standard rpkm to required input format
# for ggplot2 violin plots.
# Currently, the function can only generate violin plots with only one categorical dimension.
# Future work can expand upon this code to format data objects for bean plots of two
# categorical dimensions.

# The function requires two inputs: the data object; and a vector of integers indicating which
# columns to analyze (ie. 1:5)

rpkm_to_VioPlotInput <- function(data, columns) {
 
  # A list is generated with each item of the list being a separate data frame for each group.
  # The first column of each item is the count data for an individual condition.
  # The second column is a repeated vector of the condition name, which indexes the count data.
  
  biglist <- list()
  for(i in columns) {
    a <- data[,i]
    b <- rep(colnames(data)[i], length(data[,i]))
    name <- paste(i)
    tmp <- list(count=a, group=b)
    biglist[[name]] <- tmp
  }
  
  # The first item of the list is denoted as the beginning of the final data object.
  # The remaining items are vertically appended.
  
  for(i in 1:length(biglist)) {
    if(i == 1) {
      bigdata <- as.data.frame(biglist[[i]])
    }
    else {
      bigdata <- rbind(bigdata, as.data.frame(biglist[[i]]))
    }
  }
  return(bigdata)
}

# Reference website below for further tutorial on using the ggplot2 violin plot module
# http://www.sthda.com/english/wiki/ggplot2-violin-plot-quick-start-guide-r-software-and-data-visualization

# Written by: Brian Ligh
