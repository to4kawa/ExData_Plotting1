library(readr)

# download file and unzip
file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file_url,"data.zip",method="curl")
df <- {unzip("data.zip")}

# read require cols to dataframe
data_df <- read_delim(df,delim=";",na=c("?","NA"), col_types = "ccd______")

plot1_df_x <- subset(data_df,Date %in% c("2/2/2007","1/2/2007"))

# create png image
png("plot1.png", width = 480, height = 480)

hist(plot1_df_x$Global_active_power,xlab="Global Active Power(kilowatts)",ylab="Frequency",main="Global Active Power", col="red")

dev.off()