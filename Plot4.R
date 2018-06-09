# Plot4
##the purpose of this project is to examine 
##how household energy usage varies over a 2-day period in February, 2007

plot4<- function(){

datafile <- read.table("household_power_consumption.txt", header = T,sep = ";", na.strings = "?")
# convert the date 
datafile$Date <- as.Date(datafile$Date, format = "%d/%m/%Y")

# Subset the data
datafile <- subset(datafile, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
datafile$datetime <- strptime(paste(datafile$Date, datafile$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

# Plot 4

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2))
with(datafile,plot(datetime,Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))
with(datafile,plot(datetime,Voltage, type = "l"))
with(datafile,plot(datetime,Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(datafile,lines(datetime,Sub_metering_2, col = "Red"))
with(datafile,lines(datetime,Sub_metering_3 , col = "Blue"))
with(datafile,legend("topright", lty = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n"))

with(datafile,plot(datetime,Global_reactive_power, type = "l"))

dev.off()
}