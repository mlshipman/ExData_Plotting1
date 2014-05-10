#Reads "household_power_consumption.txt" file, but skips to the relevant section then assigns
#  the new dataframe "PowerUse".
PowerUse <- read.table(file = "household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)
        
#Adds a "DT"column to the dataframe for date and time combination ni calendar time format.
PowerUse$DT <- as.POSIXct(strptime(paste(PowerUse$V1,PowerUse$V2), "%d/%m/%Y %H:%M:%S"))

#Creates "Energy sub Metering" vs "Day" overlay plots with a legend.
plot(PowerUse$DT, PowerUse$V7, type = "l", xlab = "Day", ylab = "Energy sub metering")
points(PowerUse$DT, PowerUse$V8, type = "l", col = "red")
points(PowerUse$DT, PowerUse$V9, type = "l", col = "blue")
#legend specifications
lines <- c(1, 1, 1)
linecolors <- c("black", "blue", "red")
legendnames <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
#Creates Legend for overlay plot.
legend("topright", lty = lines, col = linecolors, legend = legendnames)

#Creates a "Plot1.png" file with png copy device.
dev.copy(png, file = "Plot3.png")
dev.off() #Turns off the png copy device.