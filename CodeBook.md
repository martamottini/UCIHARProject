### Information on the features of the raw data set

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag

### Variables of the first data set 
####Obtained as described in the README file up to point 7 in the "R script file" section

The original data set contained several variables that were estimated from the features mentioned above, for the purpuse of this project only the following two were included in the first data set: 

mean(): Mean value

std(): Standard deviation

This means that the mean and the standard deviation for all the features previously mentioned have been selected.
In addition to these 66 variables (all nunerical), the data set also contains the Subject_ID and the Activity performed (integer and character, respectively).

### Variables of the final, tidy data set

The variables present in the tidydataset.txt file are 68: Activity and Subject_ID are identical to the one in the first data set. The remaining 66 (numerical variables) are the average of the 66 variables in the first data set, grouped by Activity and Subject_ID. 

For example, the mean of all values of tBodyAcc-mean-X for the activity "LAYING" and the subject "1" is the first value of the column ave(tBodyAcc-mean-X), the mean of all values of tBodyAcc-mean-X for the activity "SITTING" and the subject "1" is the second value of the column ave(tBodyAcc-mean-X), and so on for all the activities and all the subject. The values in all the remaining columns are calculated in a similar way. 

