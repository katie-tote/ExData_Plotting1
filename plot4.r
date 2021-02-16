##Packages##
library(lubridate)

###Downloading file & limiting to selected dates###
hpc <- read.table("household_power_consumption.txt", sep = ";", skip=1, col.names=c("Date", "Time", "Global Active Power", "Global Reactive Power", "Voltage", "Global Intensity", "Sub-Metering 1", "Sub-Metering 2", "Sub-Metering 3"))
selected_data <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")
selected_data$Date = as.Date(selected_data$Date, format="%d/%m/%Y")

##Plotting###
par(mfrow=c(2,2))

selected_data$dt_time <- as.POSIXct(paste(selected_data$Date, selected_data$Time), format="%Y-%m-%d %H:%M:%S")
plot(selected_data$dt_time, as.numeric(selected_data$Global.Active.Power), type="l", ylab="Global Active Power", xlab="")

plot(selected_data$dt_time, as.numeric(selected_data$Voltage), type="l", ylab="Voltage", xlab="datetime")

plot(selected_data$dt_time, as.numeric(selected_data$Sub.Metering.1), type="l", ylab="Energy sub metering", xlab="")
with(selected_data,lines(dt_time,as.numeric(as.character(Sub.Metering.1))))
with(selected_data,lines(dt_time,as.numeric(as.character(Sub.Metering.2)),col="red"))
with(selected_data,lines(dt_time,as.numeric(as.character(Sub.Metering.3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub Metering 1","Sub Metering 2","Sub Metering 3"))


plot(selected_data$dt_time, as.numeric(selected_data$Global.Reactive.Power), type="l", ylab="Global Reactive Power", xlab="datetime")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()