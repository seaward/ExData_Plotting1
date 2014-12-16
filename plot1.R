plot1 <- function() {
  source("subdata.R")
  data = subdata()
  windows.options(width=480, height=480)
  hist(data$Global_active_power, col="red",main="Global Active Power", xlab = "Global Active Power(kilowatts)")
  dev.copy(png, "figure/plot1.png")
  dev.off()
}