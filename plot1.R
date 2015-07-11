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


# PLOT 1

## Create Plot on the screen device
hist(data02$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Create PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()