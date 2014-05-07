#Read and clean the data
data <- read.csv('household_power_consumption.txt', sep=";", na.strings="?")
data$Date <- as.Date(data$Date, '%d/%m/%Y')
#Filtering dates
obsDays <- data[data$Date>=as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"), ]
dateTime <- strptime(paste(obsDays$Date, obsDays$Time, sep=" "), "%Y-%m-%d %X")
#converting dates & time
obsDays <- cbind(obsDays, dateTime)
#Export png
png(filename="plot2.png")
with(obsDays, plot(dateTime, Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)"))
with(obsDays, lines(dateTime, Global_active_power))
dev.off()