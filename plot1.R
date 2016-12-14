df<-read.table("household_power_consumption.txt",na.strings = "?",sep =";")
df<-df[df$V1=="1/2/2007"|df$V1=="2/2/2007",]
df$V3<-as.numeric(as.character(df$V3))
colnames(df)<-c("datetime","time","global_active_power","global_reactive_power","voltage","global_intensity","sub_metering_1","sub_metering_2","sub_metering_3")
with(df,hist(global_active_power, col = "red",xlab = "Global Active Power (kilowatts)",main="Global Active Power"))
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()