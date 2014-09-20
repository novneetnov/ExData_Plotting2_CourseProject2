NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset the dataset NEI containing only the data for the Baltimore City.
NEI_Baltimore_LA = subset(NEI, fips=="24510"|fips=="06037")

## All the rows with type = "ON-ROAD" are selected since I think the definition 
## of motor vehicles is cars/trucks and all other ON-ROAD vehicles.
NEI_Baltimore_LA_Motor = NEI_Baltimore_LA[NEI_Baltimore_LA$type=="ON-ROAD", ]
NEI_Baltimore_LA_Motor$city = sapply(NEI_Baltimore_LA_Motor$fips,FUN=function(x){
    if(x=="24510") return("Baltimore City")
    else return("Los Angeles")
})

library(ggplot2)
png("plot6.png")
g = ggplot(NEI_Baltimore_LA_Motor, aes(year,Emissions))
g + facet_grid(.~city) +
    geom_bar(stat="summary",fun.y="sum", aes(fill=year)) +
    ylab(expression('Total PM'[2.5]*" Emissions in tons")) +
    ggtitle("Total Emissions of Motor Vehicle Sources in\n Los Angeles vs. Baltimore City")
dev.off()
