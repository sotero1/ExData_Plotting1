
setwd("~/AWC Laptop/EDA/Week 1")


econsumption <- read.table("household_power_consumption.txt",sep = ";", header = T)

#data.frame(wifi[1:3], apply(wifi[4:9],2, A) )


# change as.date format to day month year before converting below
#as.Date(dates, "%m/%d/%y")



econ<- data.frame(apply(econsumption[1],2, as.Date, format="%d/%m/%y"),econsumption[2:9])


#18293=feb 1 2006
#18294=feb 2 2006


as.Date("01/02/2006","%d/%m/%y")

econs<-econ[econ$Date==18293,  ]

econs2<-econ[econ$Date==18294,  ]

econs3<-rbind(econs,econs2)

econs3$Global_active_power<-as.numeric(econs3$Global_active_power)

econs3$Global_active_power<-econs3$Global_active_power/1000

hist(econs3$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power" )


