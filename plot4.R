Enter file contents here
plot4 <- function() {

	library(lubridate)

	data <- read.table("./household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";")

	data <- transform(data, timestamp = dmy_hms(paste(Date, Time)))
	
	data$Date <- dmy(data$Date)

	data <- subset(data, data$Date %in% ymd(c("2007-02-01", "2007-02-02")))

	data$Global_active_power = as.numeric(data$Global_active_power)

	data$Global_reactive_power = as.numeric(data$Global_reactive_power)

	data$Voltage = as.numeric(data$Voltage)

	data$Sub_metering_1 = as.numeric(data$Sub_metering_1)

	data$Sub_metering_2 = as.numeric(data$Sub_metering_2)

	data$Sub_metering_3 = as.numeric(data$Sub_metering_3)

	par(mfrow = c(2,2))

	with(data, plot(timestamp, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

	with(data, plot(timestamp, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

	with(data, plot(timestamp, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))

	with(data, lines(timestamp, Sub_metering_2, col = "red"))

	with(data, lines(timestamp, Sub_metering_3, col = "blue"))

	legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
		lty= c(1,1), bty = "n", cex = .5)

	with(data, plot(timestamp, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

	dev.copy(png, file = "plot4.png")

	dev.off()

}
