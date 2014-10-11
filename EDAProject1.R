
setwd("~/AWC Laptop/EDA/Week 1")

# here we load the text file

econsumption <- read.table("household_power_consumption.txt",sep = ";", header = T)

#data.frame(wifi[1:3], apply(wifi[4:9],2, A) )


# change as.date format to day month year before converting below
#as.Date(dates, "%m/%d/%y")

# here we change the date string into a date format . I cound have done this an easier way

#econ<- data.frame(apply(econsumption[1],2, as.Date, format="%d/%m/%y"),econsumption[2:9])

econsumption$Date<-as.character(econsumption$Date)

econsumption$Date<-as.Date(econsumption$Date,format="%d/%m/%Y",origin="01/01/1970")



# convert to numbers now.

# this should have been 2007 the numbers below are wrong
#18293=feb 1 2006
#18294=feb 2 2006

# convert dates below to numbers

econs<-econsumption[econsumption$Date=="2007-02-01",  ]

econs2<-econsumption[econsumption$Date=="2007-02-02",  ]

econs3<-rbind(econs,econs2)

econs3$Global_active_power<-as.numeric(econs3$Global_active_power)

econs3$Global_active_power<-econs3$Global_active_power/1000

hist(econs3$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power" )

x <- paste(econs3$Date,econs3$Time)
x<-as.character(x)

y <- strptime(x, "%Y-%m-%d %H:%M:%S")

econs3<-cbind(econs3,y)

colnames(econs3)[10]<-"datetime"

plot(econs3$datetime,econs3$Global_active_power )
