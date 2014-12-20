# Load necessary packages
library(plyr)
library(ggplot2)

# Read the data file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# subset data to Baltimore City only
BaltimoreData <- subset(NEI, fips == "24510")

# create notor vehicle related source list
# subset Baltimore City data to motor vehicle related source only
SCC.mobile <- subset(SCC, grepl("mobile", EI.Sector, ignore.case=T) )
Baltimore.mobile <- subset(BaltimoreData, BaltimoreData$SCC %in%  SCC.mobile$SCC)

# aggregate the total emission by year
TotalEmissionMobile <- ddply(Baltimore.mobile, .(year), function(x) sum(x$Emissions))
colnames(TotalEmissionMobile) <- c("Year", "Emissions")


# plot plot5.png with qqplot2
png("plot5.png")
qplot(Year, Emissions, data=TotalEmissionMobile, geom="line") +
        ggtitle(expression("Motor Vehicle" ~ PM[2.5] ~ "Total Emissions in Baltimore City  by Year")) +
        xlab("Year") +
        ylab(expression("Total" ~ PM[2.5] ~ "Emissions"))
dev.off()
