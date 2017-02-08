# Coursera Data Science Specialization Course 4: Exploratory Data Analysis
# Course Project Week 1: Prepare and submit four graphs
# Plot 2: Global Active Power Time Series

# Set working directory
setwd("~/R/John Hopkins Data Science Specialization/Course 4 - Exploratory Data Analysis/Data")

# Remove all the variables from the workspace
rm(list=ls())

# Read in data file
Household_Power_Data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Convert dates and times to R Date/Time classes
Household_Power_Data$Date <- as.Date(Household_Power_Data$Date, format="%d/%m/%Y")
Household_Power_Data$Time <- strptime(Household_Power_Data$Time, format="%H:%M:%S")

# Create combined date and time variable in POSIXct class
datetime <- paste(as.Date(Household_Power_Data$Date), Household_Power_Data$Time)
Household_Power_Data$Datetime <- as.POSIXct(datetime)

# Create subset of data for 1/2/2007 - 2/2/2007
Household_Power_Data_Subset2007 <- subset(Household_Power_Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Create plot
plot(as.numeric(Household_Power_Data_Subset2007$Global_active_power), 
     type="l", xlab="", ylab="Global Active Power(kilowatts)")

# Create png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()