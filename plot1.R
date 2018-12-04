#Read data
data <- read.table("~/household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")   #convert Date column to the date class
#subset the rows to only include data from 01/02/2007 and 02/02/2007
subset_data <- data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"),] 
png("plot1.png") #open device
hist(subset_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()  #close device