# This script is to be executed in the same directory where household_power_consumption.txt file is located

# read data, note NA values encoding
power = read.csv("household_power_consumption.txt", na.strings=c("?"), sep=";", header=T, stringsAsFactors=F)

# we analyse only 2007-02-01 and 2007-02-02 
power = power[power$Date %in% c("1/2/2007", "2/2/2007"),]

# add DateTime column
power$Timestamp = strptime(paste(power$Date, ' ', power$Time), format="%d/%m/%Y %H:%M:%S")

# save plot of energy sub-metering 1, 2 and 3 (in watt-hour of active energy) into plot3.png file
png("plot3.png")
plot(power$Timestamp, power$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l", col="black")
lines(power$Timestamp, power$Sub_metering_2, type="l", col="red")
lines(power$Timestamp, power$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
dev.off()


