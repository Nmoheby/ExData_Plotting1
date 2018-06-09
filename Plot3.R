# Plot3
##the purpose of this project is to examine 
##how household energy usage varies over a 2-day period in February, 2007

plot3<- function(){

datafile <- read.table("household_power_consumption.txt", header = T,sep = ";", na.strings = "?")
# convert the date 
datafile$Date <- as.Date(datafile$Date, format = "%d/%m/%Y")

# Subset the data
datafile <- subset(datafile, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
datafile$datetime <- strptime(paste(datafile$Date, datafile$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

# Plot 3

png("plot3.png", width=480, height=480)

with(datafile,plot(datetime,Sub_metering_1, type = "l",ylab = "Energy sub metering", xlab = ""))
with(datafile,lines(datetime,Sub_metering_2, col = "red"))
with(datafile,lines(datetime,Sub_metering_3, col = "blue"))
with(datafile,legend("topright", lty = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")))

dev.off()

}
