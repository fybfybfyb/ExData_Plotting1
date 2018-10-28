library(data.table)
data <- fread(file = 'household_power_consumption.txt',
              colClasses = c("character","character","numeric","numeric","numeric","numeric"
                             ,"numeric","numeric","numeric"), data.table = F, na.strings = '?')
data$Date <- strptime(data$Date,'%d/%m/%Y')
data_select <- subset(data, Date %in% c('2007-02-01','2007-02-02'))
datetime <- paste(data_select$Date,data_select$Time)
data_select$Datetime <- as.POSIXct(datetime)
png(filename = 'plot3.png', width = 480, height = 480)
with(data_select, plot(Sub_metering_1 ~ Datetime, ylab = "Energy sub metering", xlab = "", type = 'l'))
lines(data_select$Sub_metering_2 ~ data_select$Datetime, col = 'red')
lines(data_select$Sub_metering_3 ~ data_select$Datetime, col = 'blue')
legend('topright', lty = 1, col = c('black','red','blue'), legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()