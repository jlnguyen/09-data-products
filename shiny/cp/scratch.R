# Coursera JHPH Data Science
# 09 - Developing Data Products
# Week 3 | Course Project Test
# Joe Nguyen | 23 Dec, 2015

# Change working directory
dirBase <- "/home/joe/Documents/01-coursera/01-data-science"
dirWorking <- "/09-data-products/shiny/cp"
setwd(file.path(dirBase, dirWorking))
rm(list = ls())
# par(mfrow = c(1,2))


## Logistic Regression Example
# Use logistic regression to fit a function to a dataset
data("mtcars"); require(ggplot2)
str(mtcars); summary(mtcars)
g <- ggplot(aes(disp, mpg), data = mtcars) + geom_point(shape = 0, size = 4)

x <- mtcars$disp[1:7]
y <- mtcars$mpg[1:7]

plot(x,y, cex = 1.5)

# For regularised regression, refer to Andrew Ng's notes here:
# http://openclassroom.stanford.edu/MainFolder/DocumentPage.php?course=MachineLearning&doc=exercises/ex5/ex5.html

# Download data
url <- 'http://openclassroom.stanford.edu/MainFolder/courses/MachineLearning/exercises/ex5materials/ex5Data.zip'
if (!dir.exists('data')) {dir.create('data')}
download.file(url, destfile = 'data/ex5Data.zip', method = 'curl')
x <- read.table(unzip('data/ex5Data.zip', files = 'ex5Linx.dat')); x <- x$V1
y <- read.table(unzip('data/ex5Data.zip', files = 'ex5Liny.dat')); y <- y$V1



lambda <- c(0,1,10, 20)

# Choose 5th order polynomial function
n <- 5
m <- length(x)
X <- matrix(c(rep(1,m), x, x^2, x^3, x^4, x^5), m)

# Solve for coefficients
regularise <- function(lambda, x, y, n) {
    require(MASS)  # for 'ginv'
    lambdaMat <- diag(1,n+1,n+1); lambdaMat[1,1] <- 0
    ginv(t(X) %*% X + lambda * lambdaMat) %*% t(X) %*% y
}
coefVec <- sapply(lambda, regularise, x = X, y = y, n = n)

# Create x, y estimate for plotting
xEst <- seq(min(x), max(x), length.out = 5 * length(x))
m <- length(xEst)
XEst <- matrix(c(rep(1,m), xEst, xEst^2, xEst^3, xEst^4, xEst^5), m)
yEst <- XEst %*% coefVec

funcDf <- data.frame(x = x, y = y,
                     xFn = xEst, yFn = yEst)

# g <- ggplot(aes(x, y), data = funcDf) +
#     geom_point(shape = 0, size = 4) + 
#     geom_line(aes(x = matrix(rep(xEst, ncol(yEst)), m), y = yEst))
# g

# matplot(matrix(rep(xEst, ncol(yEst)), m), yEst, type = 'l')
matplot(xEst, yEst, type = 'l', lwd = 2)
points(x,y, cex = 1.5)
