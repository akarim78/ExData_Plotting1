##   This script produces plots for the Coursera unit Exploratory dat Analysis- Project 1, 2014
url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'; 
file <- download.file(url, destfile='power.zip');
unzip('power.zip', files = NULL, list = FALSE, overwrite = TRUE)

## Note that in this dataset missing values are coded as ?
power_data <- read.table('household_power_consumption.txt', header = TRUE, sep=';', na.strings='?')
## head(power_data)
## names(power_data)
power_data$Date<-as.Date(power_data$Date, format="%d/%m/%Y")

## Subsetting the data
data <- power_data[power_data$Date>= as.Date("2007-02-01") & power_data$Date<= as.Date("2007-02-02"),]
## nrow(data)
## head(data)
rm(power_data)
## Plot 1
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
## Save file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


