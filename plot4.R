## Read the datasets in the working directory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Find all the source names that have coal-combustion related sources.
SCC_coal_source = SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE),]

## merge the datasets by SCC - the source names. SO the result we get is a
## dataset that only has coal-related sources emitting PM2.5.
NEI_coal_source = merge(NEI,SCC_coal_source, by="SCC")

library(ggplot2)
png("plot4.png")
g <- ggplot(NEI_coal_source, aes(year, Emissions))
g + geom_line(stat="summary", fun.y="sum", size=1.2, color="red") +
    geom_point(size=4, stat="summary", fun.y="sum", color="red", aes(value=Emissions)) +
    ylab(expression('Total PM'[2.5]*" Emissions in tons")) +
    ggtitle("Total Emission in USA by coal-related sources")
dev.off()

