# Reading trainings tables:
train_x <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("./UCI HAR Dataset/train/y_train.txt")
sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Reading testing tables:
test_x <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("./UCI HAR Dataset/test/y_test.txt")
sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Reading feature vector:
features <- read.table('./UCI HAR Dataset/features.txt')

# Reading activity labels:
activityLabels = read.table('./UCI HAR Dataset/activity_labels.txt')

# Assigning Column Names
colnames(train_x) <- features[,2] 
colnames(train_y) <-"activityId"
colnames(sub_train) <- "subjectId"

colnames(test_x) <- features[,2] 
colnames(test_y) <- "activityId"
colnames(sub_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

# Merge All data into one set 
trainMerge <- cbind(train_y, sub_train, train_x)
testMerge <- cbind(test_y, sub_test, test_x)
MergeData <- rbind(trainMerge, testMerge)

# Get all Column Names
colNames <- colnames(MergeData)

# create a vector to get mean and std. deviation
mean_and_stddev <- (grepl("activityId" , colNames) | 
                     grepl("subjectId" , colNames) | 
                     grepl("mean.." , colNames) | 
                     grepl("std.." , colNames) 
)

MeanAndStddev <- MergeData[ , mean_and_stddev == TRUE]

# Using dplyr package for merging data
library(dplyr)
DataSetwithActivity <- inner_join(MeanAndStddev,activityLabels,by='activityId')

# Using dplyr group_by function to Create a second, independent tidy data set with the average of each variable for each activity and each subject:
TidyDataSet <- DataSetwithActivity %>% group_by(subjectId,activityId,activityType) %>% summarize_if(is.numeric,mean)

# Writing tidy datadata to a file
write.table(TidyDataSet, "TidyDataSet.txt", row.name=FALSE)

