######### Plot 1


#  Read Data 
NEI <- readRDS("summarySCC_PM25.rds")

#  Create Plot-Data
TotalEmission <- tapply(NEI$Emissions, NEI$year, sum)

#  Create Plot 1

png('plot1.png', width=480, height=480)
plot(names(TotalEmission), TotalEmission, type = "l", 
     xlab="Year", ylab=expression("Total" ~ PM[2.5] ~ "Emissions"),
     main=expression("Total US" ~ PM[2.5] ~ "Emissions in the US by Year"))


dev.off()

########################################################
