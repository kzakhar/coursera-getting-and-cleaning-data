# Intro
One of the most exciting areas in all of data science right now is wearable computing - see for example 
[this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). 
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the [site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) where the data was obtained.
[Here] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) are the data for the project.

# Overview
The script uses the provided open data for wearable computing to create a tidy data set with the average of each mean and standard deviation measurement for each activity and each subject.

# Files
- `run_analysis.R` - R script which reads and merges the input data sets, and prepares the tidy output data set
- `CodeBook.md` - describes the variables and transformations applied

# Input data set
the `run_analysis.R` expects the input data set to be available in the working directory. 
the input data set is [the one](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) described in the #Intro section -- it should be extracted.

# `run_analysis.R` steps
1. Merges the training (`training_data`) and the test sets (`test_data`) to create one data set (`merged_data`).
2. Extracts only the measurements on the mean and standard deviation for each measurement (`merged_data_std_mean`). 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. merge the test and train data sets, grouping the data by activity and subject, calculating the average (`mean`) for each measurement per group (`tidy_data`)
6. write the data table from the previous step into a file (hard-coded into the variable `tidy_data_output_file`)
