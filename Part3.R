# R-Fundamentals - Script 3 of 4

##### Challenge 1 - load data from files

##### 1. Load the gapminder-FiveYearData.csv file and save it in a variable named gap

##### 2. Load the sleep_VIM.csv file and save it in a variable named sv

##### 3. Load the heart.csv file and save it in a variable named heart

# Section 1: save() and load()

## You can save just the variables you want into a .RData file, and can load them later.
## NOTE: run the solutions for Challenge 1 if you are stuck to ensure save() works properly
save(gap, sv, heart, 
     file = "data/fun_data.RData")

##### Challenge 2 - loading .RData files

##### 1. Wipe your global environment clean

##### 2. Restart your R session by clicking "Session" --> "Restart R"

##### 3. Load "fun_data.RData". If you don't know how to do this, how do you find out? 

# Section 2: Data Summarization

## Computing basic summary statistics is a good first step after you familiarize yourself with data

## The summary function will return frequenies for factor variables and six number summaries for continuous variables
## Six number summary = minimum and maximum, 1st and 3rd quartile boundaries, and median and mean
summary(gap)

## We can also use this function on a single vector
## Note that newer versions of R will convert to character automatically, not factor so summary will produce different results
summary(gap$lifeExp)
summary(as.factor(as.character(gap$continent)))
summary(as.character(gap$continent)) # Strange output! 

## Contingency Tables
## We can also return return observation frequencies for the different continents
table(gap$continent) 
prop.table(table(gap$continent))

## Tabulate number of observations for continent by year
table(gap$continent, gap$year) 

## or 
table(gap$year, gap$continent) 

## Section 3: Visualization

## Here we will talk about three of the most common data visualizations
## 1. Histogram: visualize the distribution of one continuous (i.e. numeric or integer) variable
## 2. Boxplots: visualize the distribution of one continuous variable (but can be parsed by a factor)
## 3. Scatterplots: visualize the distribution of two continuous variables - one on the x-axis and one on the y-axis

## Histogram of gap life expectancy
hist(gap$lifeExp, # data to plot
     col = "gray90") # bar color

## Colors in R
colors() 

## Histogram with options
histogram <- hist(gap$lifeExp, 
     col = "honeydew1",
     # Add title
     main = "Histogram of life expectancy", 
     # Change x-axis label
     xlab = "Life expectancy (years)",
     # y-axis label
     ylab = "Frequency",
     # Change x-axis limits
     xlim = c(20, 90),
     # y-axis limits
     ylim = c(0, 350), 
     # Change tickmark value orientation
     # Try values of 0, 1, 2, 3. What happens?
     las = 1)

## Boxplots
## Think of the tilde as meaning "by"
## We can plot life expectancy BY continent
boxplot(gap$lifeExp ~ gap$continent)

## Boxplot with options
boxplot(gap$lifeExp ~ gap$continent,
        # Different colors for each of the five boxes
        col = c("pink2", "aquamarine", "goldenrod", "salmon", "gray80"),
        main = "Life expectancy boxplots", 
        xlab = "Continent", 
        ylab = "Life expectancy (years)", 
        ylim = c(20, 90),
        las = 1)

## Scatterplot with options
plot(x = gap$lifeExp, y = gap$gdpPercap,
     main = "Life expectancy versus gdpPercap", 
     xlab = "Life expectancy (years)", 
     ylab = "gdpPercap (USD)", 
     # Change point colors to correspond to continents
     col = as.factor(gap$continent),
     # Change point symbols to correspond to continents
     pch = as.integer(as.factor(as.character(gap$continent))),
     # Change point size
     cex = 1,
     las = 1)

# This is a lot of code! How do we know which color and shape corresponds to each continent? We do not even have a legend yet! :(
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

## Too much code! Enter the ggplot2 way :)

# Section 4: ggplot2

## Installing packages is a two step process:

## 1. First, physically download the files from the CRAN repository:
## NOTE: Technically, you only have to perform this step once, but it is a good to keep your R, RStudio, and packages updated
install.packages("ggplot2")

## 2. Second, link your current RStudio session with the downloaded files. You need to do this each time you open a new RStudio session
library(ggplot2)

## See if you were successful! If so, you should see the help files appear. Read the "Description" section and scroll down to the "Useful links".
?ggplot2

## You need three things to make a ggplot:
## 1. Data!
## 2. "aes()" (aesthetics): define the coordinate system, map colors and shapes to points
## 3. "geom_" (visual marks): specify how the data should be represented: points, bars, lines, etc.

## Also:
## 4. plus sign: You will be working in layers in ggplot2. Add a new layer by typing the plus sign + at the end of a line of code
## 5. "theme_": customize non-data related aspects of your plots

## View the help for the ggplot function call:
?ggplot
## NOTE: ggplot2 is the package, ggplot is the function! 

## Create the base layer - here we have the gray background and coordinate system (lifeExp on the x-axis)
## No need for $ with ggplot! 
ggplot(data = gap, aes(x = lifeExp))

## gg Histogram
## Add a layer by typing the plus sign at the end of the base layer, and add geom_histogram() to overlay the bars
ggplot(data = gap, aes(x = lifeExp)) + 
  geom_histogram()

## gg Histogram with options (and save as a variable)
gg_hist <- ggplot(data = gap, aes(x = lifeExp)) + 
  # Customize bar color and number
  geom_histogram(fill = "blue", color = "black", bins = 10) + 
  # Add title
  ggtitle("Life expectancy for the gap dataset") + 
  # Change x-axis label
  xlab("Life expectancy (years)") + 
  # y-axis label
  ylab("Frequency") + 
  # Change background theme
  theme_classic() 
gg_hist

## gg Boxplots
gg_box <- ggplot(data = gap, 
                 aes(x = continent, 
                     y = lifeExp, 
                     fill = continent)) + 
  geom_boxplot() + 
  ggtitle("Boxplots for lifeExp by continent") + 
  xlab("Continent") + 
  ylab("Life expectancy (years)") +
  theme_minimal() 
gg_box

## gg Boxplots - hide legend
## We can also hide the boxplot legend since it contains duplicative information:
## Since we "filled" the bars with the "fill" parameter in the aes function above, we can set that legend ("guide") to false to turn it off
gg_box <- gg_box + guides(fill = FALSE)
gg_box

## gg Scatterplot
gg_scatter <- ggplot(data = gap, aes(x = lifeExp, y = gdpPercap, 
                                     color = continent, 
                                     shape = continent)) + 
  # Change point size and transparency
  geom_point(size = 5, alpha = 0.25) + 
  theme_classic() +
  ggtitle("Scatterplot of life expectancy by gdpPercap") +
  xlab("Life expectancy (years)") + 
  ylab("gdpPercap (USD)") + 
  # Change legend position and customize it
  theme(legend.position = "top",
        plot.title = element_text(hjust = 0.5, size = 12),
        legend.title = element_text(size = 10),
        legend.text = element_text(size = 5),
        # Rotate x-axis text 45 degrees
        axis.text.x = element_text(angle = 45, hjust = 1)) # + 
  # scale_y_log10()
gg_scatter

# Section 5: Creating Compound Figures

## Compound figures are a nice way to combine multiple subplots into a single figure. 

##### Challenge 3 - installing and librarying packages
##### 1. Install and library the cowplot package

##### 2. How do you know if it installed and libraried correctly? 

##### Challenge 4 - create your own ggplot

##### 1. Create a fourth ggplot figure of your choosing. Save it as a variable named gg_fourth

## We can then use plot_grid to align our figures:
?plot_grid
compound_figure <- plot_grid(gg_hist, 
                             gg_box, 
                             gg_scatter, 
                             gg_fourth,
                             # labels = "auto",
                             labels = c("A)", "B)", 
                                        "C)", "D)"),
                             rel_widths = 0.5,
                             rel_heights = 0.5, 
                             ncol = 2)
compound_figure

# Section 6: Statistical Testing

## DISCLAIMER: Note that we are not teaching you statistics in this workshop. Instead, we are showing you how statistical programming works. All tests presented here have their own assumptions that you need to research before proceeding in your own research. Use D-Lab's consulting services if you have questions! 
## Link to D-Lab consulting form: 
## https://dlab.berkeley.edu/consulting

## Now, we might want to test some of the assumptions elucidated by our data visualization(s). 

## We can ask the research question: Is there a relationship between lifeExp and gdpPercap? 

## 1. cor.test(): We could first use a correlation test to check for association between lifeExp and gdpPercap

## 2. aov(): We could then use a one-way analysis of variance to look at differences in mean lifeExp by continent

## 3. lm(): We could then fit a (linear) regression to see if gdpPercap can be used to predict lifeExp

## 1. Linear correlation test gdpPercap and lifeExp
?cor.test
cor.test(x = gap$gdpPercap, 
         y = gap$lifeExp, 
         method = "pearson")

## 2. aov for lifeExp by continent
?aov
aov_gap <- aov(gap$lifeExp ~ gap$continent)

## Use summary() to access the useful information from our `aov_gap` model:
summary(aov_gap)

## TukeyHSD is a post-hoc test to look at pairwise differences:
?TukeyHSD
TukeyHSD(aov_gap)

# or, aov for gdpPercap by continent
aov_gap2 <- aov(gap$gdpPercap ~ gap$continent)
summary(aov_gap2)
TukeyHSD(aov_gap2)

## Fit a linear model to see if gdpPercap can be used to predict lifeExp
?lm
gap_lm1 <- lm(lifeExp ~ gdpPercap, data = gap)
summary(gap_lm1)

## Plot the regression results
names(gap_lm1)

## View the intercept and slope
gap_lm1$coefficients

## Create the plot
ggplot(gap, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point() + 
  geom_smooth(method = "lm", lwd = 2, col = "red") + 
  ggtitle("gdpPercap and lifeExp") + 
  xlab("GDP per capita income (USD)") + 
  ylab("Life expectancy (years)") + 
  theme_bw() + 
  theme(plot.title = element_text(hjust = 0.5, size = 40))

## Log transformed x-axis
options(scipen=999)
ggplot(gap, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point() + 
  geom_smooth(method = "lm", lwd = 2, col = "purple") + 
  scale_x_log10() + 
  ggtitle("log10 transformed gdpPercap and lifeExp") + 
  xlab("log10 transformed GDP per capita income (USD)") + 
  ylab("Life expectancy (years)") + 
  theme_bw() + 
  theme(plot.title = element_text(hjust = 0.5, size = 20))

##### Challenge 5
##### Complete the following tasks using the heart dataset:
##### 1. Plot the distribution of chol

##### 2. Visualize the differences in chol between females and males. 
##### View this link to figure out the labels for females and males: https://archive.ics.uci.edu/ml/datasets/heart+disease

##### 3. Perform a statistical test to see if there is a difference between female and male chol levels. 