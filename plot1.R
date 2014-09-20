## Read the datasets in the working directory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Split the Emmisions column by year and sum over all observations of a
## particular year to get the total emission
emissions = aggregate(NEI$Emissions, by=list(NEI$year), FUN=sum)

## Make a barplot and save in a png file
png("plot1.png")
barplot(emissions[,2], names.arg=emissions[,1], main=expression('Total Emission of PM'[2.5]), xlab='Year', ylab=expression(paste('Total PM'[2.5],' in tons')))
dev.off()
