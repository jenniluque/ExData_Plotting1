#read data
power_consum = read.table("./household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = FALSE, 
                          colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),na.strings = "?")

#take the dates we are interested on: the ones that are between 01-02-2007 and 02-02-2007
power_consum$Date = as.Date(strptime(power_consum$Date, "%d/%m/%Y"))
power_consum = power_consum[power_consum$Date <= "2007-02-02",]
power_consum = power_consum[power_consum$Date >= "2007-02-01",]
date = as.POSIXct(paste(power_consum$Date, power_consum$Time))

png("./plot4.png")
par(mfrow=c(2,2))
#plot (1,1)
plot(date, power_consum$Global_active_power, type = "l", xlab = "", ylab = "Global Active power (kilowats)")
#plot (1,2)
plot(date, power_consum$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#plot (2,1)
with(power_consum, plot(date, Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering"))
with(subset(power_consum), lines(date, Sub_metering_2, col = "red"))
with(subset(power_consum), lines(date, Sub_metering_3, col = "blue"))
legend("topright", lwd=c(2.5,2.5),  col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#plot (2,2)
plot(date, power_consum$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_rective_power")
dev.off()