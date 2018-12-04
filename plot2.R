#Read data
data <- read.table("~/household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")  #convert Date column to the date class
#subset the rows to only include data from 01/02/2007 and 02/02/2007
subset_data <- data[(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]
#convert Time column to POSIXct
subset_data$datetime <- as.POSIXct(paste(subset_data$Date, subset_data$Time), format="%Y-%m-%d %H:%M:%S")    
png("plot2.png") #open device
with(subset_data, plot(datetime, Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = ""))  #create plot
lines(subset_data$datetime, subset_data$Global_active_power) #Add line of global active power over time
dev.off() #close device