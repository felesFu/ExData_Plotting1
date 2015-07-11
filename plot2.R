#   read the data in  1/2/2007 and 2/2/2007 by function read.csv.sql
#   install the "sqldf" package before run the script.

filename <- "household_power_consumption.txt"
library(sqldf)
sql <- "select * from file where Date in ('1/2/2007', '2/2/2007') "
dat <- read.csv.sql(filename, sep = ";", sql = sql)

## Integret Date and Time, and save as POSIXLt
datetime <- strptime(paste(dat$Date, dat$Time, sep = " "),format = "%d/%m/%Y %H:%M:%S")

## plot 2: the time series of global active power(kilowatts)
## set the encoding to UTF-8, otherwise my system can't show axis label correctly
Sys.setlocale("LC_TIME", "en_US.UTF-8")
##  plot 
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(datetime, dat$Global_active_power, xlab = "", ylab = "Global Active Power (Kilowatts)", type = "l")
dev.off()



