# __DATA__
# The dataset includes 332 CSV files, 
# each representing daily air pollution data from one monitoring site in the U.S. 
# Every file logs the date, sulfate level, and nitrate level, 
# with some missing values marked as NA.

# Part 2:
# Write a function that reads a directory full of files and reports the number 
# of completely observed cases in each data file. 
# The function should return a data frame where the first column is the 
# name of the file and the second column is the number of complete cases. 

complete <- function(directory, id = 1:332) {
  ids <- numeric(length(id))
  nobs <- numeric(length(id))
  for (j in 1:length(id)) {
    i <- id[j]
    file_id <- sprintf("%03d", i)
    file_path <- paste0("assignments/", directory, "/", file_id, ".csv")
    
    data <- read.csv(file_path)
    
    good <- complete.cases(data)
    
    nob <- nrow(data[good, ])
    if (nob > 0) {
      # Store results
      ids[j] <- i
      nobs[j] <- nob
    } else {
      next 
    }
    
  }
  result <- data.frame(id = ids, nobs = nobs)
  result
}

complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)

cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cc <- complete("specdata", 54)
print(cc$nobs)


RNGversion("3.5.1")  
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
