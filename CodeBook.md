## Getting and Cleaning Data Project Code Book

### Description
The code book that describes the variables, the data, and any transformations or work that you performed to clean up the data

### Source Data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


The dataset includes the following files:

- **'README.txt'**

- **'features_info.txt'**: Shows information about the variables used on the feature vector.

- **'features.txt'**: List of all features.

- **'activity_labels.txt'**: Links the class labels with their activity name.

- **'train/X_train.txt'**: Training set.

- **'train/y_train.txt'**: Training labels.

- **'test/X_test.txt'**: Test set.

- **'test/y_test.txt'**: Test labels.


The following files are available for the train and test data. Their descriptions are equivalent. 


- **'train/subject_train.txt'**: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- **'train/Inertial Signals/total_acc_x_train.txt'**: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- **'train/Inertial Signals/body_acc_x_train.txt'**: The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- **'train/Inertial Signals/body_gyro_x_train.txt'**: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

### Attributes information

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### Data transformation

The following transformations were perfomed on the original data sets:

1. Test and train files were merged to obtain complete sets:
    
    1) **X_train.txt** merged with **X_test.txt** into **x_merged** data set
    
    2) **y_train.txt** merged with  **y_test.txt** into **y_merged** data set
    
    3) **subject_train.txt** merged with **subject_test.txt** into **subject_merged** data set
    
    **x_merged** contains all the measurements
    
    **y_merged** contains performed activities codes(1 to 6)
    
    **subject_merged** contains numbers corresponding experiment participants(1 to 30)
    
2. Extracted only the measurements on the mean and standard deviation for each measurement.
    
    The data set **x_merged** was filtered so only measurements which contain "-mean()"  or "-std()" in the name were left.

3. Activities which were representeted by numbers from 1 to 6 were replaced by descriptive activity names 

    Numbers in **y_merged** were replaced by activity names
    
    1 -	walking
    
	2 -	walking upstairs
    
	3 -	walking downstairs
    
	4 - sitting
    
	5 - standing
    
	6 -	laying

4. The data sets were combined together for further pocessing

    **x_merged**, **y_merged** and **subject_merged** were combined together.

    **y_merged** has header "Activity"
    
    **subject_merged** has header "Subjects"
    
    For **x_merged** header see features_info.txt
    
    Column names in **x_merged** data set were modified so that "-mean()" and "-std()" were replaced by "Mean" and "SD".
    E.g. tBodyAcc-mean()-X was converted to tBodyAccMean-X.
    
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
    There are 30 subjects and 6  activities, which result in a 180 combinations. For each combination the mean of each measurement was calculated.
    
    The result was saved to **tidy_data_set.txt** file.
