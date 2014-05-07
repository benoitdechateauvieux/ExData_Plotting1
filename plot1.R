#Read and clean the data
data <- read.csv('household_power_consumption.txt', sep=";", na.strings="?")
data$Date <- as.Date(data$Date, '%d/%m/%Y')
#Filtering dates
obsDays <- data[data$Date>=as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"), ]

#Export png
png(filename="plot1.png")
hist(obsDays$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()