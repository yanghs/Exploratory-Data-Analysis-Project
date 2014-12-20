# Load necessary packages
library(plyr)
library(ggplot2)

# Read the data file
NEI <- readRDS("summarySCC_PM25.rds")

# subset data to Baltimore City only
BaltimoreData <- subset(NEI, fips == "24510")

# aggregate the total emission by year and type
TotalEmissionBaltimoreType <- ddply(BaltimoreData, .(year, type), function(x) sum(x$Emissions))
colnames(TotalEmissionBaltimoreType) <- c("Year", "Type", "Emissions")

# plot plot3.png with qqplot2
png("plot3.png")
qplot(Year, Emissions, data=TotalEmissionBaltimoreType, color=Type, geom="line") +
          ggtitle(expression("Total" ~ PM[2.5] ~ "Emissions in Baltimore City by Year and Source Type")) +
          xlab("Year") +
          ylab(expression("Total" ~ PM[2.5] ~ "Emissions"))
dev.off()