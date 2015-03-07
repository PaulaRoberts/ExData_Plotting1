# This script creates the third plot for Exploratory
# Data Analysis, Assignment 1
# This plot is a line chart plotting more than 1 variable
# The plot structure is drawn first and the data added afterwards
# This means the range for the x and y axis must be calculated


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

png("plot3.png")

par(mar=c(5, 4, 2, 0))

xrange <- range(subDataSet$DateTime)
yrange <- range(subDataSet$Sub_metering_1,subDataSet$Sub_metering_2,subDataSet$Sub_metering_3)
# Use this to plot the required size of plot
plot(xrange, yrange, 
     type ="n",
     xlab = "",
     ylab = "Energy sub metering")

# and then add on the data ...
lines(subDataSet$DateTime,subDataSet$Sub_metering_1, col = "black")
lines(subDataSet$DateTime,subDataSet$Sub_metering_2, col = "red")
lines(subDataSet$DateTime,subDataSet$Sub_metering_3, col = "blue")

# and finally the legend ...
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1),
       col=c("black", "blue","red"))

dev.off()

