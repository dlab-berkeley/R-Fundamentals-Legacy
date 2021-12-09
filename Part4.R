# R Fundamentals: Part 4 of 4

# Section 1: How Do Functions Work in R?

## The functions we use actually have a lot going on under the hood. Here we will take a look at how for-loops work, and how they might be integrated into functions to make complex tasks successfully execute. 

### Challenge 1: Importing data from files
### 1. Wipe your global environment clean.
### 2. Restart your R session by clicking "Session" --> "Restart R".
### 3. Load the gap dataset.
### 4. Load the heart dataset.

## Use the nrow() function to get the numbers of rows in gap:
nrow(gap)

## Now, look at the code for nrow() by typing the function name without parentheses:
nrow

## We can manually use the code dim(x)[1L] to get the dimensions of gap and then extract the first element:
dim(gap)
dim(gap)[1L]

## Is the function output equivalent to the manual method? We can use a Boolean operator to check this:
dim(gap)[1L] == nrow(gap) 

## Or, we could write a function to do the same. Why might we do this?
custom_function = function(x){
  dim(x)[1L]
}
custom_function(gap)

## Is our custom_function() output the same as the nrow() output?
custom_function(gap) == nrow(gap)

## Does this work for other datasets?
custom_function(heart) == nrow(heart)

# Section 2: For-loops

## Before we talk about custom functions in depth, let's talk about for-loops, since many functions have for-loops contained within their code. 

## For-loops in R have four main components
## The basic syntax looks like this: 
## for(variable in sequence){statement}

## 1. For loops begin with the `for` function to tell R that you want to iterate over a loop.  
## 2. The `variable` in `(variable in sequence)` is generally denoted with an `i`, which stands for "iterator". However, `i` should be thought of as a placeholder and can be anything (e.g., x, donut, etc.). 
## 3. `sequence` is a number telling R how many times you want to iterate the code/run the loop.
## 4. `{statement}` refers to the code sequence that you want to run at each iteration `i`. Curly braces { } define the statement boundary as the body of the loop.  

## What does this for-loop do?
for (x in 1:5) {
  print(x)
}

## Below is an in-depth looks at how for-loops work. You don't have to do this each time, but it gives you a glimpse into the process: 

## Create a matrix of 2^i
?rep
vec = c(rep(NA, 5))
vec

## Populate the loop
for(i in 1:5) {
  vec[i] = 2^(i)
}  # does indentation matter? 
vec
class(vec)

## Overwrite the first 3 numbers in the vector with 3^i
for (i in 1:3) {
  vec[i] = 3^i
}                
vec

## We can also loop over characters
animal_names = c("Cat", "Dog", "Pig", "Elephant", "Giraffe")
animal_names

### Create another blank vector
animals_length = rep(NA, length(animal_names))
animals_length

## Assign the animal names to the vector
names(animals_length) = animal_names
animals_length  

### Use a for-loop to calculate the length of each name
for (i in animal_names) {
  animals_length[i] = nchar(i)
}
animals_length

## If/else
##  Intermediate commands called "control structures" help us control what happens to the output based on certain conditions of the data. If and else are two basic ones. 

## Refer to the first loop you ran above: 
for (x in 1:5) {
  print(x) 
}

## If statements are used to specify code to be evaluated when some condition is held. Here we tell the code that when `x` is no longer less than 3, stop printing:
for (x in 1:3) {
  if (x < 3) {
    print(x)
  }
}

## Else is used to specify what the code should do when the if condition is no longer satisfied. 
## Since the if condition is not met, we get an error here because that is what we designated as the "else" output: 
x = 1
if (x > 3) {
  print(x)
} else{
  # else should not start its own line. Always let it be preceded by a closing brace on the same line.
  print("Error: number not big enough to print")
}

## What happens if we change x to satisfy the if statement?
## The if output is printed: 
x = 8
if (x > 3) {
  print(x)
} else{
  print("Error: number not big enough to print")
}

## Now we can put this in a loop for multiple values
x <- 1:5
for (x in 1:length(x)) {
  if (x > 3) {
    print(x)
  } else{                     
    print("Error: 'x' must be greater than 3 to print")
  }
}

## ifelse can be used to recode data:
set.seed(1)
countries <- sample(c("Canada", "Mexico"), 5, replace = T)
countries

## If country is equal to "Canada", recode it as a 0
## ... else, recode it as a 1
weather <- ifelse(countries == "Canada", 0, 1)       
weather

### Challenge 2: write a for-loop
##### 1 TODO

# Section 3: Functions

# In R, a function is a set of code that might be more useful if it is self-contained and/or is to be used repeatedly. For example, if you want to run the same satatistical tests on several datasets, you could write a function that contains instructions for all the tests once, so that you do not have to rewrite the code each time.  

## Every function has four parts and its basic syntax looks like this:  
## function.name = function(x){
##    body of function
## }

## 1. function_name: like variable assignment, give your function a relevant name
## 2. function(x): `function` lets R know you are writing a function and `(x)` states that there is one input/argument, x.  
## {body of function}: is contained within curly braces { } and denotes the statements that you want the function to evaluate.  
## 4. The environment (global environment in our case) that the function operates within.  

## Write a test function that squares a number and look under the hood!
squares <- function(x) {
  x ^ 2
}

class(squares) # Returns the class of `squares`
formals(squares) # Shows the defined arguments
body(squares) # Displays the statement(s) to be evaluated
environment(squares) # Returns the "global" environment
squares # Shows your function as you have written it

## Test it out
squares(3)

### Also works on vectors and other data structures! 
squares(1:10) # is this the same as c(1:10) ^ 2?

## Default arguments
## Default arguments are predefined ones:
## Define the function `f` that performs (x + y) / y
f <- function(x, y=2){
  (x + y) / y
}

## We only have to pass in a definition for the x parameter because y is already defined
f(x = 5)

## Or, we can overwrite the default y = 2 by defining it as such!
f(x = 5, y = 10)

# Section 4: Local v. Global scope

## Local Scope
## If a variable is defined within a function, it does not live in the global environment and can only be called by that function
## Define the variable z inside of the function `f`
f <- function(x, y=2) {
  z = 5
  (x + y) / z
}

## Does it appear in your global environment? (it should not)
ls()

## Since we defined two arguments (x and y) when we wrote the function, the function thinks the first one is x and the second one is y (remember that z is already defined within the function itself). Since y is default defined as 2, we only have to pass in one - x:
f(x = 4)

# Or
f(4)

# You can again overwrite y like this (recall that z is defined within the body of the function)
f(x = 4, y = 4)

# Or
f(4, 4)

## Global Scope
## However, if we define z in the global environment, the function can pull from the global environment as well:
z <- 5 

## Does z live in the global environment? Yes!
ls()

f <- function(x, y=2){
  (x + y) / z
}
f(4)

##### Challenge 3 - cylinders example
##### You can also pass in the columns of a dataframe as arguments
##### 1. Given this toy data frame of cylinder height and radius, write a function that computes the volumes of the five cylinders
##### The formula for cylinder volume is: 
##### v = pi * (radius ^ 2) * height
##### The data:
cylinders <- data.frame(height = c(3,4,5,6,7),
                        radius = c(1,3,2,1,5))
cylinders
##### 2. Plug in the height and radius into your function to make it work!
##### HINT: You should have five outputs - one for each cylinder

# Section 5: For-loop Inside a Function

## You will often find for-loops nested inside of functions. These setups provide the basis for simple automation:

## This function takes a single argument x, and the prints the square, x number of times:
squared <- function(x) {
  for (i in 1:x) {
    y = i ^ 2
    print(y)
  }
}
squared(4)

## Lock Example
## This can get pretty complicated! Check out what is happening in this combination lock example:

## Generate 100 lock combinations
set.seed(1)
combos <- paste0(sample(1:60,100, replace = T), "-",
                 sample(1:60,100, replace = T), "-", 
                 sample(1:60,100, replace = T))
combos

# Write the function that will try these 100 combinations
lock <- function(x) {
  # Run the loop 100 times
  for(x in 1:length(combos)) {
    # If "25-2-57" is selected, open the lock
    if(combos[x] == "25-2-57") {
      print(paste(combos[x], ":", "unlock"))
    # Otherwise, print "ERROR:" followed by the faulty combo
      }else{
      print(paste("ERROR", ":", combos[x]))
    }
  }
}

# 3. Pass in the 100 combinations and see if you could open the lock!
lock(combos)

## Section 6: Monte Carlo from scratch

## Remember our sample function? We can simulate a single die roll like this: 
sample(1:6, 1)

## Or, we could use the sample function to simulate 100 rolls of a single die: 
sample(1:6, 100, replace = TRUE)

## Instead, let's set up 200 simulations

## 10 iterations
iter <- 10

## 100 rolls at each iteration
nr_rolls <- 100

## Write a for-loop to take the mean of each iteration (take the mean of each of the 100 die rolls)
for (i in 1:iter) {
  rolls <- sample(1:6, nr_rolls, replace = TRUE)
  # What do we see if we unhashtag print(rolls) ? 
  # print(rolls)
  print(mean(rolls))
}

## This is good, but what if we defined a mean dice roll function instead?
set.seed(1)
die_roll_mean <- function(nr_rolls) {
  rolls <- sample(1:6, nr_rolls, replace = TRUE)
  mean(rolls)
}

## Now we can define the number of rolls as we choose
## Let's try 10,000:
die_roll_mean(nr_rolls = 10000)

## Use the replicate function to get the mean of 200 iterations of 100 rolls each:
?replicate
reps <- replicate(200, die_roll_mean(nr_rolls = 100))
reps

## What do you notice that is different about a 5 roll mean, if anything? 
reps <- replicate(200, die_roll_mean(nr_rolls = 5)) 
reps

## Plot the simulations
hist(reps)

## Change the bar color and add a bold line at the mean
hist(reps, col = "grey")
abline(v = mean(reps), col = "blue", lwd = 6)

## Turn this plotting idea into a function!
## The function will take just one argument called sims
my_hist <- function(sims) {
  hist(sims, col = "grey", 
       xlab = "Mean of n die rolls", main = "")
  abline(v = mean(sims), col = "blue", lwd = 6)
}

## Now we can plot our 200 means (based on just 5 rolls each) from the variable reps above:
reps
my_hist(sims = reps)

## Add title to the plot function
## We now have two arguments: sims and n
## n is the number of rolls
my_hist <- function(sims, n) {
  hist(sims, col = "grey",  xlab = "Mean of n die rolls",
       main = paste0("n=", n), xlim = c(2,5))
  abline(v = mean(sims), col = "blue", lwd = 2)
}

## For 5 rolls we could define n as 5:
my_hist(sims = reps, n = 5)

## Very neat! But what if we want to loop over multiple sampling distributions? 
## Imagine we have a different number of die rolls, and we want to plot the distribution of each - 10, 25, 50, 100, 200, and 500:
nr_die_rolls <- c(10, 25, 50, 100, 200, 500)
nr_die_rolls

## Let's perform 1000 replications for the first element in our vector, 10 rolls:
nr_die_rolls[1]
reps <- replicate(1000, die_roll_mean(nr_rolls = nr_die_rolls[1])) 

## Then, plug it into our my_hist function:
my_hist(sims = reps, n = nr_die_rolls[1])

## With this knowledge, we can then automate all six sampling distributions: 10, 25, 50, 100, 200, and 500

## First, change our plotting area to a 2 row by 3 column surface: 
par(mfrow = c(2,3))

## Second, define our for-loop
## Keep in mind that this loop has 2 parts:
## 1. reps: 1000 replications for each of the six sampling distributions, and
## 2. my_hist: the plotting function
for (i in 1:length(nr_die_rolls)) {
  reps <- replicate(1000, die_roll_mean(nr_rolls = nr_die_rolls[i]))
  my_hist(sims = reps, n = nr_die_rolls[i])
}

## Section 7: The Birthday Problem

## If somebody asked you in a room full of 25 people, "What is the probability that two people have matching birthdays?", what would you say?

## We will use this seed because it is a Berkeley zip code that gives one matching birthday:
set.seed(94704)  

## Generate our 25 samples from 365 days of the year:
birthdays <- sample(1:365, 25, replace = TRUE)
birthdays

## Check the number of unique birthdays
## 24 is returned, because 198 appears twice
## This indicates that out of 25, two people have a matching birthday:
length(unique(birthdays))
birthdays
unique(birthdays)

## Write a function to find people with the same birthday
set.seed(94704)
birthday_function <- function(people = 25) {
  # 1. Populate the room
  birthdays <- sample(1:365, people, replace = TRUE)
  # 2. Get the unique number of bdays
  unique_bdays <- length(unique(birthdays))
  # 3. Return a 1 if at least one bday is repeated.
  as.numeric(unique_bdays != people)
}

## 1 is returned (our two 198's)
birthday_function(people = 25)

## Replicate to repeat the process 1000 times!
set.seed(94704)
many_sims <- replicate(1000, birthday_function(people = 25))
many_sims

## Calculate the probability of a matching birthday
mean(many_sims) # 0.555 chance of one matching birthday! 

## How does this probability change as we vary the number of people
people <- 2:100
n_people <- length(people)

## Create a blank matrix to store the number of people (first column), and the probability of a matching birthday (second column)
sims <- matrix(NA, nrow = n_people, ncol = 2)
head(sims)

## Define the for-loop
## (this might take a minute to complete)
for (i in 1:n_people) {
  many_sims <- replicate(5000, birthday_function(people = people[i]))
  sims[i, ] <- c(people[i], mean(many_sims))
}

## View the populated matrix
sims

## Plot the probability

## Change our plotting area back to a 1 x 1 surface: 
par(mfrow = c(1,1))

## Our final plot! Let's plot the probability of matching a birthday (y-axis) against the number of people (x-axis):
plot(x = sims[,1],
     y = sims[,2], 
     pch = 16,
     col = "blue", 
     xlab = "Number of People", 
     ylab = "Probability of at Least One Matching Birthday")

##### Challenge 4 - automation
##### 1. Automate something! Anything. (i.e., put a for-loop inside of a function and get some output)

##### 2. If this is too difficult, think about your own research - what might benefit from simple automation?

##### Challenge 5 - going further with R Markdown, bookdown, and dashboards
##### Recall that we have been going through R script files - these are just plain text files but with a .R extension. These are plain text files where we must enter a hashtag before text to enter it correctly, while entering code normally. However, R Markdown files are fully reproducible documents (with a .Rmd file extension) that mix text (entered normally and without the need for hashtags) and "chunks" of code (you can still hashtag comments inside a chunk of cocde). Open an R Markdown file by clicking File --> New File --> R Markdown... Give it a title, make sure the HTML button is selected, and click OK. 

##### 1. Go through the RStudio tutorial to learn how to "knit" R Markdown files into HTML and other vibrant formats: https://rmarkdown.rstudio.com/
##### 2. Furthermore, you can turn your R Markdown files into dynamic e-books! Go through yihui's excellent bookdown tutorial: https://bookdown.org/yihui/bookdown/get-started.html
##### 3. Additionally, you can create fast dashboards by following this guide: https://rmarkdown.rstudio.com/flexdashboard/
