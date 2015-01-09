##setwd() & make sure Libraries are loaded
setwd("~/Exploratory Data Analysis")
library("graphics", lib.loc="C:/Program Files/R/R-3.1.1/library")
library("grDevices", lib.loc="C:/Program Files/R/R-3.1.1/library")

##import data
datafile <- "./household_power_consumption.txt"
pj1data <- read.table(datafile, header=TRUE, sep=";", na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
sspj1data <- pj1data[pj1data$Date %in% c("1/2/2007","2/2/2007") ,]


#str(sspj1data)create hist in R
globalActivePower <- as.numeric(sspj1data$Global_active_power)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


