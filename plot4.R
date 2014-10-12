temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
consumption4 <- read.csv(unz(temp, "household_power_consumption.txt"), sep=";", na.strings="?")
unlink(temp)

consumption4 <- consumption4[which(!is.na(consumption4)),]
consumption4$Date <- as.Date(consumption4$Date, "%d/%m/%Y")
consumption4 <- subset(consumption4, Date >= "2007-02-01" & Date <= "2007-02-02")

consumption4$Time <- paste(consumption4$Date, consumption4$Time)
consumption4$Time <- strptime(consumption4$Time, "%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))

png("plot4.png")
#1
plot(consumption4$Time, consumption4$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab="")

#2
plot(consumption4$Time, consumption4$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(consumption4$Time, consumption4$Sub_metering_2, type="l", col="red")
lines(consumption4$Time, consumption4$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), lwd = c(2.5,2.5,2.5), col=c("black", "red", "blue"))

#3
plot(consumption4$Time, consumption4$Voltage, type="l", xlab="datetime", ylab="Voltage")

#4
plot(consumption4$Time, consumption4$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
