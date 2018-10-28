library(data.table)
data <- fread(file = 'household_power_consumption.txt',
              colClasses = c("character","character","numeric","numeric","numeric","numeric"
                             ,"numeric","numeric","numeric"), data.table = F, na.strings = '?')
data$Date <- strptime(data$Date,'%d/%m/%Y')
data_select <- subset(data, Date %in% c('2007-02-01','2007-02-02'))
datetime <- paste(data_select$Date,data_select$Time)
data_select$Datetime <- as.POSIXct(datetime)
png(filename = 'plot2.png', width = 480, height = 480)
plot(data_select$Global_active_power ~ data_select$Datetime ,type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()