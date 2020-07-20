#Plot 3
household_power_consumption <- read.table("C:/Users/Luisa/Desktop/Cursos/Cursos de R/household_power_consumption.txt", header= TRUE, sep=";", na.strings = "?")
View(household_power_consumption)

household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")

household <- subset(household_power_consumption, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
View(household)

household$Date <- as.Date(household$Date, format="%d/%m/%Y")
DT <- paste(as.Date(household$Date), household$Time)
household$DT <- as.POSIXct(DT)

with(household, { plot(Sub_metering_1~DT, type="l", ylab="Global Active Power (kilowatts)", xlab="") + 
    lines(Sub_metering_2~DT,col='Red') + lines(Sub_metering_3~DT,col='Blue') })
with(household, plot(Sub_metering_1~DT, type="l", ylab="Global Active Power (kilowatts)", xlab="") + 
    lines(Sub_metering_2~DT,col='Red') + lines(Sub_metering_3~DT,col='Blue')) + 
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
with(household, plot(Sub_metering_1~DT, type="l", ylab="Global Active Power (kilowatts)", xlab="") + 
       lines(Sub_metering_2~DT,col='Red') + lines(Sub_metering_3~DT,col='Blue')) + 
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()