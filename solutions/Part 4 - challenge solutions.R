# R-Fundamentals Part 4 - Challenge Problem Solutions

##### Challenge 1 - loading data from files
##### 1. Wipe your global environment clean
rm(list = ls())

##### 2. Restart your R session by clicking "Session" --> "Restart R"

##### 3. Load the gap dataset
load("data/fun_data.RData")

## or
gap <- read.csv("data/gapminder-FiveYearData.csv")
heart <- read.csv("data/heart.csv")

##### Challenge 2 - write a for-loop
##### 1. Write a for-loop that that uses if and else to output something - anything!
x <- 1:5
for (x in 1:length(x)) {
  if (x >= 3) {
    print("Go to the beach")
  }else{                     
    print("Go to the park")
  }
}

##### Challenge 3 - cylinders example
##### You can also pass in the columns of a dataframe as arguments
##### 1. Given this toy data frame of cylinder height and radius, write a function that computes the volumes of the five cylinders
##### The formula for cylinder volume is: 
##### v = pi * (radius ^ 2) * height
##### The data:
cylinders <- data.frame(height = c(3,4,5,6,7),
                        radius = c(1,3,2,1,5))
cylinders

##### 2. Plug in the height and radius into your function to make it work!
##### HINT: You should have five outputs - one for each cylinder

# Define the function
cylinders_function <- function(height, radius){
  volume <- pi * (radius ^ 2) * height
  print(volume)
}

# plug in height and radius
cylinders_function(height = cylinders$height, 
                   radius = cylinders$radius)

##### Challenge 4 - automation
##### 1. Automate something! Anything. (i.e., put a for-loop inside of a function and get some output)
##### 2. If this is too difficult, think about your own research - what might benefit from simple automation?

##### Challenge 5 - going further with R Markdown, bookdown, and dashboards
##### Recall that we have so far been using R script files - these are just plain text files but with a .R extension. Here, we must enter a hashtag before text to enter it correctly, while entering code normally. However, R Markdown files are fully reproducible documents (with a .Rmd file extension) that mix text (entered normally and without the need for hashtags) and "chunks" of code (you can still hashtag comments inside a chunk of cocde) to create informative narratives for your research. Open an R Markdown file by clicking File --> New File --> R Markdown... Give it a title, make sure the HTML button is selected, and click OK. 

##### 1. Go through the RStudio tutorial to learn how to "knit" R Markdown files into HTML and other vibrant formats: https://rmarkdown.rstudio.com/
##### 2. Furthermore, you can turn your R Markdown files into dynamic e-books! Go through yihui's excellent bookdown tutorial: https://bookdown.org/yihui/bookdown/get-started.html
##### 3. Additionally, you can create fast dashboards by following this guide: https://rmarkdown.rstudio.com/flexdashboard/
