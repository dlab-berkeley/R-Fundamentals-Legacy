# R Fundamentals: Part 3 of 4

## In the previous lesson, we worked closely with data frames, a data structure available in R. We learned how to manipulate them in a variety of ways. In this lesson, we're going to learn how to create visualizations in R, allowing us to better analyze these data frames.

### Challenge 1: Loading Data From Files

### Let's warm up by importing the data we're going to use.

### 1. Load the gapminder-FiveYearData.csv file and save it in a variable named gap.

### 2. Load the sleep_VIM.csv file and save it in a variable named sv.

### 3. Load the heart.csv file and save it in a variable named heart.

# Section 1: Saving and Loading RData Files

## Often, when we're performing data analysis, we'd like to have access to the dataset at an intermediate point (or end point) in the pipeline. While we could save it to a CSV file, this requires performing some conversions that might be a bit of a hassle.
## It'd be nice if we could just save the data frame exactly as it is in R, and load it the same way. This is the basis for an RData file. These types of files allow us to save objects in R exactly as they are. When we load them, they'll be exactly the same.
## We can use the save() and load() functions to create and load RData files.
save(gap, sv, heart,  file = "data/fun_data.RData")

### Challenge 2: Loading RData Files

### 1. Wipe your global environment clean.

### 2. Restart your R session by clicking "Session" --> "Restart R"

### 3. Load "fun_data.RData". If you don't know how to do this, how do you find out? 

# Section 2: Data Summarization

## Before diving into visualizations, computing basic summary statistics is a good first step after you familiarize yourself with data. These summaries will inform what kinds of visualizations you'll want to create.

## The summary() function will return frequencies for factor variables and six number summaries for continuous variables (minimum, 1st quartile, median, 3rd quartile, maximum, and mean):
summary(gap)

## We can also use this function on a single vector:
summary(gap$lifeExp)

## Note that newer versions of R will convert strings to characters automatically (and not to factors). In this case, summary will produce different results:
summary(gap$continent)

## This is happening because R is summarizing a character string
## Consider the following code. While we can plainly see that there are three "one" entries and two "four" entries, the summary function evaluates the vector as a character vector with five elements:
summary(c("one", "one", "four", "one", "four"))

## We can get summaries that are more reasonable by converting a character vector to a factor vector :
summary(as.factor(gap$continent))

## We can also return return observation frequencies for the different continents as contingency tables.
## Note that for contingency tables, we do not need to convert our character vector into a factor vector.
table(gap$continent)
prop.table(table(gap$continent))

## We can Tabulate number of observations for continent by year:
table(gap$continent, gap$year) 
table(gap$year, gap$continent) 

# Section 3: Creating Visualizations in R

## Creating visualizations is a fundamental skill in data analysis. Visualizations allow us to convey to the viewer a salient point about the data. Creating good visualizations is important, and takes a bit of practice. Luckily, R provides great resources to create clear and clean visualization.

## There are two major sets of tools for creating plots in R:
  
## 1. base graphics, which  come with all R installations  
## 2. `ggplot2`, a stand-alone package.  

## We will introduce base R graphics briefly, and then discuss ggplot2, as it's the most commonly used package for creating visualizations in R.

## In presenting R visualization basics, we'll discuss three of the most common data visualizations:
## 1. Histograms: visualize the distribution of one continuous (i.e. numeric or integer) variable.
## 2. Boxplots: visualize the distribution of one continuous variable, divided amongst a categorical (factor) variable.
## 3. Scatter plots: visualize the distribution of two continuous variables against each other (one on each axis).

## Let's create these plots using the gapminder dataset using base R.

## Let's look at histograms. We can create a histogram of life expectancy in the gapminder dataset:
hist(gap$lifeExp, # data to plot
     col = "gray90") # bar color

## We chose a specific color here, but there are many others available!
colors() 

## We can fully customize the histogram to make it more transparent to the viewer:
histogram <- hist(gap$lifeExp, 
                  col = "honeydew1",
                  # Add title
                  main = "Histogram of life expectancy", 
                  # Change x-axis label
                  xlab = "Life expectancy (years)",
                  # Change y-axis label
                  ylab = "Frequency",
                  # Change x-axis limits
                  xlim = c(20, 90),
                  # Change y-axis limits
                  ylim = c(0, 350), 
                  # Change tickmark value orientation
                  # Try values of 0, 1, 2, 3. What happens?
                  las = 1)

## Boxplots compare several distributions as a function of a categorical variable.
## In base R, we use a formula to create a boxplot, along with the boxplot function. The formula uses a tilde - this of it as meaning "by".
## For example, we can plot life expectancy BY continent:
boxplot(gap$lifeExp ~ gap$continent,
        col = "goldenrod")

## Now, let's add some options:
boxplot(gap$lifeExp ~ gap$continent,
        # Different colors for each of the five boxes
        col = c("pink2", "aquamarine", "goldenrod", "salmon", "gray80"),
        main = "Life expectancy boxplots", 
        xlab = "Continent", 
        ylab = "Life expectancy (years)", 
        ylim = c(20, 90),
        las = 1)

## Notice here that we've added color as an option. We did it to demonstrate the point, but it's actually not good practice to use color when we can get that information from elsewhere (in this case, the labels). This is called a "redundant encoding".

## Scatter plots can be created with the plot() function. Let's create a scatter plot of GDP per capita vs. life expectancy.
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

# This is a lot of code! How do we know which color and shape corresponds to each continent? We do not even have a legend yet! We can add one using the legend() function:
legend("topleft", 
        inset = 0, 
        title = "Continent", 
        cex = 1,
        c("Africa", "Americas", "Asia", "Europe", "Oceania"), 
        col = c(1,2,3,4,5), 
        pch = c(1,2,3,4,5),
        horiz = FALSE)

## Base R is nice, but there's a better way to create visualizations: with ggplot2.

# Section 4: Creating Visualizations with ggplot2

## We're now going to create visualizations with the package ggplot2, which is the main way R practitioners create plots. ggplot2 exists as its own package, which we need to download and install. 

## In the previous lesson, we learned how to install new packages. Now, we'll do the same with ggplot2. First, we install the package:
install.packages(c("ggplot2"))

## Second, we load the installed package in the current session. Remember, you need to do this each time you open a new RStudio session.
library(ggplot2)

## See if you were successful! If so, you should see the help files appear. Read the "Description" section and scroll down to the "Useful links".
?ggplot2

## A ggplot is comprised of three fundamental building blocks:
  
## 1. Data: typically as a dataframe.
## 2. "aes"thetics: to define your x and y axes, map colors to factor levels, etc.  
## 3. "geom_"s: the visual marks to represent your data - points, bars, lines, ribbons, polygons, etc. 

## One thing to remember is that `ggplot2` works in layers, similar to photoimaging software such as Photoshop, Illustrator, Inkscape, GIMP, ImageJ, etc. We create a base layer, and then stack layers on top of that base layer. New layers are added to a plot using  the addition (+) symbol. Lastly, plots can be further customized using a host of "theme_" functions.

## Note that ggplot2 is the name of the package, but ggplot is the main function call. 

## First, let's create the base layer. Here, we have the gray background and coordinate system (lifeExp on the x-axis). The aesthetic links a column to an axis.
## As in dplyr, ggplot assumes text that you enter is going to be a column in a dataframe. So, we don't need to use quotations. 
ggplot(data = gap, aes(x = lifeExp))

## Histograms, ggplot style
## Let's create a histogram. We add a layer on top of the base layer with a plus sign, and add geom_histogram() to overlay the histogram.
ggplot(data = gap, aes(x = lifeExp)) + 
  geom_histogram()

## This looks good, but we need to add some customizations. Let's make our plot have some labels with the corresponding ggplot functions. Then, we'll save the plot in its own variable:
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
print(gg_hist)

## Now, let's try boxplots, ggplot style:
gg_box <- ggplot(data = gap, 
                 aes(x = continent, 
                     y = lifeExp, 
                     fill = continent)) + 
  geom_boxplot() + 
  ggtitle("Boxplots for lifeExp by continent") + 
  xlab("Continent") + 
  ylab("Life expectancy (years)") +
  theme_minimal() 
print(gg_box)

## Let's try and hide the legend, since it provides redundant information. The legend appears automatically since we used the "fill" parameter. To get rid of it, we add an additional layer via the guides() function:
gg_box <- gg_box + guides(fill = "none")
print(gg_box)

## Scatter plots - ggplot style!
## Here, we use the theme to further customize the fonts in our plot. Themes allow us to modify almost everything about our ggplot.
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
        axis.text.x = element_text(angle = 45, hjust = 1))
print(gg_scatter)

## Looks pretty good, but this data probably needs to be scaled on the y-axis, because the GDP per capita spans many more orders of magnitude than the life expectancy. We can apply a log-transform rather easily:
gg_scatter <- gg_scatter + scale_y_log10()
print(gg_scatter)

## Looks much better!

## We can also split up each of the continents by using facets 
gg_scatter <- gg_scatter +
  facet_wrap(~continent)
print(gg_scatter)
## We can also add a linear model on top of plots rather easily. This connects our visualizations to models that we can build using our data, to better understand the relationships amongst the features. We can do this using the geom_smooth() function:
gg_line <- ggplot(gap, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point() + 
  geom_smooth(method = "lm", lwd = 1, col = "red") + 
  ggtitle("gdpPercap and lifeExp") + 
  xlab("GDP per capita income (USD)") + 
  ylab("Life expectancy (years)") + 
  theme_bw() + 
  theme(plot.title = element_text(hjust = 0.5, size = 40)) +
  scale_x_log10()
print(gg_line)

### Challenge 3: Create your own ggplot
### Create a fourth ggplot figure of your choosing. Save it as a variable named gg_fourth. What relationships have we not explored yet? How about the relationship between population and other features?
gg_fourth <- ggplot()

# Section 5: Creating Compound Figures

## Publication quality figures often incorporate several subplots, which together tell a narrative about the problem being studied. We saw above that `ggplot2` can create something like a subplot using facets, but it can be quite limited. A package called `cowplot` makes it easy to stitch together individual plots into a bigger figure:
  
### Challenge 4: Installing and loading cowplot.
### 1. Install and load the cowplot package via the library function.

### 2. How do you know if it installed and libraried correctly? 

## We can then use plot_grid to align our figures:
?plot_grid
compound_figure <- plot_grid(gg_hist, 
                             gg_box, 
                             gg_scatter, 
                             gg_fourth,
                             labels = c("A)", "B)", "C)", "D)"),
                             rel_widths = 0.5,
                             rel_heights = 0.5, 
                             ncol = 2)
print(compound_figure)

### Challenge 5
### Complete the following tasks using the heart dataset:

### 1. Plot the distribution of the cholesterol variable, chol.

### 2. Visualize the differences in chol between females and males. 

### View this link to learn more about the columns in this dataset: 

### https://archive.ics.uci.edu/ml/datasets/heart+disease
