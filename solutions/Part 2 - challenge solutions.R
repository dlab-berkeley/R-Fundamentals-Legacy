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
##### 1. How do you make a histogram of the chol column from the heart dataset?
# Google search something like "how to make histogram r" and read through one of the examples
hist(heart$chol)

##### 2. How do you make a scatterplot of the chol (on the x-axis) and trestbps (on the y-axis) from the heart dataset? 
# Google search "how to make scatterplot r" and try one of the examples
plot(x = heart$chol, 
     y = heart$trestbps)
