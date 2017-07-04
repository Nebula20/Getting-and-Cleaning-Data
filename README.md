This repo includes the following files:
-	readme.md 
-	run_analysis.R
-	codebook.md

run_analysis.R contains the script that has been written in R version 3.4.0 (2017-04-21) to complete the Johns Hopkins University’s 
course Getting and Cleaning Data. Running the script assumes that you have the Human Activity Recognition Using Smartphones Dataset at your disposal.

About this data:
"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain." Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Zip file containing data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Files of interest:
- X_train.txt
-	y_train.txt
-	Subject_train.txt
-	X_test.txt
-	y_test.txt
-	subject_test.txt
-	features.txt
-	activity_labels.txt

Running the script also requires the libraries 'plyr', 'car', and 'dplyr'. To avoid conflicts it is recommended that you load them by the time that you actually going to use them.

The script enables you to produce two tidy datasets, called traintest.Rda and averages.Rda. traintest.Rda includes a variable with the ID numbers of the volunteers, the activities they performed, and the 79 variables on the mean and standard deviations of the measurements. averages.Rda includes the average of each of the variables in the traintest.Rda dataset for each subject and each activity.

Detailed information on the variables can be found in codebook.md
