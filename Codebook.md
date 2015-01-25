# Code book for returned dataset from analysis.R

* `tAcc-XYZ and tGyro-XYZ` -- refer to accelerometer and gyroscope 3-axial raw signals in time domain
* `tBodyAcc-XYZ and tGravityAcc-XYZ` -- refer to acceleration signal which is further separated into body and gravity acceleration signals.
* `tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ` -- refer to Jerk signals
* `tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag` -- refer to Magnitude of signals.
* `fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag` -- Refer to Fast Fourier Transformed signals of the corresponding time domained signals.
* `fBodyBodyAccJerkMag, fBodyBodyAccJerkMag, fBodyBodyAccJerkMag, fBodyBodyAccJerkMag, fBodyBodyGyroMag, fBodyBodyGyroMag, fBodyBodyGyroMag, fBodyBodyGyroJerkMag, fBodyBodyGyroJerkMag, fBodyBodyGyroJerkMag` - Refer to Fast Fourier Transformed(FFT) signals of corresponding time domained signals. Time domained signals have variable names with one less Boby word. The extra "Body" in FFT variables is a result of error in original dataset. This is left as is for consistency in case one needs to compare with original dataset.
* All but 2 columns have column names either has *mean or std* suffix. The suffixes indicate the values are mean / standard deviation data for given column.
* Column named *subject* refers to subjects number under test/training.
* Column named *activity* refers to activity that the corresponding subject was performing.

Original dataset and corresponding codebook can be found at "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip". This can be used to refer back for any inconsitencies.
