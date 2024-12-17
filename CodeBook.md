# Input Data
The  input data is the [Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 
The data set was collected from the accelerometers and gyroscopes of a Samsung Galaxy S smartphone carried by 30 subjects while performing six activities: 

- Walking  
- Walking Upstairs  
- Walking Downstairs  
- Sitting  
- Standing  
- Lying

The input is composed of the following files, read by the `run_analysis.R` script:

- common data
    - `activity_labels.txt` -- activity labels
    - `features.txt`: measurement names
- train data set
    - `train/X_train.txt` -- measurements
    - `train/Y_train.txt` -- activities
    - `train/subject_train.txt` -- subject ids
- test data set
    - `test/X_test.txt` -- measurements
    - `test/Y_test.txt` -- activities
    - `test/subject_test.txt` -- subject ids

# Dependencies
- `data.table` -- enhanced and fast `data.frame` manipulations
- `dplyr` -- more concise functions for manipluations over data tables

# Output Data
The output or summary tidy data set is stored in the `tidy_data` variable. 
It contains the average of each standard deviation and mean measurements per activity and subject.
**Even though the `angle` measurements contains the `mean` suffix, those are not included into the result set -- those are the angles of the vectors.**

- `Subject` -- subject id
- `Activity` -- activity label or name
- 79 mean and standard deviation measurements of accelerometer and gyroscope data

## Measurement names
For details on the measurement meaning you can refer the description in the input data set.
In the tidy data set the measurement names were renamed to have more descriptive names. 

| pattern | meaning | rename |
|---------|---------|--------|
| prefix `t` | time signal | Time | 
| prefix `f` | frequency signal | Frequency | 
| suffix `Acc` | data from accelerometer | Accelerometer | 
| suffix `Gyro` | data from gyroscope | Gyroscope | 
| suffix `Mag` | 3D signal | Magnitude | 
| suffix `tBody` | time body acceleration signals | TimeBody | 
| suffix `-meanFreq()` | Weighted average of the frequency components to obtain a mean frequency | WeightedAverageMeanFrequency | 
| suffix `-mean()` | Mean value | Mean | 
| suffix `-std()` | Standard deviation | StandardDeviation | 
| suffix `BodyBody` | just a repeatition | Body |

See below the complete mapping of old measurement names to new ones

| Original name | Tidy data name | 
|---------------|----------------|
| tBodyAcc-mean()-X | TimeBodyAccelerometerMean-X |
| tBodyAcc-mean()-Y | TimeBodyAccelerometerMean-Y |
| tBodyAcc-mean()-Z | TimeBodyAccelerometerMean-Z |
| tGravityAcc-mean()-X | TimeGravityAccelerometerMean-X |
| tGravityAcc-mean()-Y | TimeGravityAccelerometerMean-Y |
| tGravityAcc-mean()-Z | TimeGravityAccelerometerMean-Z |
| tBodyAccJerk-mean()-X | TimeBodyAccelerometerJerkMean-X |
| tBodyAccJerk-mean()-Y | TimeBodyAccelerometerJerkMean-Y |
| tBodyAccJerk-mean()-Z | TimeBodyAccelerometerJerkMean-Z |
| tBodyGyro-mean()-X | TimeBodyGyroscopeMean-X |
| tBodyGyro-mean()-Y | TimeBodyGyroscopeMean-Y |
| tBodyGyro-mean()-Z | TimeBodyGyroscopeMean-Z |
| tBodyGyroJerk-mean()-X | TimeBodyGyroscopeJerkMean-X |
| tBodyGyroJerk-mean()-Y | TimeBodyGyroscopeJerkMean-Y |
| tBodyGyroJerk-mean()-Z | TimeBodyGyroscopeJerkMean-Z |
| tBodyAccMag-mean() | TimeBodyAccelerometerMagnitudeMean |
| tGravityAccMag-mean() | TimeGravityAccelerometerMagnitudeMean |
| tBodyAccJerkMag-mean() | TimeBodyAccelerometerJerkMagnitudeMean |
| tBodyGyroMag-mean() | TimeBodyGyroscopeMagnitudeMean |
| tBodyGyroJerkMag-mean() | TimeBodyGyroscopeJerkMagnitudeMean |
| fBodyAcc-mean()-X | FrequencyBodyAccelerometerMean-X |
| fBodyAcc-mean()-Y | FrequencyBodyAccelerometerMean-Y |
| fBodyAcc-mean()-Z | FrequencyBodyAccelerometerMean-Z |
| fBodyAccJerk-mean()-X | FrequencyBodyAccelerometerJerkMean-X |
| fBodyAccJerk-mean()-Y | FrequencyBodyAccelerometerJerkMean-Y |
| fBodyAccJerk-mean()-Z | FrequencyBodyAccelerometerJerkMean-Z |
| fBodyGyro-mean()-X | FrequencyBodyGyroscopeMean-X |
| fBodyGyro-mean()-Y | FrequencyBodyGyroscopeMean-Y |
| fBodyGyro-mean()-Z | FrequencyBodyGyroscopeMean-Z |
| fBodyAccMag-mean() | FrequencyBodyAccelerometerMagnitudeMean |
| fBodyBodyAccJerkMag-mean() | FrequencyBodyAccelerometerJerkMagnitudeMean |
| fBodyBodyGyroMag-mean() | FrequencyBodyGyroscopeMagnitudeMean |
| fBodyBodyGyroJerkMag-mean() | FrequencyBodyGyroscopeJerkMagnitudeMean |
| tBodyAcc-std()-X | TimeBodyAccelerometerStandardDeviation-X |
| tBodyAcc-std()-Y | TimeBodyAccelerometerStandardDeviation-Y |
| tBodyAcc-std()-Z | TimeBodyAccelerometerStandardDeviation-Z |
| tGravityAcc-std()-X | TimeGravityAccelerometerStandardDeviation-X |
| tGravityAcc-std()-Y | TimeGravityAccelerometerStandardDeviation-Y |
| tGravityAcc-std()-Z | TimeGravityAccelerometerStandardDeviation-Z |
| tBodyAccJerk-std()-X | TimeBodyAccelerometerJerkStandardDeviation-X |
| tBodyAccJerk-std()-Y | TimeBodyAccelerometerJerkStandardDeviation-Y |
| tBodyAccJerk-std()-Z | TimeBodyAccelerometerJerkStandardDeviation-Z |
| tBodyGyro-std()-X | TimeBodyGyroscopeStandardDeviation-X |
| tBodyGyro-std()-Y | TimeBodyGyroscopeStandardDeviation-Y |
| tBodyGyro-std()-Z | TimeBodyGyroscopeStandardDeviation-Z |
| tBodyGyroJerk-std()-X | TimeBodyGyroscopeJerkStandardDeviation-X |
| tBodyGyroJerk-std()-Y | TimeBodyGyroscopeJerkStandardDeviation-Y |
| tBodyGyroJerk-std()-Z | TimeBodyGyroscopeJerkStandardDeviation-Z |
| tBodyAccMag-std() | TimeBodyAccelerometerMagnitudeStandardDeviation |
| tGravityAccMag-std() | TimeGravityAccelerometerMagnitudeStandardDeviation |
| tBodyAccJerkMag-std() | TimeBodyAccelerometerJerkMagnitudeStandardDeviation |
| tBodyGyroMag-std() | TimeBodyGyroscopeMagnitudeStandardDeviation |
| tBodyGyroJerkMag-std() | TimeBodyGyroscopeJerkMagnitudeStandardDeviation |
| fBodyAcc-std()-X | FrequencyBodyAccelerometerStandardDeviation-X |
| fBodyAcc-std()-Y | FrequencyBodyAccelerometerStandardDeviation-Y |
| fBodyAcc-std()-Z | FrequencyBodyAccelerometerStandardDeviation-Z |
| fBodyAccJerk-std()-X | FrequencyBodyAccelerometerJerkStandardDeviation-X |
| fBodyAccJerk-std()-Y | FrequencyBodyAccelerometerJerkStandardDeviation-Y |
| fBodyAccJerk-std()-Z | FrequencyBodyAccelerometerJerkStandardDeviation-Z |
| fBodyGyro-std()-X | FrequencyBodyGyroscopeStandardDeviation-X |
| fBodyGyro-std()-Y | FrequencyBodyGyroscopeStandardDeviation-Y |
| fBodyGyro-std()-Z | FrequencyBodyGyroscopeStandardDeviation-Z |
| fBodyAccMag-std() | FrequencyBodyAccelerometerMagnitudeStandardDeviation |
| fBodyBodyAccJerkMag-std() | FrequencyBodyAccelerometerJerkMagnitudeStandardDeviation |
| fBodyBodyGyroMag-std() | FrequencyBodyGyroscopeMagnitudeStandardDeviation |
| fBodyBodyGyroJerkMag-std() | FrequencyBodyGyroscopeJerkMagnitudeStandardDeviation |
| fBodyAcc-meanFreq()-X | FrequencyBodyAccelerometerWeightedAverageMeanFrequency-X |
| fBodyAcc-meanFreq()-Y | FrequencyBodyAccelerometerWeightedAverageMeanFrequency-Y |
| fBodyAcc-meanFreq()-Z | FrequencyBodyAccelerometerWeightedAverageMeanFrequency-Z |
| fBodyAccJerk-meanFreq()-X | FrequencyBodyAccelerometerJerkWeightedAverageMeanFrequency-X |
| fBodyAccJerk-meanFreq()-Y | FrequencyBodyAccelerometerJerkWeightedAverageMeanFrequency-Y |
| fBodyAccJerk-meanFreq()-Z | FrequencyBodyAccelerometerJerkWeightedAverageMeanFrequency-Z |
| fBodyGyro-meanFreq()-X | FrequencyBodyGyroscopeWeightedAverageMeanFrequency-X |
| fBodyGyro-meanFreq()-Y | FrequencyBodyGyroscopeWeightedAverageMeanFrequency-Y |
| fBodyGyro-meanFreq()-Z | FrequencyBodyGyroscopeWeightedAverageMeanFrequency-Z |
| fBodyAccMag-meanFreq() | FrequencyBodyAccelerometerMagnitudeWeightedAverageMeanFrequency |
| fBodyBodyAccJerkMag-meanFreq() | FrequencyBodyAccelerometerJerkMagnitudeWeightedAverageMeanFrequency |
| fBodyBodyGyroMag-meanFreq() | FrequencyBodyGyroscopeMagnitudeWeightedAverageMeanFrequency |
| fBodyBodyGyroJerkMag-meanFreq() | FrequencyBodyGyroscopeJerkMagnitudeWeightedAverageMeanFrequency | 

## Transformations
- Join the measurement data with activities and subjects for both training and test data sets
- Merge the training and data sets into one data table
- Select only the mean and standard deviation measurements, i.e. the ones with either `-mean` or `-std` suffix
- Use descriptive activity names to name the activities in the merged data set
- Relabel the variable names
- Group the data by activity and subject, applying the `mean` function to all, but group variables

### The script variables
- `tidy_data_output_file` - a path to the file where the result data set will be written to
- `measurements` - a data table with all features
- `training_data` - a data table with only mean and standard deviation features (`std_mean_features`) for training data set with additional columns for subject and activity
- `test_data` - a data table with only mean and standard deviation features (`std_mean_features`) for test data set with additional columns for subject and activity
- `merged_data` - a data table combining training and test data
- `merged_data_std_mean` - only the measurements on the mean and standard deviation for each measurement from `merged_data`
- `activity_labels` - a data table, which links the class labels with their activity name
- `tidy_data` - an outpu data table with the average of each variable for each activity and each subject