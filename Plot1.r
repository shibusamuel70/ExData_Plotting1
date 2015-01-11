#Download and unzip the file from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip into your working directory.
 
#Read the contents of the file household_power_consumption.txt from the working directory
eledat <- read.csv("D:/DataScience/household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")

#Convert the Date column value to type date with format as d/m/Y
eledat$Date <- as.Date(as.character(eledat$Date), format = "%d/%m/%Y")

#Convert the Time column value to type time with format as HH:MM:SS
eledat$Time <- strptime(eledat$Time, format="%H:%M:%S")

#Generate a png file with a width of 480 pixels and a height of 480 pixels by filtering data for dates 2007-02-01 & 2007-02-02
png(file = "plot1.png",width = 480, height = 480, units = "px")
with(subset(eledat, Date >= '2007-02-01' & Date <= '2007-02-02'),hist(Global_active_power,col="red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency"))

#Complete creating of the file
dev.off()


