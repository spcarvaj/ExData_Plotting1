# SUBSETTING THE DATA

## Set working Directory
getwd()
setwd("D:/DATA SCIENCE SPECIALIZATION/Coursera")
getwd()

## Get dataset
data01 <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

## Set the date field to the right format. 
data01$Date <- as.Date(data01$Date, format="%d/%m/%Y")

## Create subset  
data02 <- subset(data01, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## PLOT 4

## Set new date field to the right format
datetime <- paste(as.Date(data02$Date), data02$Time)
data02$datetime <- as.POSIXct(datetime)

## Create Plot on the screen device
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data02, {
  plot(datetime, Global_active_power, type="l", ylab="Global Active Power", xlab="")
  plot(datetime, Voltage, type="l", ylab="Voltage", xlab="datatime")
  plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col="blue")
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2.5, bty="n", cex=0.5,
          legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(datetime, Global_reactive_power, type="l", ylab="Global Reactive Power (kilowatts)",xlab="datetime")
})

## Create PNG file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()