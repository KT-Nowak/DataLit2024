##bringing in packages
library(tidyverse)

library(knitr)

library(kableExtra)

library(lubridate)


##calling data

url <- "https://docs.google.com/spreadsheets/d/1Mk1YGH9LqjF7drJE-td1G_JkdADOU0eMlrP01WFBT8s/pub?gid=0&single=true&output=csv"

read.csv( url ) -> rice

## below is a function that

  ###All the data is represented in common units (Imperial or Standard).
  ###An actual date object represents the date and time information.
  ###Additional columns for Month, Day, and Weekday as properly ordered variables. 
  ###No extraneous columns of data. Keep atmospheric and water conditions


get_rice_data <- function() { 
  
  #change h2o temp c to f
  mutate( rice$H2O_TempC = 1.8 * rice$H2O_TempC + 32)
  
  
  return(better_rice)
}