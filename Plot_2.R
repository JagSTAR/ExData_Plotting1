## READING DATA IN (Enter File Path)
Data1<-read.table("FILE PATH HERE", sep = ";",header = TRUE, stringsAsFactors = FALSE)
## SEGMENTING FOR CORRECT DATES 
Dates1<-c(grep("1/2/2007",Data1$Date, value = FALSE),grep("2/2/2007",Data1$Date, value = FALSE))
Data2<-Data1[Dates1,]
## cLEANING THE DATA FURTHER TO REMOVE INCORRECT EXTRACTIONS (11/2/2007, 12/2/2007, 21/2/2007, 22/2/2007)
Dates2<-c(grep("11/2/2007",Data2$Date, value = FALSE), grep("12/2/2007",Data2$Date, value = FALSE),grep("21/2/2007",Data2$Date, value = FALSE), grep("22/2/2007",Data2$Date, value = FALSE))
Dates3<--1*Dates2
Data3<-Data2[Dates3,]
## STRIPPING TIME FROM THE RECORDS 
Data3<-cbind(strptime(paste(Data3$Date,Data3$Time),"%d/%m/%Y %H:%M:%S"),Data3)
colnames(Data3)[1]<-"ClassTime"
Data3<-cbind(format.Date(strptime(paste(Data3$Date,Data3$Time),"%d/%m/%Y %H:%M:%S"),"%c"),Data3)
colnames(Data3)[1]<-"Date and Time"
Data3<-cbind(format.Date(strptime(Data3$Date,"%d/%m/%Y"),"%a"), Data3)
colnames(Data3)[1]<-"Weekday"

##Turning on PNG Saving 
png("plot2.png")

##Building Plot 2
plot(Data3$ClassTime,Data3$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)",xlab = "")

##Turning Off PNG Printing 
dev.off()

