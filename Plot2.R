#Reads "household_power_consumption.txt" file, but skips to the relevant section then assigns
#  the new dataframe "PowerUse".
PowerUse <- read.table(file = "household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)
        
#Adds a "DT"column to the dataframe for date and time combination ni calendar time format.
PowerUse$DT <- as.POSIXct(strptime(paste(PowerUse$V1,PowerUse$V2), "%d/%m/%Y %H:%M:%S"))

#Creates "Global Active Power" vs "Day" plot.
plot(PowerUse$DT, PowerUse$V3, type = "l", xlab = "Day", ylab = "Global Active Power (kilowatts)")  

#Creates a "Plot1.png" file with png copy device.
dev.copy(png, file = "Plot2.png")
dev.off() #Turns off the png copy device.