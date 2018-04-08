Data <- read.csv2("household_power_consumption.txt")
Data$Date <- as.Date(Data$Date, format = "%d/%m/%Y")
df <- Data[(Data$Date == "2007-02-01") | (Data$Date == "2007-02-02"),]

df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

df <- transform(df, time = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

plot(df$time,df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(df$time,df$Sub_metering_2, col = "red")
lines(df$time,df$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.5, lty = c(1,1,1), lwd = c(1,1,1))

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()