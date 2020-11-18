# R Script for Day 3

## Part 1 Review and Objectives

## Set Working Directory

## Go to Session -> Set Working Directory -> Choose Directory -> R-Fundamentals
## We can also do this with code:

setwd("~/R-Fundamentals")

## Check our working directory
getwd()

## Let's load the gap data again

gap = read.csv("data/gapminder-FiveYearData.csv")

str(gap)

head(gap)

## Part 2 Data Summarization

# Load the sleep_VIM dataset
sleep = read.csv("data/sleep_VIM.csv")

# Load the iris dataset
data(iris)
iris

# Load the mtcars dataset
data(mtcars)
mtcars

# Save these four datasets to the "data.RData" file in the data-proc folder.
save(gap, iris, sleep, mtcars,
     file = "data/all_data.RData")

# Remove gap, sleep, and iris from your environment
rm(gap)
rm(sleep)
rm(iris)
rm(mtcars)

# Load both gap and iris by loading "gap-iris.RData"
load("data/all_data.RData")

## We can use the summary function to get some summary stats on a dataset
summary(gap)

# or of a single vector
## Note that newer versions of R will convert to character automatically, not factor so summary will produce different results
summary(gap$lifeExp)
summary(as.factor(as.character(gap$continent)))

# Contingency Tables

# Return frequencies for the different continents
table(gap$continent) 

# Get frequencies for the different continents by year
table(gap$continent, gap$year) 
# Or 
table(gap$year, gap$continent) 

# Part 3: Visualization

# Load our datasets
load("data/all_data.RData")

# Histogram of gapminder life expectancy
hist(gap$lifeExp, 
     col = "gray90")

# Colors in R

colors() 

# Histogram Options

histogram <- hist(gap$lifeExp, 
     col = "honeydew1",
     main = "Histogram of life expectancy",
     xlab = "Life expectancy (years)",
     ylab = "Frequency",
     xlim = c(20, 90),
     ylim = c(0, 350), 
     las = 1)

# Boxplot

boxplot(gap$lifeExp ~ gap$continent)

# Boxplot with Options

boxplot(gap$lifeExp ~ gap$continent,
        col = c("pink2", "aquamarine", "goldenrod", "salmon", "gray80"),
        main = "Life expectancy boxplots", 
        xlab = "Continent", 
        ylab = "Life expectancy (years)", 
        ylim = c(20, 90),
        las = 1)

# Scatterplot

## Two continuous variables

x = gap$lifeExp
y = gap$gdpPercap

## Scatterplot with Options

scatter <- plot(x = x, y = y,    
     main = "Life expectancy versus gdpPercap", 
     xlab = "Life expectancy (years)", 
     ylab = "gdpPercap (USD)", 
     # Change point colors to correspond to continents
     col = as.integer(gap$continent),   
     # Change point symbols to correspond to continents
     pch = as.integer(gap$continent),   
     # Change point size
     cex = 2,
     las = 1)

# This looks a little bit better, but we still do not even have a legend! 
legend("topleft", 
        inset = 0, 
        title = "Continent", 
        cex = 1,
        c("Africa", 
         "Americas", 
         "Asia", 
         "Europe", 
         "Oceania"), 
        col = c(1,2,3,4,5), 
        pch = c(1,2,3,4,5),
        horiz = FALSE)

# Part 4: ggplot2

## Now let's try plotting with ggplot
library(ggplot2)
?ggplot2

## Load all data
load("data/all_data.RData")
ggplot(data = gap, aes(x = lifeExp))

## Histogram in ggplot
ggplot(data = gap, aes(x = lifeExp)) + 
  geom_histogram()

## ggplot histogram with options

gg_hist <- ggplot(data = gap, aes(x = lifeExp)) + 
  geom_histogram(fill = "blue", color = "black", bins = 10) + 
  ggtitle("Life expectancy for the gap dataset") + 
  xlab("Life expectancy (years)") + 
  ylab("Frequency") + 
  theme_classic() 

## Boxplots

gg_box <- ggplot(data = gap, 
       aes(x = continent, 
           y = lifeExp, 
           fill = continent)) + 
  geom_boxplot() + 
  ggtitle("Boxplots for lifeExp by continent") + 
  xlab("Continent") + 
  ylab("Life expectancy (years)") +
  theme_minimal()

## Scatterplots

gg_scatter <- ggplot(data = gap, aes(x = lifeExp, y = gdpPercap, color = continent, shape = continent)) + 
  geom_point(size = 5, alpha = 0.5) + 
  theme_classic() +
  ggtitle("Scatterplot of life expectancy by gdpPercap") +
  xlab("Life expectancy (years)") + 
  ylab("gdpPercap (USD)") + 
  theme(legend.position = "top",
        plot.title = element_text(hjust = 0.5, size = 20),
        legend.title = element_text(size = 10),
        legend.text = element_text(size = 5),
        axis.text.x = element_text(angle = 45, hjust = 1)) 

library(gridExtra)
grid.arrange(gg_hist, gg_box, gg_scatter, ncol = 2)

# Part 5: Statistical Testing

## Loading data

load("data/all_data.RData")

## ANOVA on gap

gap_aov <- aov(gdpPercap ~ continent, data = gap)

#Use `summary()` to access the useful information from our `aov1` model:
summary(gap_aov)

# TukeyHSD
TukeyHSD(gap_aov)

# Pearson's r

cor.test(gap$gdpPercap, gap$lifeExp)

# Linear model

gap_lm1 <- lm(lifeExp ~ gdpPercap, data = gap)
summary(gap_lm1)

# Plotting

library(ggplot2)
names(gap_lm1)

gap_lm1$coefficients

ggplot(gap, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point() + 
  geom_smooth(method = "lm", lwd = 2, col = "red") + 
  ggtitle("gdpPercap and lifeExp") + 
  xlab("GDP per capita income (USD)") + 
  ylab("Life expectancy (years)") + 
  theme_bw() + 
  theme(plot.title = element_text(hjust = 0.5, size = 40))

# Log transformed x-axis
ggplot(gap, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point() + 
  geom_smooth(method = "lm", lwd = 2, col = "purple") + 
  scale_x_log10() + 
  ggtitle("log10 transformed gdpPercap and lifeExp") + 
  xlab("log10 transformed GDP per capita income (USD)") + 
  ylab("Life expectancy (years)") + 
  theme_bw() + 
  theme(plot.title = element_text(hjust = 0.5, size = 20))
