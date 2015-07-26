gm <- read.csv("gapminder.csv")
length(unique(gm$country))
str(gm)
length(levels(gm$country))
length(table(gm$country))

library(dplyr)
library(ggplot2)

foo <- "andrew"
bar <- matrix(1:9, 3)

mean(foo)

mean()

gm %>% 
  tbl_df %>% 
  ggplot(aes(x = gdpPercap, y = lifeExp)) + geom_point()


cv <- function(x){
  sd(x) / mean(x)
}

library(tidyr)
gm %>% 
  gather("response", "value", lifeExp, pop, gdpPercap) %>% 
  group_by(country, continent, response) %>% 
  summarize(CV = cv(value)) %>% 
  ggplot(aes(x = CV, fill = continent)) + geom_point() + facet_wrap(~ response)