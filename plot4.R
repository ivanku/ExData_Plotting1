# This script is to be executed in the same directory where household_power_consumption.txt file is located

# read data, note NA values encoding
power = read.csv("household_power_consumption.txt", na.strings=c("?"), sep=";", header=T, stringsAsFactors=F)

# we analyse only 2007-02-01 and 2007-02-02 
power = power[power$Date %in% c("1/2/2007", "2/2/2007"),]

# add DateTime column
power$Timestamp = strptime(paste(power$Date, ' ', power$Time), format="%d/%m/%Y %H:%M:%S")

# save multiple base plot of global active power, voltage, energy sub metering and global reactive power into plot4.png file
png("plot4.png")
par(mfrow=c(2,2))
with(power, {
  plot(Timestamp, Global_active_power, ylab="Global Active Power", xlab="", type="l")
  
  plot(Timestamp, Voltage, ylab="Voltage", xlab="datetime", type="l")

  plot(Timestamp, Sub_metering_1, ylab="Energy sub metering", xlab="", type="l", col="black")
  lines(Timestamp, Sub_metering_2, type="l", col="red")
  lines(Timestamp, Sub_metering_3, type="l", col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),   col=c("black", "red", "blue"), lwd=1, bty="n")
  
  plot(Timestamp, Global_reactive_power, xlab="datetime", type="l")
})
dev.off()


