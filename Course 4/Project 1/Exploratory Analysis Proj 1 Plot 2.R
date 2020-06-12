library(dplyr)

##For Plot 2
PowData <- read.table("~/household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
C4W1 <- subset(PowData, Date %in% c("1/2/2007", "2/2/2007")
C4W1$Date <- as.Date(C4W1$Date, format="%d/%m/%Y")
fDate <- paste(as.Date(C4W1$Date), C4W1$Time)
C4W1$fDate <- as.POSIXct(fDate)


##Second Plot
plot(C4W1$fDate, C4W1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kW)")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()




