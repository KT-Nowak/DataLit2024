##bringing in packages
library(tidyverse)

library(lubridate)


##calling data



## below is a function that

  ###All the data is represented in common units (Imperial or Standard).
  ###An actual date object represents the date and time information.
  ###Additional columns for Month, Day, and Weekday as properly ordered variables. 
  ###No extraneous columns of data. Keep atmospheric and water conditions

get_rice_data <- function() { 
  url <- "https://docs.google.com/spreadsheets/d/1Mk1YGH9LqjF7drJE-td1G_JkdADOU0eMlrP01WFBT8s/pub?gid=0&single=true&output=csv"
  
  read_csv( url ) -> rice
  
  rice$H2O_TempF <- (9/5) * rice$H2O_TempC + 32 
  rice$Rain_cm <- rice$Rain_in * 2.54
  rice$Date <- substr(rice[["DateTime"]], 1, nchar(rice[["DateTime"]]) - 11)
  rice$Time <- substr(rice[["DateTime"]], 
                      nchar(rice[["DateTime"]]) - 10, nchar(rice[["DateTime"]]))
  rice$Date <- as.POSIXlt(rice$Date, format = "%mm/%d/%y")
  rice$Weekday <-wday(
    rice$Date,
    label = TRUE,
    abbr = TRUE,)
    rice <- rice[, !names(rice) %in% c("H2O_TempC")]
    rice <- rice[, !names(rice) %in% c("PH_mv")]
    rice <- rice[, !names(rice) %in% c("Depth_ft")]
    rice <- rice[, !names(rice) %in% c("SpCond_mScm")]
    rice <- rice[, !names(rice) %in% c("Rain_in")]
    rice <- rice[, !names(rice) %in% c("DateTime")]
    rice <- rice[, !names(rice) %in% c("RecordID")]
    
    return(rice)
  
}



