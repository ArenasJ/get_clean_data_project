## Project for the "Getting and cleaning data" course

library(dplyr)

## ------ Read train data

setwd("")

## Subjects data preparation
subject_train <- read.table("subject_train.txt")
subject_train <- rename(subject_train, Subject = V1)

## Activity data preparation
activity_train <- read.table("y_train.txt")
activity_train <- rename(activity_train, Activity = V1)

## Sensors data preparation
data_train <- read.table("X_train.txt")

## Changing the column names of the complete dataset
setwd("")
features <- read.table("features.txt", stringsAsFactors = FALSE)
features <- features$V2
features <- sub("\\()","-",features)
colnames(data_train) <- features

data_train <- data_train[grepl("-mean-|-std-", names(data_train))]

## Merging data sets
trainComplete <- cbind(subject_train, activity_train, data_train)

## ------Read the test data

setwd("")

## Subjects data preparation
subject_test <- read.table("subject_test.txt")
subject_test <- rename(subject_test, Subject = V1)

## Activity data preparation
activity_test <- read.table("y_test.txt")
activity_test <- rename(activity_test, Activity = V1)

#Sensors data preparation
data_test <- read.table("X_test.txt")
colnames(data_test) <- features
data_test <- data_test[grepl("-mean-|-std-", names(data_test))]
##Merging data sets
testComplete <- cbind(subject_test, activity_test, data_test)

## ------  Bind the test and train data

completeData <- rbind(testComplete,trainComplete)

## Changing activity names for description

count = 1
  for(i in completeData$Activity){
    
    if(i == 1) completeData[count,2] <- "WALKING"
    else if(i == 2) completeData[count,2] <- "WALKING UPSTAIRS"
    else if(i == 3) completeData[count,2] <- "WALKING DOWNSTAIRS"
    else if(i == 4) completeData[count,2] <- "SITTING"
    else if(i == 5) completeData[count,2] <- "STANDING"
    else if(i == 6) completeData[count,2] <- "LAYING"
    
    count = count + 1
  }

## Creating the second Data Set
## first it's arranged from subject 1 to subject 30

completeData_2 <- arrange(completeData, Subject)

## Then the data is summarized by subject and acitivity and the mean of each column and group is calculated
summary_Data <- completeData_2 %>% group_by(Subject, Activity) %>% summarise_all(funs(mean))

## Removing not necessary data

rm(activity_test, activity_train, completeData_2, subject_test, subject_train, testComplete, trainComplete,data_test, data_train)