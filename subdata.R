## Within household_power_consumption.txt, we only need Date 
## in 1/2/2007 nad 2/2/2007.
## The needed data will be read from sqlite and write into csv file
## hpc20070201-02.csv
subdata <- function() {
  f = "hpc20070201-02.csv"
  if(!file.exists(f)){
    if(require("RSQLite")) {
      con = dbConnect(RSQLite::SQLite(), dbname = "cc.sqlite")
      dbWriteTable(con, name="hpc", value="household_power_consumption.txt"
                   , row.names=FALSE, header=TRUE, sep = ";")
      data = dbGetQuery(con, 'select * from hpc where Date in ("1/2/2007", "2/2/2007")')
      dbDisconnect(con)
      write.csv(data, f)
    }
  }
  d = read.csv(f)
  
  d
}