NEI<-readRDS("data/summarySCC_PM25.rds")
SCC<-readRDS("data/Source_Classification_Code.rds")

NEI<-subset(NEI, fips == "24510")

aggregates<-aggregate(Emissions~year, NEI, sum)
#aggregates

png("plot2.png")
barplot(height=aggregates$Emissions, names.arg=aggregates$year, xlab="years", ylab="Total Emissions",main="Total Emissions at various years in Maryland")
dev.off()

