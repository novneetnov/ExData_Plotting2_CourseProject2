## Read the datasets in the working directory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset the dataset NEI containing only the data for the Baltimore City.
NEI_Baltimore = subset(NEI, fips=="24510")

library(ggplot2)
png("plot3.png")
g <- ggplot(NEI_Baltimore, aes(year, Emissions))
g + stat_summary(geom="line", fun.y="mean", aes(color=type), size=1.2) +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle("Total Emissions in Baltimore City from 1999 to 2008 by emission source type")
dev.off()
