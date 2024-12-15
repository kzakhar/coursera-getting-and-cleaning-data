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
The output or transformed data set is stored in the `summary_table` variable. 
It contains the average of each standard deviation and mean measurements per activity and subject

- `activity` -- activity label or name
- `subject` -- subject id
- 79 mean and standard deviation measurements of accelerometer and gyroscope data

## Measurement names
The measurement names are kept as is. For more details you can refer the description in the input data set. Briefly:

- the prefix `t` represents the time signals
- the prefix `f` represents the frequency signals
- the suffix `Acc` represents the data from accelerometer
- the suffix `Gyro` represents the data from gyroscope
- the suffix `Mag` represents a 3D signal
- the suffix `-mean()` represents the mean measurement
- the suffix `-std()` represents the standard deviation measurement

## Transformations
- Select only the mean and standard deviation measurements, i.e. the ones with either `-mean` or `-std` suffix
- Join the activity data and replace with a human-readable labels
- Join the subject data
- Combine the train and test data sets
- Group the data by activity and subject, applying the `mean` function

### The script variables
- `data_set_output_file` - a path to the file where the result data set will be written to
- `features` - a data table with all features
- `std_mean_features` - a vector with only mean and standard deviation features (column names)
- `labels` - a data table, which links the class labels with their activity name
- `test_table` - a data table with only mean and standard deviation features (`std_mean_features`) for test data set with additional columns for subject and activity
- `train_table` - a data table with only mean and standard deviation features (`std_mean_features`) for training data set with additional columns for subject and activity
- `summary_table` - a merged data table with the average of each variable for each activity and each subject