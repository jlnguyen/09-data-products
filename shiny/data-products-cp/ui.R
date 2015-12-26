# Coursera JHPH Data Science
# 09 - Developing Data Products
# Week 3 Course Project
# Joe Nguyen | 24 Dec, 2015

# # Change working directory
# dirBase <- "/home/joe/Documents/01-coursera/01-data-science"
# dirWorking <- "/09-data-products/shiny/data-products-cp"
# setwd(file.path(dirBase, dirWorking))
# rm(list = ls())
# # par(mfrow = c(1,2))

require(shiny)
shinyUI(
    pageWithSidebar(
        headerPanel('Regularised Linear Regression'),
        sidebarPanel(
            sliderInput('lambda', 'lambda', min = 0, max = 100e3, value = 10e3, step = 1000),
            wellPanel(helpText( a("Refer to Andrew Ng's notes", target = "_blank",
                                  href = "http://openclassroom.stanford.edu/MainFolder/DocumentPage.php?course=MachineLearning&doc=exercises/ex5/ex5.html")))
        ),
        mainPanel(
            withMathJax(),
            h4('Regression Equation'),
            uiOutput('reg_eq'),
            h4('Regularised Objective (to minimise):'),
            uiOutput('obj_eq'),

            h3('`mtcars` dataset'),
            plotOutput('mpg_disp')
        )
))