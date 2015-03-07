# This script creates the first plot for Exploratory
# Data Analysis, Assignment 1
# This plot is a histogram of $Global_active_power versus Frequency

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

png("plot1.png")

par(mar=c(5, 5, 3, 2))
font.lab = 2
ps = 12
hist(subDataSet$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()

