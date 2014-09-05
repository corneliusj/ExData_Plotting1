# Assumes that household_power_consumption.txt is in the same folder
# as plot4.R

# Read in all data
power_consumption <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")

# Format dates and times as such
power_consumption$Date <- as.Date(format = "%d/%m/%Y", power_consumption$Date)
power_consumption$Time <- strptime(power_consumption$Time, format = "%H:%M:%S")

# subset data to include 2007-02-01 and 2007-02-02
power_consumption <- subset(power_consumption, power_consumption$Date >= "2007-02-01" & power_consumption$Date <= "2007-02-02")


# Open png graphics device
png(filename = "plot4.png", width = 480, height = 480)

# Generate Plots
par(mfrow=c(2,2))

# First Plot
plot(power_consumption$Global_active_power, type = "l", xaxt="n", xlab="", ylab = "Global Active Power")
axis(1, at = c(1,nrow(power_consumption)/2,nrow(power_consumption)), labels = c("Thu", "Fri", "Sat"))

# Second Plot
plot(power_consumption$Voltage, type="l", xaxt="n", ylab="Voltage", xlab="datetime")
axis(1, at = c(1,nrow(power_consumption)/2,nrow(power_consumption)), labels = c("Thu", "Fri", "Sat"))

# Third Plot
plot(power_consumption$Sub_metering_1, type="l", xaxt = "n", xlab="", ylab="Energy sub metering")
lines(power_consumption$Sub_metering_2, type="l", col="Red")
lines(power_consumption$Sub_metering_3, type="l", col="Blue")
axis(1, at = c(1,nrow(power_consumption)/2,nrow(power_consumption)), labels = c("Thu", "Fri", "Sat"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"), bty = "n")

# Fourth Plot
plot(power_consumption$Global_reactive_power, type = "l", pch=19, xaxt="n", ylab="Global_reactive_power", xlab="datetime",lwd=0.5)
points(power_consumption$Global_reactive_power, pch=".")
axis(1, at = c(1,nrow(power_consumption)/2,nrow(power_consumption)), labels = c("Thu", "Fri", "Sat"))

# Close graphics device
dev.off()

