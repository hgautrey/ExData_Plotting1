#Read data
data <- read.table("~/household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")  #convert Date column to the date class
#subset the rows to only include data from 01/02/2007 and 02/02/2007
subset_data <- data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]
#convert Time column to POSIXct
subset_data$datetime <- as.POSIXct(paste(subset_data$Date, subset_data$Time), format="%Y-%m-%d %H:%M:%S")    
png("plot3.png") #open device
with(subset_data, plot(datetime, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
lines(subset_data$datetime, subset_data$Sub_metering_1)
lines(subset_data$datetime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$datetime, subset_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off() #close device