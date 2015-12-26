# Coursera JHPH Data Science
# 09 - Developing Data Products
# Week 1 | Lecture Slidify
# Joe Nguyen | 18 Dec, 2015

# Change working directory
dirBase <- "/home/joe/Documents/01-coursera/01-data-science"
dirWorking <- "/09-data-products/first_deck"
setwd(file.path(dirBase, dirWorking))
rm(list = ls())
# par(mfrow = c(1,2))

library(devtools)
# install_github('ramnathv/slidify')
# install_github('ramnathv/slidifyLibraries')
library(slidify)

## Create project with name 'first_deck'
# author('first_deck')

# Compile slidify presentation
slidify("index.Rmd")

# Open in browser
browseURL("index.html")


## Publishing to Github
# publish_github("slidify-data-products", "jlnguyen")
publish('first_deck', 'jlnguyen')

## Publish to RPubs
publish(title = "Coursera Data Products Pitch", "index.html", host = "rpubs")

