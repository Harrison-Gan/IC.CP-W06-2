---
  title: "Module 3-1-Principle - Data Visualization with ggplot2 in R"
author: "Harrison Gan"
date: '`r format(Sys.time())`'
format: 
  html: 
  toc: true
toc-depth: 4
number-sections: false
code-line-numbers: true
code-fold: false
code-link: true
embed-resources: true
df-print: paged
editor: visual
execute: 
  freeze: auto
warning: false  
error: true
editor_options: 
  chunk_output_type: console
---
  
  {r}
#install.packages("ggplot2")
#install.packages('ggrepel')
#install.packages('ggthemes')
#install.packages('scales')
#install.packages('plotly')
#install.packages('lattice')
#install.packages('GGally')
#install.packages("dplyr")
#install.packages("tidyverse")
#install.packages('ggtext')
#install.packages("glue")


library(ggplot2) #visualization
library(ggrepel) #labels for data
library(ggthemes) #collections of themes
library(scales) # scale
library(plotly) # interactive chart
library(GGally) # correlation
library(dplyr) # data transformation
library(tidyverse) # mega package containing 8 packages
library(ggtext) # for text visualization
library(glue) # combining multiple component
library(gapminder)
library(tibble)
library(migritter) # for the pipe operator

1. Understand mtcars data

1.1 Using Help

?mtcars

A data frame with 32 observations on 11 (numeric) variables.

[, 1] mpg Miles/(US) gallon

[, 2] cyl Number of cylinders

[, 3] disp Displacement (cu.in.)

[, 4] hp Gross horsepower

[, 5] drat Rear axle ratio

[, 6] wt Weight (1000 lbs)

[, 7] qsec 1/4 mile time

[, 8] vs Engine (0 = V-shaped, 1 = straight)

[, 9] am Transmission (0 = automatic, 1 = manual)

[,10] gear Number of forward gears

[,11] carb Number of carburetors Note]

1.2 Reading data and converting to a tibble (cars)

head(mtcars)

{r}
class(mtcars)
mtcars


{r}
cars <- 
  mtcars %>% # piping operator from dplyr (shortcut: Ctrl+Shift+M)
  rownames_to_column() %>% # do this before changing the data to tibble as the conversion will remove rownames in tibble.
  as_tibble() %>%  
  rename(model = rowname) %>% 
  print (n = 20, width = Inf)

{r}
cars <-
  mtcars is # piping operator from dlpyer (shortcut: Ctrl+Shift)
rownames_to_column() %/% # do this before changing the data to tibble as the conversion will remove rownames in tibble
  as_tibble() |>
  print (n = 20, width = Inf)

**1.3 Simple Descriptive Statistics

{r}
summary(cars)
glimpse(cars)
skimr::skim(cars)

#Basic Plotting Methods in Base R

{r}
# Using a built  in plotting function 
hist(cars$disp, breaks = 10)

3.Lattice package

{r}
library(lattice)
xyplot(mpg ~ wt, cars)

#4. ggplot2

We will use ggplot2 - the best tool in the market for data visualization from now on

4.1. Elaborate Example

Data Wrangling

{r}
cars <- 
  mtcars |>
  rownames_to_column() %>%
  as_tibble() |>
  rename(model = rowname)


Plotting

{r}
cars |>
  count(cyl)

easy_tabels_n <- as_labeller(c("4"= "4 Cylinder Cars",
                               "6" = "6 Clyinder Cars",
                               "8"= "8 Clyinder Cars"
)
)

cars |>
  ggplot(aes(x = mpg,y = disp, color = factor(cyl))) +
  geom_point(size = 3,
             color= "black"
  ) + 
  geom_smooth(method = lm, se = FALSE) + 
  facet_wrap(~ cyl,
             ncol = 1) +
  theme_bw()


