
#####   Coursera Data Science Specialisation    #####
#####   Course 4 - Exploratory Data Analyis     #####
#####   Week 1 - Peer Review Project            #####
#####   Paul Loh                                #####
#####   21st Dec 2017                           #####
#####   Plot3.png output file                   #####

## Read all the data
d1 <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors = FALSE)

## Convert the 'Date' column to a date data tyoe 
d1$Date <- as.Date(strptime(d1$Date, "%d/%m/%Y"))

## Subset the dataset only on the 1st and 2nd of Feb, 2007
d2 <- subset(d1, d1$Date==as.Date("2007-02-01") | d1$Date==as.Date("2007-02-02"))

## Convert tall other columns to the relevant datatypes
d2$Global_active_power <- as.numeric(d2$Global_active_power)
d2$Global_reactive_power <- as.numeric(d2$Global_reactive_power)
d2$Voltage <- as.numeric(d2$Voltage)
d2$Global_intensity <- as.numeric(d2$Global_intensity)
d2$Sub_metering_1 <- as.numeric(d2$Sub_metering_1)
d2$Sub_metering_2 <- as.numeric(d2$Sub_metering_2)
d2$Sub_metering_3 <- as.numeric(d2$Sub_metering_3)
d2$DateTime <- strptime(stringr::str_c(d2$Date," ", d2$Time), format = "%Y-%m-%d %H:%M:%S")

## Change the device to png output with width & height dimensions of 480 pixels
png("plot3.png", width = 480, height = 480)

## Plot the 3 sub metering datasets on the same graph setting the y-axis to the full range of values contained
plot(d2$DateTime, d2$Sub_metering_1, type = "l", col="black", xlab = "", ylab = "Energy sub metering", ylim = range(c(d2$Sub_metering_1, d2$Sub_metering_2, d2$Sub_metering_3)))
par(new=T)
plot(d2$Sub_metering_2, type = "l", xlab="", ylab="", col="red", axes = "F", ylim = range(c(d2$Sub_metering_1, d2$Sub_metering_2, d2$Sub_metering_3)))
par(new=T)
plot(d2$Sub_metering_3, type = "l", xlab="", ylab="", col="blue", axes = "F", ylim = range(c(d2$Sub_metering_1, d2$Sub_metering_2, d2$Sub_metering_3)))

## Add the legend
legend('topright', legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

## Close the device 
dev.off()

#####       END       #####