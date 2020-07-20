#Plot 2
household_power_consumption <- read.table("C:/Users/Luisa/Desktop/Cursos/Cursos de R/household_power_consumption.txt", header= TRUE, sep=";", na.strings = "?")
View(household_power_consumption)

household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")

household <- subset(household_power_consumption, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
View(household)

household$Date <- as.Date(household$Date, format="%d/%m/%Y")
DT <- paste(as.Date(household$Date), household$Time)
household$DT <- as.POSIXct(DT)
GAP<-as.numeric(household$Global_active_power)

plot(household$Global_active_power~household$DT, type="l")
plot(household$Global_active_power~household$DT, type="l", ylab="Global Active Power (kilowatts)")
plot(household$Global_active_power~household$DT, type="l", ylab="Global Active Power (kilowatts)", xlab="")

png("plot2.png", width=480, height=480)
plot(household$Global_active_power~household$DT, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()