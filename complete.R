complete <- function(directory, id = 1:332){
    ##  'directory' is a character vector of length 1 indicating
    ##  the location of the CSV files
    
    ##  'id' is an integer vector indicating the monitor ID numbers 
    ##  to be used
    
    ##  Return a data frame of the form:
    ##  id   nobs
    ##  1    117
    ##  2    1041
    ##  ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    ##initiallize
    library(stringr)
    comdata <- numeric()
    
    for(i in 1:length(id)){
        
        ##select data to be read
        datatarget <- paste(directory, "/", str_pad(id[i], 3, pad = 0), ".csv", sep = "" )
        
        data <- read.csv(datatarget)
         
        ## calculate number of complete values in each data file
        iscomp <- complete.cases(data["sulfate"], data["nitrate"])
        totalcomp <- sum(iscomp)
         
        ## create a vector of the number of complete values in each data file
        comdata[i] <- totalcomp
    }
    
    data.frame("id" = id, "nobs" = comdata)
}


