### Exploratory Data Analysis - Course Project 1
## Create plot1

# Read data into a table
EL <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", header= TRUE, sep=";",
                 stringsAsFactors = FALSE)

# Load dplyr package
library(dplyr)

# Filter the table on the two dates of interest
EL <- filter(EL, Date=="1/2/2007"|Date=="2/2/2007")

# Load lubdridate package
library(lubridate)

# Convert variables to appropriate classes
EL$Date <- dmy(EL$Date)
# EL$Time <- hms(EL$Time)
EL$Global_active_power <- as.numeric(EL$Global_active_power)
EL$Global_reactive_power <- as.numeric(EL$Global_reactive_power)
EL$Voltage <- as.numeric(EL$Voltage)
EL$Global_intensity <- as.numeric(EL$Global_intensity)
EL$Sub_metering_1 <- as.numeric(EL$Sub_metering_1)
EL$Sub_metering_2 <- as.numeric(EL$Sub_metering_2)
# EL$Sub_metering_3 <- as.numeric(EL$Sub_metering_3)

hist(EL$Global_active_power, main= "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
