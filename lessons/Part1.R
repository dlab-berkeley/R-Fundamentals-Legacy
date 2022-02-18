# R Fundamentals: Part 1 of 4

# Section 1: Navigating RStudio

## By default, this script will open in the upper left pane of RStudio. You can open a new script by clicking File --> New File --> R Script.

## Most of the time, RStudio will be organized in the following four panes:

## 1. Script (upper left): This is where you view and edit most files, such as scripts, RMarkdown notebooks, etc.
## 2. Console (lower left): You can use this to enter R commands on the fly. Furthermore, most R output will appear here.
## 3. Global Environment (upper right): Saved variables, functions, and other R objects will appear here.
## 4. Misc (lower right): A variety of other tabs which allow you to navigate your file system, view plots, install packages, view help, etc.

## RStudio also has a lot of helpful customizations to improve your experience:

## Click Tools --> Global Options --> Appearance to change your color and font settings.
## Click Tools --> Global Options --> Code and check the box that says "Soft-wrap R source files" to wrap the text in your script to the width of the script pane.
## Click Tools --> Global Options --> Code --> Display and check the boxes that say "Highlight selected line" and "Highlight R function calls". These will provide helpful highlighting as you edit your files.

# Section 2: Variable Assignment

## Try assigning the value "5" to the variable 'number' and then run 'number'.
## To run a line of code, place your cursor on a line of runnable code and click the "Run" button or click Ctrl + Enter (PC) or command + Enter (Mac).
number <- 5
number

## You can also use the '=' operator to do variable assignment. 
number = 5
number

## There are subtle differences between '<-' and '=', which won't matter in most cases. However, using '<-' is considered good code style. You want your code to adhere to good stylistic practices, since that makes it easier to read and use by other users.

## You can perform basic arithmetic in R:
number + 1
number - 2
number * 3
number / 4

## Use a hashtag to comment your code (e.g., write notes to your future self and your collaborators) to help keep your script organized. 

## Press Ctrl + l on both Mac and PC to clear your console. This does not erase any data. It simply moves the console prompt (the greater-than symbol: >) up to the top to improve readability. 

# Section 3: Functions and Arguments

## Functions perform actions on inputs. They are followed by trailing round parentheses.
## Arguments are the inputs - values, expressions, text, entire datasets, etc. You tell a function what arguments it needs inside the parentheses. Sometimes, these arguments are "named". This is helpful when you need to enter multiple arguments: the names tell R which arguments correspond to what variables you're passing into the function.

## Use the ls() function to see all of the variables you have defined.
## Notice that ls() does not take any arguments!
ls()

## You can use the "TAB" key to autocomplete a variable.
## Place your cursor after the 'b' in 'numb' below and press TAB.
## This works for variables and functions alike.
numb

## Place your cursor after the 'e' in 'me' below and press TAB
## Notice how you can get the mean() function 
me

## Variables will be overwritten if you redefine them.
## What happens to "UC Berkeley" when you run this code?
welcome <- "UC Berkeley" 
welcome

welcome <- "Social Sciences Building"
welcome

## Try saving new values as new variables:
welcome2 <- "UC Davis"
welcome2

# The class() function tells the data class/type of the variable and requires one argument
class(welcome2)
ls()

## Removing Variables. rm() will remove a variable
rm(welcome)
ls()
welcome # Error

## Remove all variables with rm(list = ls()).
## Notice that this is the first function we're using with a named argument!
## Or, click the broom icon at top of 'Environment' pane.
rm(list = ls()) 
ls()

## If we look at the documentation for rm(), we see a '...' for the first argument. This means we simply provide it all the variables we'd like to remove.
?rm
## Let's see this in action:
var1 <- 1
var2 <- 2
var3 <- 3
ls()
rm(var1, var2)
## What variables are left?
ls()
## Finish removing all variables:
rm(list = ls())

### Challenge 1: Variable Assignment
### Define three variables and then write a mathematical expression using only those variables.

# Section 4: Data Classes and Coercion

## There are five main classes of data we will work with in this workshop:
## 1. numeric: decimals (the default for ALL numbers in R).
## 2. integer: whole numbers (positive and negative, including zero).
## 3. character: text strings (always wrapped in quotations).
## 4. logical: TRUE or FALSE (1 or 0).
## 5. factor: nominal or ordinal categorical type.

# Section 4.1: Numerics
## Assign 5 to 'number' and check its class. 
number <- 5
number
class(number)

# Section 4.2: Integers
## Coerce 'number' to integer type with the as.integer() function:
number_int <- as.integer(number)
number_int
class(number_int)

## Section 4.3: Characters
## Define welcome <- "Welcome to the D-Lab" and check its class:
welcome <- "Welcome to the D-Lab"
class(welcome)
ls()

## Single and double quotes work similarly:
contraction <- 'I am hungry.'
contraction

contraction <- "I am hungry."
contraction

## You can nest single quotes inside of double quotes:
contraction <- "I'm hungry"
contraction

## Or, you can use all single quotes along with escape characters:
contraction <- 'I\'m hungry'
contraction

## However, you cannot nest single quotes inside of single quotes.

## Section: 4.4 Logicals
## Logical data will check to see if a condition is TRUE (1) or FALSE (0).
class(TRUE)
class(FALSE)

## Since TRUE and FALSE are stored as 1 and 0, they take on mathematical properties:
TRUE + 2
FALSE - 4

## Boolean data types evaluate whether a statement is TRUE. Check the following:
FALSE < TRUE # less than
TRUE >= TRUE # greater than or equal to
FALSE == FALSE # equivalent to (equal to)
"Mac" == "mac" # R is case sensitive
FALSE != FALSE # not equivalent to (not equal to)
"PC" != "Windows"

## Boolean 'and' (all conditions must be satisfied):
TRUE & TRUE 
TRUE & FALSE

## Boolean "or" (just one condition must be satisfied):
TRUE | TRUE 
TRUE | FALSE

# Section 4.5: Factors

## A factor variable is a set of categorical or ordinal values. To create a factor variable, we first need a vector. We'll return to factors in the next section after we've learned about vectors.

### Challenge 2: Data type coercion
### Like as.integer, other "as dot" functions exist as well, such as as.numeric, as.character, as.logical, and as.factor.
### 1. Define three variables: one numeric, one character, and one logical

### 2a. Can you convert numeric to integer type?

### 2b. Convert numeric to logical?

### 2c. Convert numeric to character?

### 2d. Convert logical to character?

### 2e. Convert character to numeric?

# Section 5: Data Structures

## There are four main functions you can use to form more complex data structures:
## 1. c(): ordered groupings of the SAME type of data (called "vectors").
## 2. data.frame(): and ordered group of equal-length vectors; also like a list.
## 3. list(): store heterogeneous data.
## 4. matrix(): like a vector, but can be ordered into rows and columns.

## Helpful tip: Type a question mark before a function name to view the help pages. Read the "Description" section for a definition. The "Usage" section shows what arguments can be passed into the function and the "Arguments" section provides definitions of the individual parameters/arguments. Also see the "Details", "References", and "Examples" sections for more information.

# Section 5.1: Vectors
## A vector is an ordered group of the *same* type of data. We can we can create vectors by concatenating data together with the c() function:
vec <- c(2, 5, 8, 11, 14)
vec

## We can also store missing values in a vector using the NA keyword:
vec <- c(2, 5, 8, NA, NA)
vec

# View the help page for the arithmetic mean function:
?mean

mean(vec, na.rm = FALSE) # Does not work due to missing data.

mean(vec, na.rm = TRUE) # Works properly. 

(2 + 5 + 8) / 3 # Do it manually! (sanity check)

## It does not matter what type the data is contained within the vector, as long as it is all the same:
numeric_vector <- c(234, 31343, 78, 0.23, 0.0000002)
numeric_vector
class(numeric_vector)
length(numeric_vector) # There are five elements in this vector.

## Indexing a vector
## To index a vector means to extract an element based on its position.
## For example, if we want to return just the third thing from "numeric_vector", we would use square brackets and type:
numeric_vector[3]
class(numeric_vector[3])

## We can also add items to a vector using another c() function:
numeric_vector2 <- c(numeric_vector, c(0.1, 0.2, 0.3))
numeric_vector2

## We can use the seq() function to create a vector according to a sequence:
?seq
sequence <- seq(from = 0, to = 8, by = 1)
sequence

decimals <- seq(from = 0, to = 2, by = 0.25)
decimals

## Extract just the 4th element:
decimals[4]

## When we want a numeric vector with entries separated by 1, we can also use the colon operator: 
0:8

colon_vector <- c(28:36)
colon_vector 

0:length(colon_vector)

# Vectors can contain other types, too. Consider the following examples:
character_vector <- c("Canada", "United States", "Mexico")
character_vector
class(character_vector)

logical_vector <- c(TRUE, FALSE, TRUE, FALSE, TRUE)
logical_vector
class(logical_vector)

## R also provides the operator %in% to test if a value belongs to a vector. 
TRUE %in% logical_vector
"Canada" %in% character_vector
26 %in% colon_vector

## The %in% operator can be very useful if you have multiple elements that you want to check. 
c(29, 31) %in% colon_vector
c("Canada", "Ethiopia") %in% character_vector

### Challenge 3: Concatenating vectors
### 1. Create a vector starting from 10, and ending with 30, with each entry separated by 2.

### 2. Index the 3rd through 7th elements of this vector.

### 3. Index the 3rd through 7th elements and the 10th element.

# Section 4.5: Factors (interlude)

## Remember above when we talked about factors are how R refers to categorical data?
## Categorical data can be important when you are performing calculations or making visualizations by group. This way, R knows that the numeric or character data should have grouping properties.
## "Levels" are the groups contained within the factor variable itself.

## Let's create a vector of countries. We'll assume that our dataset will only refer to these three countries, i.e., they're categorical values:
countries <- c("Canada", "Mexico", "United States", "Mexico", "Canada")

## We can create a factor using the factor() function:
countries_factor <- factor(countries)
countries_factor

## Note that factors are *ordered* groupings. Here, R chose the ordering to be alphabetical, by default. We could have specified something else using the "levels" argument:
countries_factor <- factor(countries, levels = c("United States", "Mexico", "Canada"))
countries_factor

## Factors can also be created using numeric values:
numeric_factor <- factor(c(1, 2, 1, 2, 3, 1))
numeric_factor

# Section 5.2: Data frames
## A data frame is an ordered group of equal-length vectors.
## Think of a data frame as a spread sheet you would open in MS Excel.
## Since they are vectors, each column can only contain the same data type, but columns of different types can be lined up next to each other.
## Meanwhile, rows can contain heterogeneous data.

## Let's create a dataframe capturing some information about countries:
countries <- c("Canada", "Mexico", "United States")
populations <- c(10, 20, 30)
areas <- c(30, 10, 20)

## We can create the data frame with the data.frame() function.
## The equal-length vectors are the arguments.
## Notice that the name of each variable becomes the name of the column.
df <- data.frame(countries, populations, areas)
df

## If we wanted to change the column names, we can specify that with the function argument:
df <- data.frame(country = countries, population = populations, area = areas)
df

## Check the compact structure of the data frame:
str(df)

## View the dimensions (nrow x ncol) of the data frame:
dim(df) 

## View column names:
colnames(df)

## View row names (we did not change these and they default to character type):
rownames(df)
class(rownames(df))

## Rename columns
## You can rename columns by assigning a vector of equal length to the colnames function on the left side of the equation:
colnames(df) <- c("Country", "Population", "Area")
df

## You can also change column order (this is a preview of Part 2: subsetting operations):
df <- df[, c("Area", "Country", "Population")]
df

## You can extract a single column with the $ operator:
df$Country

## The $ operator can also be used to create new columns:
df$Density <- df$Population / df$Area
df

## You can sort the data frame by row value using the order() function:
df_sorted <- df[order(df$Area)]
df_sorted

### Challenge 4: Make your own data frame.
### 1. Create a data frame that contains four different food items and three attributes for each: name, price, and quantity.
### 2. Add a fourth column that calculates the total cost for each food item.
### 3. What function could you use to calculate the total cost of all the fruits combined?

# Section 5.3: Lists
## A list can be used to store heterogeneous data.
## Let's include three different data types: logical, character, and integer.
list1 <- list(TRUE, "one", 1) 
list1
class(list1)

## Normal arithmetic operates won't work with lists, though:
list1 * list(FALSE, "zero", 0) # Error

# Section 5.4: Matrices
## A matrix is like a vector in that it can only contain data of the same type, but it can be organized into rows and columns.
## It can also be higher dimensional (i.e., it can have more than two dimensions of rows and columns).
matrix1 <- matrix(data = 1:12, nrow = 4, ncol = 3) 
matrix1
class(matrix1)

## You can also coerce vector to matrix. First, let's create a normal vector:
vec1 <- 1:20
vec1
class(vec1)

## We can coerce this vector to a matrix with 10 rows and 2 columns:
matrix2 <- matrix(vec1, ncol = 2)
matrix2
class(matrix2)

## This concludes Part 1 of R Fundamentals! In Part 2, we will take a closer look at data frames, which are the main type of data structure we'll work with to perform data analysis.