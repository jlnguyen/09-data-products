# Coursera JHPH Data Science
# 09 - Developing Data Products
# Week 4 | Lecture yHat
# Joe Nguyen | 28 Dec, 2015

# # Change working directory
# dirBase <- "/home/joe/Documents/01-coursera/01-data-science"
# dirWorking <- "/09-data-products"
# setwd(file.path(dirBase, dirWorking))
# rm(list = ls())
# # par(mfrow = c(1,2))
# 
# 
# if (!dir.exists("data")) { dir.create("data") }
# if (!file.exists("./data/airdata")) {
#     url <- "http://aqsdr1.epa.gov/aqsweb/aqstmp/airdata/annual_all_2013.zip"
#     download.file(url, "./data/airdata", method = "curl")
#     unzip("./data/airdata", exdir = "./data")
# }
# airdata <- read.csv("./data/annual_all_2013.csv")

airdataSub <- subset(airdata, Parameter.Name %in% c("PM2.5 - Local Conditions", "Ozone")
                     & Pollutant.Standard %in% c("Ozone 8-Hour 2008", "PM25 Annual 2006"),
                     select = c(Longitude, Latitude, Parameter.Name, Arithmetic.Mean))

# Aggregate data (Arithmetic.Mean) for rows with same "Longtitude" etc...
pollAvg <- aggregate(airdataSub[, "Arithmetic.Mean"],
                     airdataSub[, c("Longitude", "Latitude", "Parameter.Name")],
                     mean, na.rm = TRUE)
names(pollAvg)[4] <- "level"
pollAvg <- transform(pollAvg, Parameter.Name = as.factor(Parameter.Name))


## Monitor locations
monitors <- data.matrix(pollAvg[, c("Longitude", "Latitude")])


#' Prediction Function
#' 
#' @param df  - a data frame with:
#'              lon: longitude
#'              lat: latitude
#'              radius: radius in miles for finding monitors
library(fields)     # to compute great circle distance
pollutant <- function(df) {
    x <- data.matrix(df[, c("lon", "lat")])
    r <- df$radius
    d <- rdist.earth(monitors, x)
    
    # Set of monitors used to predict pollutant level
    use <- lapply(seq_len(ncol(d)), function(i) {
        which(d[, i] < r[i])
    })
    levels <- sapply(use, function(idx) {
        with(pollAvg[idx, ], tapply(level, Parameter.Name, mean))
    })
    dlevels <- as.data.frame(t(levels))
    data.frame(df, dlevels)
}

# Test
a <- pollutant(data.frame(lon = -76.61, lat = 39.28, radius = 40))


##############################
## Upload using yhat
library(yhatr)

# Load dependencies
model.require <- function() {
    library(fields)
}

# If data has to be transformed (into specific format)
model.transform <- function(df) {
    df
}

# Prediction code
model.predict <- function(df) {
    pollutant(df)
}



