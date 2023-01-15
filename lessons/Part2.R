# R Fundamentals: Part 2 of 4

# Section 1: Matrices

## We are now going to introduce two types of data structures for handling data that comes in multiple dimensions. In Part 1, every data structure we looked at was in just one dimension. 
## A matrix is like a vector in that it can only contain data of the same type, but it can be organized into rows and columns.
## The rows and columns do not have to be the same. A matrix can have more rows than columns or more columns than rows.
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

## We will see the benefits of matrices in Part 4. 

# Section 2: Data frames

## Why do we care about multiple dimensions? Think about datasets that you have seen before. For example, suppose we collected data on the characteristics of D-Lab Workshop learners. We might want to know the age, degree program, previous familiarity with programming, research interests, and likely many other attributes (variables). 

## This kind of dataset is multidimensional. We have one row for each participant and a number of columns for each attribute we collect data on. If we had forty participants and collected 10 attributes for each participant, then we would have a 40 by 10 dataset.

## The data structure in R that is most suited for this kind of problem is the data frame. 
## A data frame is an ordered group of equal-length vectors. They are the most common type of data structure used for data analyses. Most of the time when we load real data into R (which we will see in the next section!), we are loading that data into a data frame. 
## Since they are vectors, each column can only contain the same data type, but columns of different types can be lined up next to each other.
## Meanwhile, rows can contain heterogeneous data.

## Let's create a data frame capturing some information about countries:
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

## You can extract a single column with the $ operator:
df$Country

## The $ operator can also be used to create new columns:
df$Density <- df$Population / df$Area
df


### Challenge 1: Make your own data frame.
### 1. Create a data frame that contains four different food items and three attributes for each: name, price, and quantity.
### 2. Add a fourth column that calculates the total cost for each food item.
### 3. What function could you use to calculate the total cost of all the foods combined?

# Section 3: Importing Data from Files

## Data 
## First, we need to set the working directory. This is the folder that RStudio considers "home base". There are a couple ways to do this.

## Option 1: Click Session -> Set Working Directory -> Choose Directory. Then, select the R-Fundamentals folder you downloaded or cloned.

## Option 2: Using the setwd() function. You need to know the exact path to where the R-Fundamentals is located. Save this in the working_directory variable:
working_directory <- ""

## For example, if it's on your desktop, this path might be:
## "~/Desktop/R-Fundamentals" (Mac) 
## If you downloaded the zip file of the workshop it 
## might be:
## "~/Desktop/R-Fundamentals-main" 

## On a PC this path might be
## "C:/Users/YourUserName/Desktop/R-Fundamentals/" or
## If you downloaded the zip file of the workshop it 
## might be:
## "C:/Users/YourUserName/Desktop/R-Fundamentals-main/"

## Then, run the setwd() function:
setwd(working_directory)

## You can double-check that this worked by using the getwd() function. What does this do?
getwd()

## Now, let's read in the data. The dataset we'll look at is the gapminder dataset, which contains information about the GDPs and life expectancies of countries over time. This data is located in a "comma separated value" (csv) file. We'll use the read.csv() function to read in the data.

## Why doesn't this work? 
gap <- read.csv("gapminder-FiveYearData.csv")

## There is no such file in this directory! 
## View the contents of your working directory with dir:
dir()

## We need to go one level deeper into our file system (into the "data" folder).
## Therefore, we need to select the "data" folder when specifying the file path:
gap <- read.csv("data/gapminder-FiveYearData.csv")
gap

## This file path is "relative" to the working directory. We could have also specified an "absolute" file path. The difference between the two is that an absolute path begins with a forward slash.

## We can also add optional arguments to the read.csv() function:
gap <- read.csv(file = "data/gapminder-FiveYearData.csv", 
                # Place column names in header row outside of the data
                header = TRUE,
                # Tell R to code anything defined here as NA
                na.strings = c("", " ", "?", "NONE", "none"))

## The gapminder dataset is automatically loaded as a dataframe. We can preview a dataframe with the head() function.
## The first six rows are displayed by default.
head(gap)

## We can see its structure:
str(gap)

## Or we can view the dataset in a separate tab as well:
View(gap)

## Notice that RStudio comes with a "Filter" button in the View panel.

### Challenge 2: Import data from a file.
### 1. Load the heart.csv file. Save it in a variable named heart. See more about the heart dataset here:

### https://archive.ics.uci.edu/ml/datasets/heart+Disease

### 2. Load the sleep_VIM.csv file. Save it in a variable named sleep_VIM. See more about the sleep VIM dataset here:

### https://rdrr.io/cran/VIM/man/sleep.html

### 3. What functions can you use to learn more about the heart or sleep_VIM datasets?


# Section 4: Subsetting Columns in a Data Frame

## Subsetting a data frame consists of extracting "slices" of it that are meaningful. This could be getting certain rows, or columns, or both.
## The dollar sign symbol, $, allows us to subset single columns. Let's take a look at its documentation. Note that you need to wrap symbols in quotation marks to view their help pages:
?"$"

## Check out one column by typing the name of the data frame, the dollar sign, then the column name.
sleep_VIM$Dream

## You can also tab complete to see a list of columns. Helpful!
sleep_VIM   # Place a dollar sign and press TAB to select from the available columns.
  
# Section 5: Subsetting a Data Frame in Two Dimensions

## There are many ways to efficiently subset rows and columns in R. The simplest is "bracket notation".
## Remember how we indexed a vector by typing a number in square brackets? We will do the same here, but will use a comma in the square brackets to designate rows from columns: 
## dataframe[rows, cols]

## The area BEFORE the comma is left blank and tells R we want ALL the rows returned (because we didn't specify a row subset).
## Only the BodyWgt and BrainWgt columns are returned
sleep_subset_names <- sleep_VIM[, c("BodyWgt", "BrainWgt")]
dim(sleep_subset_names)
head(sleep_subset_names)

## We can also pass in integers to to denote column number. Let's take a look at the columns:
names(sleep_VIM)

## Suppose we just want the NonD (3rd), Sleep (5th), and Exp (9th) columns:
sleep_subset_ints <- sleep_VIM[, c(3, 5, 9)] 
dim(sleep_subset_ints)
head(sleep_subset_ints)

## We can also pass in negative integers to EXCLUDE specific columns.
## Suppose we want to exclude BodyWgt and BrainWgt:
names(sleep_VIM)
sleep_subset_neg <- sleep_VIM[, -c(1, 2)]
dim(sleep_subset_neg)
head(sleep_subset_neg)

### Challenge 3: Subsetting data frames in one and two dimensions

### 1. Create a subset of heart that returns only the sex, trestbps, and target columns.

### 2. Create a subset of heart that returns rows 3-7 and row 12 along with columns 2, 4, and 14.

# Section 6: Subsetting with Logical Operators

## Remember your logical symbols from Part 1?
?"=="

## We can subset rows based on a logical condition in one column.
## Let's get the rows where the experiment number is equal to 4, and only choose specific columns:
sleep_logical <- sleep_VIM[sleep_VIM$Exp == 4, 8:10] 
dim(sleep_logical)
head(sleep_logical)

## We can also subset based on multiple conditions. We'll need the AND and OR operators for this:
?"&"
?"|"

## & (and) means that all conditions must be TRUE.
## Let's subset rows where Exp is 1 AND Danger is 2:
sleep_logical_and <- sleep_VIM[(sleep_VIM$Exp == 1) & (sleep_VIM$Danger == 2), ]
dim(sleep_logical_and)
head(sleep_logical_and)

## | (or) means that just one of the conditions must be TRUE.
## Let's subset rows where Exp is 1 OR Danger is 2.
## Do you think we will get more or less rows returned? Why or why not?
sleep_logical_or <- sleep_VIM[(sleep_VIM$Exp == 1) | (sleep_VIM$Danger == 2), ]
dim(sleep_logical_or)
head(sleep_logical_or)

# Section 7: Subsetting Lists

## Recall that lists are different from vectors and data frames. They can contain heterogeneous data types.
## We can also subset lists with double brackets "[[]]"
?"[["

## Let's make an example list:
example_list <- list(TRUE, "string data", 5, list(1, 2, 3))
example_list

## What happens with one bracket? Both the placeholder and the value are returned:
example_list[1]

## What about double brackets? Just the value is returned:
example_list[[1]]

## Section 8: Using dplyr to Subset Data Frames

## A modern approach to interacting with data frames is called dplyr. This package is part of the tidyverse, a suite of packages that helps facilitate data science in R.
## We need to first install this package. We can do so by running the install.packages() function:
install.packages("dplyr")

## It's good practice to pass the names of packages as a vector of names, and a requirement if you want to install more than one package at a time. The reason for this is that the second argument in install.packages() is the place on your computer where you want to install packages. R is smart enough to know what you mean by default if you just pass a single argument, but install.packages("dplyr", "anotherPackage") will lead to a cryptic warning that "lib = "anotherPackage" is not writable. Wrapping our packages in c() avoids this problem. 
install.packages(c("dplyr"))

## Now that it's installed, we need to import it to our current R session:
library(dplyr)

## In dplyr, we can use the "select" function to select columns:
sleep_select <- select(sleep_VIM, BodyWgt, BrainWgt)
dim(sleep_select)
head(sleep_select)

## Notice how we don't need to use quotation marks. dplyr is smart enough to figure out when we're talking about columns.
## We can also use the filter() function to subset rows according to logical condition:
sleep_filter <- filter(sleep_VIM, Exp == 1 & Danger == 2)
dim(sleep_filter)
head(sleep_filter)

## dplyr comes with a "piping" operator that allows us to perform multiple computations on the same data frame in a single command. If you have loaded dplyr then you can access this with the %>%
## If you have R 4.1 or higher, there is now a native pipe operator |>. For both you can think of the function as taking the output of the left hand side, and passing it into the function on the right hand side. Let's see it in action:
sleep_pipe <- sleep_VIM %>%
  filter(Exp == 1 & Danger == 2) %>%
  select(BodyWgt, BrainWgt)
dim(sleep_pipe)
head(sleep_pipe)

## Notice that we didn't need to pass sleep_VIM as the first argument of each function. The piping operator takes care of this for us.

## If you'd like to learn more about how to use dplyr to perform analysis, check out the Data Wrangling in R workshop!

# Section 9: Missing Data

## Let's review missing data:
?NA
?mean # Scroll down to "na.rm".

## Let's see how this works on our sleep_VIM data:
mean(sleep_VIM$NonD) 

## This returns NA because R is unsure how to deal with NA cells for the mean computation.

## What happens if we use the na.rm = TRUE argument? It now computes the mean!
mean(sleep_VIM$NonD, na.rm = TRUE) 

## We can check to see if a cell is missing with is.na:
?is.na
is.na(sleep_VIM)

## We can count the number of total missing cells. Why does this work?
sum(is.na(sleep_VIM))

## Perhaps we'd like to extract rows where NonD is *not* missing. We can do this using the ! operator and dplyr:
sleep_NonD <- sleep_VIM %>% 
  filter(!is.na(NonD))
head(sleep_NonD)

## How can we check whether the new data frame does in fact have no missing values for NonD?

## Maybe we'd like to extract the *rows* that have no missing values (rather than a specific column). Another package in the tidyverse - tidyr - provides us a useful function to do this:
install.packages(c("tidyr"))
library(tidyr)

## tidyr typically contains functions which allow you to transform your data frames from longer to wider (this is called pivoting). It also contains the drop_na() function, which is useful in this case:
sleep_non_missing <- sleep_VIM %>%
  drop_na()
dim(sleep_non_missing)
sum(is.na(sleep_non_missing))

# Section 10: Merging Data Frames

## We can merge two data frames by a column that is shared by both using the merge() function:
?merge

## Let's make a toy dataframe:
df1 <- data.frame(Name = c("Joe", "Susan", "Jack", "Kelly"),
                  City = c("Berkeley", "Berkeley", "Oakland", "Oakland"),
                  Math = c(42, 48, 50, 46),
                  Reading = c(8, 10, 10, 10))
df1

## And a second toy dataframe:
df2 <- data.frame(Name = c("Joe", "Susan", "Jack", "Kelly"),
                  Science = c(99, 100, 99, 100),
                  Music = c(19, 18, 20, 20),
                  Art = c(20, 20, 19, 18))
df2

## Merge the dataframes
df_merge <- merge(df1, df2, by = "Name")
df_merge

## In dplyr, there are several "join" functions used to perform merges. These include inner_join(), left_join(), right_join(), and full_join().
## The variations consist of how to treat cases when there might not be a one-to-one mapping between two rows of a data frame.
## Let's try the full_join() on the above example:
df_join <- full_join(df1, df2, by = "Name")
df_join

## Looks basically the same!

### Challenge 4
### Consider the following data frame:
challenge_df <- data.frame(Name = c("Joe", "Susan", "Juan", "Preeti"),
                           City = c("Berkeley", "Berkeley", "San Mateo", "San Jose"),
                           Physics = c(20, 21, 22, 23),
                           Chemistry  = c(23, 22, 21, 20))

### 1. Use the merge() function to merge df_merge and challenge_df by Name. What do you notice about the columns? How many rows are there?

### 2. Use the inner_join() function from dplyr to merge df_merge and challenge_df by Name. What happens if you merge by Name and City? 

### 3. Use the left_join() function to merge df_merge and challenge_df by Name and City. Use the right_join() function to merge df_merge and challenge_df by Name and City.

### 4. Use the full_join() function to merge df_merge and challenge_df by Name and City.

### What do you notice about the differences among 2, 3, and 4?


### Take Home Challenge (OPTIONAL)

## This take home challenge introduces the here package, a method of organizing filepaths. 

## Navigating directory structures can be confusing. We have to remember a lot of aspects of of where our files are located. This can be fragile and dependent on the way we order files on our computers, which are often different than the way our friends and colleagues do it. 

## One way to make this easier is to take advantage of the "here" R package. A package is a set of R code, data, documentation, and tests that are easy to share with others. The set of code usually revolves around some kind of task. We will see several packages through this fundamentals series. 


## The "here" package enables easy file referencing by using the top level directory of our project to build the file paths. For more information, check out the "here" package documentation [https://here.r-lib.org/articles/here.html]

## To use here we need to first install the package. We can do so by running the install.packages() function:
install.packages("here")

## Now that it's installed, we need to import it to our current R session:
library(here)

## Run the following 
here()

## Note that it returns a file path, which tells us what our working directory is now.
## Using here, we can read in our files like this 
gap <- read.csv(here("data/gapminder-FiveYearData.csv"))

## This doesn't look like much of a difference, which is a good thing! This workshop is built around an R Project, so the file structure looks the same on your machine. As you continue your R journey, we strongly recommend putting your data analyses in a similar structure. 

## We can also add optional arguments to the read.csv() function with calls to "here":
gap <- read.csv(file = here("data/gapminder-FiveYearData.csv"), 
                # Place column names in header row outside of the data
                header = TRUE,
                # Tell R to code anything defined here as NA
                na.strings = c("", " ", "?", "NONE", "none"))

## If you take more D-Lab workshops in the future (and we hope you will!) you will notice this pattern to read in files often. 