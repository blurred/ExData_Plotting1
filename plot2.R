## Set working directory
setwd("C:\\Users\\jason\\Documents\\EDUCATION\\COURSERA\\JHU DATA SCIENCE SPECIALIZATION\\EXPLORATORY DATA ANALYSIS\\WEEK1\\ExData_Plotting1")

## 
library(ggplot2)

## Loading the data
hpcdata <- read.csv("household_power_consumption.txt", header=T, sep=";",
                    na.strings="?", check.names=F, stringsAsFactors=F,
                     comment.char="", quote='\"')
powerdata <- subset(hpcdata, Date %in% c("1/2/2007","2/2/2007"))
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(powerdata$Date), powerdata$Time)
powerdata$Datetime <- as.POSIXct(datetime)

## Plot 2
with(powerdata, {
        plot(Global_active_power~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
})
png("plot2.png", width=480,height=480)
dev.off()
