Enter file contents here
plot2 <- function() {

	library(lubridate)

	data <- read.table("./household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";")

	data <- transform(data, timestamp = dmy_hms(paste(Date, Time)))
	
	data$Date <- dmy(data$Date)

	data <- subset(data, data$Date %in% ymd(c("2007-02-01", "2007-02-02")))

	data$Global_active_power = as.numeric(data$Global_active_power)

	par(mfrow = c(2,2))

	with(data, plot(timestamp, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

	dev.copy(png, file = "plot2.png")

	dev.off()

}
