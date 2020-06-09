library(dplyr)

##For Plot 3
PowData <- read.table("~/household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
C4W1 <- subset(PowData, Date %in% c("1/2/2007", "2/2/2007")
C4W1$Date <- as.Date(C4W1$Date, format="%d/%m/%Y")
fDate <- paste(as.Date(C4W1$Date), C4W1$Time)
C4W1$fDate <- as.POSIXct(fDate)

##Third Plot
plot(C4W1$fDate, Sub1, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(C4W1$fDate, Sub2, col = "red")
lines(C4W1$fDate, Sub3, col = "blue")
legend("topright", legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), col=c("black", "red", "blue"), lty =1, lwd=2)
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()




