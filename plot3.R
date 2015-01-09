

##import data
datafile <- "./household_power_consumption.txt"
pj1data3 <- read.table(datafile, header=TRUE, sep=";", na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
sspj1data <- pj1data3[pj1data3$Date %in% c("1/2/2007","2/2/2007") ,]


#str(sspj1data)
datetime <- strptime(paste(sspj1data$Date, sspj1data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(sspj1data$Global_active_power)
subMetering1 <- as.numeric(sspj1data$Sub_metering_1)
subMetering2 <- as.numeric(sspj1data$Sub_metering_2)
subMetering3 <- as.numeric(sspj1data$Sub_metering_3)


plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))


## copy to PNG file
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
