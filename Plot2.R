# Plot2
##the purpose of this project is to examine 
##how household energy usage varies over a 2-day period in February, 2007

plot2<- function(){

datafile <- read.table("household_power_consumption.txt", header = T,sep = ";", na.strings = "?")
# convert the date 
datafile$Date <- as.Date(datafile$Date, format = "%d/%m/%Y")

# Subset the data
datafile <- subset(datafile, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
datafile$datetime <- strptime(paste(datafile$Date, datafile$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

# Plot 2

png("plot2.png", width=480, height=480)

plot(datafile$datetime,datafile$Global_active_power, type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()

}
