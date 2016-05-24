NEI<-readRDS("data/summarySCC_PM25.rds")
SCC<-readRDS("data/Source_Classification_Code.rds")

aggregates<-aggregate(Emissions~year, NEI, sum)
#aggregates

png("plot1.png")
barplot(height=aggregates$Emissions, names.arg=aggregates$year, xlab="years", ylab="Total Emissions",main="Total Emissions at various years")
dev.off()



vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips==24510,]

library(ggplot2)
ggp <- ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) +
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(ggp)



head(NEI)
head(SCC)