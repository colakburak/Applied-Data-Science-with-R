# =======================
#     IF Conditions
# =======================
num <- 33
if(num > 10) {
  print("number is bigger than 10")
} else if (num == 10) {
  print("Number is 10")  
} else {
  print("Number is smaller than 10")
}

# Or you can assign to a value
x <- 111
y <- if (x>3) {
  10
} else {
  0
}
y
# y is 10

# =======================
#       for loops
# =======================
# most used to iterate of an object of list, vector, etc.
for(i in 1:10) {
  print(i)
}

x <- c("a", "b", "c", "d")

# Below for lopps do the same task
for(i in 1:4) {
  print(x[i])
}

for(i in seq_along(x)) {
  print(x[i])
}

for(letter in x) {
  print(letter)
}

for(i in 1:4) print(x[i])

# nested for loop
x <- matrix(1:6, 2, 3)

for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
    print(x[i,j])
  }
}

# =======================
#      while loops
# =======================
count <- 0

while(count < 10) {
  print(count)
  count <- count + 1
}


# =======================
#   repeact, next, break
# =======================

# repeat: infitnite loops
# break: to break from this infitinite loop
# Below code not very logical just to represent the syntax
i <- 100
count <- 0

repeat {
  count <- count + 1
  half <- i / 2
  if(half < 0) {
    break
  }
  break
}

# next: to skip current iteration

for(i in 1:100) {
  if(i <= 20){
    ## skip the first 20 iteration
    next
  }
  ## Do something
  print(i)
}


# =======================
#      FUNCTIONS
# =======================

add <- function(a = 1, b = 1, c = NULL) {
  a + b
}

# function with default values
# they are R objects of class "function"
# a, b are arguments

class(add)
# [1] "function"

# Functions are "First class objects"; they can be treated much like any other objects:
# - Funcs can passed as args to other funcs
# - Funcs can be nested

# Return values if the last expression in the function body

# providing params to add
# as positional
add(2,3)
# as by name
add(a=2, b=3)
# as by  default params
add()

# __LAZY EVALUATION__
# R function's arguments are "Lazy Evaluated":
# Means evaluation done only when it's needed

f <- function(a, b) {
  print(a)
}
# b not evaluated
f(2)

# --

f <- function(a, b) {
  print(a)
  print(b)
}
# Only here we see the err
f(2)


# __`...` ARGUMENT__
# Special argument used to extending another func and you don't want to write same entire args
myplot <- function(x, y, type = "1", ...) {
  plot(x, y, type = type, ...)
}

# Also generic funcs use `...` so extra args can be passed to methods (More on this later)
# > mean
# function (x, ...)
# UseMethod("mean")


# =======================
#     Scoping Rules
# =======================

# Given lm func:
lm <- function(x) { x * x }
# There is also lm function comes from stats package
?lm()

# R needs to bind a value to a symbol.
# In CLI, R retrieve value of it's object in this order:
#   1 - Search ".GlobalEnv" for a symbol name matching the one requested
#   2 - Search the namespaces of each of the packages on the search list
#   3 - Last search always the "package:base"

search()
# lm we defined above it exists in the ".GlobalEnv"
# somewhere in the packages we also have "package:stats" where lm comes from


# __SCOPING__
# `Lexical Scoping` in R:
# The values of free vars are searched for in the env in which the func was defined.

# What is an env?
#   - An env is a collection of (symbol, value) pairs. ie (x, 3.14)
#   - Every env has a parent env. It is possible for an env to have multiple `children`
#   - the only env without a parent is the empty env
#   - A func + an env = `closure` or `function closure`

f <- function(x, y) {
  x^2 + y / z 
  # z is `free variable`, Scoping rules will determines what will be the value of z
  # `free variables` aren't formal args nor local vars
}
f(2,3)
# search starts from the env where func was defined
# if z not in func's defined env from search() list search continues with parents. 
# Until we hit the `empty env` -> finally error is thrown indicating z is not found
# i.e. search pattern for z
# Empty env <- Global Env <- Child env <- Child of Child (Func defined here)

# Why we care?
make.power <- function(n) {
  pow <- function(x) {
    x ^ n
  }
  pow
}

cube <- make.power(3)
square <- make.power(2)

cube(3)
square(3)

# What's in a func's env?
ls(environment(cube))
get("n", environment(cube))

ls(environment(square))
get("n", environment(square))


