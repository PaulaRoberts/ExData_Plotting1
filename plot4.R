# This script creates the fourth plot for Exploratory
# Data Analysis, Assignment 1
# This plot displays 4 plots in a 2x2 fashion


# Download and extract the data file

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
install.packages("downloader")
library(downloader)
download(url, dest="exdata_data_household_power_comsumption.zip", mode="wb")
unzip("exdata_data_household_power_comsumption.zip", exdir="./")
fileName <- "household_power_consumption.txt"

# Read in the data and subset for the required dates

dataSet <- read.table(fileName, header=TRUE, na.strings="?", sep=";")
subDataSet <- dataSet[(dataSet$Date=="1/2/2007" | dataSet$Date=="2/2/2007" ),]
subDataSet$DateTime<-strptime(paste(subDataSet$Date,subDataSet$Time),"%d/%m/%Y %H:%M:%S")

# Plot the data

png("plot4.png")

par(mfrow = c(2,2))
par(mar=c(4,5,4,0.5),
    oma=c(0,0,0,0))

plot(subDataSet$DateTime, subDataSet$Global_active_power, 
     type = "n",
     xlab = "",
     ylab = "Global Active Power")
lines(subDataSet$DateTime, subDataSet$Global_active_power, type = "l")

plot(subDataSet$DateTime, subDataSet$Voltage,
     type = "n",
     xlab = "datetime",
     ylab = "Voltage")
lines(subDataSet$DateTime, subDataSet$Voltage, type = "l")

xrange <- range(subDataSet$DateTime)
yrange <- range(subDataSet$Sub_metering_1,subDataSet$Sub_metering_2,subDataSet$Sub_metering_3)
plot(xrange, yrange, 
     type ="n",
     xlab = "",
     ylab = "Energy sub metering")
lines(subDataSet$DateTime,subDataSet$Sub_metering_1, col = "black")
lines(subDataSet$DateTime,subDataSet$Sub_metering_2, col = "red")
lines(subDataSet$DateTime,subDataSet$Sub_metering_3, col = "blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1),
       col=c("black", "blue","red"))

plot(subDataSet$DateTime, subDataSet$Global_reactive_power, 
     type = "n",
     xlab = "datetime",
     ylab = "Global_reactive_power")
lines(subDataSet$DateTime, subDataSet$Global_reactive_power, type = "l")

dev.off()

