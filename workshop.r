######## dplyr and tidyr!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
x <- 2
y <- 3
x+y
z=x+y
z <- x-y
x <- c(2,3,4,5)
y <- c(1,2,3,4)
z
gapminder <- read.csv("gapminder.csv")
mean(x)
mean(gapminder)
mean(gapminder$lifeExp)
?read.csv
# Read first row as values: 
read.csv("gapminder.csv",header=F)
# = is <- , == is the actual =
1!=1
gapminder$continent == "Africa"
gapminder[1,2] #[row,column]
gapminder[gapminder$continent == "Africa",]
mean(gapminder[gapminder$continent =="Africa", "lifeExp"])
install.packages("dplyr")
library("dplyr")
year_country_gdp <- select(gapminder,year,country,gdpPercap)
str(year_country_gdp)
str(gapminder)
#Pipe in R: %>%
year_country_gdp <- gapminder %>% select(year,country,gdpPercap)
year_country_gdp_euro <- gapminder %>% 
  filter(continent == "Europe") %>% 
  select(year,country,gdpPercap)
str(year_country_gdp_euro) 

year_country_gdp_euro2 <- gapminder %>% 
  filter(continent == "Europe") %>% 
  select(country,year,gdpPercap)
rm(year_country_gdp_euro2)
unique(year_country_gdp_euro$country)
# Write a single command that will produce dataframe has the African values 
# for lifeExp, country and year, but not for other continents.
lifeExp_year_country_africa <- gapminder %>% 
  filter(continent == "Africa") %>% 
  select(lifeExp, country, year)

# remove NA values
mean(x,na.rm=T)

year_country_gdp_bycontinent <- gapminder %>%
  group_by(continent) %>% 
  select(year,country, gdpPercap)
str(year_country_gdp_bycontinent)
gdp_bycontinents <- gapminder %>%
  group_by(continent) %>%
  summarize(mean_gdp_Percap=mean(gdpPercap), sd_gdp=sd(gdpPercap), mean_lifeExp=mean(lifeExp))
gdp_bycontinents2 <- gapminder %>%
  group_by(continent) %>%
  summarize(mean(gdpPercap), sd(gdpPercap), mean(lifeExp))

# Calculate the average life expectancy per country. 
# Which longest and shortest?
gdp_bycountry <- gapminder %>%
  group_by(country) %>%
  summarize(mean_lifeExp=mean(lifeExp)) %>%
  arrange(mean_lifeExp)
head(gdp_bycountry)
tail(gdp_bycountry)
str(gdp_bycountry)
sort(gdp_bycountry$mean_lifeExp)
min_rank(gdp_bycountry$mean_lifeExp)

install.packages("tidyr")
library("tidyr")
gap_long <- gapminder %>%
  gather(obs_type,obs_values,pop,lifeExp,gdpPercap)
str(gap_long)

gap_long2 <- gapminder %>%
  gather(obs_type,obs_value,-continent,-country,-year)

gap_normal <- gap_long2 %>%
  spread(obs_type,obs_value)
str(gap_normal)
identical(gapminder,gap_normal)
#use gap_long to calculate mean lifeExp, pop, gdpPercap for each continent
#use group and summarize function.
mean_gap_long <- gap_long %>%
  group_by(continent,obs_type) %>%
  summarize(means=mean(obs_values))

# or spread it back
Means_gap_long <- gap_long %>%
  spread(obs_type,obs_value) %>%
  group_by(continent) %>%
  summarize(mean_lifeExp=mean(lifeExp),mean_pop=mean(pop),mean_gdpPercap=mean(gdpPercap))
