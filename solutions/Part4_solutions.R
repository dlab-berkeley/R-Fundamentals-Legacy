# R Fundamentals Part 4: Challenge Problem Solutions

### Challenge 1: Importing data from files.
### 1. Wipe your global environment clean.
rm(list = ls())

### 2. Restart your R session by clicking "Session" --> "Restart R".

### 3. Load the gap dataset.
gap <- read.csv(here("data/gapminder-FiveYearData.csv"))

### 4. Load the heart dataset.
heart <- read.csv(here("data/heart.csv"))

### Challenge 2: Write your own functions.
### 1. Write a function that calculates the area of a circle with radius r. The formula for the area of a circle is A = pi * r^2.
area <- function(r) {
  return(pi * r^2)
}
area(2)
4 * pi

### 2. Write a function that calculates the sample standard deviation given a vector of numeric values. Check that this function returns the same output as the base function sd().
my_sd <- function(vec) {
  n_samples <- length(vec)
  avg <- mean(vec)
  var <- sum((vec - avg)^2) / (n_samples - 1)
  return(sqrt(var))
}
vec <- c(2, 5, 10, 20)
sd(vec)
my_sd(vec)

### Challenge 3: Automating tasks with functions and for-loops.
### 1. Create a function that takes a number and returns whether it is prime or not. Use a for-loop and if-statement on the inside of the function. You will need to use the modulus operator, %%. The operation a %% b returns the remainder when a is divided by b.
prime_checker <- function(n) {
  # The number 2 is an edge case!
  if (n == 2) {
    return(TRUE)
  }
  for (i in 2:(n-1)) {
    if (n %% i == 0) {
      return(FALSE)
    }
  }
  return(TRUE)
}
prime_checker(2)

### 2. Monte Carlo sampling can be used to approximate the value of pi. We can do this by sampling random points in a 1x1 square. The fraction of sampled points that lie within the circle should approximate the area of the circle divided by the area of the square. A circle of radius r = 0.5 can lie within this square. The area of this circle is A = pi * (0.5)^2 = pi / 4. Since the area of the square is 1^2 = 1, this fraction is equal to pi / 4. So, Monte Carlo sampling can be used to approximate pi.

### Create a function the approximates pi. It should accept as an argument the number of points to sample.
simulation <- function(n_points) {
  # Sample points
  x <- runif(n_points, min = -1, max = 1)
  y <- runif(n_points, min = -1, max = 1)
  # Determine if they lie in the circle
  distance <- x^2 + y^2
  within_circle <- distance < 1
  # Calculate fraction of points
  frac_points <- mean(within_circle)
  # Estimate pi
  pi_estimate <- frac_points * 4
  return(pi_estimate)
}
simulation(1e7)

## Now, with plotting:
simulation_plotter <- function(n_points) {
  # Sample points
  x <- runif(n_points, min = -1, max = 1)
  y <- runif(n_points, min = -1, max = 1)
  # Determine if they lie in the circle
  distance <- x^2 + y^2
  within_circle <- distance < 1
  # Calculate fraction of points
  frac_points <- mean(within_circle)
  # Estimate pi
  pi_estimate <- frac_points * 4
  # Calculate fraction of points
  plot(x, y, col = within_circle + 1, pch = 20,
       main = paste0("Pi estimate = ", pi_estimate))

}
simulation_plotter(10000)
