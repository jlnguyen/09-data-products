# Coursera JHPH Data Science
# 09 - Developing Data Products
# Week 4 | Quiz
# Joe Nguyen | 28 Dec, 2015

# Change working directory
dirBase <- "/home/joe/Documents/01-coursera/01-data-science"
dirWorking <- "/09-data-products"
setwd(file.path(dirBase, dirWorking))
rm(list = ls())
# par(mfrow = c(1,2))

if (!dir.exists("data")) { dir.create("data") }
if (!file.exists("./data/DDPQuiz3_1.0")) {
    url <- "https://d396qusza40orc.cloudfront.net/devdataprod/DDPQuiz3_1.0.zip"
    download.file(url, "./data/DDPQuiz3_1.0")
    unzip("./data/DDPQuiz3_1.0", exdir = "./data")
}

file.edit("./data/DDPQuiz3/R/createmean.R")
