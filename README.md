clean_data_project
==================

Repository for the code developed for the project in coursera class - R langage Getting and Cleaning data

Download and unzip the files for analysis in the working directory
./UCI HAR Dataset

the run_analysis.R program executes the following task on the dataset

- Merges the training set (in ./train) and the test set (in ./test) to create one data set. 
- Extracts only the measurements on the mean and standard deviation for each measurement 
- update the column names of the file using the features.txt info.
- join the activity file  (y) with the activity_labels.txt 
- merge the subject table, activity table and measurement table into a large table final_table
- calculate the mean by suject and activity
- save the table into a test file.
-
