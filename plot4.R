# Code for plot4.R -> -> Code file for the fourth part of the EDA Assignment

# Clear workspace
rm(list = ls())

# Read provided Household Power Consumption data file to a dataframe
hpcdatafl <- "household_power_consumption.txt"
hpc <- read.table(hpcdatafl, header = FALSE, sep = ";", na.strings = "?", 
                  skip = 66637, 
                  nrows = 2880)
                  
# Assign variable names from header
names(hpc) <- names(read.table(hpcdatafl, header = TRUE, sep = ";", nrows = 1))

# Convert Date and Time values to xlt values for plotting.
datetime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

# Set par background to 'white' or 'transparent'.
par(bg = "white")

# plot4 -> Create & place the generated PNG plot in the current working directory with the required dimensions
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(hpc, {
  # plot(1,1)
  plot(datetime, Global_active_power, type = "l", xlab = "", 
       ylab = "Global Active Power")
  # plot(1,2)
  plot(datetime, Voltage, type = "l")
  # plot(2,1)
  col <- c("black", "red", "blue")
  plot(datetime, hpc[, 7], type = "l", col = col[1], xlab = "", 
       ylab = "Energy sub metering")
  lines(datetime, hpc[, 8], col = col[2])
  lines(datetime, hpc[, 9], col = col[3])
  legend("topright", legend = names(hpc[7:9]), col = col, lty = c(1, 1, 1), 
         bty = "n")
  # plot(2,2)
  plot(datetime, Global_reactive_power, type = "l")
})
dev.off()
