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

#plot 1
par(1,1)

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA, 
    type ="quartz")

hist(dataset$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power, (kilowatts)")
dev.off()