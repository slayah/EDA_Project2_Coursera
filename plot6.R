NEIdata<-readRDS("data/summarySCC_PM25.rds")
SCCdata<-readRDS("data/Source_Classification_Code.rds")

v<-grepl("Vehicle",SCCdata$SCC.Level.Two,ignore.case = TRUE)
motor<-SCCdata[v,]
motorNEI<-subset(NEIdata,SCC %in% motor$SCC)

balCal<-subset(motorNEI, fips == "24510" | fips == "06037")
aggregates<-aggregate(Emissions~year+fips, balCal, sum)

png("plot6.png", width=1040, height=480)
library(ggplot2)
g<-ggplot(aggregates,aes(factor(year),Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")+
         xlab("Year")+
         ylab("Total Emissions")+
         ggtitle("Total Emissions from Motor Vehicles in California(06037) vs Baltimore(24510) ")
print(g)
dev.off()
