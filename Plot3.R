setwd("~/Desktop")
data <- read.table("household_power_consumption 2.txt", sep=";", header = TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
within_date <- data[data$Date >="2007-02-01" & data$Date <="2007-02-02",]
within_date$Global_active_power<- as.numeric(as.character(within_date$Global_active_power))


within_date$Sub_metering_1 <- as.numeric(as.character(within_date$Sub_metering_1))
within_date$Sub_metering_2 <- as.numeric(as.character(within_date$Sub_metering_2))
within_date$Sub_metering_3 <- as.numeric(as.character(within_date$Sub_metering_3))

within_date$Voltage <- as.numeric(as.character(within_date$Voltage))


## Plot 3 ##
within_date$DateTime <- paste(within_date$Date, within_date$Time)
within_date$DateTime <- as.POSIXct(within_date$DateTime, format="%Y-%m-%d %H:%M:%S", tz ="")
with(within_date, plot(DateTime,Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", main = "Plot 3"))
with(within_date, lines(DateTime,Sub_metering_2, col = "red", type = "l"))
with(within_date, lines(DateTime,Sub_metering_3, col = "blue", type = "l"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)

