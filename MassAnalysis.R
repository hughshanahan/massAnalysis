daysSinceStart <- function(){
  
  today <- Sys.Date()
  day <- format(today,"%d")
  month <- format(today,"%m")
  year <- format(today,"%Y")
  as.numeric(ISOdate(year,month,day)- ISOdate("2020","2","1"),units='days')
}

updateMass <- function(){
  setwd("/Users/upac004/Dropbox (Personal)/R")
# Read in masses data frame then ask for mass for today
  massesFn <- "masses.Rdata"
  load(file=massesFn)
  m <- as.numeric(readline("What is your mass today? "))

# Update masses data frame and store
  thisDay <- data.frame(Today=c(Sys.Date()),daysElapsed=c(daysSinceStart()),mass=c(m*1.0))
  masses <- rbind(masses,thisDay)
  save(masses,file=massesFn)

# Plot all the data
  library(ggplot2)
  ggplot(data=masses,aes(daysElapsed,mass)) + geom_point()  + scale_y_continuous(limits=c(75,90)) + stat_smooth(method="loess",fullrange=TRUE)
}

updateMass()



