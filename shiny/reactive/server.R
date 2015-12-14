# Coursera JHPH Data Science
# 09 - Developing Data Products
# Week 1 | Lecture 1 - Shiny | Reactive Expressions
# Joe Nguyen | 14 Dec, 2015

# Change working directory
dirBase <- "/home/joe/Documents/01-coursera/01-data-science"
dirWorking <- "/09-data-products/shiny/reactive"
setwd(file.path(dirBase, dirWorking))
rm(list = ls())
# par(mfrow = c(1,2))

require(shiny)

# Global variable assignment
x <<- x + 1
y <<- 0

shinyServer(
    function(input, output) {
        y <<- y + 1
        output$text1 <- renderText({input$text1})
        output$text2 <- renderText({input$text2})
        output$text3 <- renderText({as.numeric(input$text1) + 1})
        output$text4 <- renderText(y)
        output$text5 <- renderText(x)
    }
)