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
png(file="plot2.png", width = 480, height = 480, units = "px")

#Prepare plot
plot(as.numeric(paste(dataset1$Global_active_power)), ylab = "Global Active Power (kilowatts)", xlab = "", xaxt = 'n', type = "n")

# Plot with lines, x-axis is created based on knowledge we ahve 2880 samples in thursday and friday,
# saturday is added as 2881th sample
lines(as.numeric(paste(dataset1$Global_active_power)), ylab = "Global Active Power (kilowatts)", xlab = "", xaxt = 'n')
axis(1, at=c(0,1440,2881),labels=c('Thu','Fri','Sat'))


dev.off()