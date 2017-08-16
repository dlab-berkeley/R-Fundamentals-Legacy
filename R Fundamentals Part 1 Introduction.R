## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------
X <- 1
Y <- X + 5

## ------------------------------------------------------------------------
additionX <- X + 5
testX <- X == 5
exponentX <- X ^ 2

## ------------------------------------------------------------------------
sineX <- sin(X)
logX <- log(exp(10))

## ---- eval=FALSE---------------------------------------------------------
## install.packages("CAR")
## library(CAR)

## ------------------------------------------------------------------------
5 + 5

## ------------------------------------------------------------------------
12/4

## ---- eval=FALSE---------------------------------------------------------
## getwd()

## ---- eval=FALSE---------------------------------------------------------
## setwd("/home/sam/Desktop/R-Fundamentals")
## getwd()

## ---- eval=FALSE---------------------------------------------------------
## setwd("/Users/MacName/Desktop/R-Fundamentals-master")   # Mac and Linux
## setwd("C:\Users\PCName\Desktop\R-Fundamentals-master")  # note that PC users must use "C:\..."

## ------------------------------------------------------------------------
dir()

## ------------------------------------------------------------------------
ls() 

## ------------------------------------------------------------------------
numeric_variable <- 5

## ------------------------------------------------------------------------
ls()

## ------------------------------------------------------------------------
numeric_variable

## ------------------------------------------------------------------------
rm(numeric_variable)
ls()

## ------------------------------------------------------------------------
rm(list=ls()) 
ls()

## ------------------------------------------------------------------------
numeric_variable <- 5

## ------------------------------------------------------------------------
missing_variable <- NA
missing_variable  

## ------------------------------------------------------------------------
#
consent_to_contact = TRUE
supplied_email = 'samyag1@berkeley.edu'

email = NULL
if (consent_to_contact){
  email = supplied_email
}
email

## ------------------------------------------------------------------------
NaN_variable <- 0/0
NaN_variable

## ------------------------------------------------------------------------
infinity_variable <- 10/0
infinity_variable

## ------------------------------------------------------------------------
numeric_variable <- 100

## ------------------------------------------------------------------------
numeric_variable

## ------------------------------------------------------------------------
numeric_variable2 <- -200
ls() 

## ------------------------------------------------------------------------
numeric_variable2

## ---- eval=FALSE---------------------------------------------------------
## ?"<-"
## help("<-")
## ?ls
## help(ls)
## help("ls"")
## ?dir
## ?rm

## ------------------------------------------------------------------------
??"<-"
??rm

## ------------------------------------------------------------------------
2^5
5 > 10
!TRUE

## ------------------------------------------------------------------------
# This comment reminds use that we are calculating how many hours before we're R masters!
3*3 # and this comment tells us it better by 9!

## ------------------------------------------------------------------------
numeric_variable3 <- sum(numeric_variable, numeric_variable2)

## ------------------------------------------------------------------------
ls()
variable_names <- ls()
variable_names

## ------------------------------------------------------------------------
plot_return_val <- plot(c(1,2,3))
plot_return_val

## ------------------------------------------------------------------------
sum1 <- sum(1,2,3,4,NA,5,6)
sum2 <- sum(1,2,3,4,NA,5,6, na.rm=TRUE)

## ---- eval=FALSE---------------------------------------------------------
## install.packages("psych")

## ------------------------------------------------------------------------
library(psych)
# the psych package is now loaded in our current R instance

## ---- eval=FALSE---------------------------------------------------------
## install.packages("ggplot2")
## install.packages("knitr")
## install.packages("reshape2")
## install.packages("rmarkdown")
## install.packages("swirl")
## install.packages("VIM")
## 
## # Do not forget to load them before you use them!
## library(ggplot2)
## library(knitr)
## library(reshape2)
## library(rmarkdown)
## library(swirl)
## library(VIM)

## ------------------------------------------------------------------------
#class(numeric_variable)
#class(character_variable)
#class(logical_variable)

## ------------------------------------------------------------------------
observation_count <- 4
class(observation_count)

observation_count_integer <- as.integer(observation_count)
class(observation_count_integer)

# or
observation_count_integer <- 4L
class(observation_count_integer)

## ------------------------------------------------------------------------
radius = 2.3
area_circle <- pi * radius^2
area_circle
class(area_circle)

## ------------------------------------------------------------------------
tricky_R <- 4
class(tricky_R)

## ------------------------------------------------------------------------
captainObvious <- "This is character data"
captainObvious
class(captainObvious)

## ------------------------------------------------------------------------
crazyCharacters <- 'This is really only 1 Character long?'
length(crazyCharacters)

## ------------------------------------------------------------------------
nchar(crazyCharacters)

## ------------------------------------------------------------------------
crazyCharacters[1]

## ------------------------------------------------------------------------
substr(crazyCharacters,1,4)

## ------------------------------------------------------------------------
niceEnglishSentece <- sprintf('We have %i observations in our data.', observation_count_integer)
niceEnglishSentece

## ------------------------------------------------------------------------
twoSigDigits <- sprintf('Only show 2 significant digits of pi: %.2f', pi)
twoSigDigits

## ------------------------------------------------------------------------
messageHome <- paste("Hey", "momma", "I'm", "a", "string")
messageHome

## ------------------------------------------------------------------------
nonsense <- paste("Hey", "momma", "I'm", "a", "string", sep=" ")
nonsense 

## ------------------------------------------------------------------------
list_O_Words <- strsplit(messageHome, " ")
list_O_Words  

## ------------------------------------------------------------------------
list_O_Words[[1]][3]

## ------------------------------------------------------------------------
gsub("a", "Not a", messageHome)

## ------------------------------------------------------------------------
is_R_cool <- TRUE
is_R_cool
class(is_R_cool)

## ------------------------------------------------------------------------
is_R_cool + 1
TRUE - TRUE
TRUE + FALSE
FALSE - TRUE

## ---- eval=FALSE---------------------------------------------------------
## ?"=="
## ?"&"
## ?"|"
## ?"!"

## ------------------------------------------------------------------------
TRUE == TRUE
FALSE == FALSE
TRUE == FALSE
TRUE & TRUE   # and 
TRUE | FALSE  # or
TRUE != FALSE  # not
TRUE > FALSE
FALSE >= TRUE

## ------------------------------------------------------------------------
country <- c("USA", "Egypt", "Spain", "Egypt", "Spain", "USA")
country
class(country)
countryFactor <- "as.factor"(country)
countryFactor
class(countryFactor)

## ------------------------------------------------------------------------
countryEgyptFirst <- relevel(countryFactor, 'Egypt')
countryEgyptFirst
identical(countryFactor, countryEgyptFirst)
countryFactor[1] <- NA
countryFactor
countryEgyptFirst

## ------------------------------------------------------------------------
is.numeric(numeric_variable) 
is.logical(is_R_cool)

is.logical(nonsense)
class(nonsense)

## ------------------------------------------------------------------------
# Create some character data
some_number_string <- "9"
class(some_number_string)

# Coerce this character data to numeric data type
as.numeric(some_number_string)
class(some_number_string)

# What happened here? Why did `char_data` not change classes? (hint: we did not overwrite the object!)
some_number <- as.numeric(some_number_string)
class(some_number)
some_number

## ------------------------------------------------------------------------
# Create a new object
another_number_string <- "three"
another_number_string   #Note that the word three is contained within " " 
class(another_number_string)

# What happens if we try to coerce character to numeric data type? 
as.integer(another_number_string)

## ------------------------------------------------------------------------
another_number <- as.integer('three') # doesn't work
another_number <- as.integer('3') # does work

## ------------------------------------------------------------------------
save.image('Day1_data.RData')
getwd()

## ------------------------------------------------------------------------
rm(list=ls())
ls()

## ------------------------------------------------------------------------
load('Day1_data.RData')
ls()

## ---- eval=FALSE---------------------------------------------------------
## ?read.csv

## ---- eval=FALSE---------------------------------------------------------
## emotion_df <- read.csv('data/emotions.csv', header=TRUE)
## str(emotion_df)

## ---- eval=FALSE---------------------------------------------------------
## emotion_modified_df <- emotion_df
## emotion_modified_df[1,] <- NA

## ---- eval=FALSE---------------------------------------------------------
## ?write.csv

## ---- eval=FALSE---------------------------------------------------------
## write.csv(emotion_modified_df, "data/emotions_modified.csv", row.names=FALSE)

## ---- eval=FALSE---------------------------------------------------------
## library(swirl)
## swirl()
## # follow the instructions until you can select number 1 "R Programming: The basics of programming in R"

