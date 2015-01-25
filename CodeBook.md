# OVERVIEW #
This is a brief code book describing the cleaned wearable data (tidy_data.txt) in this repository.

The data were collected to explore how movement trackers perform under different activity conditions.

The tidy_data.txt file was created by applying the run_analysis.R script on the original source data provided by the authors (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#). See README.md for more details on how to use the script and see the script itself to see how it works.

The end result of the transformations is data for 30 participants each engaging in 6 different kinds of activity. There is a row for each participant/activity combination for 180 total observations.

The first three variables identify the participant, data source, and activity. The remaining variables are averaged data for the named device measurement (e.g., tBodyAcc-XYZ is the average of all tBodyAcc-XYZ values collected for the participant for that particular activity).

# THE VARIABLES #

There are three custom variables to explain here.

subject_ID (CATEGORICAL): This is the ID of the participant associated with the current observation. It was assigned by the original researchers and extracted from the subject text files.

condition_ID (CATEGORICAL): This variable identifies if the observation was extracted from the training data or test data.

- training = Extracted from training data.

- test = Extracted from test data.

activity_ID (CATEGORICAL): This variable identifies which activity the observation is associated with. The levels of the variable are human readable and so are not described further.

- WALKING

- WALKING_UPSTAIRS

- WALKING_DOWNSTAIRS

- SITTING

- STANDING

- LAYING

The remaining variables are described in detail by the data source authors. The relevant portion of the description is copied below.

All remaining variabes are NUMERICAL. As noted above, the variables are AVERAGES of the ORIGINAL UNITS for each measure.

Feature Selection 
=================

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

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
