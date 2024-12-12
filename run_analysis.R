library(data.table)
library(dplyr)

###
# From the Project instructions
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
###

###
# However, with the merged data set at step 1, linking the data to activity and subject becomes complicated. 
# That's why the implementation below prepares the individual sets first, merges them, and then calculates the summary
###

# path variables
base_dir = "~/Downloads/UCI HAR Dataset/"
target_file = "~/Downloads/tidy_data_set.txt"

# read the features
features <- fread(paste(base_dir, "features.txt", sep=""))[[2]]
std_mean_features <- grep("-std|-mean", features, value = TRUE)

# read the labels
labels <- fread(paste(base_dir, "activity_labels.txt", sep=""), col.names = c ("key", "activity"))

# read and transform the test data set
test_table <- fread(paste(base_dir, "test/X_test.txt", sep=""), col.names = features)[, .SD, .SDcols = std_mean_features] %>%
  # join the label data and add the activity column
  cbind(fread(paste(base_dir, "test/Y_test.txt", sep=""))[labels, on=.(V1 = key)][,.(activity)]) %>%
  # add the subject column
  cbind(fread(paste(base_dir, "test/subject_test.txt", sep=""), col.names = "subject")) %>%
  # re-order and make `activity` and `subject` the first columns 
  select(c("activity", "subject"), everything())

# read and transform the training data set
train_table <- fread(paste(base_dir, "train/X_train.txt", sep=""), col.names = features)[, .SD, .SDcols = std_mean_features] %>%
  # join the label data and add the activity column
  cbind(fread(paste(base_dir, "train/Y_train.txt", sep=""))[labels, on=.(V1 = key)][,.(activity)]) %>%
  # add the subject column
  cbind(fread(paste(base_dir, "train/subject_train.txt", sep=""), col.names = "subject")) %>%
  # re-order and make `activity` and `subject` the first columns
  select(c("activity", "subject"), everything())

# merge the train and training sets, and calculate average of each variable for each activity and each subject
summary_table <- rbind(test_table, train_table)[, lapply(.SD, mean, na.rm=TRUE), by=.(activity,subject)]

# write the summary table into file 
write.table(summary_table, file=target_file, row.name=FALSE)