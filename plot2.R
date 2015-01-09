##setwd() & make sure Libraries are loaded, not needed if have already loaded for plot1
setwd("~/Exploratory Data Analysis")
library("graphics", lib.loc="C:/Program Files/R/R-3.1.1/library")
library("grDevices", lib.loc="C:/Program Files/R/R-3.1.1/library")


datafile <- "./household_power_consumption.txt"
pj1data2 <- read.table(datafile, header=TRUE, sep=";", na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
sspj1data <- pj1data2[pj1data2$Date %in% c("1/2/2007","2/2/2007") ,]


#str(sspj1data2)
datetime <- strptime(paste(sspj1data$Date, sspj1data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(sspj1data$Global_active_power)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
## copy to PNG file 
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
