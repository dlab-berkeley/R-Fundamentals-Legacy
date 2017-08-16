## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------
emotions_df <- read.csv('data/emotions.csv', header=TRUE, stringsAsFactors = FALSE)

## ---- eval=FALSE---------------------------------------------------------
## ?"if"

## ------------------------------------------------------------------------
if (nrow(emotions_df) > 1000){
  print("Wow, we've got some big data!")
}

## ------------------------------------------------------------------------
# Use the complete.cases function and which functions we learned today to get the row numbers that have at least one piece of # missing data NA
missingrows <- which(!complete.cases(emotions_df))

# now let's write out a file that lists the row numbers of
if (length(missingrows) > 0){
  write.csv(missingrows, "data/RowNumbersWithMissingData.csv", col.names = FALSE)
}

## ------------------------------------------------------------------------
SCALE_DATA <- TRUE
if(SCALE_DATA) {
  valence_foranalysis_df <- scale(emotions_df$Valence)
} else {
  valence_foranalysis_df <- emotions_df$Valence
}

# Now run my statistical tests on the new dataframe, and we don't have to worry if it was scaled or not...

## ---- eval=FALSE---------------------------------------------------------
## ?"ifelse"

## ------------------------------------------------------------------------
emotions_df$AnxietyHighLow <- ifelse(emotions_df$Anxiety>=median(emotions_df$Anxiety), TRUE, FALSE)
sum(emotions_df$AnxietyHighLow)

## ------------------------------------------------------------------------
indexToActOn <- 10
if(emotions_df$Gender[indexToActOn] == 'Female'){
  print( 'We found a female person.')
} else if(emotions_df$Gender[indexToActOn] == 'Male'){
  print( 'We found a male person.')
} else if(emotions_df$Gender[indexToActOn] == 'Other'){
  print( 'We found an other gendered person.')
} else {
  print( "Uh-Oh, we encountered a Gender factor level we weren't expecting")
}


## ---- eval=FALSE---------------------------------------------------------
## voterIndex <- 100 # you can change this number
## # TODO - Fill in the code below
## if(){
##   print('SLOGAN #1')
## } else if(){
##   print('SLOGAN #2')
## } else if(){
##   print('SLOGAN #3')
## } else if(){
##   print('SLOGAN #4')
## } else if(){
##   print('SLOGAN #5')
## }

## ---- eval=FALSE---------------------------------------------------------
## ?"for"

## ------------------------------------------------------------------------
# simple example to print out the 1st through 10th Valence values.
for (i in 1:10){
  print(emotions_df$Valence[i])
}

## ------------------------------------------------------------------------
for (i in 1:nrow(emotions_df)){
  print(emotions_df$Valence[i])
}

## ------------------------------------------------------------------------
charsToIterate <- c('Loops', 'Are', 'Very', 'Versatile')
for (curChar in charsToIterate){
  print(curChar)
}

## ------------------------------------------------------------------------
for (curTrial in 1:nrow(emotions_df)){
  if(emotions_df$Scenario[curTrial] %in% c('S1', 'S2', 'S3')) {
    tempValence <- emotions_df$Valence[curTrial]
    emotions_df$Valence[curTrial] <- emotions_df$Arousal[curTrial]
    emotions_df$Arousal[curTrial] <- tempValence
  }
}

## ---- eval=FALSE---------------------------------------------------------
## ?break

## ------------------------------------------------------------------------
for(i in 1:nrow(emotions_df)){
    print(emotions_df$Valence[i])
    if(emotions_df$Valence[i] > 10){
      break
    }
}

## ------------------------------------------------------------------------
emotions_df$Valence[15] <-  as.numeric(NA)

## ------------------------------------------------------------------------
for(i in 1:nrow(emotions_df)){
    print(emotions_df$Valence[i])
    if(is.na(emotions_df$Valence[i])){
      break
    }
}

## ---- eval=FALSE---------------------------------------------------------
## ?"function"

## ------------------------------------------------------------------------
test_function <- function(x){
  x + 1
}

class(test_function)        # Returns the class of `test_function`
formals(test_function)      # Shows the defined arguments
body(test_function)         # Displays the statements to be evaluated
environment(test_function)  # Returns the envirnoment his function is defined in. NOT the function's own local environment
test_function               # Shows all the above information about your function 

## ------------------------------------------------------------------------
test_function(2)

## ------------------------------------------------------------------------
funcWithDefault <- function(x, y=2){
  (x + y) / y
}
funcWithDefault(5)
funcWithDefault(4, 4) # here, we do not need to specify `x` and `y` because R knows that the second argument is "y"
funcWithDefault(4, y=4) # this is the same as f(4, 4)

#does f(y=4, 4) work? Yes, but it is not recommended.
funcWithDefault(y=4, 4)

## ------------------------------------------------------------------------
funcWithNULLDefault <- function(x, y=NULL){
  if (is.null(y)){
    returnValue <- x
  } else {
    returnValue <- (x + y) / y
  }
  returnValue
}
funcWithNULLDefault(5)
funcWithNULLDefault(5,10)

## ------------------------------------------------------------------------
test_function <- function(x){
  return(x + 1)
}

## ------------------------------------------------------------------------
funcWithNULLDefault <- function(x, y=NULL){
  if (is.null(y)){
    return(x)
  } 
  
  # this is the return value as the code is written
  (x + y) / y
  
  # but if new code is added here later on, and return wasn't called above, the function wouldn't return x when y is NULL 
}

## ------------------------------------------------------------------------
funcMultiReturn <- function(x, y){
  return(list(x+5, !y))
}  

## ------------------------------------------------------------------------
environmentTest <- function(x){
  z <- 5
  return(x + z)
}

environmentTest(10)

# Does the variable 'z' exist in the global environment?
zInGlobal <- 'z' %in% ls()

## ------------------------------------------------------------------------
z <- 5 # define z outside of the function environment in the global environment

environmentTest2 <- function(x){
  return(x + z)
}
environmentTest2(10)

zInGlobal <- 'z' %in% ls()

## ------------------------------------------------------------------------
in_to_cm <- function(x){
  x * 2.5
}
in_to_cm(74)
#Evan is 185 cm tall (incorrectly assuming that 1 inch = 2.5 cm)

## ---- eval=FALSE---------------------------------------------------------
## in_to_m <- function(x){
##   x * 2.5 / 100
## }

## ------------------------------------------------------------------------
in_to_m <- function(x){
  in_to_cm(x) / 100
}
in_to_m(74)

## ------------------------------------------------------------------------
in_to_cm <- function(x){
  x * 2.54
}
in_to_m(74)
#Evan is actually 1.8796 meters tall

## ---- eval=FALSE---------------------------------------------------------
## # get the SubjectNo of all subjects that identify as 'Other' gender
## otherGenderSubjectNos <- unique(emotions_df[emotions_df$Gender == 'Other', 'SubjectNo'])
## 
## # let's add a new variable to our dataframe for special notes
## emotions_df$Notes <- character(nrow(emotions_df))
## 
## # loop over those subject numbers and read their file containing more information
## for (curSubjectNo in otherGenderSubjectNos) {
##   # create the filename for the current subject
##   textFilename <- sprintf('TextFilename_SubjectNo%03i.txt', curSubjectNo)
## 
##   # read in the text file with the note
##   currentNote <- readLines(textFilename)
## 
##   # store the current note in all the Note rows where the SubjectNo equals the current subjectNo
##   emotions_df$Notes[emotions_df$SubjectNo==curSubjectNo] <- currentNote
## }

## ------------------------------------------------------------------------
uniqueTest <- unique(c(1,1,1,2,2,2))
uniqueTest

otherGenderSubjectNos <- unique(emotions_df[emotions_df$Gender == 'Other', 'SubjectNo'])

## ---- eval=FALSE---------------------------------------------------------
## emotions_df$Notes <- character(nrow(emotions_df))

## ---- eval=FALSE---------------------------------------------------------
## for (curSubjectNo in otherGenderSubjectNos) {
## }

## ---- eval=FALSE---------------------------------------------------------
##   # create the filename for the current subject
##   textFilename <- sprintf('TextFilename_SubjectNo%03i.txt', curSubjectNo)
## 
##   # read in the text file with the note
##   currentNote <- readLines(textFilename)

## ---- eval=FALSE---------------------------------------------------------
##   emotions_df$Notes[emotions_df$SubjectNo==curSubjectNo] <- currentNote
## 
##   # Doing the same thing using 2D indexing instead of the $
##   emotions_df[emotions_df[,'SubjectNo']==curSubjectNo, 'Notes'] <- currentNote

