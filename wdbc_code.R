wdbc <-read.table(file.choose(),sep = ",")
View(wdbc)

#remove id 
wdbc <- wdbc[,-1]
nrow(wdbc)
wdbc
#create function to normalize the factor
Normal <- function(x) {((x- min(x))/ (max(x)-min(x)))}
#Store data to dataframe
wdbc_Normal <- as.data.frame(lapply(wdbc[,-1], Normal))

summary(wdbc[,2:5])

summary(wdbc_Normal)

#create training
trainning <- wdbc_Normal[1:450,]
testing <- wdbc_Normal[451:569,]
library(class)

wdbc_pred <- knn(trainning, testing, wdbc[1:450,1], k=15)


#creat table to validate the result from model
table(wdbc_pred, wdbc[451:569,1])

