library(readr)
library(lubridate)


# download file and unzip
file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file_url,"data.zip",method="curl")
df <- {unzip("data.zip")}

# read require cols to dataframe
data_df <- read_delim(df,delim=";",na=c("?","NA"), col_types = "ccd______")
plot2_df <- subset(data_df,Date %in% c("2/2/2007","1/2/2007"))

# Date and Time cols change POSIXlt dataframe
plot2_df_x <- strptime(paste(dmy(plot2_df$Date) ,plot2_df$Time),"%Y-%m-%d %H:%M:%S")

# create png image
png("plot2.png", width = 480, height = 480)

plot(plot2_df_x, plot2_df$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")

dev.off()