##setwd() & make sure Libraries are loaded, not needed if have already loaded for plot1
setwd("~/Exploratory Data Analysis")
library("graphics", lib.loc="C:/Program Files/R/R-3.1.1/library")
library("grDevices", lib.loc="C:/Program Files/R/R-3.1.1/library")

## "plot3.r" is a script to read data from a txt file into R
## renders plot on screen then saves as PNG file
## data is from the Electric Power Consumption Data Set 
## which is available on the UC Irvine Machine Learning Repository

##Step 1 import data and subset to Feb 1 and 2 of 2007 only


##import data
datafile <- "./household_power_consumption.txt"
pj1data3 <- read.table(datafile, header=TRUE, sep=";", na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
sspj1data <- pj1data3[pj1data3$Date %in% c("1/2/2007","2/2/2007") ,]

## Step 2 subset data to Global_active_power: household global minute-averaged active power (in kilowatt) and subset metering variables
#str(sspj1data)
datetime <- strptime(paste(sspj1data$Date, sspj1data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(sspj1data$Global_active_power)
subMetering1 <- as.numeric(sspj1data$Sub_metering_1)
subMetering2 <- as.numeric(sspj1data$Sub_metering_2)
subMetering3 <- as.numeric(sspj1data$Sub_metering_3)

##Step 3 set up plot parameters in course project instructions
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))


##Step 4 copy to PNG file - Save plot to png file and close graphic device.
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()