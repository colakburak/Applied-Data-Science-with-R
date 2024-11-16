# Assignment Operator `<-`
x <- 1
print(x)  # Prints the object
x         # Auto-prints the object when in interactive mode

# You can reassign values easily:
x <- 2      # `x` is now a numeric vector with a single element: 2
x <- 1:20   # The `:` operator creates a sequence from 1 to 20

# ========================
#      DATA TYPES IN R
# ========================

# In R, everything is an OBJECT.
# R has 5 basic atomic classes of objects:
# 1. character
# 2. numeric (real numbers)
# 3. integer
# 4. complex
# 5. logical (TRUE/FALSE)

# The most basic object type in R is a vector.
# - A vector can only contain elements of the same class.
# - The one exception is a `list`, which is technically a type of vector
#   but can contain objects of different classes.

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
