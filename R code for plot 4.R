energy <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(energy) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
houseold_energy <- subset(energy,energy$Date=="1/2/2007" | energy$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
houseold_energy$Date <- as.Date(houseold_energy$Date, format="%d/%m/%Y")
houseold_energy$Time <- strptime(houseold_energy$Time, format="%H:%M:%S")
houseold_energy[1:1440,"Time"] <- format(houseold_energy[1:1440,"Time"],"2007-02-01 %H:%M:%S")
houseold_energy[1441:2880,"Time"] <- format(houseold_energy[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# initiating a composite plot with many graphs
par(mfrow=c(2,2))

# calling the basic plot function that calls different plot functions to build the 4 plots that form the graph
with(houseold_energy,{
  plot(houseold_energy$Time,as.numeric(as.character(houseold_energy$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(houseold_energy$Time,as.numeric(as.character(houseold_energy$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(houseold_energy$Time,houseold_energy$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(houseold_energy,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(houseold_energy,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(houseold_energy,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(houseold_energy$Time,as.numeric(as.character(houseold_energy$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})