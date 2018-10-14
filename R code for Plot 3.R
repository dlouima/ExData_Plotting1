#creating the plot 3

energy <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(energy) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
houseold_energy <- subset(energy,energy$Date=="1/2/2007" | energy$Date =="2/2/2007")


# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
houseold_energy$Date <- as.Date(houseold_energy$Date, format="%d/%m/%Y")
houseold_energy$Time <- strptime(houseold_energy$Time, format="%H:%M:%S")
houseold_energy[1:1440,"Time"] <- format(houseold_energy[1:1440,"Time"],"2007-02-01 %H:%M:%S")
houseold_energy[1441:2880,"Time"] <- format(houseold_energy[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png("plot3.png", width=480, height=480)

# calling the basic plot functions
plot(houseold_energy$Time,houseold_energy$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(houseold_energy,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(houseold_energy,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(houseold_energy,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# annotating graph
title(main="Energy sub-metering")

dev.off()
