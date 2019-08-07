library(readr)
library(lubridate)


# download file and unzip
file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file_url,"data.zip",method="curl")
df <- {unzip("data.zip")}

# read require cols to dataframe
data_df <- read_delim(df,delim=";",na=c("?","NA"), col_types = "cc____ddd")
plot3_df <- subset(data_df,Date %in% c("2/2/2007","1/2/2007"))

# Date and Time cols change POSIXlt dataframe
plot3_df_x <- strptime(paste(dmy(plot3_df$Date) ,plot2_df$Time),"%Y-%m-%d %H:%M:%S")

labels <- grep("Sub",names(plot3_df),value=T)

# create png image
png("plot3.png", width = 480, height = 480)

plot(plot3_df_x, plot3_df$Sub_metering_1,type="l", col="black", xlab="", ylab="", ylim=c(0,38))
par(new=TRUE)
plot(plot3_df_x, plot3_df$Sub_metering_2, type="l", col="red", xlab="", ylab="", ylim=c(0,38))
par(new=TRUE)
plot(plot3_df_x, plot3_df$Sub_metering_3, type="l", col="blue", xlab="", ylab="Energy sub metering", ylim=c(0,38))
legend("topright", legend = labels, col = c("black","red","blue"), lty = c(1,1,1))

dev.off()
