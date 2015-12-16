# Coursera JHPH Data Science
# 09 - Developing Data Products
# Week 1 | Lecture Manipulate
# Joe Nguyen | 16 Dec, 2015

# Change working directory
dirBase <- "/home/joe/Documents/01-coursera/01-data-science"
dirWorking <- "/09-data-products/"
setwd(file.path(dirBase, dirWorking))
rm(list = ls())
# par(mfrow = c(1,2))

library(manipulate)

manipulate(plot(1:x), x = slider(1,100))


## Example from regression class
library(UsingR); data("galton")

library(manipulate)
myHist <- function(mu) {
    hist(galton$child, col = 'blue', breaks = 100)
    lines(c(mu, mu), c(0, 150), col = 'red', lwd = 5)
    mse <- mean((galton$child - mu)^2)
    text(63, 150, paste("mu ", mu))
    text(63, 140, paste("MSE ", round(mse,2)))
}
manipulate(myHist(mu), mu = slider(62, 74, step = 0.5))

