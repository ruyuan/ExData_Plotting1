electric<-read.table("./household_power_consumption.txt",header=TRUE, sep=";", na.strings="?", 
                     colClasses=c("character", "character", "numeric", "numeric", "numeric",
                                  "numeric", "numeric", "numeric", "numeric"))

electric$datetime <- strptime(paste(electric$Date, electric$Time), "%d/%m/%Y %H:%M:%S")

data<-subset(electric, as.Date(datetime)>=as.Date("2007-02-01") & as.Date(datetime)<=as.Date("2007-02-02"))

head(data, n=2)

png(file="plot2.png", height=480, width=480)

plot(data$datetime, data$Global_active_power, ylab="Global Active Power (kilowatts)",
    xlab="", type="l")

dev.off()