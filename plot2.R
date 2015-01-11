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

# Create Plot2 Global Active Power vs DateTime
png("plot2.png", width=480, height=480) 
plot(cons$Date_Time, cons$Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)") 
dev.off() 
