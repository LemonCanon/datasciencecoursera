corr <- function(directory, threshold = 0) {
    ##  'directory' is a character vector of length 1 indicating
    ##  the location of the CSV files
    
    ##  'threshold' is a numeric vector of length 1 indicating the 
    ##  number of completely observed observation (on all
    ##  variables) required to compute the correlation between 
    ##  nitrate and sulfate; the default is 0
    
    ##  Return a numeric vector of correlation
    ##  NOTE: Do not round the result:
    
    library(stringr)
    id <- 1:332
    cordata <- numeric()
    
    for (i in id){
        
        datatarget <- paste(directory, "/", str_pad(id[i], 3, pad = 0), ".csv", sep = "" ) 
        data <- read.csv(datatarget)
        
        sulf <- as.vector(data["sulfate"])
        nitr <- as.vector(data["nitrate"])
        iscomp <- complete.cases(sulf, nitr)
        totalcomp <- sum(iscomp)
        
        csulf <- sulf["sulfate"][iscomp,]
        cnitr <- nitr["nitrate"][iscomp,]
        
        if(totalcomp > threshold){
            
            newentry <- cor(csulf, cnitr)
            cordata <- c(cordata, newentry)
            
        }
        
    }
    cordata
}
    
    