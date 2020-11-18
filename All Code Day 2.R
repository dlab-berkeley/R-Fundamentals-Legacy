# R Script for Day 2

# Part 1 Load Data from Files

## Set Working Directory

## Go to Session -> Set Working Directory -> Choose Directory -> R-Fundamentals
## We can also do this with code:

#setwd("~/R-Fundamentals")

## We can read a dataset with the following code
gap = read.csv("data/gapminder-FiveYearData.csv", 
               # Place column names in header row outside of the data
               header = TRUE, 
               # Automatically convert string vectors to factor type?
               stringsAsFactors = T,
               # Tell R to code anything defined here as NA
               na.strings = c("", " ", "999", "?", "NONE", "none"))

## We can preview a dataset with the head() function

head(gap)

## Or we can see its structure

str(gap)

## Or we can view the dataset in a separate tab as well

View(gap)

# Part 2 Subset One Dimension

## Load in the sleep_VIM dataset

sleep_VIM = read.csv("data/sleep_VIM.csv")

# Returns the structure/critical information of the data object
str(sleep_VIM)    

# Dataframe dimensions. Rows are the first number, columns are the second. 
# Remember, your dataframe should have 62 rows and 10 columns! 
dim(sleep_VIM)    

# Row names (they have not been named and default to character type)
rownames(sleep_VIM)   
class(rownames(sleep_VIM)) 

# Number of rows
nrow(sleep_VIM)   

# Number of columns
ncol(sleep_VIM) 

# Show rows with unique data
unique(sleep_VIM)   

# Show the first "n" rows (default is 6)
head(sleep_VIM, n = 2) 

# Show the last "n" rows
tail(sleep_VIM, n = 3) 

# `names()` and `colnames()` both return column names of the data frame:
names(sleep_VIM)  
colnames(sleep_VIM)

# Help on the ?

?"$" # Remember to wrap symbols in quotation marks to view their help pages

# Check out one column by doing dataframe$column
sleep_VIM$Dream 

# You can also tab complete to see a list of columns

sleep_VIM$
  
# Part 3: Subset Two Dimensions
  
# Load sleep_VIM again so that we have a fresh copy
  
sleep_VIM = read.csv("data/sleep_VIM.csv")

# Make a new dataframe called sleep_varnames, subsetting on two columns
sleep_varnames = sleep_VIM[ , c("BodyWgt", "BrainWgt")]

# Check the structure and first few rows
str(sleep_varnames)
head(sleep_varnames)

# Select by column position

str(sleep_VIM)
sleep_posint = sleep_VIM[ , c(3, 5, 9)] 
str(sleep_posint)
head(sleep_posint)

# Subset with negative integers

str(sleep_VIM)
sleep_negint_VIM = sleep_VIM[ , -c(1, 2)]
str(sleep_negint_VIM)
head(sleep_negint_VIM)

# Subset with logical operators. First check what "==" does to refresh from yesterday
?"=="

# Subset based on a logical condition in one column, then select by column positions
sleep_logical = sleep_VIM[sleep_VIM$Exp == 4 , 8:10 ] 
sleep_logical

# What if we wanted to ues and/or conditions?

?"&"
?"|"

# & (and) = all conditions must be TRUE
sleep_logical_and = sleep_VIM[sleep_VIM$Exp == 1 & 
                                sleep_VIM$Danger == 2, ]

sleep_logical_and

# | (or) = just one of the conditions must be TRUE
sleep_logical_or = sleep_VIM[sleep_VIM$Exp == 1 | 
                               sleep_VIM$Danger == 2, ]
sleep_logical_or

dim(sleep_logical_and) # 5 rows x 10 columns
dim(sleep_logical_or) # 36 rows x 10 columns

# We can also subset lists with double brackets "[[]]"
?"[["

# Make an example list
example_list = list(TRUE, "string data", 5, list(1, 2, 3))
example_list

# What happens with one bracket?
example_list[1]

# What about double brackets?

example_list[[1]]

# Part 4: Subset function

## We can also use the "subset" function to subset data

## First let's see the documentation for subset
?subset

# Load the sleep_VIM dataset again
# subset rows where "BrainWgt" is less than 60 and "Danger" equals 4 and "Exp" equals 3. 
# subset columns "BrainWgt", "Danger", "Exp".
sleep_VIM = read.csv("data/sleep_VIM.csv")
subset_1 = subset(x = sleep_VIM, 
                  subset = BrainWgt < 60 & 
                    Danger == 4 & 
                    Exp == 3,
                  select = c("BrainWgt", "Danger", "Exp"))
subset_1

# subset all rows where BrainWgt is less than 100 or Danger equals 4 along with the "BrainWgt", "Danger", and "Exp" columns:
subset_2 = subset(sleep_VIM, 
                  subset = BrainWgt < 100 | Danger == 4, 
                  select = c(BrainWgt, Danger, Exp))
subset_2

# Part 5: Missing Data

## Let's review missing data from yesterday

?NA
?mean # Scroll down to `na.rm`

## Let's see how this works on our data

sleep_VIM = read.csv("data/sleep_VIM.csv")
# This returns NA because R is unsure how to deal with NA cells for the `mean` computation.
mean(sleep_VIM$NonD) 

# What happens if we use the na.rm = TRUE argument?

mean(sleep_VIM$NonD, na.rm = TRUE) #`mean()` now returns the mean!

# We can check to see if a cell is missing

?is.na

is.na(sleep_VIM)

# Count the number of total missing cells (total number of TRUE)
# Why does this work?
sum(is.na(sleep_VIM))

# Make a copy of sleep_VIM to play with the missing data

sv = sleep_VIM

# Convert NA to "NONE"
sv[is.na(sv)] = "NONE"
sv

# Convert back to NA
sv[sv == "NONE"] = NA
sv

# Now let's explore the complete cases function
?complete.cases

# What does this do?
s_complete = sleep_VIM[complete.cases(sleep_VIM) , ]  
s_complete

# Hint:
is.na(s_complete)
sum(is.na(s_complete)) # what did we do here?

# Alternatively, we can subset to only include rows with missing data

?"!"


s_NA = sleep_VIM[!complete.cases(sleep_VIM),]


s_NA # All rows have at least one cell with missing data
is.na(s_NA) # We see TRUE values where data is missing
sum(is.na(s_NA)) # 38 cells have missing data

## Merging data

### Make dataframe 1
df1 = data.frame(Name = c("Joe", "Susan", "Jack", "Kelly"),
                 City = c("Berkeley", "Berkeley", "Oakland", "Oakland"),
                 Math = c(42, 48, 50, 46),
                 Reading = c(8, 10, 10, 10))
df1

### Make dataframe 2

df2 = data.frame(Name = c("Joe", "Susan", "Jack", "Kelly"),
                 Science = c(99, 100, 99, 100),
                 Music = c(19, 18, 20, 20),
                 Art = c(20, 20, 19, 18))
df2

### Merge the dataframes

df_merge = merge(df1, df2, by = "Name")
df_merge

### cbind and rbind

?cbind
?rbind

df3 = data.frame(Name = c("Heather", "Billy", "Hector", "Jane"),
                 City = c("San Francisco", "Los Angeles", "San Francisco", "Chico"),
                 Math = c(49, 44),
                 Reading = c(10,10))
df3

df_cbind = cbind(df1, df3)
df_cbind

dfB = data.frame(Name = c("James", "Tanisha", "Elizabeth", "Barack"),
                 City = c("Cleveland", "Memphis", "Detroit", "Chicago"),
                 Math = c(44, 49, 50, 49),
                 Reading = c(9, 9, 9, 10))

df_rbind = rbind(df1, dfB)
df_rbind

