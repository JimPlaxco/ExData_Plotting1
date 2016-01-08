## PLOT 3 PROGRAM
edata <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
##> str(edata)  ## report on file
## subset Date: 2007-02-01 and 2007-02-02
edatasub <-subset(edata, Date == "1/2/2007" | Date=="2/2/2007")
## merge date and time  
edatasub$DTV <- strptime(paste(edatasub$Date,edatasub$Time),"%d/%m/%Y %H:%M:%S")
##Yaxis:
##  black  edatasub$Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
##  red    edatasub$Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
##  blue   edatasub$Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
##Xaxis:  edatasub$DTV
png(filename = "plot3.png", width=480, height=480)
plot(edatasub$DTV,edatasub$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=" ",col="black")
lines(edatasub$DTV,edatasub$Sub_metering_2,col="red")
lines(edatasub$DTV,edatasub$Sub_metering_3,col="blue")
legend("topright",lty=1,lwd=2,col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
## DONE