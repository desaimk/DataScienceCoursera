library(dplyr)

##For Plot 4
PowData <- read.table("~/household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
C4W1 <- subset(PowData, Date %in% c("1/2/2007", "2/2/2007")
C4W1$Date <- as.Date(C4W1$Date, format="%d/%m/%Y")
fDate <- paste(as.Date(C4W1$Date), C4W1$Time)
C4W1$fDate <- as.POSIXct(fDate)

##Fourth Plot
par(mfcol=c(2,2))
mar=c(3,3,2,1)

##Col1, Row1
plot(C4W1$fDate, C4W1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kW)")

##Col1, Row2
plot(C4W1$fDate, Sub1, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(C4W1$fDate, Sub2, col = "red")
lines(C4W1$fDate, Sub3, col = "blue")
legend("topright", legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), col=c("black", "red", "blue"), lty =1, lwd=2)

##Col2, Row1
plot(C4W1$fDate, C4W1$Voltage, type = "l", xlab = "", ylab = "Voltage (volt)")

##Col2, Row2
plot(C4W1$fDate, C4W1$Global_reactive_power, type = "l", xlab = "", ylab = "Global Reactive Power (kW)")

dev.copy(png, file = "PLOT5.png", width = 480, height = 480)



