# This script creates the second plot for Exploratory
# Data Analysis, Assignment 1
# This plot is a line chart


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

png("plot2.png")

par(mar=c(4.5, 4.5, 3, 2))
font.lab =2
ps = 10
plot(subDataSet$DateTime, subDataSet$Global_active_power, 
     type = "n",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
lines(subDataSet$DateTime, subDataSet$Global_active_power, type = "l")

dev.off()

