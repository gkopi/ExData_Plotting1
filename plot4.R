library(lubridate)
library(dplyr)

household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
dates = dmy(household_power_consumption$Date)
household_power_consumption = mutate(household_power_consumption,dates)

subset = household_power_consumption[household_power_consumption$dates >= ymd("2007-02-01"),]
subset = subset[subset$dates <= ymd("2007-02-02"),]
datetimes = dmy_hms(paste(subset$Date,subset$Time, sep=" "))

household_power_consumption_mutated = mutate(subset,datetimes)
Global_active_power = household_power_consumption_mutated$Global_active_power;

png("plot4.png")
par(mfrow = c(2,2))

plot(household_power_consumption_mutated$datetimes, as.numeric(household_power_consumption_mutated$Global_active_power), type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(household_power_consumption_mutated$datetimes, household_power_consumption_mutated$Voltage, type="l", xlab = "datetime", ylab="Voltage")

plot(household_power_consumption_mutated$datetimes, household_power_consumption_mutated$Sub_metering_1, type="l" , xlab = "", ylab = "Energy sub metering")
lines(household_power_consumption_mutated$datetimes, household_power_consumption_mutated$Sub_metering_2, type="l", col="red")
lines(household_power_consumption_mutated$datetimes, household_power_consumption_mutated$Sub_metering_3, type="l", col="blue")

plot(household_power_consumption_mutated$datetimes, household_power_consumption_mutated$Global_reactive_power, type="l", xlab = "datetime", ylab="Global_reactive_power")
dev.off()
