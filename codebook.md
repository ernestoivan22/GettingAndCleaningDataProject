# Code Book
The objective of this document is explain the data contained in the original data set and the variables that can be found on the tidy dataset.


All the features that were contained in the original raw data are signals that came from the accelerometer and gyroscope of a smartphone (Samsung Galaxy S II) that 30 volunteers wore in their waist.


The file features_info.txt contained in the raw data explains: 

>"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
>'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

>* tBodyAcc-XYZ
>* tGravityAcc-XYZ
>* tBodyAccJerk-XYZ
>* tBodyGyro-XYZ
>* tBodyGyroJerk-XYZ
>* tBodyAccMag
>* tGravityAccMag
>* tBodyAccJerkMag
>* tBodyGyroMag
>* tBodyGyroJerkMag
>* fBodyAcc-XYZ
>* fBodyAccJerk-XYZ
>* fBodyGyro-XYZ
>* fBodyAccMag
>* fBodyAccJerkMag
>* fBodyGyroMag
>* fBodyGyroJerkMag"

In order to build the tidy dataset only the variables related to the mean and sqr of this vectors were used (refer to the README.md in this repo to know more of the process).

The tidydatasets also contains:
* **subject**: A number between 1 and 30 that represents the volunteer that used the smartphone.
* **activity**: A label that describes the activity that the volunteer was doing when the measurements were taken. The values are:
  1. WALKING
  2. WALKING_UPSTAIRS
  3. WALKING_DOWNSTAIRS
  4. SITTING
  5. STANDING
  6. LAYING 


The information related to the original dataset was taken from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
and features_info.txt 