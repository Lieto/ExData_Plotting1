# Check if we have data directory, create if not
if (!file.exists("data")) {
  dir.create("data")
}

# Download dataset if not already loaded
if (!file.exists("./data/dataset.zip")) {
  
  fileUrlCsv = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrlCsv, destfile="./data/dataset.zip")
  unzip("./data/dataset.zip", exdir = "./data")
}

# Load data to memory
dataset = read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ";")

# Subset for dates
dataset = subset(dataset, dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007")


# Create png file
png(file="plot4.png", width = 480, height = 480, units = "px")

# Create data for plots
submeter1 = dataset$Sub_metering_1
submeter2 = dataset$Sub_metering_2
submeter3 = dataset$Sub_metering_3
globalActivePower = dataset$Global_active_power
globalReactivePower = dataset$Global_reactive_power
voltage = dataset$Voltage

#Prepare plot
# Set parts
par(mfrow = c(2, 2))

# Plot first 
plot(as.numeric(paste(dataset1$Global_active_power)), ylab = "Global Active Power", xlab = "", xaxt = 'n', type = "l")
axis(1, at=c(0,1440,2881),labels=c('Thu','Fri','Sat'))

# Plot second
plot(as.numeric(paste(voltage)), ylab = "Voltage", xlab = "datetime", xaxt = 'n', type = "l")
axis(1, at=c(0,1440,2881),labels=c('Thu','Fri','Sat'))

# Plot third
plot(as.numeric(paste(submeter1)), ylab = "Energy sub metering", xlab = "", xaxt = 'n', type = "l", col = "black")
lines(as.numeric(paste(submeter2)), ylab = "Energy sub metering", xlab = "", xaxt = 'n', col = "red")
lines(as.numeric(paste(submeter3)), ylab = "Energy sub metering", xlab = "", xaxt = 'n', col = "blue")

axis(1, at=c(0,1440,2881),labels=c('Thu','Fri','Sat'))

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1), col = c("black", "red", "blue"))

#Plot fourth
plot(as.numeric(paste(globalReactivePower)), ylab = "Global_reactive_power", xlab = "datetime", xaxt = 'n', type = "l")
axis(1, at=c(0,1440,2881),labels=c('Thu','Fri','Sat'))

dev.off()