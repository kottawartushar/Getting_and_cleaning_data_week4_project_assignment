---
title: "CodeBook"
author: "Tushar Kottawar"
---

## R Markdown

#Getting and Cleaning Data Week 4 Project Assignment

The outout file tidy_data_set.txt contains a total of 180 rows and 82 columns. This dataset has average of each column for each activity and each subject.

The R code run_analysis.R uses the following variables:

1. read_features: Reading data from features file
2. read_activity_labels: Reading data from activity_labels file
3. colnames(read_activity_labels): Labeling column names for activity_labels file
4. read_x_train, read_y_train, read_subject_train: Reading training dataset
5. read_x_test, read_y_test, read_subject_test: Read test dataset
6. colnames(read_x_train), colnames(read_x_test): Assigning column names from features file to train and test dataset respectively
7. colnames(read_y_train), colnames(read_y_test): Assigning column name "activity_No" to train and test dataset respectively
8. colnames(read_subject_train), colnames(read_subject_test): Assigning column name "subject_ID" to train and test dataset respectively
9. merge_train, merge_test: Merging train(x, y and subject) and test(x, y and subject) dataset respectively
10. merg_all: Combined datset of merged train and test dataset.
11. column_names: Stored the column names from the merged dataset
12. col_mean_std: Filtering out columns that contain mean and std(Standard Deviation) in column name
13. data_meanStd: Merged dataset with mean and std(Standard Deviation) in column name
14. columns: Contains some columns with tidy names
15. data_activity_names: Contains merged data with some tidy column names
16. data_tidy: Contains tidy data set as per the given requirements


The R code run_analysis.R executes the following steps as per the project requirements:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
