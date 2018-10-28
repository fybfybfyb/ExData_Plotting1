library(data.table)
data <- fread(file = 'household_power_consumption.txt',
              colClasses = c("character","character","numeric","numeric","numeric","numeric"
                             ,"numeric","numeric","numeric"), data.table = F, na.strings = '?')

data$Date <- strptime(data$Date,'%d/%m/%Y')
data_select <- subset(data, Date %in% c('2007-02-01','2007-02-02'))
png(filename = 'plot1.png', width = 480, height = 480)
hist(data_select$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency', main = 'Global Active Power')
dev.off()