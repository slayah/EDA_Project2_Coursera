NEIdata<-readRDS("data/summarySCC_PM25.rds")
SCCdata<-readRDS("data/Source_Classification_Code.rds")

v<-grep("Coal",SCCdata$Short.Name,ignore.case = TRUE)
coal<-SCCdata[v,]
#head(coal)

coalNEI<-subset(NEIdata,SCC %in% coal$SCC)

aggregates<-aggregate(Emissions~year, coalNEI, sum)

png("plot4.png")
barplot(height=aggregates$Emissions, names.arg=aggregates$year, xlab="years", ylab="Total Emissions",main="Total Emissions from coal sources")
dev.off()


