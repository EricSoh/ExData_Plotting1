## plot4.R - Create 4 plots
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
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12, bg = "white")

par(mfrow=c(2,2), mar=c(4,4,1,1), oma=c(0,0,2,1))

## Plot line Global Active Power
plot(power$Time,as.numeric(power$Global_active_power),
     ylab = "Global Active Power",type="l", xlab="")

## Plot line Voltage Vs dateTime
plot(power$Time,as.numeric(power$Voltage),
     ylab = "Voltage",type="l", xlab="datetime")

## Plot lines for sub metering values
with(power,{
    plot(Time,as.numeric(Sub_metering_1),
         ylab = "Energy sub metering",type="l", xlab="")
    lines(Time,as.numeric(Sub_metering_2), type="l", xlab="", col="red")
    lines(Time,as.numeric(Sub_metering_3), type="l", xlab="", col="blue")
    legend("topright", lty=1, bty="n", cex=0.80, col=c("black", "red","blue"), 
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
}
     )

## Plot line Voltage Vs dateTime
plot(power$Time,as.numeric(power$Global_reactive_power),
     ylab = "Global_reactive_power",type="l", xlab="datetime")

## Close
dev.off()