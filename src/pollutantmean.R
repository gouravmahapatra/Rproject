pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## This function calculates the mean values for a few given fields 
  ## from the "specdata" dataset.
  
  ## set the main path
  dat_path <- paste("../",directory,"/",sep = "")
  ## make a for loop to go through the ids and read the data from .csv files.
  for (i in seq_along(id)) {
    file_name <- sprintf("%03d.csv",id[[i]])
    dat <- read.csv(paste(dat_path,file_name,sep=""))
    ## find the mean 
    mean_val <- mean(dat[[pollutant]],na.rm = TRUE)
    if(i == 1){
      mean_list <- mean_val   # create the list
    }
    else{
      mean_list <- c(mean_list,mean_val)  # update the list
    }
  }
  df <- data.frame(ids = id,mean_vals=paste(mean_list),type=pollutant) 
  df
}