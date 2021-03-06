myurl<-"http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(myurl, destfile="electricdata.zip", method="auto")
unzip("electricdata.zip")

electric<-read.table("./household_power_consumption.txt",header=TRUE, sep=";", na.strings="?", 
                     colClasses=c("character", "character", "numeric", "numeric", "numeric",
                                  "numeric", "numeric", "numeric", "numeric"))

electric$datetime <- strptime(paste(electric$Date, electric$Time), "%d/%m/%Y %H:%M:%S")

data<-subset(electric, as.Date(datetime)>=as.Date("2007-02-01") & as.Date(datetime)<=as.Date("2007-02-02"))

head(data, n=2)


png(file="plot4.png", height=480, width=480)

par(mfcol=c(2,2))

plot(data$datetime, data$Global_active_power, ylab="Global Active Power",
    xlab="", type="l")


plot(data$datetime, data$Sub_metering_1, ylab="Energy sub metering",
    xlab="", type="l")

lines(data$datetime, data$Sub_metering_2, col="red")

lines(data$datetime, data$Sub_metering_3, col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=c(1,1,1), col=c("black","red","blue"), bty="n")


plot(data$datetime, data$Voltage, ylab="Voltage", xlab="datetime", type="l")


plot(data$datetime, data$Global_reactive_power, ylab="Global_reactive_power",
     xlab="datetime", type="l")


dev.off()