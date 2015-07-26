## Andrew MacDonald
## 25 July 2015
## subsetting

x <- c("a" = 5.4, "b" = 6.2, "c" = 7.1, "d" = 4.8, "e" = 7.5)

names(x)
head(x,1)
?head
x[1]
x[4]
x[c(1,3)]
x[c(3,3)]

x[c("a", "c")]
x
x>6
x[x>6]
bigger_than_6 <- x>6
x[bigger_than_6]

TRUE | FALSE
TRUE & FALSE
TRUE & TRUE
c(TRUE, FALSE) & TRUE
c(1, 2) + 3
c(1, 2) + c(3,4)
x > 6
x < 7
x[x > 6 & x < 7]
names(x)
names(x) %in% c("c", "e")
c(1,2,3,4,5)
1:5

x[c(2,3,4)]
x[2:4]


## matrix in R
rnorm(10)

set.seed(1)
m <- matrix(rnorm(6*4), nrow = 6, ncol = 4)
m
m[1,1]
m[1:4, 1]
m[1, 1:4]
m
m[1, ]
m[1:3, 2:4]

## subsetting a list

xlist <- list(a = "Software Carpentry", b = 1:10, data = head(gapminder))
x
x["a"]
xlist["a"]
xlist[1]
xlist[[1]]
xlist[[3]]
y <- xlist[[2]]
y[2]
xlist[[c(3,4,4)]]

xlist$b[2]
xlist[["b"]][2]

xlist[[2]][c(2,2)]

head(gapminder)
gapminder[57:108,]
head(gapminder[gapminder$year > 1985,])

gapminder$continent[5]




