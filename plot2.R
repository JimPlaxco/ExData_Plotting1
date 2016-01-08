## PLOT 2 PROGRAM
edata <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
##> str(edata)  ## report on file
## subset Date: 2007-02-01 and 2007-02-02
edatasub <-subset(edata, Date == "1/2/2007" | Date=="2/2/2007")
## merge date and time  
edatasub$DTV <- strptime(paste(edatasub$Date,edatasub$Time),"%d/%m/%Y %H:%M:%S")
##plot 2: Y= Global_active_power, x= day of week from Date
png(filename = "plot2.png", width=480, height=480)
plot(edatasub$DTV, edatasub$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=" ")
dev.off()
## DONE