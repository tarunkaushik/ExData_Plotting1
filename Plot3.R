# Reading data
data <- read.table("household_power_consumption.txt",header=TRUE,sep = ";",colClasses=c(rep("character",2),rep("numeric",7)),na.strings = c("NA","?"))

# Merging date and time
data <- cbind(strptime(paste(data[,1],data[,2],sep="-"),format="%d/%m/%Y-%H:%M:%S"),data[,3:9])

# Renaming column of date and time
names(data)[1] <- "DateTime"

# Subsetting data
data <- data[which(data$DateTime>strptime("2007-02-01",format="%Y-%m-%d") & data$DateTime<strptime("2007-02-03",format="%Y-%m-%d")),]

# Opening file Plot1.png of specified dimensions
png(file="Plot3.png",width = 480, height = 480,units = "px")

# Setting global background to be white
par(bg="white")

# Plotting graph for each variable one by one and then setting legend
with(data,plot(DateTime,Sub_metering_1,type='n',ylab="Energy sub metering",xlab=""))
with(data,points(DateTime,Sub_metering_1,type='l',ylab="Energy sub metering",xlab="",col="black"))
with(data,points(DateTime,Sub_metering_2,type='l',ylab="Energy sub metering",xlab="",col="red"))
with(data,points(DateTime,Sub_metering_3,type='l',ylab="Energy sub metering",xlab="",col="blue"))
legend("topright", lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Closing file
dev.off()

