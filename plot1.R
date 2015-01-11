consumption <- read.table("./data/household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
consumption$Date <- as.Date(consumption$Date,format="%d/%m/%Y")
cons <- subset(consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
rm(consumption) 
# Convert number to numerica values
for(i in c(3:9)) {cons[,i] <- as.numeric(as.character(cons[,i]))} 

# Combine Date & Time and create Date_Time variable 
cons$Date_Time <- paste(cons$Date, cons$Time)

# Format Date_Time variable 
cons$Date_Time <- strptime(cons$Date_Time, format="%Y-%m-%d %H:%M:%S") 

# Create Plot1 (Histogram of Global Active Power)
png("plot1.png", width=480, height=480) 
hist(cons$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)",lty=1,lwd=2) 
dev.off() 
