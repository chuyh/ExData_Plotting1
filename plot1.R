temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
consumption <- read.csv(unz(temp, "household_power_consumption.txt"), sep=";", na.strings="?")
unlink(temp)

consumption <- consumption[which(!is.na(consumption)),]
consumption$Date <- as.Date(consumption$Date, "%d/%m/%Y")
consumption <- subset(consumption, Date >= "2007-02-01" & Date <= "2007-02-02")
png("plot1.png")
hist(consumption$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
