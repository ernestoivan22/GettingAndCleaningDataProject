# GettingAndCleaningDataProject

The objective of this project is to code a script that will take the raw dataset obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and return a tidy dataset as a result.

To acomplish the later the script does the following:

Loads the library reshape2, so if you want to use the script you need to install it first.
Verify that the raw dataset exist in the workspace, if it does not, the data will be downloaded.
Identifies which columns have mean and std in their names.
Creates two data frames joining the data obtained from the training and test.
The names of the columns are set to each data frame.
The IDs on the activities column are changed by labels.
The two data frames are merged.
A new data frame is created by using the melt and dcast function. The result contains the mean of every variable for every subject and activity.
The column names are changed one last time to remove some characters.
Finally the tidy dataset is saved.