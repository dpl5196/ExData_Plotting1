##setwd() & make sure Libraries are loaded
setwd("~/Exploratory Data Analysis")
library("graphics", lib.loc="C:/Program Files/R/R-3.1.1/library")
library("grDevices", lib.loc="C:/Program Files/R/R-3.1.1/library")
## "plot1.r" is a script to read data from a txt file into R
## renders histogram on screen then saves as PNG file
## data is from the Electric Power Consumption Data Set 
## which is available on the UC Irvine Machine Learning Repository
##import data and subset to Feb 1 and 2 of 2007 only
datafile <- "./household_power_consumption.txt"
pj1data <- read.table(datafile, header=TRUE, sep=";", na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
sspj1data <- pj1data[pj1data$Date %in% c("1/2/2007","2/2/2007") ,]


#str(sspj1data)subset data to Global_active_power: household global minute-averaged active power (in kilowatt) variable

globalActivePower <- as.numeric(sspj1data$Global_active_power)

## set up parameters for a histogram with red bars, 480x480, and titles as shown in project instructions
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Saving to file Save plot to png file and close graphic device.
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
