# Coursera JHPH Data Science
# 09 - Developing Data Products
# Week 1 | Lecture 1 - Shiny | Prediction
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
        # Application title
        headerPanel = 'Diabetes Prediction',
        
        sidebarPanel(
            numericInput('glucose', 'Glucose mg/dl', 90, 50, 200, 5),
            submitButton('Submit')
        ),
        
        mainPanel(
            h3('Results of prediction'),
            h4('You entered'),
            verbatimTextOutput("inputValue"),
            h4('which resulted in a prediction of '),
            verbatimTextOutput('prediction')
        )
    )
)