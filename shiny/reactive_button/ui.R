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

shinyUI(pageWithSidebar(
    headerPanel('Reactive Expressions with Submit Button'),
    sidebarPanel(
        textInput(inputId = 'text1', label = 'Input Text 1'),
        textInput(inputId = 'text2', label = 'Input Text 2'),
        actionButton('goButton', 'Go!')
    ),
    mainPanel(
        p('Output text 1'),
        textOutput('text1'),
        p('Output text 2'),
        textOutput('text2'),
        p('Output text 3'),
        textOutput('text3')
    )
))