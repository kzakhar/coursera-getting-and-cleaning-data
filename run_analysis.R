library(data.table)
library(dplyr)

tidy_data_output_file = "~/Downloads/tidy_data_set.txt"

# 1. Merges the training and the test sets to create one data set.
measurements <- fread("features.txt")[[2]]
training_data <- fread("train/X_train.txt", col.names = measurements) %>%
  cbind(fread("train/Y_train.txt", col.names = "activity_key")) %>%
  cbind(fread("train/subject_train.txt", col.names = "subject"))
test_data <- fread("test/X_test.txt", col.names = measurements) %>%
  cbind(fread("test/Y_test.txt", col.names = "activity_key")) %>%
  cbind(fread("test/subject_test.txt", col.names = "subject"))
merged_data <- rbind(training_data, test_data)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
merged_data_std_mean <- merged_data %>% select(subject, activity_key, contains("mean()"), contains("std()"), contains("meanFreq()"))

# 3. Uses descriptive activity names to name the activities in the data set
activity_labels <- fread("activity_labels.txt", col.names = c ("key", "activity"))
merged_data_std_mean$activity_key <- activity_labels[merged_data_std_mean$activity_key, 2]

# 4. Appropriately labels the data set with descriptive variable names
merged_data_std_mean %>%
  setnames("subject", "Subject") %>%
  setnames("activity_key", "Activity") %>%
  setnames(gsub("^t", "Time", names(merged_data_std_mean))) %>%
  setnames(gsub("^f", "Frequency", names(merged_data_std_mean))) %>%
  setnames(gsub("Acc", "Accelerometer", names(merged_data_std_mean))) %>%
  setnames(gsub("Gyro", "Gyroscope", names(merged_data_std_mean))) %>%
  setnames(gsub("Mag", "Magnitude", names(merged_data_std_mean))) %>%
  setnames(gsub("tBody", "TimeBody", names(merged_data_std_mean))) %>%
  setnames(gsub("-meanFreq\\(\\)", "WeightedAverageMeanFrequency", names(merged_data_std_mean))) %>%
  setnames(gsub("-mean\\(\\)", "Mean", names(merged_data_std_mean))) %>%
  setnames(gsub("-std\\(\\)", "StandardDeviation", names(merged_data_std_mean))) %>%
  setnames(gsub("\\(\\)", "", names(merged_data_std_mean))) %>%
  setnames(gsub("BodyBody", "Body", names(merged_data_std_mean)))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidy_data <- merged_data_std_mean %>%
  group_by(Subject, Activity) %>%
  summarise_all(mean)

# dump the tidy data set
write.table(tidy_data, file=tidy_data_output_file, row.name=FALSE)