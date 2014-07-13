Sys.setlocale(category = "LC_TIME", locale = "C") #used to set the weekdays in english

#Load Data
data <- read.table("/home/david/Escritorio/R/Exploratory Data/household_power_consumption.txt", 
                   sep = ";", comment.char= "", na.strings = "?", skip = 66600, n= 3050, stringsAsFactors= FALSE
                   ,col.names= c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                                 "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Subset to days: 01/02/2007 y 02/02/2007
Power <- subset(data, as.Date(Date) == "1/2/2007" | as.Date(Date) == "2/2/2007")

#Para tener los dias, tentativamente
dias <- strptime(paste(Power$Date, Power$Time, sep = ""), format= "%d/%m/%Y %H:%M:%S")

#Generate Plot1
hist( x = Power$Global_active_power, col = "red", xlab= "Global Active Power (kilowatts)", 
      main= "Global Active Power")

#Save Plot1
dev.copy()

png("plot1.png", width=480, height=480)

hist( x = Power$Global_active_power, col = "red", xlab= "Global Active Power (kilowatts)", 
      main= "Global Active Power")
dev.off()