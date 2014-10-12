#read data
power_consum = read.table("./household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = FALSE, 
                          colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),na.strings = "?")

#take the dates we are interested on: the ones that are between 01-02-2007 and 02-02-2007
power_consum$Date = as.Date(strptime(power_consum$Date, "%d/%m/%Y"))
power_consum = power_consum[power_consum$Date <= "2007-02-02",]
power_consum = power_consum[power_consum$Date >= "2007-02-01",]
date = as.POSIXct(paste(power_consum$Date, power_consum$Time))


#plot of the global active power by date (with hours included)
png(file = "./plot2.png")
plot(date, power_consum$Global_active_power, type = "l", xlab = "", ylab = "Global Active power (kilowats)")
dev.off()
