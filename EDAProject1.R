
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


# we are subsetting the desired dates result in econs3 

econs<-econsumption[econsumption$Date=="2007-02-01",  ]

econs2<-econsumption[econsumption$Date=="2007-02-02",  ]

econs3<-rbind(econs,econs2)


# PLOT 1
#econs3$Global_active_power<-as.character(econs3$Global_active_power)

econs3$Global_active_power<-as.numeric(econs3$Global_active_power)

econs3$Global_active_power<-econs3$Global_active_power/1000

hist(econs3$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power" )


# PLOT 2################################################################
# in commands below we are convining date and time and appending in column 10

x <- paste(econs3$Date,econs3$Time)
x<-as.character(x)

y <- strptime(x, "%Y-%m-%d %H:%M:%S")

econs3<-cbind(econs3,y)

econs3$Global_active_power[399]<-6.536
econs3$Global_active_power[401]<-5.292

colnames(econs3)[10]<-"datetime"

plot(econs3$datetime,econs3$Global_active_power )



plot(econs3$datetime,econs3$Global_active_power,type="l",xlab="" , ylab="Global Active Power (kilowatts)" )


################################################ PLOT 3 ################################

# submetering 1


econs3$Sub_metering_1<-as.numeric(econs3$Sub_metering_1)




econs3$Sub_metering_2<-as.character(econs3$Sub_metering_2)

econs3$Sub_metering_2<-as.numeric(econs3$Sub_metering_2)



econs3$Sub_metering_3<-as.numeric(econs3$Sub_metering_3)

#plot(x,y1,type="l",col="red")
#lines(x,y2,col="green")


plot(econs3$datetime,econs3$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""   )


lines(econs3$datetime,econs3$Sub_metering_2, col="orange"   )

lines(econs3$datetime,econs3$Sub_metering_3, col="blue"   )

legend("topright", # places a legend at the appropriate place c("Health","Defense"), # puts text in the legend 
       
       c("Sub Metering 1","Sub Metering 2","Sub Metering 3"),
       
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       
       lwd=c(2.5,2.5,2.5),col=c("black","orange","blue"), cex=0.3) # gives the legend lines the correct color and width


#####  PLOT 4 ##############################################

# VOltage

econs3$Voltage<-as.character(econs3$Voltage)

econs3$Voltage<-as.numeric(econs3$Voltage)


plot( econs3$datetime, econs3$Voltage, type="l",ylab="Voltage",xlab="datetime"    )

# global reactive power


econs3$Global_reactive_power<-as.numeric(econs3$Global_reactive_power)

plot(econs3$datetime,econs3$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"  )


#oma= c(0,0,2,0) 

#par(mfrow = c(2,2)  )

#with(econs3, plot(datetime,Global_active_power,type="l",xlab="" , ylab="Global Active Power (kilowatts)" ))

#with(econs3,plot( datetime, Voltage, type="l",ylab="Voltage",xlab="datetime") )


#with(econs3,plot(datetime,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"  ))


#with(econs3,plot(datetime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""   ),


#lines(datetime,Sub_metering_2, col="orange"   ),

#lines(datetime,Sub_metering_3, col="blue"   ))

#})



#######################################################################
#middle,left and middle vertical
par(mfrow = c(2,2),mar = c(3,4,2,2)  )

plot(econs3$datetime,econs3$Global_active_power,type="l",xlab="" , ylab="Global Active Power " )


plot( econs3$datetime, econs3$Voltage, type="l",ylab="Voltage",xlab="datetime"    )

plot(econs3$datetime,econs3$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""   )


lines(econs3$datetime,econs3$Sub_metering_2, col="orange"   )

lines(econs3$datetime,econs3$Sub_metering_3, col="blue"   )

legend("topright", # places a legend at the appropriate place c("Health","Defense"), # puts text in the legend 
       
       c("Sub Metering 1","Sub Metering 2","Sub Metering 3"),
       
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       
       lwd=c(2.5,2.5,2.5),col=c("black","orange","blue"), cex=0.3) # gives the legend lines the correct color and width

plot(econs3$datetime,econs3$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"  )

