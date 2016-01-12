library(dplyr)
library(lubridate)

#Open the data file
setwd("/Users/ykim/Desktop/coursera/exploratory-data-analysis/week1")
data<-tbl_df(read.table("household_power_consumption.txt",header = TRUE, sep=";", na.strings = "?",nrows = 2075259, stringsAsFactors = FALSE, comment.char=""))

#FilterDataset to dataset2 and create a dateime column (mydatetime)
dataset<-data %>% 
  mutate(mydate=dmy(data$Date)) %>% 
  filter(mydate >=  dmy("01/02/2007")) %>% 
  filter(mydate <=  dmy("02/02/2007"))
dataset2 <-mutate(dataset,mydatetime = dmy_hms(paste(dataset$Date,dataset$Time)))
rm(data) #clean temp files
rm(dataset) #clean temp files

#Change to local Git dicrectory
setwd("/Users/ykim/ExData_Plotting1")


#png4

png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white", res = NA, type = "quartz")
par(mfcol = c(2,2), pch=22)
with(dataset2,plot(mydatetime,Global_active_power, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)", cex.lab = 0.8))

with(dataset2,plot(mydatetime,Sub_metering_1, col = "black", type = "l", xlab ="", ylab = "Energy Sub metering", cex.lab = 0.8))
with(dataset2,lines(mydatetime, Sub_metering_2, col = "red"))
with(dataset2,lines(mydatetime, Sub_metering_3, col = "blue"))
legend("topright",1:40 , c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), cex=0.3, 
       col=c("black","red","blue"), pch = , lty = 1)

with(dataset2, plot(mydatetime,Voltage, type ="l", xlab = "datetime", ylab = "Voltage", col = "black", cex.lab = 0.8))

with(dataset2,plot(mydatetime,Global_reactive_power,type ="l", xlab = "datetime", ylab = "Global Reactive Power", col = "black", cex.lab = 0.8))

dev.off()