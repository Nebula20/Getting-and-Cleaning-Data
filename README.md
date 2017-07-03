This repo includes the following files:
-	readme.md 
-	run_analysis.R
-	codebook.md

run_analysis.R contains the script that has been written in R version 3.4.0 (2017-04-21) to complete the Johns Hopkins University’s 
course Getting and Cleaning Data. 

Running the script assumes that you have the Human Activity Recognition Using Smartphones Dataset at your disposal. 
Original source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Zip file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Files of interest:
-	X_train.txt
-	y_train.txt
-	Subject_train.txt
-	X_test.txt
-	y_test.txt
-	subject_test.txt
-	features.txt
-	activity_labels.txt

Running the script also requires the libraries 'plyr', 'car', and 'dplyr'. To avoid conflicts it is recommended that you load them by the
time that you actually going to use them.

The script enables you to produce two tidy datasets, called traintest.Rda and averages.Rda. traintest.Rda includes a variable with the 
ID numbers of the volunteers, the activities they performed, and the 79 variables on the mean and standard deviations of the time and 
frequency domain variables. averages.Rda includes the average of each of the variables in the traintest.Rda dataset for each subject and 
each activity.
