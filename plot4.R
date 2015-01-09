##setwd() & make sure Libraries are loaded, not needed if have already loaded for plot1
setwd("~/Exploratory Data Analysis")
library("graphics", lib.loc="C:/Program Files/R/R-3.1.1/library")
library("grDevices", lib.loc="C:/Program Files/R/R-3.1.1/library")

## "plot4.r" is a script to read data from a txt file into R
## renders plot on screen then saves as PNG file
## data is from the Electric Power Consumption Data Set 
## which is available on the UC Irvine Machine Learning Repository


##Step 1 import data and subset to Feb 1 and 2 of 2007 only
datafile <- "./household_power_consumption.txt"
pj1data4 <- read.table(datafile, header=TRUE, sep=";", na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
sspj1data <- pj1data4[pj1data4$Date %in% c("1/2/2007","2/2/2007") ,]

## Step 2 subset data to Global_active_power: household global minute-averaged active power, global reactive power, voltage and subset metering variables

#str(subSetData)
datetime <- strptime(paste(sspj1data$Date, sspj1data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(sspj1data$Global_active_power)
globalReactivePower <- as.numeric(sspj1data$Global_reactive_power)
voltage <- as.numeric(sspj1data$Voltage)
subMetering1 <- as.numeric(sspj1data$Sub_metering_1)
subMetering2 <- as.numeric(sspj1data$Sub_metering_2)
subMetering3 <- as.numeric(sspj1data$Sub_metering_3)

##Step 3 set up PNG plot parameters in course project instructions
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

## Step 4 close graphic device
dev.off()
