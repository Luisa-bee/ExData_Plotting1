#Plot 1
household_power_consumption <- read.table("C:/Users/Luisa/Desktop/Cursos/Cursos de R/household_power_consumption.txt", header= TRUE, sep=";", na.strings = "?")
View(household_power_consumption)

household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")

household <- subset(household_power_consumption, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
View(household)

hist(as.numeric(as.character(household$Global_active_power)),col="red")
hist(as.numeric(as.character(household$Global_active_power)),col="red",main="Global Active Power")
hist(as.numeric(as.character(household$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(household$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()