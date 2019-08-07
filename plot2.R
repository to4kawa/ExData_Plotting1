library(dplyr)
library(readr)
library(lubridate)

HPC_df <- read_delim("household_power_consumption.txt",delim=";",na=c("?","NA"))

w1_df <- HPC_df %>% filter(Date %in% c("2/2/2007","1/2/2007"))

w1_weekday_df <- mutate(w1_df, weekDate = paste(dmy(w1_df$Date) ,w1_df$Time)) %>%
  select(weekDate,Global_active_power)

png("plot2.png")

with(w1_weekday_df, plot(strptime(weekDate,"%Y-%m-%d %H:%M:%S"),Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)"))

dev.off()