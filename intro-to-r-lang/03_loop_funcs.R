# =======================
#     Loop Functions
# =======================

#       __lapply__
# =======================
# loop over a list and eval a func on each element returns to a list
# lapply(list, function)

x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)
# $a
# [1] 3
# $b
# [1] -0.0474927

x <- 1:4
lapply(x, runif)
# runif -> generates random uniform variables
# x -> 1 2 3 4
# So we generate rand uniform vars based on x
# Generating random 1 uniform vars
# [[1]]
# [1] 0.7108169

# Generating random 2 uniform vars
# [[2]]
# [1] 0.710346 0.474639

# [[3]]
# [1] 0.9688282 0.5138259 0.9005831

# [[4]]
# [1] 0.59789127 0.96521355 0.25745983 0.08854886

# generate random uniform vars from 0 to 10
lapply(x, runif, min = 0, max = 10)

# used a lot with anon funcs:
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
x
# we want to extract the first column of each matrix a and b
lapply(x, function(elt) elt[,1])


#       __sapply__
# =======================
# same as lapply but try to simplify the result, if result is a list where every 
# element is length 1 then vector is return if >1 then matrix returned if it can't
# figure it out then list is returned
# sapply(list, function)
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20,1), d = rnorm(100,5))
l <- sapply(x, mean)
l


#       __apply__
# =======================
# func over the margins of an array
# apply(array, margin, ...)
str(apply)
# function (X, MARGIN, FUN, ..., simplify = TRUE)
# X: array, MARGIN: int vector indication which margins should be `retained`,
# FUN: function to be applied, ...

m <- matrix(rnorm(200), 20, 10) # 20x10 matrix

# 2 here indicades the dimmension, in our case 2nd dimmension is columns,
# and collapse 1st dimmensions which is the rows.
# Mean of all rows for each column
apply(m, 2, mean) # vector len 10 returned

# Preserve all rows and collapse all columns
apply(m, 1, sum)

# More col/row sums and means funcs much better than apply funcs
# rowSums = apply(m, 1, sum)
# rowMeans = apply(m, 1, mean)
# colSums = apply(m, 2, sum)
# colMeans = apply(x, 2, mean)


#       __tapply__
# =======================
# func over subsets of vector
# tapply(vector, index, function)
str(tapply)
# function (X, INDEX, FUN = NULL, ..., default = NA, simplify = TRUE)  
# X:vec, INDEX:factor or a list of factors, FUN:func to apply, ...

x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)

tapply(x, f, mean, simplify = FALSE)


#       __mapply__ 
# =======================
# multivariate version of lapply
str(mapply)
# function (FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE)  
# FUN: func to apply, MoreArgs: is a list of other args to FUN, SIMPLIFY: results.

list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))
# instead we can do
mapply(rep, 1:4, 4:1)


#       __split__ 
# =======================
# not a loop functions
# takes a vec or other objs and splits it into groups determined by a factor or a list of factors

str(split)
# function (x, f, drop = FALSE, ...)
# x:vec/list/data.frame, f:factor/listOfFactors, drop:empty factors levels should be dropped?

x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
split(x, f)


lapply(split(x, f), mean)

library(datasets)
head(airquality)
# mean of each value each month?
# split df montly pieces than we can calculate mean
s <- split(airquality, airquality$Month)
s
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))

# or even better output
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))


