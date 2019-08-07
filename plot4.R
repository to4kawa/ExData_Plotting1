library(readr)
library(lubridate)


# download file and unzip
file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file_url,"data.zip",method="curl")
df <- {unzip("data.zip")}

# read require cols to dataframe
data_df <- read_delim(df,delim=";",na=c("?","NA"), col_types = "ccddddddd")
plot4_df <- subset(data_df,Date %in% c("2/2/2007","1/2/2007"))

datetime_df  <- strptime(paste(dmy(plot4_df$Date) ,plot4_df$Time),"%Y-%m-%d %H:%M:%S")

# create png image
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

### plot1

hist(plot4_df$Global_active_power,xlab="Global Active Power(kilowatts)",ylab="Frequency",main="Global Active Power", col="red")

### plot2

plot(datetime_df, plot4_df$Voltage, type="l", xlab="datetime",ylab="Voltage")

### plot3

plot(datetime_df, plot4_df$Sub_metering_1,type="l", col="black", xlab="", ylab="", ylim=c(0,38))
par(new=TRUE)
plot(datetime_df, plot4_df$Sub_metering_2, type="l", col="red", xlab="", ylab="", ylim=c(0,38))
par(new=TRUE)
plot(datetime_df, plot4_df$Sub_metering_3, type="l", col="blue", xlab="", ylab="Energy sub metering", ylim=c(0,38))

legend("topright", legend = labels, col = c("black","red","blue"), lty = c(1,1,1), box.lty = 0)


### plot4

plot(datetime_df, plot4_df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
