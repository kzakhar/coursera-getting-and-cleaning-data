# Data
See `README.txt` in the extracted data for the project

# Variables
`base_dir` - a path to the directory with extracted data for the project
`target_file` - a path to the file where the result data set will be written to
`features` - a data table with all features
`std_mean_features` - a vector with only mean and standard deviation features (column names)
`labels` - a data table, which links the class labels with their activity name
`test_table` - a data table with only mean and standard deviation features (`std_mean_features`) for test data set with additional columns for subject and activity
`train_table` - a data table with only mean and standard deviation features (`std_mean_features`) for training data set with additional columns for subject and activity
`summary_table` - a merged data table with the average of each variable for each activity and each subject

# Transformations
See the `run_analysis.R`
