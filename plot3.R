## Set working directory
setwd("C:\\Users\\jason\\Documents\\EDUCATION\\COURSERA\\JHU DATA SCIENCE SPECIALIZATION\\EXPLORATORY DATA ANALYSIS\\WEEK1\\ExData_Plotting1")

## 
library(ggplot2)

## Loading the data
hpcdata <- read.csv("household_power_consumption.txt", header=T, sep=";",
                    na.strings="?", check.names=F, stringsAsFactors=F,
                    nrows=2075259,comment.char="", quote='\"')
powerdata <- subset(hpcdata, Date %in% c("1/2/2007","2/2/2007"))
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(powerdata$Date), powerdata$Time)
powerdata$Datetime <- as.POSIXct(datetime)

## Plot 3
png("plot3.png", width=480,height=480)
with(powerdata, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime, col="Red")
        lines(Sub_metering_3~Datetime, col="Blue")
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()