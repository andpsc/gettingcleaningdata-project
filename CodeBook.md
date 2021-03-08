The run-analysis.R script collects data from different available datasets, combines them, extracts a specific dataset and summarizes the result, as defined in the assignment steps. 

In particular, the script performs the following actions:

## Step 1: Merge the datasets

# 1.1 Datasets are imported from "test" folder
# 1.2 Datasets are imported from "train" folder
# 1.3 "Test" and "train" datasets are joined
# 1.4 Relevant names are assigned
# 1.5 Full dataset is created

## Step 2: Extract mean and standard deviation for each measurement
    
# 2.1 Variables including mean and standard deviation values are identified
# 2.2 Full dataset is filtered in order to keep only relevant variables

## Step 3: Rename activities with descriptive names

# 3.1: Indexes are substituted with corresponding characters

## Step 4: Label dataset with descriptive variable names
    
# 4.1: The prefix "avg." is assigned to all summarized variables
    
## Step 5: Create a dataset with the average of each variable for each activity and each subject

# 5.1: Final dataset is created using dyplr
# 5.2: Output table is written in .txt format


Please find below a detailed description of all summarized variables:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
