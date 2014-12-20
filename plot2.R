# Read the data file
NEI <- readRDS("summarySCC_PM25.rds")

# subset data to Baltimore City only
BaltimoreData <- subset(NEI, fips == "24510")

# aggregate the total emission by year 
TotalEmissionBaltimore <- tapply(BaltimoreData$Emissions, BaltimoreData$year, sum)

# graph plot2.png
png("plot2.png")
        plot(names(TotalEmissionBaltimore), TotalEmissionBaltimore, type="l",
                xlab="Year", ylab=expression("Total" ~ PM[2.5] ~ "Emissions"),
                main=expression("Total" ~ PM[2.5] ~ "Emissions in Baltimore City by Year"))
dev.off()