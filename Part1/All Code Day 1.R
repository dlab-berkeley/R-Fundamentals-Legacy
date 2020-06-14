# R Script for Students to Follow

# Part 1: Introduction

## Installing Packages

### You can install packages with the "install.packages" command as follows
### If you already have these installed DO NOT run the following code - it will
### take a long time to run
install.packages(c("ggplot2", 
                   "knitr", 
                   "psych", 
                   "rmarkdown", 
                   "reshape2", 
                   "swirl"), 
                 dependencies = TRUE)

## Loading Libraries

### After installing packages you can load libraries to work with them later
### Note that once you have installed a package, you can just use the "library"
### function when you want to use it later on

library(ggplot2)
library(knitr)
library(psych)
library(rmarkdown)
library(reshape2)

## Get help documentation Using ?

?read.csv
?class
?hist

## Calculate the mean

mean(c(100, 1000, 10000))

# Part 2: Variable Assignment

### Try assigning the value "5" to the variable "number" and then run "number"
number = 5
number

## Use ls() to see all of the variables you defined

ls()

## You can use the "TAB" key to fill in a variable

numb

## Variables will be overwritten if you redefine them. What happens to "UC Berkeley" when you run this code?

welcome = "UC Berkeley" 
welcome

welcome = "Barrows Hall"
welcome

## Try saving new values as new variables.

welcome2 = "UC Davis"
welcome2
class(welcome2)
ls()

## Removing Variables. rm() will remove a variable, ls() will list all variables in scope

rm(welcome)
ls()
welcome

## Remove All Variables with rm(list = ls())

rm(list = ls()) 
ls()

# Part 3: Data Classes and Coercion

### Assign 5 to "number" and check its class. 

number = 5
class(number)

## Character Class: Define welcome = "Welcome to the D-Lab" and check its class

welcome = "Welcome to the D-Lab"
ls()
class(welcome)

#### Single and double quotes work similarly
contraction = 'I am hungry.'
contraction = "I am hungry."

#### You can nest single quotes inside of double quotes
contraction = "I'm hungry"

#### Or, you can use all single quotes along with escape characters
contraction = 'I\'m hungry'

## Logical Data. Logical data will check to see if a condition is TRUE or FALSE.

logical_variable = TRUE
logical_variable
class(logical_variable)

logical_variable + 2
logical_variable - 4

## Boolean. Boolean data types evaluate whether a statement is TRUE. Check the following:

FALSE < TRUE # less than
TRUE >= TRUE # greater than or equal to
TRUE == TRUE # equivalent to (equal to)
TRUE == FALSE
FALSE == FALSE
FALSE != FALSE # not equivalent to (not equal to)
FALSE != TRUE

TRUE & TRUE # boolean "and"
TRUE & FALSE

TRUE | TRUE # boolean "or"
TRUE | FALSE

## Numerical Vectors. We can put numeric data together into vectors.

num_vec = c(2, 5, 8, NA, NA)
num_vec

mean(num_vec, na.rm = FALSE) # Does not work. 

mean(num_vec, na.rm = TRUE) # Works properly. 

(2 + 5 + 8) / 3 # Do it manually! (sanity check)

# Part 4 Data Structures

## Paste characters together. 

pangram = paste("The", 
                "quick", 
                "brown", 
                "fox", 
                "jumps", 
                "over", 
                "the", 
                "lazy", 
                paste0("dog", "."))
pangram

## Splitting Strings with the "strsplit" function

words = strsplit(pangram, split = " ")
words 

## Subset string by position

sub_text = substr(pangram, start = 4, stop = 11)
sub_text

## Gsub string substitution. This is an example of a regular expression.

pangram
hippo = gsub("cow", "hippopotamus", pangram)
hippo

## Numeric Vector

numeric_vector = c(234, 31343, 78, 0.23, 0.0000002)
numeric_vector
class(numeric_vector)
length(numeric_vector)

### turn off scientific notation
options(scipen = 999)
numeric_vector

## Index a vector

numeric_vector[3]
class(numeric_vector[3])

## Add items to a vector

numeric_vector2 = c(numeric_vector, c(0.1, 0.2, 0.3))
numeric_vector2

## Generate a sequence of numbers

sequence = seq(from = 0, to = 8, by = 1)
sequence

0:8

sequence_object = c(28:36)
sequence_object 

0:length(numeric_vector)

## Set Seed. This ensures that when you use probabilstic functions that they can be replicated. For example, if you sample a dataset, you will always get the same sample.

?set.seed

# Sample numbers from the uniform distribution
?runif

# Sample numbers from the normal distribution. 
?rnorm

# Sample numbers, logical values, character strings, etc.
?sample

## Pseudo-Random Sampling

set.seed(1)

# 10 random samples from the uniform distribution between the numbers one hundred and one million
uniform = runif(n = 10, min = 100, max = 1000000) 
uniform
class(uniform)

# 10 random samples from the standard normal distribution with a mean of 0 and standard deviation of 1
normal = rnorm(n = 10, mean = 0, sd = 1) 
normal
class(normal)

# 10 random samples from between the numbers 1990 and 2010. 
# Note that `replace = TRUE` signifies that it is OK to reuse numbers already selected.
integer = sample(x = 1990:2010, size = 10, replace = FALSE) 
integer
class(integer)

# 10 random samples from a character vector
character = sample(c("Canada", "USA", "Mexico"), 10, replace = TRUE) 
character
class(character)

# 10 random samples from a logical vector
logical = sample(c(TRUE, FALSE), 10, replace = TRUE) 
logical
class(logical)

# Part 5: Data Frames

## Make a dataframe

set.seed(1)
(uniform = runif(n = 10, min = 100, max = 1000000))
(normal = rnorm(n = 10, mean = 0, sd = 1))
(integer = sample(x = 1990:2010, size = 10, replace = FALSE))
(character = sample(c("Canada", "USA", "Mexico"), 10, replace = TRUE))
(logical = sample(c(TRUE, FALSE), 10, replace = TRUE))

gdp = data.frame(uniform, normal, integer, character, logical, 
                 stringsAsFactors = FALSE)

gdp

## Check Structure of dataframe

str(gdp)

## Check information about dataframe

### View the dimensions (nrow x ncol) of the data frame:
dim(gdp) 

### View column names:
colnames(gdp)

### View row names (we did not change these and they default to character type)
rownames(gdp)
class(rownames(gdp))

## Change column order

gdp = gdp[,c("country", "year", "gdpPercap", "growth_rate", "healthy")]
gdp

## Sort data

gdp_sorted = gdp[order(gdp$country, gdp$year),]
gdp_sorted

## Factor Data

str(gdp) # "country" is character type. 
gdp$Country = factor(gdp$country) # Convert "Country" to factor type. 
str(gdp) # "Country" is now factor type!

gdp$Country
levels(gdp$Country)

## Changing Factor Levels

gdp$country  # Levels: Canada, Mexico, USA (default alphabetical sort)

#### What if we want to change the factor level sort to Levels: Mexico, USA, Canada?

gdp$country = factor(gdp$Country, levels = c("Mexico", "USA", "Canada"))
gdp$country # The level order has changed. 

# Part 6: Lists and Matrices

## Make a list

list1 = list(TRUE, "one", 1) # include three kinds of data: logical, character, and integer
list1
class(list1)

## Can't operate on lists

list1 * list(FALSE, "zero", 0) # Error

## Make a matrix

matrix1 = matrix(data = 1:12, nrow = 4, ncol = 3) 
matrix1
class(matrix1)

## Coerce vector to matrix

### Create a numeric vector from 1 to 20
vec1 = c(1:20)
vec1
class(vec1)

### Coerce this vector to a matrix with 10 rows and 2 columns:
matrix2 = matrix(vec1, ncol = 2)
matrix2
class(matrix2)

# Part 7: Exporting and Practice

## Get working directory

getwd()