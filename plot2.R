## Read the datasets in the working directory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset the dataset NEI containing only the data for the Baltimore City.
NEI_Baltimore = subset(NEI, fips=="24510", select=c(Emissions,year))

## Split the Emisions column by year and sum over all observations of the 
## baltimore cityof a particular year to get the total emission
emissions_baltimore = aggregate(NEI_Baltimore$Emissions, by=list(NEI_Baltimore$year), FUN=sum)

## Make a barplot and save in a png file
png("plot2.png")
barplot(emissions_baltimore[,2], names.arg=emissions_baltimore[,1],  main='Total Emission in Baltimore City, MD', 
        xlab='Year', ylab=expression(paste('Total PM'[2.5],' in tons')))
dev.off()
