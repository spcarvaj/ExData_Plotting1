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


# PLOT 2

## Set new date field to the right format
datetime <- paste(as.Date(data02$Date), data02$Time)
data02$datetime <- as.POSIXct(datetime)

## Create Plot on the screen device
plot(data02$datetime, data02$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Create PNG file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()