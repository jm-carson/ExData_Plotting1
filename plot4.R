# Coursera Data Science Specialization Course 4: Exploratory Data Analysis
# Course Project Week 1: Prepare and submit four graphs
# Plot 4: Multiple Figures

# Set working directory
setwd("~/R/John Hopkins Data Science Specialization/Course 4 - Exploratory Data Analysis/Data")

# Remove all the variables from the workspace
rm(list=ls())

# Read in data file
Household_Power_Data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Convert dates and times to R Date/Time classes
Household_Power_Data$Date <- as.Date(Household_Power_Data$Date, format="%d/%m/%Y")
Household_Power_Data$Time <- strptime(Household_Power_Data$Time, format="%H:%M:%S")

# Create subset of data for 1/2/2007 - 2/2/2007
Household_Power_Data_Subset2007 <- subset(Household_Power_Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Create plots
par(mfrow = c(2, 2)) 
  # Plot 1
    plot(as.numeric(Household_Power_Data_Subset2007$Global_active_power), type="l", xlab="", ylab="Global Active Power", cex=0.2)

  # Plot 2
    plot(as.numeric(Household_Power_Data_Subset2007$Voltage), type="l", xlab="datetime", ylab="Voltage")

  # Plot 3
      plot(as.numeric(Household_Power_Data_Subset2007$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")
      lines(as.numeric(Household_Power_Data_Subset2007$Sub_metering_2), type="l", col="red")
      lines(as.numeric(Household_Power_Data_Subset2007$Sub_metering_3), type="l", col="blue")
      legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.4)

  # Plot 4
      plot(as.numeric(Household_Power_Data_Subset2007$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

# Create png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()