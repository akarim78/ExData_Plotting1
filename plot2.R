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
data$DateTime <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")
##head(data$DateTime)
##class(data$DateTime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
## Save file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


