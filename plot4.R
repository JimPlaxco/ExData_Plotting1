## PLOT 4 PROGRAM - 4 plots
edata <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
## subset Date: 2007-02-01 and 2007-02-02
edatasub <-subset(edata, Date == "1/2/2007" | Date=="2/2/2007")
## merge date and time  
edatasub$DTV <- strptime(paste(edatasub$Date,edatasub$Time),"%d/%m/%Y %H:%M:%S")
png(filename = "plot4.png", width=480, height=480)
## set graphics parms
par(mfcol=c(2,2)) ## 2 rows, 2 columns
par(mar=c(4.1, 4.0, 2.5, 2.1))  ## default was 5.1 4.1 4.1 2.1
##-----------------------------------------
## 1st plot
plot(edatasub$DTV,edatasub$Global_active_power,type="l",ylab="Global Active Power",xlab=" ",col="black")
##-----------------------------------------
## 2nd plot is a repeat of plot 3 from prior script
plot(edatasub$DTV,edatasub$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=" ",col="black")
lines(edatasub$DTV,edatasub$Sub_metering_2,col="red")
lines(edatasub$DTV,edatasub$Sub_metering_3,col="blue")
legend("topright",lty=1,bty="n",lwd=2,col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##-----------------------------------------
## 3rd plot
plot(edatasub$DTV,edatasub$Voltage,type="l",ylab="Voltage",xlab="datetime",col="black")
##-----------------------------------------
## 4th plot
plot(edatasub$DTV,edatasub$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime",col="black")
dev.off()
## DONE