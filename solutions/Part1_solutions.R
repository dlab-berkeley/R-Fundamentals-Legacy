# R Fundamentals Part 1: Challenge Problem Solutions

### Challenge 1: Variable Assignment
### Define three variables and then write a mathematical expression using only those variables.
x <- 4
y <- 7
z <- 9

(x * y) / z


### Challenge 2: Data type coercion
### Like as.integer, other "as dot" functions exist as well, such as as.numeric, as.character, as.logical, and as.factor.
### 1. Define three variables: one numeric, one character, and one logical
num <- 5
char <- "Oski"
lgcl <- TRUE

### 2a. Can you convert numeric to integer type?
num_to_int <- as.integer(num)
num_to_int
class(num_to_int)
## Yes!

### 2b. Convert numeric to logical?
num_to_lgcl <- as.logical(num)
num_to_lgcl
class(num_to_lgcl)
# Yes!

### 2c. Convert numeric to character?
num_to_char <- as.character(num)
num_to_char
class(num_to_char)
# Yes!

### 2d. Convert logical to character?
lgcl_to_char <- as.character(lgcl)
lgcl_to_char
class(lgcl_to_char)
# Yes!

### 2e. Convert character to numeric?
char_to_num <- as.numeric(char)
char_to_num
class(char_to_num)
# No! Technically, yes, but this will lead to some very strange behavior...


### Challenge 3: Concatenating vectors
### 1. Create a vector starting from 10, and ending with 30, with each entry separated by 2.
vec <- seq(10, 30, 2)

### 2. Index the 3rd through 7th elements of this vector.
vec[3:7]

### 3. Index the 3rd through 7th elements and the 10th element.
vec[c(3:7, 10)]


### Challenge 4: Make your own data frame.
### 1. Create a data frame that contains four different food items and three attributes for each: name, price, and quantity.
name <- c("Mango", "Pear", "Pineapple", "Kiwi")
price <- c(1.29, 0.79, 2.99, 1.49)
quantity <- c(4, 6, 3, 10)

fruits <- data.frame(name, price, quantity)
fruits

### 2. Add a fourth column that calculates the total cost for each food item.
fruits$total_cost <- fruits$price * fruits$quantity
fruits

### 3. What function could you use to calculate the total cost of all the fruits combined?
sum(fruits$total_cost)
