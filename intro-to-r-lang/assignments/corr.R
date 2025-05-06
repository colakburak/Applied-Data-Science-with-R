# __DATA__
# The dataset includes 332 CSV files, 
# each representing daily air pollution data from one monitoring site in the U.S. 
# Every file logs the date, sulfate level, and nitrate level, 
# with some missing values marked as NA.

# Part 3:
# Write a function that takes a directory of data files and a threshold 
# for complete cases and calculates the correlation between sulfate and 
# nitrate for monitor locations where the number of completely observed cases 
# (on all variables) is greater than the threshold. 
# The function should return a vector of correlations for the monitors 
# that meet the threshold requirement. If no monitors meet the threshold requirement, 
# then the function should return a numeric vector of length 0. 

corr <- function(directory, threshold = 0) {
  # Create an empty vector to store correlations
  correlations <- numeric(0)
  
  # Get list of all files in the directory
  all_files <- list.files(paste0("assignments/", directory), full.names = TRUE)
  
  for (file in all_files) {
    # Read data from file
    data <- read.csv(file)
    
    # Get complete cases
    complete_data <- data[complete.cases(data), ]
    
    # Check if number of complete cases exceeds threshold
    if (nrow(complete_data) > threshold) {
      # Calculate correlation between sulfate and nitrate
      current_correlation <- cor(complete_data$sulfate, complete_data$nitrate)
      
      # Add correlation to the vector
      correlations <- c(correlations, current_correlation)
    }
  }
  
  return(correlations)
}

cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)


cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))