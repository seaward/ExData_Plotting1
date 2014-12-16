plot3 <- function() {
  source("subdata.R")
  data = subdata()
  data$datetime = as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
  png(file="figure/plot3.png",width=480, height=480)
  with(data, plot(datetime, Sub_metering_1, ylab='Energy sub metering', xlab='', type='l'))
  with(data, lines(datetime, Sub_metering_2, col='red'))
  with(data, lines(datetime, Sub_metering_3, col='blue'))
  legend("topright", col=c("black", "red","blue")
         , legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
         , lty=1)
  dev.off()
}