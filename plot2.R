temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
consumption2 <- read.csv(unz(temp, "household_power_consumption.txt"), sep=";", na.strings="?")
unlink(temp)

consumption2 <- consumption2[which(!is.na(consumption2)),]
consumption2$Date <- as.Date(consumption2$Date, "%d/%m/%Y")
consumption2 <- subset(consumption2, Date >= "2007-02-01" & Date <= "2007-02-02")

consumption2$Time <- paste(consumption2$Date, consumption2$Time)
consumption2$Time <- strptime(consumption2$Time, "%Y-%m-%d %H:%M:%S")
png("plot2.png")
plot(consumption2$Time, consumption2$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()
