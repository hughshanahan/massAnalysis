daysSinceStart <- function(){
  
  today <- Sys.Date()
  day <- format(today,"%d")
  month <- format(today,"%m")
  year <- format(today,"%Y")
  as.numeric(ISOdate(year,month,day)- ISOdate("2020","2","1"),units='days')
}

load(file="masses.Rdata")
m <- readline("What is your mass today?")

thisDay <- data.frame(Today=c(Sys.Date()),daysElapsed=c(daysSinceStart()),mass=c(m))
masses <- rbind(masses,thisDay)
save(masses,file="masses.Rdata")

library(ggplot2)
ggplot(data=masses,aes(daysElapsed,mass)) + geom_point() + scale_x_continuous(limits = c(0,30)) + scale_y_continuous(limits=c(75,90)) + stat_smooth(method="loess",fullrange=TRUE)





