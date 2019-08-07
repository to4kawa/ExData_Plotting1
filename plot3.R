library(dplyr)
library(readr)
library(lubridate)

HPC_df <- read_delim("household_power_consumption.txt",delim=";",na=c("?","NA"))

w1_df <- HPC_df %>% filter(Date %in% c("2/2/2007","1/2/2007"))

w1_weekday_df <- mutate(w1_df, weekDate = paste(dmy(w1_df$Date) ,w1_df$Time)) %>%
  select(weekDate,starts_with("Sub"))

labels <- grep("Sub",names(w1_weekday_df),value=T)


with(w1_weekday_df, plot(strptime(weekDate,"%Y-%m-%d %H:%M:%S"),Sub_metering_1,type="l",ylim=c(0,40),xlab="",ylab=""))
par(new=TRUE)
with(w1_weekday_df, plot(strptime(weekDate,"%Y-%m-%d %H:%M:%S"),Sub_metering_2,type="l",ylim=c(0,40),xlab="",ylab="",col="red"))
par(new=TRUE)
with(w1_weekday_df, plot(strptime(weekDate,"%Y-%m-%d %H:%M:%S"),Sub_metering_3,type="l",ylim=c(0,40),xlab="",ylab="Energy sub metering",col="blue"))

legend("topright", legend = labels, col = c("black","red","blue"), lty = c(1,1,1))

dev.off()
