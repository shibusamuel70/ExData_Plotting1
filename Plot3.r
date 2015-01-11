#Exploratory Data Analysis - Course Project 1

#Download and unzip the file from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip into your working directory.
 
#Read the contents of the file household_power_consumption.txt from the working directory
eledat <- read.csv("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")

#Convert the Date column value to type date with format as d/m/Y
eledat$Date <- as.Date(as.character(eledat$Date), format = "%d/%m/%Y")

#Filter the data for dates 2007-02-01 & 2007-02-02
eledat2 <- eledat[eledat$Date >= '2007-02-01' & eledat$Date <= '2007-02-02',]

#Create a datetime column with type as date time with format as YYYY-mm-dd HH:MM:SS
eledat2$datetime <- with(eledat2,paste(as.character(Date),as.character(Time),sep=' ')) #Concatenate Date and Time column to get a datetime column
eledat2$datetime = strptime(eledat2$datetime,"%Y-%m-%d %H:%M:%S")   

#Generate a png file with a width of 480 pixels and a height of 480 pixels
png(file = "plot3.png",width = 480, height = 480, units = "px")
with(eledat2,plot(datetime,Sub_metering_1
,xlab=""
,ylab = "Energy sub metering"
,type = "n"
)
)
with(eledat2, points(datetime,Sub_metering_1 , col = "black", type="l"))
with(eledat2, points(datetime,Sub_metering_2 , col = "red", type="l"))
with(eledat2, points(datetime,Sub_metering_3 , col = "blue", type="l"))
legend("topright",
col = c("black","red","blue"),
lty=1,
bty="o",
box.lty=1, box.lwd=1,
legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")
)
#Complete creating of the file
dev.off()





