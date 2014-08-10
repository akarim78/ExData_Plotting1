##   This script produces plots for the Coursera unit Exploratory dat Analysis- Project 1, 2014
url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'; 
file <- download.file(url, destfile='power.zip');
unzip('power.zip', files = NULL, list = FALSE, overwrite = TRUE)

## Note that in this dataset missing values are coded as ?
power_data <- read.table('household_power_consumption.txt', header = TRUE, sep=';', na.strings='?')
power_data$Date<-as.Date(power_data$Date, format="%d/%m/%Y")

## Subsetting the data
data <- power_data[power_data$Date>= as.Date("2007-02-01") & power_data$Date<= as.Date("2007-02-02"),]
rm(power_data)

## wkdays<-weekdays(data$Date)
##head(data$Time)
data$DateTime <- paste(data$Date,data$Time)
data$DateTime <- as.POSIXct(data$DateTime)

## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(data$Global_active_power~data$DateTime, type="l", ylab="Global Active Power", xlab="")
plot(data$Voltage~data$DateTime, type="l", ylab="Voltage", xlab="datetime")

plot(data$Sub_metering_1~data$DateTime, type="l", ylab="Energy sub metering", xlab="")
lines(data$Sub_metering_2~data$DateTime, col='Red')
lines(data$Sub_metering_3~data$DateTime, col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$Global_reactive_power~data$DateTime, type="l", ylab="Global_reactive_power", xlab="datetime")

## Save file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

