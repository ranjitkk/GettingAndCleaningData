---
title: "CodeBook"
output: html_document
---

## About R Script

File with R code "run_analysis.R" perform 5 following steps (in accordance assigned task of course work):

Merging the training and the test sets to create one data set.
- Reading files
    - Reading trainings tables
    - Reading testing tables
    - Reading feature vector
    - Reading activity labels
- Assigning column names
- Merging all data in one set
- Extracting only the measurements on the mean and standard deviation for each measurement
    - Reading column names
    - Create vector for defining ID, mean and standard deviation
    - Making nessesary subset from setAllInOne
- Using descriptive activity names to name the activities in the data set
- Appropriately labeling the data set with descriptive variable names
- Creating a second, independent tidy data set with the average of each variable for each activity and each subject
    -  Making second tidy data set
    -  Writing second tidy data set in txt file

## About Variables
# Datasets for downloaded files
- train_x
- train_y
- test_x
- test_y
- sub_test
- sub_train
- features
- activityLables

# Merge Data Sets
- trainMerge
- testMerge
- MergeData
- DataSetwithActivity

# Final Tidy Data Set
- TidyDataSet