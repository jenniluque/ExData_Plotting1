#read data
power_consum = read.table("./household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = FALSE, 
                          colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),na.strings = "?")

#take the dates we are interested on: the ones that are between 01-02-2007 and 02-02-2007
power_consum$Date = as.Date(strptime(power_consum$Date, "%d/%m/%Y"))
power_consum = power_consum[power_consum$Date <= "2007-02-02",]
power_consum = power_consum[power_consum$Date >= "2007-02-01",]
date = as.POSIXct(paste(power_consum$Date, power_consum$Time))

#plot in the same axis: sub_metering_1 (black), sub_metering_2 (red) and submetering_3 (blue) with a legend
plot(file = "./plot3.png")
with(power_consum, plot(date, Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering"))
with(subset(power_consum), lines(date, Sub_metering_2, col = "red"))
with(subset(power_consum), lines(date, Sub_metering_3, col = "blue"))
legend("topright", lwd=c(2.5,2.5),  col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()