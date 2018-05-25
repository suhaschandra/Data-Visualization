rpkm_to_VioPlotInput <- function(data) {
  
  biglist <- list()
  for(i in 1:ncol(data)) {
    a <- data[,i]
    b <- rep(colnames(data)[i], length(data[,i]))
    name <- paste(i)
    tmp <- list(count=a, group=b)
    biglist[[name]] <- tmp
  }
  
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
    
  