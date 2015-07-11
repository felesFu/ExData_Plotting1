#   read the data in  1/2/2007 and 2/2/2007 by function read.csv.sql
#   install the "sqldf" package before run the script.

filename <- "household_power_consumption.txt"
library(sqldf)
sql <- "select * from file where Date in ('1/2/2007', '2/2/2007') "
dat <- read.csv.sql(filename, sep = ";", sql = sql)

## plot 1 : the frquency of global active power(kilowatts) 
## creat a PNG file with 480*480, plot, and close the file
png(filename = "plot1.png", width = 480, height = 480, units = "px")
with(dat, hist(Global_active_power, xlab = "Global active power(kilowatts)",main = "global active power", col ="red"))
dev.off()
