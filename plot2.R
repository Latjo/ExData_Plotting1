## Create plot2

# Read data into a table
EL <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE)

# Load dplyr package
library(dplyr)

# Filter the table on the two dates of interest
EL <- filter(EL, Date=="1/2/2007"|Date=="2/2/2007")

# Load lubdridate package
library(lubridate)

# Convert EL$Date to date class
EL$Date <- dmy(EL$Date)

# Add a new column which holds both date and time.
EL <- mutate(EL, DateTime = as.POSIXct(strptime(paste(EL$Date, EL$Time), format = "%Y-%m-%d %H:%M:%S")))

# Make the newly created column DateTime become first column.
EL <- EL[,c(10,1:9)]

# Convert variables to appropriate classes
EL$Global_active_power <- as.numeric(EL$Global_active_power)
EL$Global_reactive_power <- as.numeric(EL$Global_reactive_power)
EL$Voltage <- as.numeric(EL$Voltage)
EL$Global_intensity <- as.numeric(EL$Global_intensity)
EL$Sub_metering_1 <- as.numeric(EL$Sub_metering_1)
EL$Sub_metering_2 <- as.numeric(EL$Sub_metering_2)
EL$Sub_metering_3 <- as.numeric(EL$Sub_metering_3)

# Create and output diagram to png file "plot1.png"
png(file = "plot2.png")
plot(EL$DateTime, EL$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()