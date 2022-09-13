# R Fundamentals Part 2: Challenge Problem Solutions
library(here)

## Challenge 1: Make your own data frame.

## Create a data frame that contains four different food items and three attributes for each: name, price, and quantity.
foods <- data.frame(food = c("Apple", "Banana", "Tomato", "Watermelon"),
                    itemPrice = c(1.25, .5, 1.4, 4.20),
                    itemQuantity = c(4,6,2,1))
foods
colnames(foods) <- c("food", "price", "quantity")

## Add a fourth column that calculates the total cost for each food item.
foods$totalCost <- foods$price * foods$quantity


## What function could you use to calculate the total cost of all the foods combined?
sum(foods$totalCost)
example <- c(foods$totalCost, NA)
example
sum(example, na.rm = TRUE) 


### Challenge 2: Import data from a file.
### 1. Load the heart.csv file. Save it in a variable named heart.
heart <- read.csv("data/heart.csv")
heart

## Alternatively with the here package 
heart <- read.csv(here("data/heart.csv"))

### 2. Load the sleep_VIM.csv file. Save it in a variable named sleep_VIM.
sleep_VIM <- read.csv("data/sleep_VIM.csv")
sleep_VIM

## Alternatively with the here package
sleep_VIM <- read.csv("data/sleep_VIM.csv")

### 3. What functions can you use to learn more about the heart or sleep_VIM datasets?
# Show compact structure
str(sleep_VIM)
# Show the first "n" rows (default is 6)
head(sleep_VIM, n = 2)
# Show the last "n" rows (default is 6)
tail(sleep_VIM, n = 3)
# Dimensions of dataframe
dim(sleep_VIM)
# Number of rows
nrow(sleep_VIM)
# Number of cols
ncol(sleep_VIM)
# Show column names (two different ways)
colnames(sleep_VIM)
names(sleep_VIM) 
# Show row names (unnamed: default to character type for row number)
rownames(sleep_VIM)
# Show rows with unique data
unique(sleep_VIM) 

### Challenge 3: Subsetting data frames in one and two dimensions

### 1. Create a subset of heart that returns only the sex, trestbps, and target columns.
heart_sub1 <- heart[, c("sex", "trestbps", "target")]
head(heart_sub1)

### 2. Create a subset of heart that returns rows 3-7 and row 12 along with columns 2, 4, and 14.
heart_sub2 <- heart[c(3:7, 12), c(2, 4, 14)]
heart_sub2


### Challenge 4
### Consider the following data frame:
challenge_df <- data.frame(Name = c("Joe", "Susan", "Juan", "Preeti"),
                           City = c("Berkeley", "Berkeley", "San Mateo", "San Jose"),
                           Physics = c(20, 21, 22, 23),
                           Chemistry  = c(23, 22, 21, 20))

## Data for df_merge
df1 <- data.frame(Name = c("Joe", "Susan", "Jack", "Kelly"),
                  City = c("Berkeley", "Berkeley", "Oakland", "Oakland"),
                  Math = c(42, 48, 50, 46),
                  Reading = c(8, 10, 10, 10))

df2 <- data.frame(Name = c("Joe", "Susan", "Jack", "Kelly"),
                  Science = c(99, 100, 99, 100),
                  Music = c(19, 18, 20, 20),
                  Art = c(20, 20, 19, 18))

## Merge the dataframes
df_merge <- merge(df1, df2, by = "Name")

### 1. Use the merge() function to merge df_merge and challenge_df by Name. What do you notice about the columns? How many rows are there?
merge(df_merge, challenge_df, by = "Name")
# There are 2 rows and 10 columns. Without doing any additional merging by columns, we end up seeing duplicates. 
# Here, we get duplicates on "City". That would go away if we instead merge by additional categories:
merge(df_merge, challenge_df, by = c("Name", "City"))

### 2. Use the inner_join() function from dplyr to merge df_merge and challenge_df by Name. What happens if you merge by Name and City? 
inner_join(df_merge, challenge_df, by = c("Name"))
# Note that this gives us the same data frame as our first merge. Similarly, doing:
inner_join(df_merge, challenge_df, by = c("Name", "City"))
# gives us back the same data frame without two city columns 
### 3. Use the left_join() function to merge df_merge and challenge_df by Name and City. Use the right_join() function to merge df_merge and challenge_df by Name and City.

# The reason we want to merge by multiple columns is to avoid the city.x and city.y issue.
# Here's an example with left join:
left_join(df_merge, challenge_df, by = c("Name"))
left_join(df_merge, challenge_df, by =c("Name", "City"))
right_join(df_merge, challenge_df, by = c("Name", "City"))

### 4. Use the full_join() function to merge df_merge and challenge_df by Name and City.
full_join(df_merge, challenge_df, by = c("Name", "City"))
### What do you notice about the differences among 2, 3, and 4?
# There are multiple answers to this, but a basic one is what city variable has NA values. This will change depending on the type of merge. Another difference will be which names are returned. 
