# Assumes that household_power_consumption.txt is in the same folder
# as plot1.R

# Read in all data
power_consumption <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")

# Format dates and times as such
power_consumption$Date <- as.Date(format = "%d/%m/%Y", power_consumption$Date)
power_consumption$Time <- strptime(power_consumption$Time, format = "%H:%M:%S")

# subset data to include 2007-02-01 and 2007-02-02
power_consumption <- subset(power_consumption, power_consumption$Date >= "2007-02-01" & power_consumption$Date <= "2007-02-02")

# Open png graphics device
png(filename = "plot1.png", width = 480, height = 480)

# Plot histogram
hist(power_consumption$Global_active_power, col="Red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")

# Close graphics device
dev.off()

