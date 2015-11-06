## Plot2
library(dplyr)
library(lubridate)
rm(list=ls())
## Set working Directory
#setwd("???")
## --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
hpc <- tbl_df(read.delim("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE))
# subset
hpcd <- mutate (hpc, dt = as.Date(Date, "%d/%m/%Y"), Global_active_power = as.numeric(Global_active_power) )
#hpc2 <- filter(hpcd, as.Date(Date, "%Y/%m/%d") >= "2007/02/01" & as.Date(Date, "%Y/%m/%d") <= "2007/02/02")
hpc2 <- filter(hpcd, dt >= "2007/02/01" & dt <= "2007/02/02")
## --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## Cleaunp
rm("hpc","hpcd")
## Plot1
plabs <- c("Thur","Fri","Sat") # Static Labels
pvals <- c(0,1441,2800)        # Static Positions based on number of observations
plot(hpc2$Global_active_power, col = 1, type = "l", xaxt = "n", ylab = "Global Active Power (Kilowatts)", xlab= " ")
#plot(hpc2$Global_active_power, col = 1, type = "l", ylab = "Global Active Power (Kilowatts)")
axis(1, at = pvals, labels=plabs)
dev.copy(png, filename = "plot2.png",width = 480, height = 480, units = "px")
dev.off()