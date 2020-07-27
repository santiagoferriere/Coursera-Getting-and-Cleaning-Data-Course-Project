# Coursera-Getting-and-Cleaning-Data-Course-Project README
# Initial data for research
The script is invented to analyze the data from UCI HAR Dataset. It's supposed that archive is extracted to the working directory.

The following files from the initial dataset is used:

features.txt - includes the descriptions for features measured
train/X_train.txt - includes the measurements of the features in train set (one row - 1 measurement of 561 features)
test/X_test.txt - includes the measurements of the features in test set
train/subject_train.txt - subject for each measurement from the train set
test/subject_test.txt - subject for each measurement from the test set
train/y_train.txt - activity (from 1 to 6) for each measurement from the train set
test/y_test.txt - activity (from 1 to 6) for each measurement from the test set

# How script works
Script involves the following stages:
1) Download data into R
2) Rename columns of the data sets to make them more friendly
3) column-bind all data sets
4) row-bind train and test bind
5) select only the columns with that mention mean or std
6) create another data.frame that separates data by subject and calculate mean
7) create another data.frame that separates data by activity and calculate mean
