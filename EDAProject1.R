
setwd("~/AWC Laptop/EDA/Week 1")


econsumption <- read.table("household_power_consumption.txt",sep = ";", header = T)

#data.frame(wifi[1:3], apply(wifi[4:9],2, A) )


# change as.date format to day month year before converting below
#as.Date(dates, "%m/%d/%y")

econ<- data.frame(apply(econsumption[1],2, as.Date, "%d/%m/%y"),econsumption[2:9])
ds
f'sa
d'
