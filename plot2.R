#Reading the table
df<-read.table("household_power_consumption.txt",na.strings = "?",sep =";")

#Selecting only wanted data
df<-df[df$V1=="1/2/2007"|df$V1=="2/2/2007",]

#Converting data to right format
df$V1<-paste(df$V1,df$V2,sep = "-")
df$V1<-strptime(df$V1,"%d/%m/%Y-%H:%M:%S")
df$V3<-as.numeric(as.character(df$V3))

#Renaming columns
colnames(df)<-c("datetime","time","global_active_power","global_reactive_power","voltage","global_intensity","sub_metering_1","sub_metering_2","sub_metering_3")

#Doing the actual plot
plot(x = df$datetime,y=df$global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")

#Creating file and closing device
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()