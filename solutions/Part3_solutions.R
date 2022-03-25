# R Fundamentals Part 3: Challenge Problem Solutions

### Challenge 1: Loading Data From Files

### 1. Load the gapminder-FiveYearData.csv file and save it in a variable named gap.
gap <- read.csv(here("data/gapminder-FiveYearData.csv"))
str(gap)
head(gap)

### 2. Load the sleep_VIM.csv file and save it in a variable named sv.
sv <- read.csv(here("data/sleep_VIM.csv"))
str(sv)
head(sv)

### 3. Load the heart.csv file and save it in a variable named heart.
heart <- read.csv(here("data/heart.csv"))
str(heart)
head(heart)

### Challenge 2: Loading RData Files

### 1. Wipe your global environment clean.
rm(list = ls()) # Or, click the broom icon.

### 2. Restart your R session by clicking "Session" --> "Restart R"

### 3. Load "fun_data.RData". If you don't know how to do this, how do you find out? 
load("data/fun_data.RData")
?load

### Challenge 3: Create your own ggplot
### Create a fourth ggplot figure of your choosing. Save it as a variable named gg_fourth. What relationships have we not explored yet? How about the relationship between population and other features?
## Here is an example of plotting GDP per capita vs. population:
library(ggplot2)
gg_fourth <- ggplot(data = gap, aes(x = pop, y = gdpPercap)) + 
  # Change point size and transparency
  geom_point(size = 2, alpha = 0.25) + 
  theme_classic() +
  ggtitle("Scatterplot of GDP Per Capita by Population") +
  xlab("Population") + 
  ylab("GDP Per Capita") + 
  # Change legend position and customize it
  theme(legend.position = "top",
        plot.title = element_text(hjust = 0.5, size = 12),
        legend.title = element_text(size = 10),
        legend.text = element_text(size = 5),
        axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_x_log10() +
  scale_y_log10()
print(gg_fourth)
# Not much of a relationship!

## Here's another example with some data wrangling:
library(dplyr)
gap_lifeExp_mean <- gap |>
  dplyr::group_by(year, continent) |>
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
print(gg_fourth)

### Challenge 5
### Complete the following tasks using the heart dataset:

### 1. Plot the distribution of the cholesterol variable, chol.
hist(heart$chol)

### 2. Visualize the differences in chol between females and males. 
heart_diffs <- ggplot(heart, aes(y = chol, 
                  x = as.factor(sex), 
                  fill = as.factor(sex))) +
  geom_boxplot() + 
  # Relabel x-axis tickmarks
  scale_x_discrete(breaks = c(0, 1), 
                   labels = c("Female", "Male")) + 
  # Change colors
  scale_fill_manual(values=c("purple", "green")) +
  # Hide legend
  guides(fill = "none") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  xlab("Sex") + 
  ylab("Cholesterol (mg/dl)") +
  theme_bw()
print(heart_diffs)
