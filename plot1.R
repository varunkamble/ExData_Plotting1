Data <- read.csv2("household_power_consumption.txt")
Data$Date <- as.Date(Data$Date, format = "%d/%m/%Y")
df <- Data[(Data$Date == "2007-02-01") | (Data$Date == "2007-02-02"),]
df$Global_active_power <- as.numeric(df$Global_active_power)
hist(df$Global_active_power, main  = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatt)")

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()