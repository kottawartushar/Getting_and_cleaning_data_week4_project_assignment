library(dplyr)

#Downloading the dataset and unzipping
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filePath <- "C:/Users/lenovo/Desktop/R_test/Gather_and_clean_data_week4_project\\dataset_4.zip"
download.file(fileURL, filePath, method = "auto")
unzip(zipfile = "C:/Users/lenovo/Desktop/R_test/Gather_and_clean_data_week4_project\\dataset_4.zip", exdir = "C:/Users/lenovo/Desktop/R_test/Gather_and_clean_data_week4_project")
path_data <- file.path("C:/Users/lenovo/Desktop/R_test/Gather_and_clean_data_week4_project", "UCI HAR Dataset")

#Read features data
read_features <- read.table(file.path(path_data, "features.txt"))


#Read activity lables data
read_activity_labels <- read.table(file.path(path_data, "activity_labels.txt"))
colnames(read_activity_labels) <- c("activity_No", "activity_Name")


#Reading train data
read_x_train <- read.table(file.path(path_data, "train", "X_train.txt"))
read_y_train <- read.table(file.path(path_data, "train", "y_train.txt"))
read_subject_train <- read.table(file.path(path_data, "train", "subject_train.txt"))


#Read test data
read_x_test <- read.table(file.path(path_data, "test", "X_test.txt"))
read_y_test <- read.table(file.path(path_data, "test", "y_test.txt"))
read_subject_test <- read.table(file.path(path_data, "test", "subject_test.txt"))


#Labeling the dataset
colnames(read_x_train) = read_features[,2]
colnames(read_y_train) = "activity_No"
colnames(read_subject_train) = "subject_ID"

colnames(read_x_test) = read_features[,2]
colnames(read_y_test) = "activity_No"
colnames(read_subject_test) = "subject_ID"



#Merge the dataset
merge_train <- cbind(read_x_train, read_subject_train, read_y_train)
merge_test <- cbind(read_x_test, read_subject_test, read_y_test)
merge_all <- rbind(merge_train, merge_test)


#Extracting only the measurements on the mean and standard deviation for each measurement
column_names <- colnames(merge_all)
#col_mean_std <- (grep("activity..",column_names) | grep("subject..",column_names) | 
#                   grep("-mean..", column_names) | grep("-std..", column_names))
col_mean_std <- (grepl("activity..",column_names) | grepl("subject..",column_names) | 
                   grepl("-mean..", column_names) | grepl("-std..", column_names))
data_meanStd <- merge_all[ , col_mean_std == TRUE]


columns <- colnames(data_meanStd)
columns <- gsub("\\()", "", columns)
columns <- gsub("-std", "StdDev", columns)
columns <- gsub("-mean", "Mean", columns)
columns <- gsub("Freq", "frequency", columns)
columns <- gsub("([Bb]ody[Bb]ody)", "Body", columns)
colnames(data_meanStd) <- columns


data_activity_names <- merge(data_meanStd, read_activity_labels, by = "activity_No", all.x = TRUE)

data_tidy <- summarise_all(group_by(data_activity_names, subject_ID,  activity_No, activity_Name), funs(mean))

#Creating a second tidy data set
write.table(data_tidy, "tidy_data_set.txt", row.names = FALSE)



