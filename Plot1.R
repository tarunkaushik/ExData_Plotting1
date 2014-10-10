# Reading data
data <- read.table("household_power_consumption.txt",header=TRUE,sep = ";",colClasses=c(rep("character",2),rep("numeric",7)),na.strings = c("NA","?"))

# Merging date and time
data <- cbind(strptime(paste(data[,1],data[,2],sep="-"),format="%d/%m/%Y-%H:%M:%S"),data[,3:9])

# Renaming column of date and time
names(data)[1] <- "DateTime"

# Subsetting data
data <- data[which(data$DateTime>strptime("2007-02-01",format="%Y-%m-%d") & data$DateTime<strptime("2007-02-03",format="%Y-%m-%d")),]

# Opening file Plot1.png of specified dimensions
png(file="Plot1.png",width = 480, height = 480,units = "px")

# Setting global background to be white
par(bg="white")

# Plotting histogram
hist(data$Global_active_power,xlab="Global Active Power (kilowatts)", col= "red",main="Global Active Power")

# Closing file
dev.off()

