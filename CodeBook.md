# Code Book

The raw source of this data is the [Getting and Cleaning Data Course
Project
data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

It was processed with the [run_analysis.R](run_analysis.R) script, which
performed the following steps:

1. concatenated the "train" and "test" data,
2. selected only the mean and standard deviation raw variables,
3. summarized, for each activity and subject pair, the average of each
   selected raw variable.

The first, "activity", column of the resulting tidy data contains one of
the following six activities:

- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

The second, "subject", column contains integers from one to 30,
corresponding to each of the 30 volunteers who produced the raw data.

The remaining 66 columns each contains the average of a different raw
variable. The source of the raw data are sensor signals -- a 3-axis
accelerometer and a 3-axis gyroscope. Columns for mean raw variables are
named "mean" -- standard deviation, "standarddeviation". Columns for
each of the three axes are named "x", "y", and "z" -- columns for the
magnitude (euclidean norm), "magnitude".

The accelerometer signal is separated into body and gravity components
(in the raw data) and columns for these are correspondingly named "body"
and "gravity". The "jerk" columns correspond to raw variables that are
the derivation in time of the sensor signals. (So "bodyjerkmeanx" is the
derivation in time of "bodymeanx" ... or so says the description of the
raw data ...) Finally, the "frequency" columns correspond to raw
variables that are the application of a fast Fourier transform.

Hence, "gravitymeanx" is the X axis of the gravity component of the
accelerometer signal, "gyroscopejerkmagnitudestandarddeviation" is the
standard deviation of the magnitude of the derivation in time of the
gyroscope signal, "bodyfrequencymeanx" is the fast Fourier transform of
the X axis of the body component of the accelerometer signal, etc.

Presumably, the raw variables were once in standard gravitational units
(accelerometer) and radians per second (gyroscope) -- but the raw data
was all normalized and bounded within [-1, 1] -- so the corresponding
tidy data is also unitless.

The following table summarizes the correspondence between the tidy
columns and the raw variables:

| Tidy | Raw |
| ---- | --- |
| bodymeanx | tBodyAcc-mean()-X |
| bodymeany | tBodyAcc-mean()-Y |
| bodymeanz | tBodyAcc-mean()-Z |
| bodystandarddeviationx | tBodyAcc-std()-X |
| bodystandarddeviationy | tBodyAcc-std()-Y |
| bodystandarddeviationz | tBodyAcc-std()-Z |
| gravitymeanx | tGravityAcc-mean()-X |
| gravitymeany | tGravityAcc-mean()-Y |
| gravitymeanz | tGravityAcc-mean()-Z |
| gravitystandarddeviationx | tGravityAcc-std()-X |
| gravitystandarddeviationy | tGravityAcc-std()-Y |
| gravitystandarddeviationz | tGravityAcc-std()-Z |
| bodyjerkmeanx | tBodyAccJerk-mean()-X |
| bodyjerkmeany | tBodyAccJerk-mean()-Y |
| bodyjerkmeanz | tBodyAccJerk-mean()-Z |
| bodyjerkstandarddeviationx | tBodyAccJerk-std()-X |
| bodyjerkstandarddeviationy | tBodyAccJerk-std()-Y |
| bodyjerkstandarddeviationz | tBodyAccJerk-std()-Z |
| gyroscopemeanx | tBodyGyro-mean()-X |
| gyroscopemeany | tBodyGyro-mean()-Y |
| gyroscopemeanz | tBodyGyro-mean()-Z |
| gyroscopestandarddeviationx | tBodyGyro-std()-X |
| gyroscopestandarddeviationy | tBodyGyro-std()-Y |
| gyroscopestandarddeviationz | tBodyGyro-std()-Z |
| gyroscopejerkmeanx | tBodyGyroJerk-mean()-X |
| gyroscopejerkmeany | tBodyGyroJerk-mean()-Y |
| gyroscopejerkmeanz | tBodyGyroJerk-mean()-Z |
| gyroscopejerkstandarddeviationx | tBodyGyroJerk-std()-X |
| gyroscopejerkstandarddeviationy | tBodyGyroJerk-std()-Y |
| gyroscopejerkstandarddeviationz | tBodyGyroJerk-std()-Z |
| bodymagnitudemean | tBodyAccMag-mean() |
| bodymagnitudestandarddeviation | tBodyAccMag-std() |
| gravitymagnitudemean | tGravityAccMag-mean() |
| gravitymagnitudestandarddeviation | tGravityAccMag-std() |
| bodyjerkmagnitudemean | tBodyAccJerkMag-mean() |
| bodyjerkmagnitudestandarddeviation | tBodyAccJerkMag-std() |
| gyroscopemagnitudemean | tBodyGyroMag-mean() |
| gyroscopemagnitudestandarddeviation | tBodyGyroMag-std() |
| gyroscopejerkmagnitudemean | tBodyGyroJerkMag-mean() |
| gyroscopejerkmagnitudestandarddeviation | tBodyGyroJerkMag-std() |
| bodyfrequencymeanx | fBodyAcc-mean()-X |
| bodyfrequencymeany | fBodyAcc-mean()-Y |
| bodyfrequencymeanz | fBodyAcc-mean()-Z |
| bodyfrequencystandarddeviationx | fBodyAcc-std()-X |
| bodyfrequencystandarddeviationy | fBodyAcc-std()-Y |
| bodyfrequencystandarddeviationz | fBodyAcc-std()-Z |
| bodyjerkfrequencymeanx | fBodyAccJerk-mean()-X |
| bodyjerkfrequencymeany | fBodyAccJerk-mean()-Y |
| bodyjerkfrequencymeanz | fBodyAccJerk-mean()-Z |
| bodyjerkfrequencystandarddeviationx | fBodyAccJerk-std()-X |
| bodyjerkfrequencystandarddeviationy | fBodyAccJerk-std()-Y |
| bodyjerkfrequencystandarddeviationz | fBodyAccJerk-std()-Z |
| gyroscopefrequencymeanx | fBodyGyro-mean()-X |
| gyroscopefrequencymeany | fBodyGyro-mean()-Y |
| gyroscopefrequencymeanz | fBodyGyro-mean()-Z |
| gyroscopefrequencystandarddeviationx | fBodyGyro-std()-X |
| gyroscopefrequencystandarddeviationy | fBodyGyro-std()-Y |
| gyroscopefrequencystandarddeviationz | fBodyGyro-std()-Z |
| bodymagnitudefrequencymean | fBodyAccMag-mean() |
| bodymagnitudefrequencystandarddeviation | fBodyAccMag-std() |
| bodyjerkmagnitudefrequencymean | fBodyBodyAccJerkMag-mean() |
| bodyjerkmagnitudefrequencystandarddeviation | fBodyBodyAccJerkMag-std() |
| gyroscopemagnitudefrequencymean | fBodyBodyGyroMag-mean() |
| gyroscopemagnitudefrequencystandarddeviation | fBodyBodyGyroMag-std() |
| gyroscopejerkmagnitudefrequencymean | fBodyBodyGyroJerkMag-mean() |
| gyroscopejerkmagnitudefrequencystandarddeviation | fBodyBodyGyroJerkMag-std() |
