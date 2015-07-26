## Andrew
## 25 July
## linear model

gapminder <- read.csv("gapminder.csv")

model <- lm(gdpPercap ~ lifeExp, data = gapminder)
sum_mod <- summary(model)
str(sum_mod)

library(broom)

glance(model)
tidy(model)

library(dplyr)
gapminder %>% 
  group_by(country) %>% 
  do(glance(lm(gdpPercap ~ year, data = .)))

