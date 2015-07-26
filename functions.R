## functions for gapminder

get_sum <- function(a, b){
  the_sum <- a + b
  return(the_sum)
}


cv <- function(x){
  the_cv <- sd(x) / mean(x)
  return(the_cv)
}


