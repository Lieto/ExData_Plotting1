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
png(file="plot1.png", width = 480, height = 480, units = "px")

# Plot histogram for Global Active Power
hist(as.numeric(paste(dataset1$Global_active_power)), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()

