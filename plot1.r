##Packages##
library(lubridate)

###Downloading file & limiting to selected dates###
hpc <- read.table("household_power_consumption.txt", sep = ";", skip=1, col.names=c("Date", "Time", "Global Active Power", "Global Reactive Power", "Voltage", "Global Intensity", "Sub-Metering 1", "Sub-Metering 2", "Sub-Metering 3"))
selected_data <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")
selected_data$Date = as.Date(selected_data$Date, format="%d/%m/%Y")

##Plotting###
png("plot1.png", width=480, height=480)
selected_data <- subset(selected_data, Global.Active.Power != "?")
hist(as.numeric(selected_data$Global.Active.Power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()