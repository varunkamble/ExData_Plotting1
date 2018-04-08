Data <- read.csv2("household_power_consumption.txt")
Data$Date <- as.Date(Data$Date, format = "%d/%m/%Y")
df <- Data[(Data$Date == "2007-02-01") | (Data$Date == "2007-02-02"),]

df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))

df <- transform(df, time = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2))

# plot1
plot(df$time, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active power")
# plot2
plot(df$time, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# plot3
plot(df$time, df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(df$time, df$Sub_metering_2, col = "red")
lines(df$time, df$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.2, lty = c(1,1))

# plot4
plot(df$time, df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
