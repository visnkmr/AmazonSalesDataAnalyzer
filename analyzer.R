TestData <- read.csv(file="<location to csv file here>", header=TRUE, sep=",")
#SaveData<-TestData
TestData$Transaction.Time<-gsub('[a-zA-Z.]', '', TestData$Transaction.Time)
TestData$Transaction.Time<-as.Date(TestData$Transaction.Time)


appcount<-aggregate(TestData,by = list(TestData$Title),FUN = length)[,1:2]
currencycount<-aggregate(TestData,by = list(TestData$Marketplace.Currency),FUN = length)[,1:2]
countrycount<-aggregate(TestData,by = list(TestData$Country.Region.Code),FUN = length)[,1:2]
marketplacecount<-aggregate(TestData,by = list(TestData$Marketplace),FUN = length)[,1:2]
mktcntrycount<-aggregate(TestData,by = list(TestData$Title,TestData$Country.Region.Code),FUN = length)[,1:3]
pdaypappcount<-aggregate(TestData,by = list(TestData$Transaction.Time,TestData$Title),FUN = length)[,1:3]
pdaypapppcntrycount<-aggregate(TestData,by = list(TestData$Transaction.Time,TestData$Title,TestData$Country.Region.Code),FUN = length)[,1:4]
pdaypcntrycount<-aggregate(TestData,by = list(TestData$Transaction.Time,TestData$Country.Region.Code),FUN = length)[,1:3]

#write.csv(<dataframe/table-name>,'test.csv')

