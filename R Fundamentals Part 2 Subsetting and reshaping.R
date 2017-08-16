## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ---- eval=FALSE---------------------------------------------------------
## getwd()
## setwd("/home/sam/Desktop/R-Fundamentals")

## ------------------------------------------------------------------------
message <- 'How to store character data into a variable'
remindMe = TRUE

## ------------------------------------------------------------------------
ls()

## ------------------------------------------------------------------------
rm(remindMe)
rm(list=ls())

## ------------------------------------------------------------------------
integer_variable = 6L
class(integer_variable)
numeric_variable = 6
class(numeric_variable)
is.integer(numeric_variable)

character_variable = 'Hey there'
class(character_variable)
logical_variable = TRUE
class(logical_variable)

rm(list=ls())

## ---- eval=FALSE---------------------------------------------------------
## read.csv('data/emotions.csv', header=TRUE, stringsAsFactors=FALSE)

## ---- eval=FALSE---------------------------------------------------------
## ?c

## ------------------------------------------------------------------------
numeric_vector <- c(3, 5, 6, 5, 3)
numeric_vector

## ------------------------------------------------------------------------
numeric_vector2 <- c(numeric_vector, 78)
numeric_vector2

class(numeric_vector2)
class(78)

## ------------------------------------------------------------------------
logical_vector <- c(TRUE, TRUE, FALSE)
logical_vector

logical_vector2 <- c(logical_vector, c(FALSE, FALSE, FALSE))
logical_vector2

character_vector <- c('one', 'two', 'three', 'four', 'I', 'declare')
character_vector

## ------------------------------------------------------------------------
numeric_vector_element <- numeric_vector * numeric_vector
numeric_vector_element

numeric_vector_element2 <- numeric_vector2 + numeric_vector2
numeric_vector_element2

## ------------------------------------------------------------------------
dotproduct <- numeric_vector %*% numeric_vector
dotproduct

## ------------------------------------------------------------------------
scaled_numeric_vector <- numeric_vector * 5
scaled_numeric_vector

## ------------------------------------------------------------------------
c(1,2,3,4) * c(TRUE, FALSE)

## ---- eval=FALSE---------------------------------------------------------
## ?length

## ------------------------------------------------------------------------
length(logical_vector2)
seq(from=0,to=length(logical_vector2),by=2)

## ------------------------------------------------------------------------
0:8

sequence_vector <- c(28:33)
sequence_vector 

0:length(logical_vector2)

## ---- eval=FALSE---------------------------------------------------------
## ?matrix
## empty_matrix <- matrix(nrow=25, ncol=4)

## ------------------------------------------------------------------------
matrix_of_NAs <- matrix(NA, nrow = 5, ncol = 4)
matrix_of_NAs
matrix_of_5s <- matrix(5, nrow = 5, ncol = 4)
matrix_of_5s
class(matrix_of_5s)

## ------------------------------------------------------------------------
# Create a numeric vector from 1 to 20
our_20s <- 1:20
our_20s
class(our_20s)

# Coerce this vector to a matrix with 10 rows and 2 columns:
wheres_the_vector <- matrix(our_20s, ncol=2)
wheres_the_vector
class(wheres_the_vector)

## ------------------------------------------------------------------------
class(wheres_the_vector[1,1])

## ------------------------------------------------------------------------
dim(wheres_the_vector)
nrow(wheres_the_vector)
ncol(wheres_the_vector)

## ---- eval=FALSE---------------------------------------------------------
## ?list

## ------------------------------------------------------------------------
list_variable <- list(TRUE, "one", 1) # include three kinds of data: logical, character, and integer
list_variable
class(list_variable)

## ---- eval=FALSE---------------------------------------------------------
## list_object * list(FALSE, "zero", 0) # Error

## ---- eval=FALSE---------------------------------------------------------
## ?data.frame

## ------------------------------------------------------------------------
now_were_talking <- data.frame(numeric_vector2, numeric_vector_element2, logical_vector2, character_vector, sequence_vector, stringsAsFactors=FALSE)
# NOTE: `stringsAsFactors=FALSE` means that R will NOT try to interpret character data as factor type. More on this below. 
class(now_were_talking)

## ------------------------------------------------------------------------
head(now_were_talking)
tail(now_were_talking)

## ---- eval=FALSE---------------------------------------------------------
## ?str

## ------------------------------------------------------------------------
str(now_were_talking)

## ------------------------------------------------------------------------
dim(now_were_talking)
nrow(now_were_talking)   # number of rows
ncol(now_were_talking)   # number of columns

## ------------------------------------------------------------------------
colnames(now_were_talking)
names(now_were_talking)

# Create a vector called `new_df_names` with the new column names:
new_df_names <- c("Weight", "Height", "Consented", "Favorite Word", "Participant Number")

# Pass this vector into `colnames()`
colnames(now_were_talking) <- new_df_names
str(now_were_talking)

class(colnames(now_were_talking))

## ------------------------------------------------------------------------
rownames(now_were_talking)
rownames(now_were_talking) <- c('Sub1', 'Sub2', 'Sub3', 'Sub4', 'Sub5', 'Sub6')

## ------------------------------------------------------------------------
rm(list=ls())
emotions_df <- read.csv('data/emotions.csv', header=TRUE, stringsAsFactors = FALSE)
str(emotions_df)

## ------------------------------------------------------------------------
emotions_df$Scenario <- as.factor(emotions_df$Scenario)
emotions_df$Gender <- as.factor(emotions_df$Gender)

## ------------------------------------------------------------------------
f <- factor(c("Apple", "Orange", "Pear"))
p <- c(10, 28, 36)
basket <- data.frame(f, p)
basket

colnames(basket) <- c("Fruit", "Price")
basket

basket$Color <- factor(c("Red", "Orange", "Green"))
str(basket)
basket

## ---- eval=FALSE---------------------------------------------------------
## ?"["

## ------------------------------------------------------------------------
colnames(emotions_df)

## ------------------------------------------------------------------------
character_column_indices <- c("Valence", "Scenario")
emotionSemantic_df <- emotions_df[, character_column_indices]
class(emotionSemantic_df)
str(emotionSemantic_df)

## ------------------------------------------------------------------------
valence <- emotions_df[,'Arousal']
str(valence)
class(valence)

## ------------------------------------------------------------------------
integer_column_numbers = c(1,7)
emotionSemantic_df2 <- emotions_df[,integer_column_numbers]
str(emotionSemantic_df2)
identical(emotionSemantic_df, emotionSemantic_df2)

## ------------------------------------------------------------------------
nrow(emotions_df)

## ------------------------------------------------------------------------
emotions_NoFirst20_df <- emotions_df[-(1:20),]
nrow(emotions_NoFirst20_df)
str(emotions_NoFirst20_df)

## ------------------------------------------------------------------------
-(1:20)
-1:-20
c(-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15,-16,-17,-18,-19,-20)

## ------------------------------------------------------------------------
-1:20

## ------------------------------------------------------------------------
logical_column_numbers = c(TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE)
emotionSemantic_df3 <- emotions_df[,logical_column_numbers]
str(emotionSemantic_df3)
identical(emotionSemantic_df, emotionSemantic_df3)

## ------------------------------------------------------------------------
missing_column_numbers = c(TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE)
extraColumns_df <- emotions_df[,missing_column_numbers]
ncol(extraColumns_df) 

## ------------------------------------------------------------------------
high_arousal_df <- emotions_df[emotions_df[,'Arousal'] >= 5,]
nrow(high_arousal_df)

## ---- eval=FALSE---------------------------------------------------------
## emotions_df[,'Arousal']

## ---- eval=FALSE---------------------------------------------------------
## emotions_df[,'Arousal'] >= 5
## length(emotions_df[,'Arousal'] >= 5)

## ------------------------------------------------------------------------
# Step #1: Get the vector of all the arousal values
arousal_vector <- emotions_df[,'Arousal']
length(arousal_vector)

# Step #2: Create a logical vector that is TRUE for all the rows where that subject's arousal value is greater than or equal to 5
logical_indexing_vector = arousal_vector >= 5
length(logical_indexing_vector)

# Step #3: Do logical indexing using the logical vector we just created
high_arousal_df2 <- emotions_df[logical_indexing_vector,]
identical(high_arousal_df,high_arousal_df2)

## ---- eval=FALSE---------------------------------------------------------
## ?"&"

## ------------------------------------------------------------------------
high_arousal_consent_df <- emotions_df[emotions_df[,'Arousal'] >= 5 & emotions_df[,'Consent'],]
nrow(high_arousal_consent_df)

## ------------------------------------------------------------------------
high_arousal_basic_df <- emotions_df[emotions_df[,'Arousal'] >= 5, 'Age']
class(high_arousal_basic_df)
length(high_arousal_basic_df)

## ------------------------------------------------------------------------
first10_character_df <- emotions_df[1:10, nchar(colnames(emotions_df)) >7]
str(first10_character_df)

## ------------------------------------------------------------------------
# The whole thing at once, creating a logical vector that is the length of the number of columns.
nchar(colnames(emotions_df)) >7

# get the column names
column_names <- colnames(emotions_df)

# pass the column names into nchar, which will give us the number of characters in each character string of a character vector
col_name_lengths <- nchar(column_names)
col_name_lengths

# create the logical vector of column names that have more than 7 characters
col_name_lengths > 7

## ---- eval=FALSE---------------------------------------------------------
## ?"[["

## ------------------------------------------------------------------------
example_list <- list(TRUE, "string data", 5)
example_list

## ------------------------------------------------------------------------
example_list[1]

## ------------------------------------------------------------------------
example_list[[1]]

## ---- eval=FALSE---------------------------------------------------------
## sum(example_list[3], 3) # INCORRECT
## sum(example_list[[3]], 3) # CORRECT

## ---- eval=FALSE---------------------------------------------------------
## ?"$" # Remember that we must wrap symbols in quotation marks to view their help pages

## ---- eval=FALSE---------------------------------------------------------
## emotions_df$Arousal

## ---- eval=FALSE---------------------------------------------------------
## emotions_df[['Arousal']]

## ---- eval=FALSE---------------------------------------------------------
## emotions_df[,'Arousal'] # Using Character vectors
## emotions_df[,colnames(emotions_df) == 'Arousal'] # Using logical vectors
## emotions_df[,4] # Using Integer vectors, where Arousal is the 4th column

## ---- eval=FALSE---------------------------------------------------------
## ?is.na

## ------------------------------------------------------------------------
emotions_missing_df <- read.csv('data/emotions_missing.csv', header=TRUE)

## ---- eval=FALSE---------------------------------------------------------
## is.na(emotions_missing_df)

## ------------------------------------------------------------------------
emotions_imputed_df <- emotions_missing_df
emotions_imputed_df[is.na(emotions_imputed_df)] <- 0

## ---- eval=FALSE---------------------------------------------------------
## emotions_imputed_df

## ---- eval=FALSE---------------------------------------------------------
## ?complete.cases

## ------------------------------------------------------------------------
emotions_nomissing_df <- emotions_missing_df[complete.cases(emotions_missing_df),]  
str(emotions_nomissing_df)

## ------------------------------------------------------------------------
sum(is.na(emotions_nomissing_df))

## ---- eval=FALSE---------------------------------------------------------
## ?"!"

## ------------------------------------------------------------------------
emotions_onlymissing_df <- emotions_missing_df[!complete.cases(emotions_missing_df),]

## ------------------------------------------------------------------------
str(emotions_onlymissing_df) # All rows have at least one cell with missing data
sum(is.na(emotions_onlymissing_df)) # Now we see TRUE values where data is missing

## ---- eval=FALSE---------------------------------------------------------
## ?which

## ------------------------------------------------------------------------
which(complete.cases(emotions_missing_df))

## ---- eval=FALSE---------------------------------------------------------
## ?merge #Click the "Merge two data frames" link

## ------------------------------------------------------------------------
df1 <- data.frame(Name=c("Joe", "Susan", "Jack", "Kelly"),
                  City=c("Berkeley", "Berkeley", "Oakland", "Oakland"),
                  Math=c(42, 48, 50, 46),
                  Reading=c(8, 10, 10, 10))
df1

df2 <- data.frame(Name=c("Joe", "Susan", "Jack", "Kelly"),
                    Science=c(99, 100, 99, 100),
                    Music=c(19, 18, 20, 20),
                    Art=c(20, 20, 19, 18))
df2

df_merge <- merge(df1, df2, by="Name")
df_merge
#What happened here? 

## ---- eval=FALSE---------------------------------------------------------
## ?cbind
## ?rbind # Click the "Combine R Objects by Rows or Columns" link

## ------------------------------------------------------------------------
df1

df3 <- data.frame(Name=c("Heather", "Billy", "Hector", "Jane"),
                  City=c("San Francisco", "Los Angeles", "San Francisco", "Chico"),
                  Math=c(49, 44),
                  Reading=c(10,10))
df3

df_cbind <- cbind(df1, df3)
df_cbind

## ------------------------------------------------------------------------
df1 

dfB <- data.frame(Name=c("James", "Cher", "Elizabeth", "Barack"),
                  City=c("Cleveland", "Memphis", "Detroit", "Chicago"),
                  Math=c(44, 49, 50, 49),
                  Reading=c(9, 9, 9, 10))
df_rbind <- rbind(df1, dfB)
df_rbind

## ---- eval=FALSE---------------------------------------------------------
## ?t

## ------------------------------------------------------------------------
mat1 <- matrix(1:10, nrow=5, ncol=2)
mat1
mat1_t <- t(mat1)
mat1_t

# or
animals <- read.csv('data/animals.csv')
animals_t <- t(animals)
animals_t

## ---- eval=FALSE---------------------------------------------------------
## library(reshape2)
## library(reshape)

## ------------------------------------------------------------------------
head(animals)

## ------------------------------------------------------------------------
?melt
?dcast

## ---- eval=FALSE---------------------------------------------------------
## animals_melt <- melt(animals, id="Type")
## str(animals_melt)

## ---- eval=FALSE---------------------------------------------------------
## animals_melt

## ---- eval=FALSE---------------------------------------------------------
## type_means <- dcast(animals_melt, Type~variable, mean)
## type_means
## 
## type_sd <- dcast(animals_melt, Type~variable, sd)
## type_sd

