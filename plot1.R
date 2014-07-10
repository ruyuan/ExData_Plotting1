myurl<-"http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(myurl, destfile="electricdata.zip", method="auto")
unzip("electricdata.zip")

electric<-read.table("./household_power_consumption.txt",header=TRUE, sep=";", na.strings="?", 
                     colClasses=c("character", "character", "numeric", "numeric", "numeric",
                                  "numeric", "numeric", "numeric", "numeric"))

electric$trandate<-as.Date(electric$Date, format='%d/%m/%Y')

data<-subset(electric, (trandate>="2007-02-01") & (trandate<="2007-02-02"))



head(data,n=2)

######another way
 electric$datetime<-strptime(paste(electric$Date, electric$Time), "%d/%m/%Y %H:%M:%S")
 head(electric, n=2) ####


png(file="plot1.png",height=480, width=480)

hist(data$Global_active_power, main="Global Active Power",
    xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")


dev.off()