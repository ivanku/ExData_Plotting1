# This script is to be executed in the same directory where household_power_consumption.txt file is located

# read data, note NA values encoding
power = read.csv("household_power_consumption.txt", na.strings=c("?"), sep=";", header=T, stringsAsFactors=F)

# we analyse only 2007-02-01 and 2007-02-02 
power = power[power$Date %in% c("1/2/2007", "2/2/2007"),]

# save histogram of household global minute-averaged active power (in kilowatt) into plot1.png file
png("plot1.png")
hist(power$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()


