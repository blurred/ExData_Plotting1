## Set working directory
setwd("C:\\Users\\jason\\Documents\\EDUCATION\\COURSERA\\JHU DATA SCIENCE SPECIALIZATION\\EXPLORATORY DATA ANALYSIS\\WEEK1\\ExData_Plotting1")

## Loading the data
hpcdata <- read.csv("household_power_consumption.txt", header=T, sep=";",
                    na.strings="?", check.names=F, stringsAsFactors=F,
                    comment.char="", quote='\"')
powerdata <- subset(hpcdata, Date %in% c("2007-02-01","2007-02-02"))
powerdata$Date <- as.Date(powerdata$Date)
hist(powerdata$Global_active_power, main="Global Active Power",
     xlab="Global Active Power", ylab="Frequency")
png("plot1.png", width=480,height=480)
dev.off()