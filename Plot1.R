#Reads "household_power_consumption.txt" file, but skips to the relevant section then assigns
#  the new dataframe "PowerUse".
PowerUse <- read.table(file = "household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)
        
#Adds a "DT"column to the dataframe for date and time combination ni calendar time format.
PowerUse$DT <- as.POSIXct(strptime(paste(PowerUse$V1,PowerUse$V2), "%d/%m/%Y %H:%M:%S"))

#Creates histogram of "Global Active Power".
hist(PowerUse$V3, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")  

#Creates a "Plot1.png" file with png copy device.
dev.copy(png, file = "Plot1.png")
dev.off() #Turns off the png copy device.