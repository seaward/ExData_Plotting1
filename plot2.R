## If your system locale is not en, X label might not in English,
## use `Sys.setlocale("LC_TIME", "English")` for English annos.
plot2 <- function() {
  source("subdata.R")
  data = subdata()
  data$dt = as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
  png(file="figure/plot2.png",width=480, height=480)
  with(data, plot(dt, Global_active_power, xlab='', type='l'))
  dev.off()
}