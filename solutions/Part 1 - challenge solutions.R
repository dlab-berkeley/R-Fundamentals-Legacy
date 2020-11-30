# R-Fundamentals Part 1 - Challenge Problem Solutions

##### Challenge 1 - variable assignment
##### Define three variables and then write a mathematical expression using only those variables
x <- 4
y <- 7
z <- 9

(x * y) / 9

##### Challenge 2 - data type coercion
##### Like as.integer, other “as dot” functions exist as well, such as as.numeric, as.character, as.logical, and as.factor.
##### 1. Define three variables: one numeric, one character, and one logical
num <- 5
char <- "Oski"
lgcl <- TRUE

##### 2a. Can you convert numeric to integer type?
# YES!
num_to_int <- as.integer(num)
num_to_int
class(num_to_int)

##### 2b. Convert numeric to logical?
# YES! 
num_to_lgcl <- as.logical(num)
num_to_lgcl
class(num_to_lgcl)

##### 2c. Convert numeric to character?
# YES!
num_to_char <- as.character(num)
num_to_char
class(num_to_char)

##### 2d. Convert logical to character?
# YES!
lgcl_to_char <- as.character(lgcl)
lgcl_to_char
class(lgcl_to_char)

##### 2e. Convert character to numeric?
# NO! Technically yes, but this will lead to some very strange behavior...
char_to_num <- as.numeric(char)
char_to_num
class(char_to_num)

##### Challenge 3 - concatenating vectors
##### 1. Define a vector of length 20 using one of the above methods
set.seed(1)
norm_vec <- rnorm(20, 0, 1)
norm_vec

##### 2. Index the 3rd through 7th elements of this vector
norm_vec[3:7]

##### 3. Index the 3rd through 7th elements and the 14th element
norm_vec[c(3:7, 14)]

##### Challenge 4 - make your own data frame
##### 1. Create a data frame that contains four different food items and three attributes for each: name, price, and quantity
name <- c("Mango", "Pear", "Pineapple", "Kiwi")
price <- c(1.29, 0.79, 2.99, 1.49)
quantity <- c(4, 6, 3, 10)

fruits <- data.frame(name, price, quantity)
fruits

##### 2. Add a fourth column that calculates the total cost for each food item
fruits$total_cost <- fruits$price * fruits$quantity
fruits

##### 3. What function could you use to calculate the total cost of all the fruits combined? How do you find out?
sum(fruits$total_cost)

##### Challenge 5 - export to .csv
##### 1. Use ?write.csv to try and figure out how to export this data frame as a .csv file
?write.csv

##### 2. Use getwd() to see where it saved! Were you successful?
getwd()
