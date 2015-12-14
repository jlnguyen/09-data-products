# Coursera JHPH Data Science
# 09 - Developing Data Products
# Week 1 | Lecture 1 - Shiny
# Joe Nguyen | 14 Dec, 2015

# Change working directory
dirBase <- "/home/joe/Documents/01-coursera/01-data-science"
dirWorking <- "/09-data-products"
setwd(file.path(dirBase, dirWorking))
rm(list = ls())
# par(mfrow = c(1,2))

library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("09 Developing Data Products -- Week 1 Shiny"),
    sidebarPanel(
        h3("Illustrating Markup"),
        h1("H1 text"),
        h2('H2 text'),
        h3('H3 text'),
        h4('H4 text'),
        
        h3("Illustrating Inputs"),
        numericInput('id1', 'Numeric input, labelled id1',
                     value = 0, min = 0, max = 10, step = 1),
        checkboxGroupInput('id2', 'Checkbox',
                           c("Value 1" = "1",
                             "Value 2" = "2",
                             "Value 3" = "3")),
        dateInput('date', 'Date:')
        
    ),
    mainPanel(
        h3('Main Panel text'),
        code('some code'),
        p('some ordinary text'),
        
        h3('Illustrating Outputs'),
        h4('You entered'),
        verbatimTextOutput('oid1'),
        h4('You entered'),
        verbatimTextOutput('oid2'),
        h4('You entered'),
        verbatimTextOutput('odate')
    )
))