NEI<-readRDS("data/summarySCC_PM25.rds")
SCC<-readRDS("data/Source_Classification_Code.rds")

NEI<-subset(NEI, fips == "24510")

aggregates<-aggregate(Emissions~year+type, NEI, sum)
head(aggregates)

library(ggplot2)
g <- ggplot(aggregates, aes(year, Emissions, color = type))

png("plot3.png",width=1200,height=1000)
g + geom_line() +
  ylab("Total Emissions") +
  ggtitle("Total Emissions in Baltimore City,Maryland")
dev.off()

