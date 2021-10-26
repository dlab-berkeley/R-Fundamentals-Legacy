# R-Fundamentals Part 2 - Challenge Problem Solutions

##### Challenge 1 - Load data from file
##### 1. Load the heart.csv file. Save it in a variable named heart
##### 2. Load the sleep_VIM.csv file. Save it in a variable named sleep_VIM
##### 3. What functions can you use to learn more about the sleep_VIM dataset?
heart <- read.csv("data/heart.csv")
heart

sleep_VIM <- read.csv("data/sleep_VIM.csv")
sleep_VIM

str(sleep_VIM) # show compact structure
head(sleep_VIM, n = 2) # show the first "n" rows (default is 6)
tail(sleep_VIM, n = 3) # Show the last "n" rows (default is 6)
dim(sleep_VIM) # row x col dimensions
nrow(sleep_VIM) # number of rows
ncol(sleep_VIM) # number of cols
colnames(sleep_VIM) # show column names
names(sleep_VIM) 
rownames(sleep_VIM) # # row names (unnamed; default to character type)
unique(sleep_VIM) # # show rows with unique data

##### Challenge 2 - Subsetting data frames in one and two dimensions
##### 1. Create a subset of heart that returns only the sex, trestbps, and target columns
heart_sub1 <- heart[, c("sex", "trestbps", "target")]
head(heart_sub1)

##### 2. Create a subset of heart that returns only rows 3 thru 7 and 12 and columns 2, 4, and 14
heart_sub2 <- heart[c(3:7, 12), c("sex", "trestbps", "target")]
heart_sub2

heart_sub2 <- heart[c(3:7, 12), c(2, 4, 14)]
heart_sub2

##### Challenge 3
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

# There are two rows and 10 columns. Without doing any additional merging by columns, we end up seeing duplicates. 
# Here we get duplicates on City. That would go away if we did 
merge(df_merge, challenge_df, by = c("Name", "City"))


### 2. Use the inner_join() function from dplyr to merge df_merge and challenge_df by Name. What happens if you merge by Name and City? 
inner_join(df_merge, challenge_df, by = c("Name"))

# Note that this gives us the same data frame as our first merge. Similarly 
inner_join(df_merge, challenge_df, by = c("Name", "City"))
# gives us back the same data frame without two city columns 

### 3. Use the left_join() function to merge df_merge and challenge_df by Name and City. Use the right_join() function to merge df_merge and challenge_df by Name and City.

# The reason we want to merge by multiple columns is to avoid the city.x and city.y issue
# Here's an example with left join. 
left_join(df_merge, challenge_df, by = c("Name"))

left_join(df_merge, challenge_df, by =c("Name", "City"))
right_join(df_merge, challenge_df, by = c("Name", "City"))

### 4. Use the full_join() function to merge df_merge and challenge_df by Name and City.
full_join(df_merge, challenge_df, by = c("Name", "City"))
### What do you notice about the differences among 2, 3, and 4?

# There are multiple answers to this, but a basic one is what city variable has NA values. This will change depending on the type of merge. Another difference will be which names are returned. 
