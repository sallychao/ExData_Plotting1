data<-read.table("household_power_consumption.txt",header = T,sep = ";",stringsAsFactors = F)
data$Date=paste(data$Date,data$Time)
data$Date=strptime(data$Date,format = "%d/%m/%Y %H:%M:%S")
r1=which(data$Date==strptime("01/02/2007",format="%d/%m/%Y"))
r2=which(data$Date==strptime("03/02/2007",format="%d/%m/%Y"))
datap=data[r1:(r2-1),]
png("plot1.png")
hist(as.numeric(datap[,3]),breaks=12,xlab = "Global Active Power (kilowatts)",main = "Global Active Power",col="red")
dev.off()