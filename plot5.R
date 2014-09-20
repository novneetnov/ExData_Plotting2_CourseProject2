## Read the datasets in the working directory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset the dataset NEI containing only the data for the Baltimore City.
NEI_Baltimore = subset(NEI, fips=="24510")

## All the rows with type = "ON-ROAD" are selected since I think the definition 
## of motor vehicles is cars/trucks and all other ON-ROAD vehicles.
NEI_Baltimore_Motor = NEI_Baltimore[NEI_Baltimore$type=="ON-ROAD", ]

library(ggplot2)
png("plot5.png")
g = ggplot(NEI_Baltimore_Motor, aes(year,Emissions))
g + geom_bar(stat="summary",fun.y="sum", aes(fill=year)) +
    ylab(expression('Total PM'[2.5]*" Emissions in tons")) +
    ggtitle("Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland")
dev.off()
