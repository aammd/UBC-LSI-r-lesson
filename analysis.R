## ANdrew macdonald
## 25 July 2015
## analysis of gapminder

## load the packages
library(ggplot2)
library(dplyr)
library(tidyr)

## load the data
gapminder <- read.csv("gapminder.csv")

## get my functions
source("functions.R")

cv(rnorm(10))

gapminder_cvs <- gapminder %>% 
  gather("response", "value", lifeExp, pop, gdpPercap) %>% 
  group_by(continent, country, response) %>% 
  summarize(CV = cv(value))

## draw a plot
ggplot(gapminder_cvs, aes(x = continent, y = CV)) + 
  geom_boxplot() + 
  facet_wrap(~response)
