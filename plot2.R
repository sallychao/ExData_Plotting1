data<-read.table("household_power_consumption.txt",header = T,sep = ";",stringsAsFactors = F)
data$Date=paste(data$Date,data$Time)
data$Date=strptime(data$Date,format = "%d/%m/%Y %H:%M:%S")
r1=which(data$Date==strptime("01/02/2007",format="%d/%m/%Y"))
r2=which(data$Date==strptime("03/02/2007",format="%d/%m/%Y"))
datap=data[r1:(r2-1),]
png("plot2.png")
plot(datap$Date,datap[,3],type = "l",lwd=2,ylab = "Global Active Power (kilowatts)",xlab="")
dev.off()