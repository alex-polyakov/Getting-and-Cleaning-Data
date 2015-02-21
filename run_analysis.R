## This script does the following:
##
## 1. Merges the training and the test sets(from "getdata_projectfiles_UCI HAR Dataset.zip") to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with 
##    the average of each variable for each activity and each subject.

oldWorkingDir <- getwd()
setwd("./UCI HAR Dataset/");

## 1. Merges the training and the test sets

    ##Read test data
    x_test <- read.table("test/X_test.txt" )
    y_test <- read.table("test/y_test.txt")
    subject_test <- read.table("test/subject_test.txt")
    
    ##Read train data
    x_train <- read.table("train/X_train.txt" )
    y_train <- read.table("train/y_train.txt")
    subject_train <- read.table("train/subject_train.txt")
    
    ##Merge test and train
    x_merged <- rbind(x_test, x_train)
    y_merged <- rbind(y_test, y_train)
    subject_merged <- rbind(subject_test, subject_train)
    
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
    features <- read.table("features.txt")
    mean_sd_features <- grep("-(mean|std)\\(\\)", features[, 2])
    x_merged <- x_merged[, mean_sd_features]

## 3. Uses descriptive activity names to name the activities in the data set
    activity_labels <- read.table("activity_labels.txt")
    activity_labels[, 2] <- tolower(gsub("_", " ", activity_labels[, 2]))
    y_merged[, 1] <- activity_labels[y_merged[, 1], 2]

## 4. Appropriately labels the data set with descriptive variable names. 
    names(subject_merged) <- "Subject"
    names(y_merged) <- "Activity"

    features[,2] <- gsub('-std\\(\\)', 'SD', features[,2])
    features[,2] <- gsub('-mean\\(\\)', 'Mean', features[,2])
    names(x_merged) <- features[mean_sd_features, 2]

    ##put all columns together
    input_data_set <- cbind(subject_merged, y_merged, x_merged)

## 5. From the data set in step 4, creates a second, independent tidy data set with 
##    the average of each variable for each activity and each subject.
    library(data.table)
    DT <- data.table(input_data_set)
    DT <- DT[, lapply(.SD,mean), by=list(Subject, Activity)]
    tidy_data_set <- DT[order(Subject, Activity)]

    setwd(oldWorkingDir)

    write.table(tidy_data_set, "tidy_data_set.txt", row.name=FALSE)

    print("Completed successfully")