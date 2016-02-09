## Read and prepare dataset
setwd("C:/Users/Anna/Dropbox (Личный)/Cousera/4 Work")

newtable <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

newtable <- newtable[newtable$Date %in% c("1/2/2007", "2/2/2007"), ]

for(i in 3:9){
  newtable[, i] <- as.numeric(newtable[, i])
}

newtable$DateTime <- strptime(paste(newtable$Date, newtable$Time, sep = " "),
                              format = "%d/%m/%Y  %H:%M:%S")
Sys.setlocale("LC_TIME", "C")

## Draw plot3
png("plot3.png")
ylim <- range(newtable[, 7:9], na.rm = TRUE)
plot(newtable$DateTime, newtable[, 7], type= "l",
     ylab = "Energy sub metering",
     xlab = "",
     col = 1, ylim = ylim,
     main = "")
lines(newtable$DateTime, newtable[, 8], col = 2)
lines(newtable$DateTime, newtable[, 9], col = 4)
legend("topright", names(newtable)[7:9], lty = 1, col = c(1, 2, 4))
dev.off()

