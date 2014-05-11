#The following code constructs Plot 1

#The following will load the UCI dataset into a variable to use
#This assumes that the UCI dataset is unaltered and is in the working directory

house_power_file <- read.table("household_power_consumption.txt", header=TRUE,
                          sep=";");

#Change Date field to date type and filter file to include only the following
#dates: 2007-02-01 and 2007-02-02

house_power_file[,1] <- as.Date(house_power_file[,1], "%d/%m/%Y")

house_power_file <- house_power_file[house_power_file$Date == "2007-02-01" |
                                    house_power_file$Date == "2007-02-02",]

#Construct plot 1 and write to png file

png(file="plot1.png", width = 480, height = 480)
hist(as.numeric(house_power_file$Global_active_power)/1000, col = "red",
     xlab = "Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
#PNG file created within same working directory

