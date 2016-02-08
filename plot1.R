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

##Make Graph One
hist(mydata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
##Copy Graph
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()