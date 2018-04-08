Data <- read.csv2("household_power_consumption.txt")
Data$Date <- as.Date(Data$Date, format = "%d/%m/%Y")
df <- Data[(Data$Date == "2007-02-01") | (Data$Date =="2007-02-02"),]
df$Global_active_power <- as.numeric(df$Global_active_power)
df <- transform(df, time = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

plot(df$time , df$Global_active_power, type = "l", main  = "Global Active Power", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()