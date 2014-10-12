temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
consumption3 <- read.csv(unz(temp, "household_power_consumption.txt"), sep=";", na.strings="?")
unlink(temp)

consumption3 <- consumption3[which(!is.na(consumption3)),]
consumption3$Date <- as.Date(consumption3$Date, "%d/%m/%Y")
consumption3 <- subset(consumption3, Date >= "2007-02-01" & Date <= "2007-02-02")

consumption3$Time <- paste(consumption3$Date, consumption3$Time)
consumption3$Time <- strptime(consumption3$Time, "%Y-%m-%d %H:%M:%S")

png("plot3.png")
plot(consumption3$Time, consumption3$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(consumption3$Time, consumption3$Sub_metering_2, type="l", col="red")
lines(consumption3$Time, consumption3$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), lwd = c(2.5,2.5,2.5), col=c("black", "red", "blue"))
dev.off()
