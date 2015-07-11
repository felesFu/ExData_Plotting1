#   read the data in  1/2/2007 and 2/2/2007 by function read.csv.sql
#   install the "sqldf" package before run the script.
library(sqldf)
filename <- "household_power_consumption.txt"
sql <- "select * from file where Date in ('1/2/2007', '2/2/2007') "
dat <- read.csv.sql(filename, sep = ";", sql = sql)

## Integret Date and Time, and save as POSIXLt
datetime <- strptime(paste(dat$Date, dat$Time, sep = " "),format = "%d/%m/%Y %H:%M:%S")

## set the encoding to UTF-8, 
##otherwise my system can't show axis label correctly
Sys.setlocale("LC_TIME", "en_US.UTF-8")

##  plot 3
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(datetime, dat$Sub_metering_1, col = "black",type ="l", xlab = "", ylab = "Energy sub metering")
##  add the lines of sub_metering_2 and sub_metering_3
lines(datetime, dat$Sub_metering_2, col = "red")
lines(datetime, dat$Sub_metering_3, col = "blue")
##  add legend
legend("topright", lty = 1, col = c("black", "blue", "red"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

dev.off()

