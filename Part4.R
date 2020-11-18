# Script for Day 4

## Part 2: For Loops

### Use the nrow function to get the numbers of rows
data(iris)
iris

### Manually we can use dim(iris)[1L] to get the dimensions of iris and then extract the first element
dim(iris)[1L]

### Or we can use the nrow function
nrow(iris)

### Function method is equivalent to manual method
dim(iris)[1L] == nrow(iris) 

### Write a function to do the same. Why would we do this?
nrow_function = function(x){
  dim(x)[1L]
}
nrow_function(iris)
nrow_function(mtcars)

### For Loop. What does this do?
for (x in 1:10) {
  print(x)
}

### Create a matrix of 2^i

vec = c(rep(NA, 10))
vec

for(i in 1:10){
  vec[i] = 2^(i)
}  # does indentation matter? 
vec
class(vec)

### Overwrite the first 5 numbers in the vector

for (i in 1:5) {
  vec[i] = 3^i
}                
vec

### Loop over characters

animal_names = c("Cat", "Dog", "Pig", "Elephant", "Giraffe")
animal_names

### Create a blank vector
animals_length = rep(NA, length(animal_names))
animals_length

### Assign the animal names to the vector
names(animals_length) = animal_names
animals_length  

### Use a for loop to calculate the length of each one

for (i in animal_names) {
  animals_length[i] = nchar(i)
}
animals_length

### If/else

for (x in 1:10) {
  print(x) 
}

### If to control when a chunk of code runs. When did we talk about these?

for (x in 1:10) {
  if (x < 5)
    print(x)
}

### Else statement to specify behavior if condition isn't met

x = 1
if (x > 7) {
  print(x)
}else{   #`else` should not start its own line. Always let it be preceded by a closing brace on the same line.
  print("Error: number not big enough to print")
}

### What happens if we change x?

x = 8
if (x > 7) {
  print(x)
}else{
  print("Error: number not big enough to print")
}

### Now let's put it in a loop

x = 1:10
for (x in 1:length(x)) {
  if (x > 7) {
    print(x)
  }else{                     
    print("Error: number not big enough to print. 'x' must be greater than 7")
  }
}

### ifelse to recode

weather = ifelse(countries == "Canada", "Snow?", "Sun!")       
weather

# Part 3: Functions

## Write a test function and examine it

test_function = function(x){
  x ^ 2
}

class(test_function)        # Returns the class of `test_function`
formals(test_function)      # Shows the defined arguments
body(test_function)         # Displays the statements to be evaluated
environment(test_function)  # Returns the "global" environment
test_function               # Shows your function as you have written it

## Test it out

test_function
test_function(2)

### Also works on vectors and other data stuctures! 
test_function(1:10) # is this the same as c(1:10) ^ 2?

## Default arguments

f = function(x, y=2){
  (x + y) / y
}

f(x = 5)
f(x = 5, y = 10)

### Local v. Global scope

#### Local Scope
f = function(x, y=2){
  z = 5
  (x + y) / z
}

# since we defined two arguments x and y, the function thinks the first one is x and the second one is y. You can overwrite y like this:
f(4, 4)  

f(x = 4, y = 4) # produces the same result

ls() # objects defined in the function environment only exist inside the function; they are not found in the global environment!

### Global Scope

z = 5 # define z outside of the function environment
f = function(x, y=2){
  (x + y) / z
}
f(4, 4)
ls() # the function envrionment can indeed use objects defined in the global environment. 

## For loop inside a function

function_squared = function(x){
  for (i in 1:x) {
    y = i ^ 2
    print(y)
  }
}
function_squared(10)

## Columns of a dataframe as arguments

# construct a dummy data frame 
cylinders = data.frame(height = c(3,4,5,6,7),
                       radius = c(1,3,2,1,5))
cylinders

# write a function that computes the volume of these cylinders
# the two arguments are defined as the height and radius columns
cylinders_function = function(height, radius){
  volume = pi * radius ^ 2 * height
  print(volume)
}

str(cylinders)

# plug in height and radius
cylinders_function(height = cylinders$height, radius = cylinders$radius)

## Lock Example

# combination lock example

# 1.  
set.seed(123)
combos = paste0(sample(1:60,100, replace = T), "-",  # paste0 or paste?
                sample(1:60,100, replace = T), "-", 
                sample(1:60,100, replace = T))
combos

# 2. 
lock = function(x) {
  for(x in 1:length(combos)){
    if(combos[x] == "13-24-48"){
      print(paste(combos[x], ":", "unlock"))
    }else{
      print(paste("ERROR", ":", combos[x]))
    }
  }
}

# 3. 
lock(combos)

## Part 4: Monte Carlo Simulations

### Die Roll

sample(1:6, 1)

# Or, we could use the sample function to simulate 100 die rolls.
sample(1:6, 100, replace = TRUE)

### 200 simulations

iter = 200
nr_rolls = 100

for (i in 1:iter){
  rolls = sample(1:6, nr_rolls, replace=TRUE)
  #print(rolls)
  print(mean(rolls))
}

### Mean dice roll function

set.seed(1)

die_roll_mean = function(nr_rolls){
  rolls = sample(1:6, nr_rolls, replace = TRUE)
  mean(rolls)
}

die_roll_mean(nr_rolls = 100)

# 100 roll mean
reps = replicate(200, die_roll_mean(nr_rolls = 100))
reps

# 5 roll mean
reps = replicate(200, die_roll_mean(nr_rolls = 5)) 
reps

## Plot the simulations

hist(reps)

hist(reps, col = "grey")
abline(v = mean(reps), col = "blue", lwd = 6)

my_hist = function(sims){
  hist(sims, col = "grey", xlab = "Mean of n die rolls", main = "")
  abline(v = mean(sims), col = "blue", lwd = 6)
}

my_hist(sims = reps)

## Add title to plot

my_hist = function(sims, n){
  hist(sims, col = "grey",  xlab = "Mean of n die rolls",
       main = paste0("n=", n), xlim = c(2,5))
  abline(v = mean(sims), col = "blue", lwd = 2)
}

my_hist(sims = reps, n = 5)

### Sampling Distributions
nr_die_rolls = c(10, 25, 50, 100, 200, 500)

### Test for n = 10

reps = replicate(1000, die_roll_mean(nr_rolls = nr_die_rolls[1])) 
my_hist(sims = reps, n = nr_die_rolls[1])

### Test for all

# Change our plotting area to a 2 row by 3 column area
par(mfrow = c(2,3))

for (i in 1:length(nr_die_rolls)) {
  reps = replicate(1000, die_roll_mean(nr_rolls = nr_die_rolls[i]))
  my_hist(sims = reps, n = nr_die_rolls[i])
}

## Part 6: Birthday Problem

# This seed give one matching birthday
set.seed(94705)  

birthdays = sample(1:365, 25, replace = TRUE)
birthdays

## Check unique birthdays
unique(birthdays)
length(unique(birthdays))

## Write a function to find people with the same birthday

set.seed(94705)

birthday_function = function(people = 25){
  
  # we populate the room
  birthdays = sample(1:365, people, replace = TRUE)
  
  # get the unique number of bdays
  unique_bdays = length(unique(birthdays))
  
  # and return a 1 if at least one bday is repeated.
  as.numeric(unique_bdays != people)
}

birthday_function(people = 25)

## Replicate to repeat the process
set.seed(94705)
many_sims = replicate(1000, birthday_function(people = 25))
many_sims

## Calculate the probability

mean(many_sims) # 0.578 chance of one matching birthday! 

## How does this probability change as we vary the number of people
people = 2:100

sims = matrix(NA, nrow = length(people), ncol = 2)

for (i in 1:length(people)) {
  many_sims = replicate(5000, birthday_function(people = people[i]))
  sims[i,] = c(people[i], mean(many_sims))
}

sims

## Plot the probability

# Change our plotting area to a 1 x 1 surface
par(mfrow = c(1,1))

plot(x = sims[,1], y = sims[,2], 
     pch = 16, col = "blue", 
     xlab = "Nr of People", 
     ylab = "Probability of at Least One Match")


