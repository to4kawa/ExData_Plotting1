library(dplyr)
library(readr)
library(lubridate)

HPC_df <- read_delim("household_power_consumption.txt",delim=";",na=c("?","NA"))

w1_df <- HPC_df %>% filter(Date %in% c("2/2/2007","1/2/2007"))

par(mfrow = c(2,2))

### plot1

plot1_df <- mutate(w1_df, weekDate = paste(dmy(w1_df$Date) ,w1_df$Time)) %>%
  select(weekDate,Global_active_power)

with(plot1_df, plot(strptime(weekDate,"%Y-%m-%d %H:%M:%S"),Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)"))

### plot2
par(new=FALSE)
plot2_df <- mutate(w1_df, weekDate = paste(dmy(w1_df$Date) ,w1_df$Time)) %>%
  select(weekDate,Voltage)

with(plot2_df, plot(strptime(weekDate,"%Y-%m-%d %H:%M:%S"), Voltage, type="l", xlab="datetime",ylab="Voltage"))
par(new=FALSE)
### plot3

plot3_df <- mutate(w1_df, weekDate = paste(dmy(w1_df$Date) ,w1_df$Time)) %>%
  select(weekDate,starts_with("Sub"))

labels <- grep("Sub",names(plot3_df),value=T)

with(w1_weekday_df, plot(strptime(weekDate,"%Y-%m-%d %H:%M:%S"),Sub_metering_1,type="l",ylim=c(0,40),xlab="",ylab=""))
par(new=TRUE)
with(w1_weekday_df, plot(strptime(weekDate,"%Y-%m-%d %H:%M:%S"),Sub_metering_2,type="l",ylim=c(0,40),xlab="",ylab="",col="red"))
par(new=TRUE)
with(w1_weekday_df, plot(strptime(weekDate,"%Y-%m-%d %H:%M:%S"),Sub_metering_3,type="l",ylim=c(0,40),xlab="",ylab="Energy sub metering",col="blue"))
legend("topright", legend = labels, col = c("black","red","blue"), lty = c(1,1,1),box.lty=0,y.intersp = 0.8)


### plot4
par(new=FALSE)
plot4_df <- mutate(w1_df, weekDate = paste(dmy(w1_df$Date) ,w1_df$Time)) %>%
  select(weekDate,Global_reactive_power)

with(plot4_df, plot(strptime(weekDate,"%Y-%m-%d %H:%M:%S"), Global_reactive_power, type="l", xlab="datetime"))


