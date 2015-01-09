##setwd() & make sure Libraries are loaded, not needed if have already loaded for plot1
setwd("~/Exploratory Data Analysis")
library("graphics", lib.loc="C:/Program Files/R/R-3.1.1/library")
library("grDevices", lib.loc="C:/Program Files/R/R-3.1.1/library")

## "plot2.r" is a script to read data from a txt file into R
## renders plot on screen then saves as PNG file
## data is from the Electric Power Consumption Data Set 
## which is available on the UC Irvine Machine Learning Repository

##Step 1 import data and subset to Feb 1 and 2 of 2007 only


datafile <- "./household_power_consumption.txt"
pj1data2 <- read.table(datafile, header=TRUE, sep=";", na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
sspj1data <- pj1data2[pj1data2$Date %in% c("1/2/2007","2/2/2007") ,]

## Step 2 subset data to Global_active_power: household global minute-averaged active power (in kilowatt) variable
#str(sspj1data2)
datetime <- strptime(paste(sspj1data$Date, sspj1data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(sspj1data$Global_active_power)

## Step 3 set up  plot parameters in course project instructions
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")


## Step 4 copy to PNG file - Save plot to png file and close graphic device.
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()