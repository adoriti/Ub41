# load libraries----
library(tidyverse)
library(data.table)
library(chron)

# set wd
setwd("C:\\Users\\ASUS\\Documents\\Ubiqum\\4.1")
input_file <- "household_power_consumption.txt"

# read data
data <- fread(input = input_file, sep = ";", dec = ".")

# make data numerical
data$Global_active_power <- as.numeric(data$Global_active_power, na.rm = TRUE)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power, na.rm = TRUE)
data$Voltage <- as.numeric(data$Voltage, na.rm = TRUE)
data$Global_intensity <- as.numeric(data$Global_intensity, na.rm = TRUE)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1, na.rm = TRUE)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2, na.rm = TRUE)

# make dates in a way that I can read
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# make time into something I can read
# take into account gmt, light savings
data$Time <- times(data$Time)

# figure out where we have NAs
a <- rownames(data[!complete.cases(data),])
a <- as.numeric(a)
b <- sample(a, 10000)

# get an idea about the current data without missing values
qplot(data = data[b,], x = Date, y = Voltage)
qplot(data = data[b], x = Date, y = Global_active_power)
qplot(data = data[b], x = Date, y = Global_reactive_power)
qplot(data = data[b], x = Date, y = Global_intensity)
qplot(data = data[b], x = Date, y = Sub_metering_1)
qplot(data = data[b], x = Date, y = Sub_metering_2)
qplot(data = data[b], x = Date, y = Sub_metering_3)
qplot(data = data[b], x = Time, y = Voltage)
qplot(data = data[b], x = Time, y = Global_active_power)
qplot(data = data[b], x = Time, y = Global_reactive_power)
qplot(data = data[b], x = Time, y = Global_intensity)
qplot(data = data[b], x = Time, y = Sub_metering_1)
qplot(data = data[b], x = Time, y = Sub_metering_2)
qplot(data = data[b], x = Time, y = Sub_metering_3)
qplot(data = data[b], x = Voltage, y = Global_active_power)
qplot(data = data[b], x = Voltage, y = Global_active_power)
qplot(data = data[b], x = Voltage, y = Global_reactive_power)
qplot(data = data[b], x = Voltage, y = Global_intensity)
qplot(data = data[b], x = Voltage, y = Sub_metering_1)
qplot(data = data[b], x = Voltage, y = Sub_metering_2)
qplot(data = data[b], x = Voltage, y = Sub_metering_3)



