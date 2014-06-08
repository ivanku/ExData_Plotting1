# This script is to be executed in the same directory where household_power_consumption.txt file is located

# read data, note NA values encoding
power = read.csv("household_power_consumption.txt", na.strings=c("?"), sep=";", header=T, stringsAsFactors=F)

# we analyse only 2007-02-01 and 2007-02-02 
power = power[power$Date %in% c("1/2/2007", "2/2/2007"),]

# add DateTime column
power$Timestamp = strptime(paste(power$Date, ' ', power$Time), format="%d/%m/%Y %H:%M:%S")

# save plot of household global minute-averaged active power (in kilowatts) into plot2.png file
png("plot2.png")
plot(power$Timestamp, power$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.off()


