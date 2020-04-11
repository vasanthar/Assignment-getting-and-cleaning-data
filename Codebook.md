---
title: "CodeBook"
---

This codebook describes the variables and the procedure adopted for cleaning the data \
1.	Download the zip file from the link provided. The downloaded file is extracted in a folder. \
2.	The train and the test accelerometer data, subject and the activity value data text files are read in variables.\
3.	Test and train sensor data are combined as one complete list. The subject and activity value data are then added to the list. \
4.	Activity labels and features text files are read in variables. \
5.	Combined data is assigned column names as per features values read from the text file. \
6.	Average and standard deviation for the measurement are extracted from the combined data set. \
7.	Descriptive activity names and variable names are assigned for the average and standard deviation data set.\

Following are the variables used:\
*test_data_x*– test data set \
*test_data_y* – test activity value \
*subject_test* – subject  \
*train_data_x* – train data set \
*train_data_y* – train activity value   \
*subject_train* – subject  \
*activity_labels* – labels for different activities \
*features* – sensor table headings \
*combined_X_labels *– combined test and train data set \
*combined_Y_labels* – combined test and train activity value \
*merge_comp* – complete data set \
*msd* – mean and standard deviation data  \
*msd2* – tidy data set \
