## Plot4
library(dplyr)
library(lubridate)
rm(list=ls())
#Divide the plotting area
par(mfcol = c(2,2))
## Plot1 (script2)
source('plot2.R')
## Plot2 (script3) 
source('plot3.R')
## Plot3
hpc2 <- mutate(hpc2, Voltage = as.numeric(Voltage), Global_reactive_power = as.numeric(Global_reactive_power))
plot(hpc2$Voltage, col = 1, type = "l", xaxt = "n", ylab = "Voltage", xlab= "Datetime")
axis(1, at = pvals, labels=plabs)
## Plot4
plot(hpc2$Global_reactive_power, col = 1, type = "l", xaxt = "n", ylab = "Global_Reactive_Power", xlab= "Datetime")
axis(1, at = pvals, labels=plabs)
dev.copy(png, filename = "plot4.png",width = 480, height = 480, units = "px")
dev.off()
par(mfcol = c(1,1))