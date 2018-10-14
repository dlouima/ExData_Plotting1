#this is the first part of the assignement: reading, naming and creation of the first plot
energy <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(energy) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
houseold_energy <- subset(energy,energy$Date=="1/2/2007" | energy$Date =="2/2/2007")

#creating the first histogramme 
hist(as.numeric(as.character(houseold_energy$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# annotating graph
title(main="Global Active Power")