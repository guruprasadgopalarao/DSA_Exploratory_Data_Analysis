# Code for plot2.R -> Code file for the second part of the EDA Assignment

# Clear workspace
rm(list = ls())

# Read provided Household Power Consumption data file to a dataframe
hpcdatafl <- "household_power_consumption.txt"
hpc <- read.table(hpcdatafl, header = FALSE, sep = ";", na.strings = "?", 
                 skip = 66637, 
                 nrows = 2880)
                 
# Assign variable names from header
names(hpc) <- names(read.table(hpcdatafl, header = TRUE, sep = ";", nrows = 1))

# Convert Date and Time values
datetime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

# Set par background to 'white'
par(bg = "white")

# plot2 -> Create & place the generated PNG plot in the current working directory with the required dimensions
png(filename = "plot2.png", width = 480, height = 480)
plot(datetime, hpc$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()
