# Coursera JHPH Data Science
# 09 - Developing Data Products
# Week 1 | Lecture 1 - Shiny | Reactive Expressions with Submit Button
# Joe Nguyen | 16 Dec, 2015

# Change working directory
dirBase <- "/home/joe/Documents/01-coursera/01-data-science"
dirWorking <- "/09-data-products/shiny/reactive_button"
setwd(file.path(dirBase, dirWorking))
rm(list = ls())
# par(mfrow = c(1,2))

require(shiny)

shinyServer(
    function(input, output) {
        output$text1 <- renderText(input$text1)
        output$text2 <- renderText(input$text2)
        
        output$text3 <- renderText({
            input$goButton
            isolate(paste(input$text1, input$text2))
        })
        
        # Conditional statement for reactive code
        output$text3 <- renderText({
            if (input$goButton == 0) "You have not pressed the button"
            else if (input$goButton == 1) {
                #You've pressed it once"
                isolate(paste("You've pressed it once", input$text1, input$text2))
                cat
            }
            else 'OK quit pressing it'
        })
    }
)


