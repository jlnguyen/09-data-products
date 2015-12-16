# Coursera JHPH Data Science
# 09 - Developing Data Products
# Week 1 | Lecture rCharts
# Joe Nguyen | 16 Dec, 2015

# Change working directory
dirBase <- "/home/joe/Documents/01-coursera/01-data-science"
dirWorking <- "/09-data-products/"
setwd(file.path(dirBase, dirWorking))
rm(list = ls())
# par(mfrow = c(1,2))

## rCharts offer interactivity. An example is information appears when you hover the mouse over data points.
require(rCharts)


## Bar plot
haireye <- as.data.frame(HairEyeColor)
n1 <- nPlot(Freq ~ Hair, group = 'Eye', type = 'multiBarChart',
            data = subset(haireye, Sex == 'Male'))
n1$save('fig/n1.html', cdn = TRUE)
cat('<iframe src = fig/n1.html" width = 100%, height = 600></iframe')


## Scatterplot
names(iris) <- gsub("\\.", "", names(iris))
r1 <- rPlot(SepalLength ~ SepalWidth | Species,
            data = iris, color = 'Species', type = 'point')
r1$save('fig/r1.html', cdn = TRUE)
cat('<iframe src = "fig/r1.html" width = 100%, height = 600></iframe>')


## How to get the javascript (js) / html or publish an rChart
r2 <- rPlot(mpg ~ wt | am + vs,
            data = mtcars, type = 'point', col = 'gear')

# Print out the js
r2$print('chart1')

# save as html file
r2$save('mpgPlot.html')

# save to gist (json required)
r2$publish('mpgPlot', host = 'gist')

# save to rpubs
r2$publish('mpgPlot', host = 'rpubs')


######################
## MorrisJS library ##
######################
data(economics, package = 'ggplot2')
econ <- transform(economics, date = as.character(date))
m1 <- mPlot(x = 'date', y = c('psavert', 'uempmed'),
            type = 'Line', data = econ)
m1$set(pointSize = 0, lineWidth = 1)
m1$print('chart2')
# m1$save('fig/m1.html', cdn = TRUE)
# cat('<iframe src="fig/m1.html" width = 100%, height = 600></iframe')


