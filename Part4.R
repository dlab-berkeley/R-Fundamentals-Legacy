# R Fundamentals: Part 4 of 4

## In this lesson, we're going to discuss the building blocks of making more complicated R scripts and packages. These include functions, for-loops, and if-else statements.

## These building blocks rely on two fundamental concepts which underlie much of programming in general:

## 1. Modularizing repeatable code blocks.
## 2. Controlling the flow of a program.

## By using these two principles, we're going to find that we can make our code much more clean, powerful, and useful.

## To begin, let's do a warm-up challenge.

### Challenge 1: Importing data from files.
### 1. Wipe your global environment clean.

### 2. Restart your R session by clicking "Session" --> "Restart R".

### 3. Load the gap dataset.

### 4. Load the heart dataset.

# Section 1: How Do Functions Work in R?

## In R, a function is a self-contained block of code that accepts inputs and returns outputs. The strength of writing functions is  their modularization: you can repeatedly use the same block of code without have to rewrite it.
## For example, if you want to run the same data analysis pipeline on several datasets, you could write a function that performs the analysis for a general dataset. Then, you could just apply the function to each dataset, without have to rewrite the code.  

## We've already used functions in R - they're pre-defined terms that (sometimes) accept inputs, and then (sometimes) generate outputs.

## For example, we can use the nrow() function to get the numbers of rows in gap. Specifically, nrow() accepts a dataframe as its input, and returns an integer as the output.
nrow(gap)

## The nrow() function is not some magical entity that can figure out the number of rows. It's simply a block of code (specifically, one line) that performs a computation. We've simply abstracted it to the name "nrow", which is meaningful to us as the user. 

## We can actually look at the code for nrow() by typing the function name without parentheses:
nrow

## We can manually use the code dim(x)[1L] to get the dimensions of gap and then extract the first element:
dim(gap)
dim(gap)[1L]

## Is the function output equivalent to the manual method? We can use a Boolean operator to check this:
dim(gap)[1L] == nrow(gap) 

## There are many built-in functions in R, as well as functions that come with packages that we may import. However, we can also write our own functions.

## Functions are structured as follows:

## function_name <- function(x) {
##    body of function
## }

## They are composed of four main parts:
## 1. The function name: Functions are referred to by their name. Just like variables, assignment is done using the left arrow <-. In the above, the function is named `function_name`. 
## 2. The function keyword: The `function` keyword lets R know you are writing a function. It comes on the right hand side of the assignment operator.
## 3. Inputs: The parentheses contain the inputs (also called arguments) to the function. For example, `(x)` states that there is one input named x. You don't always need an input to a function.
## 4. Function body: The meat of the function lies in its body, which is surrounded by curly braces { }. Every time you call your function, the code in the body is what runs.
## 5. Optional: a `return` statement. By default, R will return whatever the last line of the function is. You may want to make this explicit. You can use a `return` statement to indicate what exactly is returned by the function.

## Let's write our own function to calculate the number of rows of a dataframe:
custom_function <- function(x){
  dim(x)[1L]
}

## Is our custom_function() output the same as the nrow() output?
custom_function(gap) == nrow(gap)

## Does this work for other datasets?
custom_function(heart) == nrow(heart)

## Let's write a new function. This one will calculate the square of an input:
squares <- function(input) {
  input^2
}

## We can apply some built-in functions to other functions:
class(squares) # Returns the class of `squares`
formals(squares) # Shows the defined arguments
body(squares) # Displays the statement(s) to be evaluated
squares # Shows your function as you have written it

## Let's test it out!
squares(3)

## This function will also work on vectors!
squares(1:10) # is this the same as c(1:10) ^ 2?

## We can also use a return statement to make it explicit what the function is returning:
squares2 <- function(input) {
  return(input ^ 2)
}
squares2(3)

# Section 2: Default Arguments

## Every argument to a function comes with its own name. In addition to the name, we can also provide default values.
## These default values are what the function uses if the user does not provide an input. Let's consider an example.

## Define the function `f` that accepts inputs x and y, and performs the simple computation (x + y) / y:
f <- function(x, y){
  return((x + y) / y)
}

## We can run this function with two inputs:
f(1, 2)
## We can also run this function while naming the input arguments:
f(x = 1, y = 2) # same output
## We can try every approach of inputting arguments:
f(x = 1, y = 2) # both named
f(x = 1, 2) # first named
f(1, y = 2) # second named
f(1, 2) # neither named
## But if we omit the second argument, what happens?
f(x = 1)

## So, let's define a new function which has a default argument:
f2 <- function(x, y = 2){
  (x + y) / y
}

## This time, we only need to pass in an input for the first argument, x:
f2(x = 1)
f2(1) # We don't need to name x to get the same output
f(x = 1, y = 2) == f2(x = 1) # Confirm we get the same output

## Of course, we're free to overwrite the default argument. We just have to be sure to include it:
f2(x = 1, y = 3) # both named
f2(x = 1, 3) # first named
f2(1, y = 3) # second named
f2(1, 3) # neither named

### Challenge 2: Write your own functions.
### 1. Write a function that calculates the area of a circle with radius r. The formula for the area of a circle is A = pi * r^2.

### 2. Write a function that calculates the sample standard deviation given a vector of numeric values. Check that this function returns the same output as the base function sd().

# Section 3: For-loops for Repeating Computation

## One strength of computers is that they are fast. To take advantage of this, we often have them perform repeated computation. One way to facilitate this is with a for-loop.
## For-loops are built on the idea of "iteration". We iterate through a procedure, with some counter keeping track of how far along the overall procedure we are.
## The structure of a for-loop is as follows:

## for(variable in sequence) {
##   statement
## }

## For-loops in R have four main components:
## 1. The `for` keyword: This keyword tells R that you want to iterate over a loop.  
## 2. The iterator: The parentheses denote what we are iterating over. In the example, it is `(variable in sequence)`. The `variable` is the iterator: it moves through the `sequence` for each step of the for-loop. Often, the `variable` is called `i`, but we could name it anything (`x`, `donut`, etc.).
## 3. The `sequence`: This tells R what values the iterator proceeds through. Often, it is a vector of numbers (e.g., 1:5), but it can be more general through that.
## 4. Loop body: As in functions, curly braces define the body of the loop. For each pass through the for-loop, the body is run. Thus, the body is repeatedly run `n` number of times, where `n`  

## What does this for-loop do?
for (x in 1:5) {
  print(x)
}

## How about this loop?
for (iterator in c(2, 4, 6, 7)) {
  cube <- iterator^3
  print(cube + 2)
}

## We don't have to just loop over integers - we can also loop over characters!
animal_names <- c("Cat", "Dog", "Pig", "Elephant", "Giraffe")

## We'll use a for-loop to calculate the length of each name, and store it in a new vector.
for (name in animal_names) {
  print(nchar(name))
}

# Section 4: If-else Statements

## Decision making is an important process in programming. We'll often proceed in different ways depending on the conditions of the scenario.
## Intermediate commands called "control structures" help us control what happens in the program based on certain conditions of the data.
## If-else statements are a fundamental control structure.

## If statements are used to specify code to be evaluated when some condition is held. Here, we define a variable, and use a couple if statements to control the flow of the program:
x <- 2
if (x < 3) {
  print("x is less than 3.")
}

## Notice how the structure of an if-statement is very similar to a for-loop. The main difference is that the parentheses contain a conditional, rather than an iteration. If the conditional evaluates to TRUE, the body of the if-statement runs. If not, it is skipped. Here's another example using a for-loop from before:
for (x in 1:5) {
  if (x < 3) {
    print(paste0("x = ", x, ", is less than 3."))
  }
}

## An else-statement is used to specify what should occur when the if-statement is not satisfied.
x <- 1
if (x > 3) {
  print(x)
} else { # Place else-statements right after the closing brace
  print("Error: number not big enough to print.")
}

## Since the if condition was not met, we got an error because that is what we designated as the "else" output.

## Let's redo the above, with a different value of x:
x <- 8
if (x > 3) {
  print("x is greater than 3.")
} else {
  print("Error: number not big enough to print.")
}

## Lastly, if we want to check for multiple conditions in a row, we can use else-if statements:
x <- 2
if (x > 3) {
  print("x is greater than 3.")
} else if (x > 0) {
  print("x is greater than 0.")
} else {
  print("x is negative.")
}

## Let's go ahead and put this if-else statement inside its own function, and run it inside a for-loop:
if_checker <- function(x) {
  if (x > 3) {
    print(paste0("x = ", x, ", is greater than 3."))
  } else if (x > 0) {
    print(paste0("x = ", x, ", is greater than 0."))
  } else {
    print(paste0("x = ", x, ", is negative."))
  }
}

## Now we can put this in a for-loop to evaluate it repeatedly:
values <- -5:5
for (x in values) {
  if_checker(x)
}

# Section 5: Environments and Scope

## How do we tell apart variables that are defined inside vs. outside functions? This is a question of "scope". Specifically, local vs. global scope.

## If a variable is defined within a function, it does not live in the global environment and can only be referred to by that function. Let's take a look at an example.

## In function `f`, the variable `z` is defined:
f <- function(x, y = 2) {
  z <- 5
  return((x + y) / z)
}

## Does it appear in your global environment? (It should not.)
ls()

## OK, maybe it's because we haven't yet called the function. What about when we run the function once - does `z` enter the global environment?
f(x = 4)
ls()

## So, right now `z` only lives in the local environment of the function. If we define `z` in the script, it should enter the global environment:
z <- 5 

## Does z live in the global environment? Yes!
ls()

## The function should be able to pull this value of `z` from the global environment:
f <- function(x, y = 2){
  return((x + y) / z)
}
f(4)

# Section 6: Rolling Dice with Functions

## With these fundamental building blocks, we're ready to start performing some interesting experiments. We're going to start making full use of for-loops, if-else statements, and functions through Monte Carlo experiments.

## We're going to run some experiments in R that mimic the rolling of a die. To do so, we need random number generation. The sample() function is one way to randomly draw numbers from a set of values:
?sample
# Let's sample one die roll:
sample(1:6, 1)

## Or, we could use the sample function to simulate 100 rolls of a single die: 
sample(1:6, 100, replace = TRUE)

## We can think of this as one "experiment". In Monte Carlo sampling, we want to run many experiments to see how things behave in the aggregate. Let's run 10 experiments, each of which has 100 die rolls.
n_experiments <- 10
n_rolls <- 100

## We're interested in the average die roll. So, we'll write a for loop to iterate over the experiments, each time calculating the average die roll:
for (i in 1:n_experiments) {
  rolls <- sample(1:6, n_rolls, replace = TRUE)
  print(mean(rolls))
}

## We're going to be doing this experiment a lot, so let's turn it into a function.
die_roll_mean <- function(n_rolls) {
  rolls <- sample(1:6, n_rolls, replace = TRUE)
  return(mean(rolls))
}

## Now we can define the number of rolls as we choose! 
## Before we run this experiment, we're going to set a random seed. This seed is a way to start the random number generator in a specific way to ensure that we all obtain the exact same results. So, everyone who sets the seed to 1 will obtain the exact same die rolls across the experiment - this helps with reproducibility!
set.seed(1)
die_roll_mean(n_rolls = 10000)

## This is one experiment. How can we do many experiments? The replicate function can help us out with this:
?replicate
n_experiments <- 200
n_rolls_high <- 100
reps_high <- replicate(n_experiments, die_roll_mean(n_rolls = n_rolls_high))
reps_high

## Let's lower the number of rolls. 
n_rolls_low <- 5
reps_low <- replicate(n_experiments, die_roll_mean(n_rolls = n_rolls_low)) 
reps_low

## Plotting the distribution is an easy way to tell these two apart!
hist(reps_high)
hist(reps_low)

## Let's customize this a bit, using what we learned from the last lesson:
hist(reps_low, col = "grey")
abline(v = mean(reps_high), col = "red", lwd = 2)

## Let's turn this plotting code block into a function!
## The function will take an argument called `means`, and an argument called `n_rolls`:
hist_plotter <- function(means, n_rolls) {
  hist(means,
       col = "grey", 
       xlab = "Average die roll",
       xlim = c(1, 6),
       main = paste0("Average die rolls for n = ", n_rolls, " rolls"))
  abline(v = mean(means), col = "red", lwd = 2)
}

## Now we can easily plot the two experiments above:
hist_plotter(means  = reps_high, n_rolls = n_rolls_high)
hist_plotter(means = reps_low, n_rolls = n_rolls_low)

## Notice how much nicer it is not having to copy the code block over and over!

## Very neat! But what if we want to loop over multiple sampling distributions? 
## Imagine we have a different number of die rolls, and we want to plot the distribution of each - 10, 25, 50, 100, 200, and 500:
n_die_rolls <- c(10, 25, 50, 100, 200, 500)

## Let's perform 1000 experiments for the first element in our vector, 10 rolls:
n_experiments <- 1000
reps <- replicate(n_experiments, die_roll_mean(n_rolls = n_die_rolls[1])) 
## Then, plug it into our histogram plotting function:
hist_plotter(means = reps, n_rolls = n_die_rolls[1])

## We can then automate all six sampling distributions.

## First, change our plotting area to a 2 row by 3 column surface: 
par(mfrow = c(2,3))

## Second, we define our for-loop.
## We need to iterate over different numbers of die rolls. For each die rolls, we're running 1000 experiments. So, implicitly, there's two levels of iteration going on here. For each set of experiments, we output a histogram, so we can compare across numbers of die rolls.
for (i in 1:length(n_die_rolls)) {
  means <- replicate(n_experiments, die_roll_mean(n_rolls = n_die_rolls[i]))
  hist_plotter(means = means, n = n_die_rolls[i])
}

# Section 7: The Birthday Problem

## If somebody asked you in a room full of 25 people, "What is the probability that two people have matching birthdays?", what would you say?

## The answer is higher than you might expect! Let's use for-loops and functions to figure it out.

## We will use this seed because it is a Berkeley zip code that gives one matching birthday:
set.seed(94704)  

## Now, we generate 25 samples from 365 days of the year:
birthdays <- sample(1:365, 25, replace = TRUE)
birthdays

## Let's check if any birthdays are duplicated:
duplicated(birthdays)
sum(duplicated(birthdays)) > 0

## We'll write a function to perform an experiment where we sample a group of random birthdays, and determine if anybody repeats.
birthday_function <- function(n_people = 25) {
  # Populate the room
  birthdays <- sample(1:365, n_people, replace = TRUE)
  # Count the number of duplicated entries
  n_duplicated <- sum(duplicated(birthdays))
  # Return a 1 if at least one birthday is repeated
  return(as.numeric(n_duplicated > 0))
}

## We reset the seed, and find that our mini-experiment does return a 1, as we might expect:
set.seed(94704)
birthday_function(n_people = 25)

## Let's run this at scale! We'll replicate the experiment 5000 times:
n_reps <- 5000
many_sims <- replicate(n_reps, birthday_function(n_people = 25))
many_sims

## Calculate the probability of a matching birthday
mean(many_sims)

## It's over a 50% chance! How does this probability change as we vary the number of people in the room?
room_sizes <- 2:100
n_experiments <- length(room_sizes)

## To store the experiment results, we'll create a blank matrix. The first column will store the room size and the second column will store the probability of a matching birthday.
results <- matrix(NA, nrow = n_experiments, ncol = 2)
head(results)

## Let's run the entire experiment in a for-loop:
for (index in 1:n_experiments) {
  # Get the number of people in the room
  n_people <- room_sizes[index]
  # Run the experiment many times
  many_sims <- replicate(n_reps, birthday_function(n_people = n_people))
  # Calculate the probability
  probability <- mean(many_sims)
  # Store the results
  results[index, ] <- c(n_people, probability)
}

## We can view the populated matrix:
head(results)

## Now, let's plot the probability. We first change our plotting area back to a 1 x 1 surface: 
par(mfrow = c(1,1))

## Our final plot! Let's plot the probability of matching a birthday (y-axis) against the number of people (x-axis):
plot(x = results[, 1],
     y = results[, 2], 
     pch = 16,
     col = "blue", 
     xlab = "Number of People", 
     ylab = "Probability of at Least\nOne Matching Birthday")

### Challenge 3: Automating tasks with functions and for-loops.
### 1. Create a function that takes a number and returns whether it is prime or not. Use a for-loop and if-statement on the inside of the function. You will need to use the modulus operator, %%. The operation a %% b returns the remainder when a is divided by b.

### 2. Monte Carlo sampling can be used to approximate the value of pi. We can do this by sampling random points in a 1x1 square. The fraction of sampled points that lie within the circle should approximate the area of the circle divided by the area of the square. A circle of radius r = 0.5 can lie within this square. The area of this circle is A = pi * (0.5)^2 = pi / 4. Since the area of the square is 1^2 = 1, this fraction is equal to pi / 4. So, Monte Carlo sampling can be used to approximate pi.

### Create a function the approximates pi. It should accept as an argument the number of points to sample.

### As an extra challenge, you can create a plotting function that plot the sampled points. Color the points that lie within the circle differently from those that lie outside the circle.

### 3. Think about a research or class project. Is there anything you can automate in those contexts to make your life easier? 

