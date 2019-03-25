# D-Lab R-FUN!damentals introductory workshop series  

This is the repository for D-Lab's introductory R-Fundamentals workshop series.  

__  

Laptop required. Before Part 1 be sure to:  
1) [Download and install R](https://cloud.r-project.org/)  
2) [Download and install RStudio Desktop Open Source License FREE](https://www.rstudio.com/products/rstudio/download/)  
3) Download the [R-Fundamentals workshop materials](https://github.com/dlab-berkeley/R-Fundamentals) to your Desktop  
- Click the green “Clone or download” button  
- Click “Download Zip”  
- Extract the files some place convenient (i.e., Desktop)  
  - if you are a Git user, simply clone this repository

__

Our goal is to teach you responsible computational programming with R - not math or statistics. To learn more about these topics, check out UC Berkeley:  
[Department of Statistics](http://statistics.berkeley.edu/)  
[Department of Mathematics](https://math.berkeley.edu/)  
[Data Science](http://data.berkeley.edu/)  
[School of Information](https://datascience.berkeley.edu/)  
[Interdepartmental Group in Biostatistics](https://www.stat.berkeley.edu/biostat/)  
[data8](http://data8.org/sp17/)  
[EECS](https://cs.berkeley.edu/)  

__  

_Learning objectives_  
**Part 1:**  
1. Variable definition (three piece recipe): `x = 5`, `ls()`, `class()`, `rm()`  
2. Data types: numeric, integer, character, logical, factor  
3. Data structures: vector, list, matrix, data frame  
4. Pseudo-random generation: `set.seed()`, `seq()`, `:`, `runif()`, `rnorm()`, `sample()`  
5. Save and practice: _`write.csv()` and `swirl()`_  

**Part 2:**  
1. Set your working directory to the R-Fundamentals "data" folder.  
2. Load the `animals` data frame  
3. Load the `sleep_VIM` data set  
4. Subsetting: _one (`$`) versus two dimensions (`[ , ]`)_  
5. Identify and count missing data: _`sum` and `is.na`_  
6. Wide and long format data: _`melt` and `dcast`_  

**Part 3:**  
1. Summarizing data: _`summary`, `describe`, `table`_  
2. Plotting data: _`hist`, `plot`, `boxplot`_  
3. ggplot2: _`+`, three parts: data, aes, geom_  
4. Testing: _`t.test`, `aov`, `TukeyHSD`, `cor.test`, `lm`_  

**Part 4:**  

Apply what you have learned to two example workflows.  

**Bonus:**  
1. For loops: _`for`, `if`, `else`, `ifelse`_  
2. Functions: _`function`_  
3. Automation - Monte Carlo simulation: `sample`, `die_roll_mean`, `replicate`, `hist`  
4. [The birthday problem](http://mathforum.org/dr.math/faq/faq.birthdayprob.html)  

__  

# Resources

--

# About the UC Berkeley Social Sciences Data Laboratory (D-Lab) 

> D-Lab works with Berkeley faculty, research staff, and students to advance data-intensive social science and humanities research. Our goal at D-Lab is to provide practical training, staff support, resources, and space to enable you to use R for your own research applications. Our services cater to all skill levels and no programming, statistical, or computer science backgrounds are necessary. We offer these services in the form of workshops such as this one, one-to-one consulting, and working groups that cover a variety of topics and programming languages.  

- [D-Lab Calendar](http://dlab.berkeley.edu/calendar-node-field-date)  
- [D-Lab Consulting](http://dlab.berkeley.edu/consulting)  
- [D-lab Working Groups](http://dlab.berkeley.edu/working-groups)  

Visit the [D-Lab homepage](http://dlab.berkeley.edu/) and [compact calendar](http://dlab.berkeley.edu/calendar-node-field-date). We offer a variety of:  

* [workshop trainings](http://dlab.berkeley.edu/training)    
* [working groups](http://dlab.berkeley.edu/working-groups)  
* [consulting services](http://dlab.berkeley.edu/consulting)  
* [data services](http://dlab.berkeley.edu/data-resources)  

__

Other D-Lab R offerings:  
* [Data Wrangling and Manipulation in R](https://github.com/dlab-berkeley/R-wrang)  
* [R Graphics](https://github.com/dlab-berkeley/R-graphics)  
* [Machine Learning in R](https://github.com/dlab-berkeley/Machine-Learning-in-R)  
* [Machine Learning Working Group](https://github.com/dlab-berkeley/MachineLearningWG)  
__  

Visit these sites for R help:  

* [Quick-R](http://statmethods.net/)  
* [UCLA idre](http://www.ats.ucla.edu/stat/r/)  
* [R-bloggers](https://www.r-bloggers.com/)  
* [Stack Overflow - R](http://stackoverflow.com/questions/tagged/r)  

__

Other resources:  

* [R for Data Science](http://r4ds.had.co.nz/)  
* [Introduction to Probability and Statistics Using R, 3rd ed.](https://cran.r-project.org/web/packages/IPSUR/vignettes/IPSUR.pdf)  
* [R Markdown: The Definitive Guide](https://bookdown.org/yihui/rmarkdown/)  
* [The tidyverse style guide](http://style.tidyverse.org/)  
* [Tidy Text Mining](https://www.tidytextmining.com/tidytext.html)
* [Regular expressions with stringr](https://stringr.tidyverse.org/articles/regular-expressions.html)
* [bookdown](https://bookdown.org/)  
* [Quick Intro to Parallel Computing in R](https://nceas.github.io/oss-lessons/parallel-computing-in-r/parallel-computing-in-r.html)  

* [Wickham H. 2014. Advanced R](http://adv-r.had.co.nz/)  
* [Lander J. 2013. R for everyone: Advanced analytics and graphics](http://www.jaredlander.com/r-for-everyone/)  
* [Matloff N. 2011. The art of R programming: A tour of statistical software design](https://www.nostarch.com/artofr.htm)  
* [Brunsdon C, Comber L. 2015. An Introduction to R for Spatial Analysis and Mapping](https://us.sagepub.com/en-us/nam/an-introduction-to-r-for-spatial-analysis-and-mapping/book241031)


__  

View course offerings at UC Berkeley:  

* [Department of Statistics](http://statistics.berkeley.edu/)  
* [Data Science](http://data.berkeley.edu/)  
* [School of Information](https://datascience.berkeley.edu/)  
* [Interdepartmental Group in Biostatistics](https://www.stat.berkeley.edu/biostat/)  
* [data8](http://data8.org/)  
* [EECS](https://cs.berkeley.edu/)  

Don't know where to start researching classes? Look up some of these to see if they pique your interest:    

* Data 8, CS61A, CS61B, CS 61C, CS70/Math 55, CS 188, CS 189, Math 53, Math 54, Math 110, Stat 28, Stat 20/21, Stat 133, Stat 134/140, Data 100.  

__

Also check out these excellent UC Berkeley online courses:  

* [D-Lab's Introduction to Data Science for Social Scientists](https://campus.sagepub.com/introduction-to-data-science-for-social-scientists#introduction-to-data-science-for-social-scientists/intro)
* [Data 8X: Foundations of Data Science](https://data.berkeley.edu/education/data-8x)  

__

Also be sure to visit:  

* [Graduate Data Science Organization](https://gdso.berkeley.edu/)  
* [Berkeley Division of Data Sciences](https://data.berkeley.edu/)  

__

Contributions to these materials were made by:  
* Evan Muzzall  
* Sam Abdel-Ghaffar  
* Rochelle Terman  
* Dillon Niederhut  
