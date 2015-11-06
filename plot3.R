## Plot3
library(dplyr)
library(lubridate)
rm(list=ls())
## Set working Directory
setwd("???")
## --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
hpc <- tbl_df(read.delim("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE))
# subset
hpcd <- mutate (hpc, dt = as.Date(Date, "%d/%m/%Y"), Sub_metering1 = as.numeric(Sub_metering_1), Sub_metering2 = as.numeric(Sub_metering_2), Sub_metering3 = as.numeric(Sub_metering_3) )
#hpc2 <- filter(hpcd, as.Date(Date, "%Y/%m/%d") >= "2007/02/01" & as.Date(Date, "%Y/%m/%d") <= "2007/02/02")
hpc2 <- filter(hpcd, dt >= "2007/02/01" & dt <= "2007/02/02")
## --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## Cleaunp
rm("hpc","hpcd")
## Plot1
plabs <- c("Thur","Fri","Sat") # Static Labels
pvals <- c(0,1441,2800)        # Static Positions based on number of observations
plot(hpc2$Sub_metering1, col = 1, type = "n", xaxt = "n", ylab = "Energy Sub metering", xlab= " ")
points(hpc2$Sub_metering1, col = "black", type = "l" )
points(hpc2$Sub_metering2, col = "red", type = "l" )
points(hpc2$Sub_metering3, col = "blue", type = "l" )
#Legend values
legend ("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
lty=c(1,1,1),
lwd=c(2.5,2.5,2.5),
col=c("black","red","blue"),
pt.cex=1, 
cex=0.5
)
axis(1, at = pvals, labels=plabs)
dev.copy(png, filename = "plot3.png", width = 480, height = 480, units = "px")
dev.off()