data<-read.table("household_power_consumption.txt",header = T,sep = ";",stringsAsFactors = F)
data$Date=paste(data$Date,data$Time)
data$Date=strptime(data$Date,format = "%d/%m/%Y %H:%M:%S")
r1=which(data$Date==strptime("01/02/2007",format="%d/%m/%Y"))
r2=which(data$Date==strptime("03/02/2007",format="%d/%m/%Y"))
datap=data[r1:(r2-1),]
png("plot4.png")
par(mfrow=c(2,2))
plot(datap$Date,datap[,3],type = "l",lwd=1,ylab = "Global Active Power (kilowatts)",xlab="")
plot(datap$Date,datap[,5],type = "l",lwd=1,ylab = "Voltage",xlab="datetime")

plot(datap$Date,datap[,7],type = "l",lwd=1,col="black",ylab = "Energy sub metering",xlab="")
lines(datap$Date,datap[,8],type="l",lwd=1,col="red")
lines(datap$Date,datap[,9],type="l",lwd=1,col="blue")
legend("topright",names(datap)[7:9],lty=c(1,1,1),col=c('black','red','blue'),bty='n',cex=0.2)

plot(datap$Date,datap[,4],type = "l",lwd=1,ylab = "Global_reactive_power",xlab="datetime")
dev.off()