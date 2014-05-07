#Read and clean the data
data <- read.csv('household_power_consumption.txt', sep=";", na.strings="?")
data$Date <- as.Date(data$Date, '%d/%m/%Y')
#Filtering dates
obsDays <- data[data$Date>=as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"), ]
dateTime <- strptime(paste(obsDays$Date, obsDays$Time, sep=" "), "%Y-%m-%d %X")
#converting dates & time
obsDays <- cbind(obsDays, dateTime)

#Export png
png(filename="plot4.png")
par(mfcol=c(2,2))

#plot1
with(obsDays, plot(dateTime, Global_active_power, type="n", xlab="", ylab="Global Active Power"))
with(obsDays, lines(dateTime, Global_active_power))
#plot2
with(obsDays, plot(dateTime, obsDays$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(obsDays, lines(dateTime, Sub_metering_1))
with(obsDays, lines(dateTime, Sub_metering_2, col="red"))
with(obsDays, lines(dateTime, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), bty = "n", lty=c(1,1,1))
#plot3
with(obsDays, plot(dateTime, Voltage, type="n", xlab="datetime"))
with(obsDays, lines(dateTime, Voltage))
#plot4
with(obsDays, plot(dateTime, Global_reactive_power, type="n", xlab="datetime"))
with(obsDays, lines(dateTime, Global_reactive_power))

dev.off()