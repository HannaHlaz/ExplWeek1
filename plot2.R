## Read and prepare dataset
setwd("C:/Users/Anna/Dropbox (Личный)/Cousera/4 Work")

newtable <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

newtable <- newtable[newtable$Date %in% c("1/2/2007", "2/2/2007"), ]

for(i in 3:9){
  newtable[, i] <- as.numeric(newtable[, i])
}

newtable$DateTime <- strptime(paste(newtable$Date, newtable$Time, sep = " "),
                              format = "%d/%m/%Y  %H:%M:%S")

## Draw plot2
Sys.setlocale("LC_TIME", "C")

png("plot2.png")
plot(newtable$DateTime, newtable$Global_active_power, type= "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     main = "Global Active Power")
dev.off()
