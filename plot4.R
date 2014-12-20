# Load necessary packages
library(plyr)
library(ggplot2)

# Read the data file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# create coal related source list
# subset data to Coal related source only
SCC.COAL <- subset(SCC, grepl("coal", EI.Sector, ignore.case=T) )
NEI.COAL <- subset(NEI, NEI$SCC %in%  SCC.COAL$SCC)

# aggregate the total emission by year and type
TotalEmissionCoal <- ddply(NEI.COAL, .(year), function(x) sum(x$Emissions))
colnames(TotalEmissionCoal) <- c("Year", "Emissions")


# plot plot4.png with qqplot2
png("plot4.png")
qplot(Year, Emissions, data=TotalEmissionCoal, geom="line") +
        ggtitle(expression("U.S." ~ PM[2.5] ~ "Coal Combustion-related Emissions by Year")) +
        xlab("Year") +
        ylab(expression("Total" ~ PM[2.5] ~ "Emissions"))
dev.off()

