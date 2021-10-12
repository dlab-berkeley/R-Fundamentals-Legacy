# R Fundamentals: Part 2 of 4

# Section 1: Importing Data from Files

## First, we need to set the working directory. This is the folder that RStudio considers "home base".
## There are a couple ways to set the working directory.
## Option 1: Click Session -> Set Working Directory -> Choose Directory. Then, select the R-Fundamentals ## folder you downloaded or cloned.
## Option 2: Using the setwd() function. You need to know the exact path to where the R-Fundamentals is located. Save this in the working_directory variable:
working_directory <- ""
## For example, if it's on your desktop, this path might be "~/Desktop/R-Fundamentals" (Mac) or "C:/Users/YourUserName/Desktop/R-Fundamentals/" (PC).
## Then, run the setwd() function:
setwd(working_directory)
## You can double-check that this worked by using the getwd() function. What does this do?
getwd()


## Why doesn't this work? 
gap <- read.csv("gapminder-FiveYearData.csv")

## There is no such file in this directory! 
## View the contents of your working directory with dir:
dir()

## We need to go one level deeper into our file system (into the "data" folder)
## Therefore, we can simply add this to the file path, otherwise we could simply select the "data" folder when setting our working directory
gap <- read.csv("data/gapminder-FiveYearData.csv")
gap

## We can also add optional arguments
gap <- read.csv(file = "data/gapminder-FiveYearData.csv", 
                # Place column names in header row outside of the data
                header = TRUE, 
                # Tell R to code anything defined here as NA
                # We have none of these so they will be ignored
                na.strings = c("", " ", "999", "?", "NONE", "none"))

## We can preview a dataset with the head() function
## The first six rows are displayed by default
head(gap)

## Or we can see its structure
str(gap)

## Or we can view the dataset in a separate tab as well
## Note the filter buttons in the header row
View(gap)

##### Challenge 1 - Load data from file
##### 1. Load the heart.csv file. Save it in a variable named heart

##### 2. Load the sleep_VIM.csv file. Save it in a variable named sleep_VIM

##### 3. What functions can you use to learn more about the sleep_VIM dataset?

# Section 2: Subset a Data Frame in One Dimension

## Wrap symbols in quotation marks to view their help pages
?"$" 

## Check out one column by typing the name of the data frame, the dollar sign, then the column name
sleep_VIM$Dream 

## You can also tab complete to see a list of columns. Helpful!
sleep_VIM$ # press the TAB key here and select a column
  
# Section 3: Subset a Data Frame in Two Dimensions

## There are many ways to efficiently subset rows and columns in R
## "Bracket notation" is the simplest
## Remember that we indexed a vector by typing a number in square brackets? We will do the same here, but will use a comma in the square brackets to designate rows from columns: 
## dataframe[rows, cols]

## Make a new dataframe called sleep_varnames, subsetting on two columns
## The space BEFORE the comma is left blank and tells R we want all the rows returned (because we didn't specify a row subset)
## Only the BodyWgt and BrainWgt columns are returned
sleep_varnames <- sleep_VIM[ , c("BodyWgt", "BrainWgt")]

## Check the structure and first few rows
str(sleep_varnames)
head(sleep_varnames)

## Select by column position
## We can also pass in integers to include particular columns
names(sleep_VIM)

## Suppose we just want the NonD (3rd), Sleep (5th), and Exp (9th) columns
sleep_posint <- sleep_VIM[ , c(3, 5, 9)] 
str(sleep_posint)
head(sleep_posint)

## We can also pass in negative integers to exclude specific columns
## Suppose we want to exclude BodyWgt and BrainWgt
names(sleep_VIM)
sleep_negint_VIM <- sleep_VIM[ , -c(1, 2)]
str(sleep_negint_VIM)
head(sleep_negint_VIM)

##### Challenge 2 - Subsetting data frames in one and two dimensions
##### 1. Create a subset of heart that returns only the sex, trestbps, and target columns

##### 2. Create a subset of heart that returns only rows 3 thru 7 and 12 and columns 2, 4, and 14

# Section 4: Subset with Logical Operators

## Remember your logical symbols from Part 1?
?"=="

## Subset rows based on a logical condition in one column
## Then, select by column positions
sleep_logical <- sleep_VIM[sleep_VIM$Exp == 4 , 8:10 ] 
sleep_logical

## Subsetting based on multiple conditions
## What if we want to incorporate multiple conditions?
?"&"
?"|"

## & (and) means that all conditions must be TRUE
## Subset rows only where Exp is 1 AND Danger is 2
sleep_logical_and <- sleep_VIM[sleep_VIM$Exp == 1 & 
                                 sleep_VIM$Danger == 2, ]
sleep_logical_and

## | (or) means that just one of the conditions must be TRUE
## Subset rows only where Exp is 1 OR Danger is 2
## Do you think we will get more or less rows returned? Why or why not?
sleep_logical_or <- sleep_VIM[sleep_VIM$Exp == 1 | 
                                sleep_VIM$Danger == 2, ]
sleep_logical_or

dim(sleep_logical_and) # 5 rows x 10 columns
dim(sleep_logical_or) # 36 rows x 10 columns

# Section 5: Subsetting Lists
## We can also subset lists with double brackets "[[]]"
?"[["

## Make an example list
example_list <- list(TRUE, "string data", 5, list(1, 2, 3))
example_list

## What happens with one bracket?
## Both the placeholder and the value are returned
example_list[1]

## What about double brackets?
## Just the value is returned
example_list[[1]]

## Section 6: Subset function

## We can also use the "subset" function to subset data based on logical conditions
?subset # subset will keep rows, select will keep columns!

# subset rows where "BrainWgt" is less than 60 and "Danger" equals 4 and "Exp" equals 3. 
# subset columns "BrainWgt", "Danger", "Exp".
subset_1 <- subset(x = sleep_VIM, 
                   subset = BrainWgt < 60 & 
                     Danger == 4 & 
                     Exp == 3,
                   select = c("BrainWgt", "Danger", "Exp"))
subset_1

# subset all rows where BrainWgt is less than 0.3 or Danger is equal to 5 along with the "BrainWgt", "Danger", and "Exp" columns:
subset_2 <- subset(sleep_VIM, 
                   subset = BrainWgt < 0.3 | Danger == 5, 
                   select = c(BrainWgt, Danger, Exp))
subset_2

##### Challenge 3
##### 1. Use the subset() function to create a subset of the heart dataset that returns only rows where chol is greater than 400 and all columns 

##### 2. Use the subset() function to create a subset of the heart dataset for sex equals 1 and chol is greater than 350 as well just the sex and chol columns.

# Section 7: Missing Data

## Let's review missing data from yesterday
?NA
?mean # Scroll down to `na.rm`

## Let's see how this works on our sleep_VIM data
mean(sleep_VIM$NonD) 

## This returns NA because R is unsure how to deal with NA cells for the `mean` computation.

# What happens if we use the na.rm = TRUE argument? It now computes the mean!
mean(sleep_VIM$NonD, na.rm = TRUE) 

# We can check to see if a cell is missing with is.na:
?is.na

is.na(sleep_VIM)

## Count the number of total missing cells (total number of TRUE) Why does this work?
sum(is.na(sleep_VIM))

## Make a copy of sleep_VIM to play with the missing data
sv <- sleep_VIM

## Convert NA to "NONE"
sv[is.na(sv)] <- "NONE"
sv

## Convert back to NA
## Why can we no longer use is.na?
sv[sv == "NONE"] <- NA
sv

## Now let's explore the complete cases function
?complete.cases

## This will return rows that only contain complete data
s_complete <- sleep_VIM[complete.cases(sleep_VIM), ]  
s_complete

# Sanity check:
is.na(s_complete)
sum(is.na(s_complete)) # what did we do here?

# Alternatively, we can subset to only include rows with missing data
?"!"

s_NA <- sleep_VIM[!complete.cases(sleep_VIM),]
s_NA # All rows have at least one cell with missing data

is.na(s_NA) # We see TRUE values where data is missing
sum(is.na(s_NA)) # 38 cells have missing data

# Section 8: Merging data

## We can merge dataframes by a column that is shared by both dataframes
?merge

## Make a toy dataframe
df1 <- data.frame(Name = c("Joe", "Susan", "Jack", "Kelly"),
                 City = c("Berkeley", "Berkeley", "Oakland", "Oakland"),
                 Math = c(42, 48, 50, 46),
                 Reading = c(8, 10, 10, 10))
df1

## Make a second toy dataframe
df2 <- data.frame(Name = c("Joe", "Susan", "Jack", "Kelly"),
                 Science = c(99, 100, 99, 100),
                 Music = c(19, 18, 20, 20),
                 Art = c(20, 20, 19, 18))
df2

## Merge the dataframes
df_merge <- merge(df1, df2, by = "Name")
df_merge

## cbind and rbind
## We can also "bind" two dataframes by rows or columns without anything shared between them
## How do you think this might be problematic?
?cbind
?rbind

df3 <- data.frame(Name = c("Heather", "Billy", "Hector", "Jane"),
                  City = c("San Francisco", "Los Angeles", "San Francisco", "Chico"),
                  Math = c(49, 44, 50, 50),
                  Reading = c(9, 7, 10, 10))
df3

df_cbind <- cbind(df1, df3)
df_cbind # Is this problematic? 

df4 <- data.frame(Name = c("James", "Tanisha", "Elizabeth", "Barack"),
                  City = c("Cleveland", "Memphis", "Detroit", "Chicago"),
                  Math = c(44, 50, 50, 49),
                  Reading = c(9, 9, 9, 10))
df4

df_rbind <- rbind(df1, df4)
df_rbind # What happened here?

##### Challenge 4
#Consider the following data frame 

challenge_df <- data.frame(Name = c("James", "Orianna", "Vidit", "Barack"),
                           City = c("Cleveland", "Minneapolis", "Seattle", "Chicago"),
                           Science = c(70, 60, 40, 70),
                           Art = c(15,15,20,20))

##### 1. Use merge to get a dataframe of the common name city pairs?
df_merge2 <- merge(df4, challenge_df, by = c("City", "Name"))
df_merge2

##### 2. Now try merging to get just common cities. What happens? 
df_merge3 <- merge(df4, challenge_df, by = c("City"))
df_merge3
