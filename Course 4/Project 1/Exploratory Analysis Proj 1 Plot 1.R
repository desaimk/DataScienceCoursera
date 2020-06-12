library(dplyr)

##For Plot 1
PowData <- read.table("~/household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
C4W1 <- subset(PowData, Date %in% c("1/2/2007", "2/2/2007")

##First Plot               
hist(C4W1$Global_active_power, col = 'red', xlab = "Global Active Power (kW)", main = "Global Active Power")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
