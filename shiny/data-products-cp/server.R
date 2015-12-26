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

data("mtcars"); require(ggplot2)
x <- mtcars$disp
y <- mtcars$mpg
n <- 5

# h(x) = t0 + t1.x + t2.x^2 + t3.x^3 + t4.x^4 + t5.x^5
fcn <- function(coef, x) {
    m <- length(x)
    matrix(c(rep(1,m), x, x^2, x^3, x^4, x^5), m) %*% coef
}

# Polynomial function coefficients for regularised linear regression
reg_obj <- function(lambda, x, y, n) {
    
    obj <- function(coef, lambda, x, y) {
        
        # Regularised objective function
        sum((fcn(coef,x) - y)^2) + lambda * sum(coef[-1]^2) / 2/length(y)
    }
    
    # Gradient descent for optimal coefficients
    solution <- optim(rep(0, n+1), obj, lambda = lambda, x = x, y = y)
    return(solution$par)
}

################################
# Create x, y estimate for plotting
xEst <- seq(min(x), max(x), length.out = 5 * length(x))
coefNom <- reg_obj(0, x,y,n)
yNom <- fcn(coefNom, xEst)

################################
shinyServer(
    function(input, output) {
        
        output$reg_eq <- renderUI({
            withMathJax(helpText('$$h_{\\theta}(x) = \\theta_0 + \\theta_1 x + \\theta_2 x^2 + \\theta_3 x^3 + 
                        \\theta_4 x^4 + \\theta_5 x^5$$'))
        })
        output$obj_eq <- renderUI({
            withMathJax(helpText('$$J(\\theta) = \\frac{1}{2 m} \\left [ \\sum_{i=1}^m ( h_{\\theta}(x^{(i)})
                                 - y^{(i)} )^2 + \\lambda \\sum_{j=1}^n \\theta_j^2 \\right ]$$'))
        })
        
        # Compute polynomial function
        coef <- reactive({reg_obj(input$lambda, x,y,n)})
        yEst <- reactive({fcn(coef(), xEst)})

#         df <- reactive({
#             data.frame(disp = x, mpg = y,
#                        xEst = xEst, yEst = yEst())
#             })
#         output$mpg_disp <- renderPlot({
#             ggplot(data = df(), aes(x = disp, y = mpg)) + geom_point(size = 5, alpha = 0.1) + 
#                 geom_line(data = df(), aes(xEst, yEst()), size = 2, color = 'blue')
#         })
        
        output$mpg_disp <- renderPlot({
            plot(x,y, cex = 1.5,
                 ylim = c(0,40),
                 xlab = 'disp', ylab = 'mpg')
            points(xEst, yNom, type = 'l', lty = 2)
            legend('topright', legend = 'lambda = 0', lty = 2)
            points(xEst, yEst(), type = 'l', col = 'blue', lwd = 2)
            grid(10)
            
        })
    }
)