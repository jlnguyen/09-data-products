# Coursera JHPH Data Science
# 09 - Developing Data Products
# Week 1 | Lecture 1 - Shiny | Image
# Joe Nguyen | 14 Dec, 2015

# Change working directory
dirBase <- "/home/joe/Documents/01-coursera/01-data-science"
dirWorking <- "/09-data-products/shiny/prediction"
setwd(file.path(dirBase, dirWorking))
rm(list = ls())
# par(mfrow = c(1,2))

require(shiny)
shinyUI(
    pageWithSidebar(
        headerPanel("Example Plot"),
        
        sidebarPanel(sliderInput('mu', 'Guess at the mean',
                                 value = 70, min = 62, max = 74, step = 0.05)
        ),
        
        mainPanel(plotOutput('newHist')
        )
    )
)