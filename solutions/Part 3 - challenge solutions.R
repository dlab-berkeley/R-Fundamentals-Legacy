# R-Fundamentals Part 3 - Challenge Problem Solutions

##### Challenge 1 - load data from files
##### 1. Load the gapminder-FiveYearData.csv file and save it in a variable named gap
gap <- read.csv("data/gapminder-FiveYearData.csv")
str(gap)
head(gap)

##### 2. Load the sleep_VIM.csv file and save it in a variable named sv
sv <- read.csv("data/sleep_VIM.csv")
str(sv)
head(sv)

##### 3. Load the heart.csv file and save it in a variable named heart
heart <- read.csv("data/heart.csv")
str(heart)
head(heart)

##### Challenge 2 - loading .RData files
##### 1. Wipe your global environment clean
rm(list = ls()) # or, click the broom icon

##### 2. Restart your R session by clicking "Session" --> "Restart R"

##### 3. Load "fun_data.RData". If you don't know how to do this, how do you find out? 
load("data/fun_data.RData")

##### Challenge 3 - installing and librarying packages
##### 1. Install and library the cowplot package
install.packages("cowplot")
library(cowplot)

##### 2. How do you know if it installed and libraried correctly? 
?cowplot
??cowplot # view the vignette walkthrough

## link in case you cannot view the vignette:
## https://cran.r-project.org/web/packages/cowplot/vignettes/introduction.html

##### Challenge 4 - create your own ggplot
##### 1. Create a fourth ggplot figure of your choosing. Save it as a variable named gg_fourth
## Check out D-Lab's R Data Wrangling workshop for more about how to use dplyr! 
## https://github.com/dlab-berkeley/R-wrang
library(dplyr)
library(ggplot2) 
gap_lifeExp_mean = gap %>%
  dplyr::group_by(year, continent) %>%
  dplyr::mutate(mean_lifeExp = mean(lifeExp))
head(gap_lifeExp_mean)

gg_fourth <- ggplot(gap_lifeExp_mean, 
                    aes(x = year, y = mean_lifeExp, 
                        color = continent, 
                        linetype = continent)) + 
  geom_line(lwd = 2) + 
  theme_bw() + 
  xlab("Mean lifeExp") +
  theme(legend.position = "top")
gg_fourth

##### Challenge 5
##### Complete the following tasks using the heart dataset:
##### 1. Plot the distribution of chol
hist(heart$chol)

##### 2. Visualize the differences in chol between females and males. 
##### View this link to figure out the labels for females and males: https://archive.ics.uci.edu/ml/datasets/heart+disease
ggplot(heart, aes(y = chol, 
                  x = as.factor(sex), 
                  fill = as.factor(sex))) +
  geom_boxplot() + 
  # Relabel x-axis tickmarks
  scale_x_discrete(breaks = c(0, 1), 
                   labels = c("Female", "Male")) + 
  # Change colors
  scale_fill_manual(values=c("purple", "green")) +
  # Hide legend
  guides(fill = FALSE) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  xlab("Sex") + 
  ylab("Cholesterol (mg/dl)") +
  theme_bw()

##### 3. Perform a statistical test to see if there is a difference between female and male chol levels. 
aov_sex <- aov(heart$chol ~ as.factor(heart$sex))
summary(aov_sex)
