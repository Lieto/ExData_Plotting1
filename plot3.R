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
png(file="plot3.png", width = 480, height = 480, units = "px")

# Create data for submeters
submeter1 = dataset$Sub_metering_1
submeter2 = dataset$Sub_metering_2
submeter3 = dataset$Sub_metering_3

#Prepare plot and plot submeters
plot(as.numeric(paste(submeter1)), ylab = "Energy sub metering", xlab = "", xaxt = 'n', type = "l", col = "black")
lines(as.numeric(paste(submeter2)), ylab = "Energy sub metering", xlab = "", xaxt = 'n', col = "red")
lines(as.numeric(paste(submeter3)), ylab = "Energy sub metering", xlab = "", xaxt = 'n', col = "blue")

# Add x-axis
axis(1, at=c(0,1440,2881),labels=c('Thu','Fri','Sat'))

# Add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1), col = c("black", "red", "blue"))

dev.off()