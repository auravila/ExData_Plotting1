## Plot1
library(dplyr)
library(lubridate)
rm(list=ls())
## Set working Directory
setwd("???")
## --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
hpc <- tbl_df(read.delim("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE))
# subset
hpcd <- mutate (hpc, dt = as.Date(Date, "%d/%m/%Y"), Global_active_power = as.numeric(Global_active_power) )
#hpc2 <- filter(hpcd, as.Date(Date, "%Y/%m/%d") >= "2007/02/01" & as.Date(Date, "%Y/%m/%d") <= "2007/02/02")
hpc2 <- filter(hpcd, dt >= "2007/02/01" & dt <= "2007/02/02")
## --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## Cleaunp
rm("hpc","hpcd")
## Vector variables
Gap <- hpc2$Global_active_power
## Plot1
hist(Gap, col = 2, main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")
par(lheight="Plot1")
dev.copy(png, filename = "plot1.png",width = 480, height = 480, units = "px")
dev.off()