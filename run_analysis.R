#load the reshape2 library
library(reshape2)

# verify if the files to be used exist, if not it'll be downloaded
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("UCI HAR Dataset")){
  if(!file.exists("uci_har_dataset.zip")){
    download.file(fileUrl, destfile = "uci_har_dataset.zip")
  }
  unzip("uci_har_dataset.zip", exdir = ".")
}

# load all the variables that will hold the raw data
raw_features <- read.table("UCI HAR Dataset/features.txt")
raw_activities <- read.table("UCI HAR Dataset/activity_labels.txt")
raw_x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
raw_y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
raw_subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
raw_x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
raw_y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
raw_subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# determine wich features are the ones we need (the ones that have 'mean(' or 'std(' in their name)
features_index <- grep(".*((mean)|(std))\\(.*", raw_features[,2])

# create a data frame that contains the data we need related to the training
train_table <- cbind(raw_subject_train, raw_y_train, raw_x_train[,features_index])

# create a data frame contains the data we need related to the test
test_table <- cbind(raw_subject_test, raw_y_test, raw_x_test[,features_index])

# Set header names to both data frames
names(train_table) <- c('subject', 'activity', as.character(raw_features[features_index,2]))
names(test_table) <- c('subject', 'activity', as.character(raw_features[features_index,2]))

# Change the id of the activities with their respective label in both data frames
train_table$activity <- raw_activities[train_table$activity, 2]
test_table$activity <- raw_activities[test_table$activity, 2]

# Join rows of train_table and test_table
binded_table <- rbind(train_table, test_table)

# melt the new data frame in order to reshape it later
binded_table <- melt(binded_table, id=c("subject", "activity"))

# reshape the data frame to obtain the mean of every variable
tidy_table <- dcast(binded_table, subject + activity ~ variable, mean)

# remove dash and parentheses from the names of the data frame
names(tidy_table) <- sub("-m", "M", names(tidy_table))
names(tidy_table) <- sub("-s", "S", names(tidy_table))
names(tidy_table) <- sub("\\(\\)", "", names(tidy_table))

# finally save a file with the tidy data
write.table(tidy_table, "tidyData.txt", row.names = FALSE)
