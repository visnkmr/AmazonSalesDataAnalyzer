TestData <- read.csv(file="<location to csv file here>", header=TRUE, sep=",")

# test <- as.Date(test, "%m/%d/%Y")
# SaveData<-TestData

TestData$Transaction.Time<-gsub('[a-zA-Z.]', '', TestData$Transaction.Time)
TestData$Transaction.Time<-as.Date(TestData$Transaction.Time)


## library(janitor)
## library(lubridate)

# MyData[,9]
# install.packages("sqldf")
# library(sqldf)
# sqldf("select distinct(9) from MyData")


appcount<-aggregate(TestData,by = list(TestData$Vendor.SKU,TestData$Title),FUN = length)[,1:3]
currencycount<-aggregate(TestData,by = list(TestData$Marketplace.Currency),FUN = length)[,1:2]
countrycount<-aggregate(TestData,by = list(TestData$Country.Region.Code),FUN = length)[,1:2]
marketplacecount<-aggregate(TestData,by = list(TestData$Marketplace),FUN = length)[,1:2]
mktcntrycount<-aggregate(TestData,by = list(TestData$Title,TestData$Country.Region.Code),FUN = length)[,1:3]
pdaypappcount<-aggregate(TestData,by = list(TestData$Transaction.Time,TestData$Title),FUN = length)[,1:3]
pdaypapp<-aggregate(TestData,by = list(TestData$Transaction.Time),FUN = length)[,1:2]
pdaypapppcntrycount<-aggregate(TestData,by = list(TestData$Transaction.Time,TestData$Title,TestData$Country.Region.Code),FUN = length)[,1:4]
pdaypcntrycount<-aggregate(TestData,by = list(TestData$Transaction.Time,TestData$Country.Region.Code),FUN = length)[,1:3]

countrycountappcount<-aggregate(TestData,by = list(TestData$Country.Region.Code,TestData$Title),FUN = length)[,1:3]
write.table(countrycountappcount, "clipboard-20000", sep="\t", row.names=FALSE) #copy data to paste to excel
write.table(countrycount, "clipboard-20000", sep="\t", row.names=FALSE) #copy data to paste to excel
write.table(appcount, "clipboard-20000", sep="\t", row.names=FALSE) #copy data to paste to excel
write.table(currencycount, "clipboard-20000", sep="\t", row.names=FALSE) #copy data to paste to excel
write.table(marketplacecount, "clipboard-20000", sep="\t", row.names=FALSE) #copy data to paste to excel
write.table(countrycount, "clipboard-20000", sep="\t", row.names=FALSE) #copy data to paste to excel

# Datacount<-appcount[,1:2]
# mktcntrycount<-mktcntrycount[,1:3]
# write.csv(Datacount,'test.csv')

# sapply(test, typeof)
# test <- mdy_hms(as.character(test))
# test <- strptime(x = as.character(test),format = "%d/%m/%Y")
# test<-"2020-01-01 00:12:56 BRST"

require(ggplot2)

ggplot(pdaypapp, aes(pdaypapp$Group.1,pdaypapp$Marketplace))
ggplot(pdaypapp, aes(x = pdaypapp$Group.1, y = pdaypapp$Marketplace)) + geom_line()
