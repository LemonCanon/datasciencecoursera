pollutanmean <- function(directory, polutant, id = 1:332) {
    ##'directory' is a character vector of length 1indicating
    ##'the location of the CSV files
  
    ##'pollutant' is a character vector of length 1 indicating 
    ##'the name of the pollutant for which we will calculate the 
    ##'mean; either "sulfate" or "nitrate".
  
    ##'id' is an integer vector indicating the monitor ID numbers
    ##'to be used

    ## return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## do not round the result!
    
    ##--------------------------------------------------------------------------
    library(stringr)
    means <- numeric()
    
    for(i in 1:length(id)){
    
        ##select data to be read
        datatarget <- paste(directory, "/",str_pad(id[i],3,pad = 0), ".csv", sep = "" )
    
         ##read data and store it to memory
        data <- read.csv(datatarget)
    
        pdata <- data[polutant]
    
        cleandata <- pdata[!is.na(pdata)]
        ##take mean of datapoints
    
        meanfile <- mean(cleandata)
    
        ##store mean of file
        means[i] <- meanfile
    }
    mean(means)
    
    ##take mean of all files in list

}