---
title: "R Fundamentals: learning objectives quick reference"
author: "D-Lab"
date: "March 31, 2019 (updated `r Sys.Date()`)"
output: html_document
---

# Learning objectives  

## Part 1

1. Learn to navigate RStudio; install and library packages  
2. Variable assignment (three piece recipe): `x = 5`, `ls`, `class`, `rm`  
3. Data types: numeric, integer, character, logical, factor  
4. Data coercion: `as.integer`, `as.numeric`, `as.character`, `as.logical`, `as.factor`  
5. Data structures: vector, list, matrix, data frame: `paste`, `c`, `list`, `matrix`, `data.frame`  
6. Basic text manipulations: `grep`, `substr`, `strsplit`, `gsub`
7. (Pseudo) random generation: `set.seed`, `seq`, `:`, `runif`, `rnorm`, `sample`  
8. Save and practice: `write.csv` and `swirl`  

## Part 2

1. Set your working directory to the R-Fundamentals "data" folder: `dir()`  
2. Load the `gapminder-FiveYearData.csv` and `sleep_VIM.csv` files: `read.csv` and its arguments `header =`, `stringsAsFactors =`, and `na.strings =`  
3. Subsetting in one and two dimensions: `$`, `[ , ]`, and `subset`  
4. Using logical/boolean operators to subset: `<`, `>=`, `==`, etc.; and `&`, or `|`  
5. Identify, count, and recode missing data: `sum` and `is.na`  
6. Merge and combine data: `merge`, `cbind`, `rbind`  
7. Reshape data between long and wide format: `melt` and `dcast`  

## Part 3

1. Learn to use your domain expertise to think systematically about research design.  
2. Summarize data: `summary`, `describe`, `table`  
3. Visualize data: `hist`, `boxplot`, `plot`  
  3. Four parts to a ggplot: data, aes, geom; `+`  
4. Test data: `t.test`, `aov`, `TukeyHSD`, `cor.test`, `lm`  

## Part 4

1. Apply what you have learned in Parts 1, 2, and 3 to investigate a heart disease dataset.  
2. For loops: `for`, `if`, `else`, `ifelse`  
3. Functions: `function`  
4. Automation - Monte Carlo simulation: `sample`, `die_roll_mean`, `replicate`, `hist`  
5. [The birthday problem](http://mathforum.org/dr.math/faq/faq.birthdayprob.html)  
6. What is RMarkdown? (and knitr)

<div class="tocify-extend-page" data-unique="tocify-extend-page" style="height: 0;"></div>