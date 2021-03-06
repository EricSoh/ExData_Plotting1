## plot2.R - Plot of Global Active Power
## Description: Measurements of electric power consumption in 
## one household with a one-minute sampling rate over a period 
## of almost 4 years. 

## Read txt file
power<-read.csv("household_power_consumption.txt", header=TRUE, sep= ";", 
                colClasses="character", na.strings="?")

## Using data from the dates 2007-02-01 and 2007-02-02 
power<-subset(power,power$Date=="1/2/2007"| power$Date=="2/2/2007")

## Convert from character to date
tmp<-paste(power$Date,power$Time)
power$Date<- strptime(power$Date, "%d/%m/%Y")
power$Time<- strptime(tmp, "%d/%m/%Y %T")

## Print to png with width 480 px, height 480 px
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12, bg = "white")

## Plot line
plot(power$Time,as.numeric(power$Global_active_power),
         ylab = "Global Active Power (kilowatts)",type="l", xlab="")

## Close
dev.off()