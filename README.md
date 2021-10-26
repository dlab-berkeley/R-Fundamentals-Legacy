# D-Lab's R Fundamentals Workshop

This repository contains the materials for D-Lab's R Fundamentals workshop. No prior experience with R required.

## Workshop Goals

In this workshop, we provide a broad overview of the fundamentals to using R, a programming language geared toward statistical analysis and data science.

The workshop is divided into four parts, which cover the following topics:

* **Part 1:** Introduction to R, navigating RStudio, variable assignment, data types and coercion, and data structures.
* **Part 2:** Working with data frames: importing, subsetting, filtering, and merging.
* **Part 3:** Data visualization using R and `ggplot2`.
* **Part 4:** Functions, for loops, and if-else statements.

Prior experience with R is not required.
## Installation Instructions

We will use RStudio to go through the workshop materials, which requires installation of both the R language and the RStudio software. Complete the following steps:

1. [Download R](https://cloud.r-project.org/): Follow the links according to the operating system that you are running. Download the package, and install R onto your compute. You should install the most recent version (at least version 4.0).
2. [Download RStudio](https://rstudio.com/products/rstudio/download/#download): Install RStudio Desktop. This should be free. Do this after you have already installed R.
3. [Download these workshop materials](https://github.com/dlab-berkeley/R-Data-Visualization): 

* Click the green "Code" button in the top right of the repository information.
* Click "Download Zip".
* Extract this file to a folder on your computer where you can easily access it (we recommend Desktop).

4. Optional: if you're familiar with `git`, you can instead clone this repository by opening a terminal and entering `git clone git@github.com:dlab-berkeley/R-Fundamentals.git`.

## Run the Code

Now that you have all the required software and materials, you need to run the code:

1. Launch the RStudio software.

2. Use the file navigator to find the `R-Fundamentals` folder that you downloaded from Github.

3. Open up the file corresponding to the part of the workshop you're attending (`Part1.R`, `Part2.R`, `Part3.R`, `Part4.R`).

4. Place your cursor on a given line and press "Command + Enter" (Mac) or "Control + Enter" (PC) to run an individual line of code. 

5. The `solutions` folder contains the solutions to the challenge problems.

## Is R not working on your laptop?

If you do not have R installed and the materials loaded on your workshop by the time it starts, we *strongly* recommend using the UC Berkeley Datahub to run the materials for these lessons. You can access the DataHub by clicking [this link](https://datahub.berkeley.edu/hub/user-redirect/git-pull?repo=https%3A%2F%2Fgithub.com%2Fdlab-berkeley%2FR-Fundamentals&urlpath=rstudio%2F&branch=main).

The DataHub downloads this repository, along with any necessary packages, and allows you to run the materials in an RStudio instance on UC Berkeley's servers. No installation is necessary from your end - you only need an internet browser and a CalNet ID to log in. By using the DataHub, you can save your work and come back to it at any time. When you want to return to your saved work, just go straight to [DataHub](https://datahub.berkeley.edu), sign in, and you click on the `R-Fundamentals` folder.

If you don't have a Berkeley CalNet ID, you can still run these lessons in the cloud, by clicking this button:

[![Binder](http://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/dlab-berkeley/R-Fundamentals/HEAD)

By using this button, however, you cannot save your work.

# Additional Resources

Check out the following online resources to learn more about R:

* [Software Carpentry](https://swcarpentry.github.io/)
* [Quick-R](http://statmethods.net/)  
* [UCLA idre](https://stats.idre.ucla.edu/r/)  
* [R-bloggers](https://www.r-bloggers.com/)  
* [R Markdown: The Definitive Guide](https://bookdown.org/yihui/rmarkdown/)
* [The tidyverse style guide](http://style.tidyverse.org/)
* [Quick Intro to Parallel Computing in R](https://nceas.github.io/oss-lessons/parallel-computing-in-r/parallel-computing-in-r.html)

as well as the following books:

* [Bookdown Featured Books](https://bookdown.org/)  
* [Kearns GJ. 2010. Introduction to Probability and Statistics in R](http://www.atmos.albany.edu/facstaff/timm/ATM315spring14/R/IPSUR.pdf)
* [Wickham H. 2014. Advanced R](http://adv-r.had.co.nz/)  
* [R for Data Science](http://r4ds.had.co.nz/)  
* [Lander J. 2013. R for everyone: Advanced analytics and graphics](http://www.jaredlander.com/r-for-everyone/)  
* [Matloff N. 2011. The art of R programming: A tour of statistical software design](https://www.nostarch.com/artofr.htm)  
* [Brunsdon C, Comber L. 2015. An Introduction to R for Spatial Analysis and Mapping](https://us.sagepub.com/en-us/nam/an-introduction-to-r-for-spatial-analysis-and-mapping/book241031)
* [James G, Witten D, Hastie T, Tibshirani R. 2013. An Introduction to Statistical Learning: With Applications in R, 7th edition](http://faculty.marshall.usc.edu/gareth-james/ISL/)
# About the UC Berkeley D-Lab
D-Lab works with Berkeley faculty, research staff, and students to advance data-intensive social science and humanities research. Our goal at D-Lab is to provide practical training, staff support, resources, and space to enable you to use R for your own research applications. Our services cater to all skill levels and no programming, statistical, or computer science backgrounds are necessary. We offer these services in the form of workshops such as R Fundamentals, one-to-one consulting, and working groups that cover a variety of research topics, digital tools, and programming languages.  

Visit the [D-Lab homepage](http://dlab.berkeley.edu/) to learn more about us. View our [calendar](http://dlab.berkeley.edu/calendar-node-field-date) for upcoming events, and also learn about how to utilize our [consulting](http://dlab.berkeley.edu/consulting) and [data](http://dlab.berkeley.edu/data-resources) services. 

# Other D-Lab R workshops

Here are other R workshops offered by the D-Lab:
## Basic Competency
* [Fast-R](https://github.com/dlab-berkeley/Fast-R)
* [R Data Wrangling](https://github.com/dlab-berkeley/R-wrang)
* [R Graphics with ggplot2](https://github.com/dlab-berkeley/R-graphics)
* [R Functional Programming](https://github.com/dlab-berkeley/R-functional-programming)
* [Project Management in R](https://github.com/dlab-berkeley/efficient-reproducible-project-management-in-R)
* [Geospatial Fundamentals in R with sf](https://github.com/dlab-berkeley/Geospatial-Fundamentals-in-R-with-sf)
* [Census Data in R](https://github.com/dlab-berkeley/Census-Data-in-R)

## Intermediate/Advanced Competency
* [Advanced Data Wrangling in R](https://github.com/dlab-berkeley/advanced-data-wrangling-in-R)
* [Introduction to Machine Learning in R](https://github.com/dlab-berkeley/Machine-Learning-in-R)
* [Unsupervised Learning in R](https://github.com/dlab-berkeley/Unsupervised-Learning-in-R)
* [R Machine Learning with tidymodels](https://github.com/dlab-berkeley/Machine-Learning-with-tidymodels)
* [Introduction to Deep Learning in R](https://github.com/dlab-berkeley/Deep-Learning-in-R)
* [Fairness and Bias in Machine Learning](https://github.com/dlab-berkeley/fairML)
* [R Package Development](https://github.com/dlab-berkeley/R-package-development) 

## Contributors
* [Evan Muzzall](https://dlab.berkeley.edu/people/evan-muzzall)
* [Aniket Kesari](https://dlab.berkeley.edu/people/aniket-kesari)
* [Jae Yeon Kim](https://jaeyk.github.io/)
* Sam Abdel-Ghaffar
* Guadalupe Tuñón
* Shinhye Choi
* Patty Frontiera
* Rochelle Terman
* Dillon Niederhut
* Pratik Sachdeva
