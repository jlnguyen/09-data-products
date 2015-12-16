# Coursera JHPH Data Science
# 09 - Developing Data Products
# Week 1 | Quiz
# Joe Nguyen | 16 Dec, 2015

# Change working directory
dirBase <- "/home/joe/Documents/01-coursera/01-data-science"
dirWorking <- "/09-data-products/"
setwd(file.path(dirBase, dirWorking))
rm(list = ls())
# par(mfrow = c(1,2))


## Question 1
library(manipulate)
myPlot <- function(s) {
    plot(cars$dist - mean(cars$dist), cars$speed - mean(cars$speed))
    abline(0, s)
}
# This function plots distance versus speed, each de-meaned and an associated line of slope s. Which of the following code will make a manipulate plot that creates a slider for the slope?
manipulate(myPlot(s), s = slider(0, 2, step = 0.1))


## Question 2
# Which of the following code uses the rCharts package to create a sortable and searchable data table for the airquality data set? Assume the rCharts package and the airquality data set have already been loaded into R.
require(rCharts); data("airquality")
dTable(airquality, sPaginationType = "full_numbers") 


## Question 3
# A basic shiny data product requires:
# A ui.R and server.R file or a A server.R file and a directory called www containing the relevant html files.


## Question 4
# What is incorrect about the followig syntax in ui.R? 
library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Data science FTW!"),
    sidebarPanel(
        h2('Big text'), # no comma in original code
        h3('Sidebar')
    ),
    mainPanel(
        h3('Main Panel text')
    )
))
# ANSWER: Missing a comma in the sidebar panel 


## Question 5
# ui.R
shinyUI(pageWithSidebar(
    headerPanel("Example plot"),
    sidebarPanel(
        sliderInput('mu', 'Guess at the mu',value = 70, min = 60, max = 80, step = 0.05)  # original code had extra comma
    ),
    mainPanel(
        plotOutput('newHist')
    )
))

# server.R
library(UsingR)
data(galton)

shinyServer(
    function(input, output) {
        output$myHist <- renderPlot({
            hist(galton$child, xlab='child height', col='lightblue',main='Histogram')
            mu <- input$mu
            lines(c(mu, mu), c(0, 200),col="red",lwd=5)
            mse <- mean((galton$child - mu)^2)
            text(63, 150, paste("mu = ", mu))
            text(63, 140, paste("MSE = ", round(mse, 2)))
        })
        
    }
)
# Why isn't it doing what we want?
# ANSWER: The server.R output name isn't the same as the plotOutput command used in ui.R. ('newHist' vs 'myHist')







