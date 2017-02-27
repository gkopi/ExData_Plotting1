library(lubridate)
library(dplyr)

household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
dates = dmy(household_power_consumption$Date)
household_power_consumption = mutate(household_power_consumption,dates)

subset = household_power_consumption[household_power_consumption$dates >= ymd("2007-02-01"),]
subset = subset[subset$dates <= ymd("2007-02-02"),]
datetimes = dmy_hms(paste(subset$Date,subset$Time, sep=" "))

household_power_consumption_mutated = mutate(subset,datetimes)

png("plot1.png")
hist(as.numeric(Global_active_power), col="red", xlab = "Global Active Power (kilowatts)",main ="Global Active Power")
dev.off()