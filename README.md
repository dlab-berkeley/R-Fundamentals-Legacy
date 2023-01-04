# D-Lab R Fundamentals Workshop

[![DataHub](https://img.shields.io/badge/launch-datahub-blue)](https://dlab.datahub.berkeley.edu/hub/user-redirect/git-pull?repo=https%3A%2F%2Fgithub.com%2Fdlab-berkeley%2FR-Fundamentals&urlpath=rstudio%2F&branch=main)
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/dlab-berkeley/R-Fundamentals/HEAD?urlpath=rstudio)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)


This repository contains the materials for the D-Lab R Fundamentals workshop. No
prior experience with R is required.

## Workshop Goals

In this workshop, we provide a broad overview of the fundamentals of using R, a programming language geared toward statistical analysis and data science.
The workshop is divided into four parts, which cover the following topics:
  - Part 1: Introduction to R, navigating RStudio, variable assignment, data types and coercion, and data structures.
  - Part 2: Working with data frames: importing, subsetting, filtering, and merging.
  - Part 3: Data visualization using R and ggplot2.
  - Part 4: Functions, for loops, and if-else statements.

No prior experience with R is required.

## Installation Instructions

RStudio is a software commonly used by R practitioners to develop code in R. We
will use RStudio to go through the workshop materials, which requires the
installation of both the R language and the RStudio software. If you would like
to run R on your own computer, complete the following steps prior to the
workshop:

1. [Download R](https://cloud.r-project.org/): Follow the links according to the operating system you are running. You will first need to click on a link corresponding to your operating system, and then an additional link to select a specific version of R. Download the package, and install R onto your computer. You should install the most recent version (at least version 4.1).

    * If you are using a Mac, click "Download R for macOS" and then select the
      right version of R. You will need to select the version corresponding to
      your specific version of macOS, as well as whether you have an Intel or
      Apple Silicon Mac.
    * If you are using Windows, click "Download R for Windows", then click
      "base", and click the download link.
    * If you are using Linux, click on the link corresponding to your Linux
      distribution, and then follow the instructions.

2. [Download RStudio](https://rstudio.com/products/rstudio/download/#download):
   Install RStudio Desktop. This should be free. Do this after you have already
   installed R. The D-Lab strongly recommends an RStudio edition of
   2022.02.0+443 "Prairie Trillium" or higher.

    * Some individuals with older operating systems may run into odd issues. If
      you are running into issues with the installation of RStudio, you may need
      to install a specific version of RStudio. Please check [this
      link](https://www.rstudio.com/products/rstudio/older-versions/) if this
      applies to you. 

3. Download these R Fundamentals [workshop materials](https://github.com/dlab-berkeley/R-Fundamentals): 

    * Click the green "Code" button in the top right of the repository
      information.
    * Click "Download Zip".
    * Extract this file to a folder on your computer where you can easily access
      it (we recommend Desktop).

4. Optional: if you're familiar with `git`, you can instead clone this repository by opening a terminal and entering `git clone git@github.com:dlab-berkeley/R-Fundamentals.git`.

## Is R not working on your laptop?

If you do not have R installed and the materials loaded on your workshop by the time it starts, we *strongly* recommend using the UC Berkeley DataHub to run the materials for these lessons. You can access the DataHub by clicking the following button:

 [![DataHub](https://img.shields.io/badge/launch-datahub-blue)](https://dlab.datahub.berkeley.edu/hub/user-redirect/git-pull?repo=https%3A%2F%2Fgithub.com%2Fdlab-berkeley%2FR-Fundamentals&urlpath=rstudio%2F&branch=main)

Some users may have to click the link twice if the materials do not load initially.

The DataHub downloads this repository, along with any necessary packages, and
allows you to run the materials in an RStudio instance on UC Berkeley's servers.
No installation is needed from your end - you only need an internet browser and
a CalNet ID to log in. By using the DataHub, you can save your work and come
back to it at any time. When you want to return to your saved work, go straight
to [DataHub](https://dlab.datahub.berkeley.edu), sign in, and click on the
`R-Fundamentals` folder.

If you don't have a Berkeley CalNet ID, you can still run these lessons in the cloud, by clicking this button:

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/dlab-berkeley/R-Fundamentals/HEAD?urlpath=rstudio)

If you are loading Binder with this repository for the first time, it may take a
few minutes to set up. Binder operates similarly to the D-Lab DataHub, but on a
different set of servers. By using Binder, however, you cannot save your work.

## Run the Code

Now that you have all the required software and materials, you need to run the
code.

1. Launch the RStudio software.

2. Use the file navigator to find the R-Fundamentals folder you downloaded from
   Github. Open `R-Fundamentals.Rproj` by double clicking on the file.  

3. Open up the file corresponding to the part of the workshop you're attending
   (`Part1.R`, `Part2.R`, `Part3.R`, `Part4.R`) via the Files panel in RStudio.

4. Place your cursor on a given line and press `Command + Enter` (Mac) or
   `Control + Enter` (PC) to run an individual line of code. 

5. The `solutions` folder contains the solutions to the challenge problems.

# Additional Resources

Check out the following online resources to learn more about R:

* [Software Carpentry](https://swcarpentry.github.io/)
* [Quick-R](http://statmethods.net/)  
* [UCLA Institute for Digital Research and Education](https://stats.idre.ucla.edu/r/)  
* [R-bloggers](https://www.r-bloggers.com/)  
* [R Markdown: The Definitive Guide](https://bookdown.org/yihui/rmarkdown/)
* [The tidyverse style guide](http://style.tidyverse.org/)

as well as the following books:

* [Bookdown Featured Books](https://bookdown.org/)  
* [Introduction to Probability and Statistics in R](http://www.atmos.albany.edu/facstaff/timm/ATM315spring14/R/IPSUR.pdf) by G. Jay Kearns.
* [Advanced R](http://adv-r.had.co.nz/) by Hadley Wickham.
* [R for Data Science](http://r4ds.had.co.nz/) by Hadley Wickham and Garrett Grolemund.
* [R for Everyone](http://www.jaredlander.com/r-for-everyone/) by Jared Lander.
* [Art of R Programming](https://www.nostarch.com/artofr.htm) by Norman Matloff.

# About the UC Berkeley D-Lab

D-Lab works with Berkeley faculty, research staff, and students to advance
data-intensive social science and humanities research. Our goal at D-Lab is to
provide practical training, staff support, resources, and space to enable you to
use R for your own research applications. Our services cater to all skill levels
and no programming, statistical, or computer science backgrounds are necessary.
We offer these services in the form of workshops, one-to-one consulting, and
working groups that cover a variety of research topics, digital tools, and
programming languages.  

Visit the [D-Lab homepage](https://dlab.berkeley.edu/) to learn more about us.
You can view our [calendar](https://dlab.berkeley.edu/events/calendar) for
upcoming events, learn about how to utilize our
[consulting](https://dlab.berkeley.edu/consulting) and [data
services](https://dlab.berkeley.edu/data), and check out upcoming
[workshops](https://dlab.berkeley.edu/events/workshops). Subscribe to our
[newsletter](https://dlab.berkeley.edu/news/weekly-newsletter) to stay up to
date on D-Lab events, services, and opportunities.

# Other D-Lab R workshops

D-Lab offers a variety of R workshops, catered toward different levels of
expertise.
## Introductory Workshops

* [R Data Wrangling](https://github.com/dlab-berkeley/R-Data-Wrangling)
* [R Data Visualization](https://github.com/dlab-berkeley/R-Data-Visualization)
* [Census Data in R](https://github.com/dlab-berkeley/Census-Data-in-R)

## Intermediate and Advanced Workshops
* [R Geospatial Fundamentals](https://github.com/dlab-berkeley/R-Geospatial-Fundamentals)
* [R Machine Learning](https://github.com/dlab-berkeley/R-Machine-Learning)
* [R Deep Learning](https://github.com/dlab-berkeley/R-Deep-Learning)

# Contributors
* [Pratik Sachdeva](https://github.com/pssachdeva)
* [Alex Stephenson](https://github.com/asteves/)
* [Evan Muzzall](https://github.com/EastBayEv)
* [Aniket Kesari](https://akesari12.github.io/)
* [Jae Yeon Kim](https://jaeyk.github.io/)
* [Sam Abdel-Ghaffar](https://github.com/samyag1)
* [Avery Richards](https://github.com/Averysaurus)
* Guadalupe Tuñón
* Shinhye Choi
* Patty Frontiera
* Rochelle Terman
* Dillon Niederhut
