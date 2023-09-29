# Summerise_data
Getting and Cleaning Data Course Project

You should run this with "training" and "test" directories inside your working directory.

The script works as following:
1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This script generates "summerised.txt" file, which contains data specified in the requirements.

Columns which name ends with "mean" conatin mean of the mean of the measurement for a given activity of a subject.

Columns which name ends with "std" conatin mean of the standard deviation of the measurement for a given activity of a subject.
