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
##### 1. Use the subset() function to create a subset of the heart dataset that returns only rows where chol is greater than 400 and all columns 
heart_sub3 <- subset(heart, 
                     subset = chol > 400)
heart_sub3

##### 2. Use the subset() function to create a subset of the heart dataset for sex equals 1 and chol is greater than 350 as well just the sex and chol columns.
heart_sub4 <- subset(heart,
                     subset = sex == 1 & chol > 350, 
                     select = c("sex", "chol"))
heart_sub4

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

## There are now two "Name" columns, one named "Name.x" and one named "Name.y". 
## This happens because Name is a common column, but are not being passed to 
## merge

