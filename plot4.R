df<-read.table("household_power_consumption.txt",na.strings = "?",sep =";")
df<-df[df$V1=="1/2/2007"|df$V1=="2/2/2007",]
df$V1<-paste(df$V1,df$V2,sep = "-")
df$V1<-strptime(df$V1,"%d/%m/%Y-%H:%M:%S")
df$V3<-as.numeric(as.character(df$V3))
colnames(df)<-c("datetime","time","global_active_power","global_reactive_power","voltage","global_intensity","sub_metering_1","sub_metering_2","sub_metering_3")
df$sub_metering_1<-as.numeric(as.character(df$sub_metering_1))
df$sub_metering_2<-as.numeric(as.character(df$sub_metering_2))
df$sub_metering_3<-as.numeric(as.character(df$sub_metering_3))
df$voltage<-as.numeric(as.character(df$voltage))
df$global_reactive_power<-as.numeric(as.character(df$global_reactive_power))

par(mfrow=c(2,2))
with(df, {
  plot(x = datetime,y=global_active_power,type = "l",ylab = "Global Active Power",xlab = "")
  plot(x = datetime,y=voltage,type = "l",ylab = "Voltage",xlab = "datetime")
  plot(x = datetime,y=sub_metering_1 ,type = "l",xlab="",ylab = "Energy sub metering")
  
  lines(x = datetime,y=sub_metering_2, col="red")
  
  lines(x = datetime,y=sub_metering_3, col="blue")
  
  legend("topright",lty=1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  plot(x = datetime,y=global_reactive_power,type = "l",ylab = "Global_reactive_power",xlab = "datetime")
})
dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()