##### GETTING AND CLEANING DATA: FINAL ASSIGNMENT #####


#Preparation

## Download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## Store data in the folder that also serves as the working directory
## Set working directory using setwd(dir)

## Load libraries. To prevent the packages to conflict, load them when you actually need them.
library(plyr) #Load library to use rename() function.
#library(car) #Load library to recode variables
#library(dplyr) #Load library to create second, independent dataset


# Step 1 - Merging the training and the test sets to create one dataset

## Obtaining the variable names from the features.txt file
features <- read.table("features.txt", header=FALSE)
headers <- features$V2

## Obtaining the training data
x_train <- read.table("X_train.txt", header = FALSE, sep="")
colnames(x_train) = headers; names(x_train) #Replaces variable names with those in the features.txt file
subject_train <- read.table("subject_train.txt", header=FALSE)
subject_train <- rename(subject_train, c("V1"="subjectID")) #Variable name becomes 'subjectID'
y_train <- read.table("y_train.txt", header = FALSE, sep="")
y_train <- rename(y_train, c("V1" = "activity")) #Variable name becomes 'activity'
train <- cbind(subject_train, y_train, x_train) #Merges training data

## Obtaining the test data
x_test <- read.table("X_test.txt", header = FALSE, sep="")
colnames(x_test) = headers; names(x_test) #Replaces variable names with those in the features.txt file
subject_test <- read.table("subject_test.txt", header=FALSE)
subject_test <- rename(subject_test, c("V1"="subjectID")) #Variable name becomes 'subjectID'
y_test <- read.table("y_test.txt", header = FALSE, sep="")
y_test <- rename(y_test, c("V1"="activity")) #Variable name becomes 'activity'
test <- cbind(subject_test, y_test, x_test) #Merges test data

## Merging the training and test data
train_test <- rbind(train, test)
nrow(train_test); ncol(train_test) #10299 rows, 563 columns
View(train_test) #Looks like a tidy dataset


#Step 2 - Extracting only the measurements on the mean and standard deviation for each measurement
train_test_sub <- train_test[,c(grep("subjectID|activity|mean()|std()",names(train_test))), drop=F]
names(train_test_sub) #79 columns remain


#Step 3 - Using descriptive activity names to name the activities in the data set
library(car)
train_test_sub$activity<-recode(train_test_sub$activity,"1='Walking';2='Walking upstairs';3='Walking downstairs';4='Sitting';5='Standing';6='Laying'")


#Step 4 - Appropriately labels the data set with descriptive variable names
## The data has been labeled appropriately during Step 1.
## The variable names have been adopted from the features.txt file.
## I don't think it'd be helpful to make further adjustments to the variable names
View(train_test_sub) #The final product meets the demands of the final assignment
save(train_test_sub, file="traintest.Rda")


#Step 5 - Creaing a second, independent tidy data set from the dataset in step 4 with the average of each variable for each activity and each subject.
## Creating a dataframe tbl
library(dplyr)
dataset2 <- tbl_df(train_test_sub)

## Grouping data first by subjectID, then by activity
by_subjectID_activity <- group_by(dataset2, subjectID, activity)

## Extracting the average of each variable for each subject and each activity
averages <- summarize_all(by_subjectID_activity, funs(mean))
View(averages) #tidy data: 30 subjects * 6 activities = 180 rows
save(averages, file="averages.Rda")


  
