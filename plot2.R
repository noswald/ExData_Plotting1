#The following code constructs Plot 2

#The following will load the UCI dataset into a variable to use
#This assumes that the UCI dataset is unaltered and is in the working directory

house_power_file <- read.table("household_power_consumption.txt", header=TRUE,
                               sep=";");

#Add DateTime field combining Date and Time fields
#Change Date field to date type and filter file to include only the following
#dates: 2007-02-01 and 2007-02-02

house_power_file <- cbind(house_power_file,
                          DateTime = strptime(paste(house_power_file$Date,
                                                    house_power_file$Time),
                                              "%d/%m/%Y %H:%M:%S"))

house_power_file[,1] <- as.Date(house_power_file[,1], "%d/%m/%Y")

house_power_file <- house_power_file[house_power_file$Date == "2007-02-01" |
                                         house_power_file$Date == "2007-02-02",]

#Construct plot 2 and write to png file

png(file="plot2.png", width = 480, height = 480)
plot(house_power_file$DateTime, as.numeric(house_power_file[,3])/1000, 
     type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

#PNG file created within same working directory
