## Getting and Cleaning Data Project

This repository contains the course project for the course "Getting and Cleaning data".

## Files
There are following files:

1. **README.md** - this file

2. **CodeBook.md** - the code book that describes the variables, the data, and transformations that were performed to clean up the data

3. **run_analysis.R** - the script that does the following 

    1) Merges the training and the test sets to create one data set.
    
    2) Extracts only the measurements on the mean and standard deviation for each measurement. 
    
    3) Uses descriptive activity names to name the activities in the data set
    
    4) Appropriately labels the data set with descriptive variable names. 
    
    5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
     
4. **tidy_data_set.txt** - a tidy data set

## Preliminary steps

 Make sure you have "data.table" package installed.

## Instructions


**1.** Extract the file https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip to your R working directory.
  
**2.** Put **run_analysis.R** to your R working directory.
  
**3.** Execute **run_analysis.R** by the command source("run_analysis.R")
  
**4.** After successful execution you will see "Completed successfully" and the file **tidy_data_set.txt** will be generated in your R working directory.
  
  


