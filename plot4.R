## Create plot4

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

# Open up a graphic device writing to file "plot4.png"
png(file = "plot4.png")

# Set number dimensions of plot display area
par(mfcol=c(2,2))

# Create and output first diagram to png file "plot4.png"
plot(EL$DateTime, EL$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Create and output second diagram to png file "plot4.png"
plot(EL$DateTime, EL$Sub_metering_1, type = "l", col="black", ylab="Energy sub metering", xlab = "")
points(EL$DateTime, EL$Sub_metering_2, type = "l", col="red")
points(EL$DateTime, EL$Sub_metering_3, type = "l", col="blue")
legend("topright", pch = "-", col = c("black", "red", "blue"), legend = names(EL)[8:10])

# Create and output third diagram to png file "plot4.png"
plot(EL$DateTime, EL$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Create and output fourth diagram to png file "plot4.png"
plot(EL$DateTime, EL$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
