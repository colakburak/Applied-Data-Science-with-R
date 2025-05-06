# __DATA__
# The dataset includes 332 CSV files, 
# each representing daily air pollution data from one monitoring site in the U.S. 
# Every file logs the date, sulfate level, and nitrate level, 
# with some missing values marked as NA.

# Part 1:
# Write a function named 'pollutantmean' that calculates the mean of a pollutant 
# (sulfate or nitrate) across a specified list of monitors. 
# The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', 
# and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that 
# monitors' particulate matter data from the directory specified in the 
# 'directory' argument and returns the mean of the pollutant across all of the 
# monitors, ignoring any missing values coded as NA. 

# Example Usage:
#> pollutantmean("specdata", "sulfate", 1:10)
## [1] 4.064128

#> pollutantmean("specdata", "nitrate", 23)
#> ## [1] 1.280833

pollutantmean <- function(directory = "specdata", pollutant, id = 1:332) {
  total_sum <- 0
  total_count <- 0
  
  for (i in id) {
    file_id <- sprintf("%03d", i)
    file_path <- paste0("assignments/", directory, "/", file_id, ".csv")
    
    data <- read.csv(file_path)
    
    non_na_values <- data[[pollutant]][!is.na(data[[pollutant]])]
    
    total_sum <- total_sum + sum(non_na_values)
    total_count <- total_count + length(non_na_values)
  }
  
  total_sum / total_count
  
}

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "sulfate", 34)
pollutantmean("specdata", "nitrate")
