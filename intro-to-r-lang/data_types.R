# ========================
# Variable Assignment in R
# ========================

# Assignment Operator `<-`, `=`, `->`
x <- 1
y = 2
3 -> z

# Console prompting
print(x)  # Prints the object
x         # Auto-prints the object when in interactive mode

# You can reassign values easily (mutable):
x <- 2      # `x` is now a numeric vector with a single element: 2
x <- 1:20   # The `:` operator creates a sequence from 1 to 20 (reference below)

# ========================
#      DATA TYPES IN R
# ========================

# In R, everything is an OBJECT.

# R has 5 basic atomic classes of objects:
# 1. character ('a', "good", '23.5')
# 2. numeric (real numbers)
# 3. integer (2L, 34L, 0L)
# 4. complex (2+5i)
# 5. logical (TRUE/FALSE)
# Bonus. raw ("Hello" is stored as 48 65 6c 6c 6f)

# The most basic object type in R is a vector.
# - A vector can only contain elements of the same class.
# - The one exception is a `list`, which is technically a type of vector
#   but can contain objects of different classes. (e.g. python list vs numpy array)

# You can create empty vectors using the `vector()` function:
empty <- vector()  # Creates an empty vector

# Specifying type and length when creating a vector:
v1 <- vector(mode = "integer", length = 100)  # A vector of 100 integers

# =======================
#        NUMBERS
# =======================

# Generally, all numbers in R are treated as numeric objects (double precision real numbers).
# If you want to create an integer, use the `L` suffix:
int_example <- 12L  # This creates 12 as an integer
typeof(int_example) # > "integer"

# Special numeric values:
# - `Inf` represents infinity. For example, 1/0 gives Inf.
1 / Inf  # Returns 0
Inf + Inf  # Returns Inf

# - `NaN` represents "Not a Number", typically the result of an undefined calculation:
0 / 0  # Returns NaN

# =======================
#      ATTRIBUTES
# =======================

# Objects can have various attributes, such as:
# - Names
# - Dimensions (e.g., matrices, arrays)
# - Class
# - Length
# - User-defined attributes (via `attributes()` function)

# =======================
#        VECTORS
# =======================

# Creating a numeric vector with the `c()` function:
x <- c(0.5, 0.2)

# Creating a numeric vector of specified length:
y <- vector("numeric", length = 10)  # A numeric vector of length 10, filled with 0s

# If you provide multiple diff type to this vector creation it takes the commons:
# Via Conversion
vec_w_diff_types = c(1.2, 'burak', 3.32, 3L) #> this is vec of chars

# Creating vector sequence from-to [9,29]
x <- 9:29


# =======================
#   Conversion (as.*)
# =======================
x <- 0:6
class(x) # Integer
as.numeric(x)
as.logical(x)
as.character(x)
as.complex(x)

# This not always works:
x <- c("a", "b", "c")
as.numeric(x) #> NA NA NA


# =======================
#        Lists 
# =======================
# special type of vectors (like python lists)
# Like a vector but can contain of different classes, numeric, char etc together

x <- list(1, "a", TRUE, 1+4i)
x # Prints bit different than vectors
# Element of lists has double brackets where vectors has single bracket.


# =======================
#        Matrix 
# =======================
# vectors with dimension attribute
# dimension attribute is itself an integer vector of length2 (nrow, ncol)

m <- matrix(nrow = 2, ncol = 3)

dim(m)
attributes(m)


# Matrices fill up by columns, you fill 1st col then 2nd ... nth col.
m <- matrix(1:6, nrow = 2, ncol = 3)
# > m
#     [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6


# Matrices can be created also by adding the dimmension attrbs to vecs
v <- 1:10
# > v
# [1]  1  2  3  4  5  6  7  8  9 10

dim(v) <- c(2,5)

#     [,1] [,2] [,3] [,4] [,5]
# [1,]    1    3    5    7    9
# [2,]    2    4    6    8   10


# Another way is Binding cols or binding rows `cbin()` & `rbind()`
x <- 1:3
# 1 2 3
y <- 10:12
# 10 11 12

# Column bind
m <- cbind(x, y)
#      x  y
# [1,] 1 10
# [2,] 2 11
# [3,] 3 12

# Row bind
n <- rbind(x, y)
#     [,1] [,2] [,3]
# x    1    2    3
# y   10   11   12


# =======================
#        Factors 
# =======================
# special type of vectors
# used to represent categorical data, can be ordered or unordered.
# Think as int vector but int has label. (e.g. male:1 female:2)

# x is Factor w/ 2 levels "no", "yes": 2 2 1 2 1
x <- factor(c("yes", "yes", "no", "yes", "no"))

# Now this is 3 levels: 3 3 2 3 2 1
y <- factor(c("yes", "yes", "no", "yes", "no", "maybe"))

# You can use table() and unclass() methods to see the mappings and relationships w/ ints.

# Order of the levels can be set using levels argument to factor()
z <- factor(c("yes", "yes", "no", "yes", "no"),
            levels = c("yes", "no"))

# x
# [1] yes yes no  yes no 
# Levels: no yes

# z
# [1] yes yes no  yes no 
# Levels: yes no


# =======================
#     Missing Values 
# =======================
# missing vals denoted by `NA` or `NaN` for undefined math operations.

# is.na() and is.nan() functions can be used to test obj if they are na, nan

# NaN valie is also NA but not other way around. NA values also have classes.

x <- c(1, 2, NA, 3)
is.na(x)
# [1] FALSE FALSE  TRUE FALSE
is.nan(x)
# [1] FALSE FALSE FALSE FALSE

y <- c(NaN, 2, NA, 3)
is.na(y)
# [1]  TRUE FALSE  TRUE FALSE -> na : {na, nan}
is.nan(y)
# [1]  TRUE FALSE FALSE FALSE -> nan : nan


# =======================
#       Data Frames 
# =======================
# used to store tabular data (like pandas data frames)
# - They represent as special type of list, where every element (column) of the list has to have same length
# - However each column doesn't have to be the same type
# - Unlike Matrices, dfs can store different classes of objs in each column.
# - dfs also have a special attribute called `row.names`

# usually created by reading:
read.table(...)
read.csv(...)
# or you can directly create via:
x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
#    foo   bar
# 1   1  TRUE
# 2   2  TRUE
# 3   3 FALSE
# 4   4 FALSE
nrow(x)
ncol(x)


# =======================
#     Names Attribute 
# =======================
# R objs can also have names
x <- 1:3

names(x)
# NULL

names(x) <- c("foo", "bar", "norf")
names(x)
# foo  bar norf 
#  1    2    3 

# lists can also have names
y <- list(a=1, b=2, c=3)
names(y)

# and matrices
m <- matrix(1:4, nrow = 2, ncol = 2)
# name row, name col
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m
#   c d
# a 1 3
# b 2 4

# =======================
#   Subsetting Objects 
# =======================
# operator -> `[]`, `[[]]`, `$`
# `[]` -> always returns an obj of the same class as the original, can be used for multiple elements
# `[[]]` -> extract elements of a list or df, it can only be used to get single element
# `$` -> used to get elements of a list or df by *name*, semantic are similar to hat of `[[]]`

x <- c("a", "b", "c", "c", "d", "a")
# First element
x[1]
# Sequence of element
x[1:4]

# Logical index also can be done as
x[x > "a"] # comparison
# Also more fancier way of doing can be:
u <- x > "a" # vector that hold Logical values if x elements bigger than 'a'
u
# Values actually bigger than 'a'
x[u]


## Subsetting Lists
# 2 element list
x <- list(foo = 1:4, bar = 0.6)

# list that has: foo(name) + sequence(values):
x[1]
# only sequence:
x[[1]]

# element associated with bar
x$bar
# same as above
x[["bar"]]
# list with element bar in it
x["bar"]
