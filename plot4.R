#Step One read in Data
data<-read.table("household_power_consumption.txt", header= T, sep = ";", stringsAsFactors = F, dec = ".")

#Step Two sebset
##Data subset of date = A or date= B
mydata<-data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"), ]

#Step three format the Time varaibles
mydata$fd <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Step Four Make all variables as a Numeric
#This is necessary to make graphs match up correctly 
mydata$Global_active_power <- as.numeric(mydata$Global_active_power)
mydata$Global_reactive_power<-as.numeric(mydata$Global_reactive_power)
mydata$Voltage<-as.numeric(mydata$Voltage)
mydata$Sub_metering_1<-as.numeric(mydata$Sub_metering_1)
mydata$Sub_metering_2<-as.numeric(mydata$Sub_metering_2)
mydata$Sub_metering_3<-as.numeric(mydata$Sub_metering_3)

#Graph Four
## the four gaphs include two of the previous graphs
##Set how the four graphs will be willed in
par(mfcol = c(2,2))

##add first graph
with(mydata, plot(fd, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

##add second graph
plot(mydata$fd, mydata$Sub_metering_1, type= "l", xlab= " ", ylab = "Energy Sub Metering")
with(mydata, lines(fd, Sub_metering_2, type = "l", col = "red"))
with(mydata, lines(fd, Sub_metering_3, type = "l", col = "blue"))
legend("topright", col=c("black","red","blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1), lwd=c(1,1))

##add third graph
with(mydata, plot(fd, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

## add fourth graph
with(mydata, plot(fd, Global_reactive_power, type = "l", xlab = "datetime"))
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
