# GettingCleaningData

## Usage

Put the script in the same directory as the ZIP archive containing the data. 
Extract the ZIP archive within this directory and run the script. It will
generate a file named *tidy.csv* containing a tidy data set with the average
of each variable for each activity and each subject from the source data set.

## What it does

The analysis script will perform these tasks:

1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement. 
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names. 
1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.