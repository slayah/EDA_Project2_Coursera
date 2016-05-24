NEIdata<-readRDS("data/summarySCC_PM25.rds")
SCCdata<-readRDS("data/Source_Classification_Code.rds")

NEIdata<-subset(NEIdata, fips == "24510")

v<-grepl("Vehicle",SCCdata$SCC.Level.Two,ignore.case = TRUE)
motor<-SCCdata[v,]

motorNEI<-subset(NEIdata,SCC %in% motor$SCC)
aggregates<-aggregate(Emissions~year, motorNEI, sum)

png("plot5.png")
barplot(height=aggregates$Emissions, names.arg=aggregates$year, xlab="years", ylab="Total Emissions",main="Total Emissions from motor vehicles",
        ylim = c(0,450))
dev.off()


