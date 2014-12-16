plot4 <- function() {
  source("subdata.R")
  data = subdata()
  data$datetime = as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

  png(file="figure/plot4.png",width=480, height=480)
  op = par(mfcol = c(2,2))
  # 1st png
  with(data, plot(datetime, Global_active_power, xlab='', ylab='Global Active Power', type='l'))
  # 2nd png
  with(data, plot(datetime,  Sub_metering_1, ylab='Energy sub metering', xlab='', type='l'))
  with(data, lines(datetime, Sub_metering_2, col='red'))
  with(data, lines(datetime, Sub_metering_3, col='blue'))
  legend("topright", col=c("black", "red","blue")
         , legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
         , lty=1, bty='n')
  # 3rd png
  with(data, plot(datetime, Voltage, type='l'))
  # 4th png
  with(data, plot(datetime, Global_reactive_power, type='l'))
  
  dev.off()
  par(op)
}