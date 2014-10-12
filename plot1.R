#read data
power_consum = read.table("./household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = FALSE, 
                          colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),na.strings = "?")

#take the dates we are interested on: the ones that are between 01-02-2007 and 02-02-2007
power_consum$Date = as.Date(strptime(power_consum$Date, "%d/%m/%Y"))
power_consum = power_consum[power_consum$Date <= "2007-02-02",]
power_consum = power_consum[power_consum$Date >= "2007-02-01",]

#plot an histogram aboout the global active voltage in the subset that we are interested on.  
#note that we add the colour of the histogram, the title and a xlabel's name
png(file = "./plot1.png")
hist(power_consum$Global_active_power, col = "red", xlab = "Global active power (kilowats)", main = "Global Active Power")
dev.off()
