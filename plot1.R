## PLOT 1 PROGRAM
edata <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
##> str(edata)  ## report on file
## subset Date: 2007-02-01 and 2007-02-02
edatasub <-subset(edata, Date == "1/2/2007" | Date=="2/2/2007")
## plot 1 histogram 
png(filename = "plot1.png", width=480, height=480)
hist(edatasub$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
## DONE