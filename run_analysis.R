
#Setup - Set working directory
setwd("~/Coursera - Data Science Specialization/Getting and Cleaning Data/UCI HAR Dataset")

#1. Merges the training and the test sets to create one data set.

#Read features and activity data
featureNames = read.table("./features.txt", header = FALSE)
activityLabels = read.table("./activity_labels.txt", header = FALSE)

#Read train data
subjectTrain = read.table("./train/subject_train.txt", header = FALSE)
xTrain = read.table("./train/X_train.txt", header = FALSE)
yTrain = read.table("./train/Y_train.txt", header = FALSE)

#Label columns for activity and train data
colnames(activityLabels) = c('ActivityID', 'ActivityType')
colnames(subjectTrain) = "SubjectID"
colnames(xTrain) = featureNames[, 2]
colnames(yTrain) = "ActivityID"

#Merge train data
trainData = cbind(subjectTrain, yTrain, xTrain)

#Read test data
subjectTest = read.table("./test/subject_test.txt", header = FALSE)
xTest = read.table("./test/X_test.txt", header = FALSE)
yTest = read.table("./test/Y_test.txt", header = FALSE)

#Label columns for test data
colnames(subjectTest) = "SubjectID"
colnames(xTest) = featureNames[, 2]
colnames(yTest) = "ActivityID"

#Merge test data
testData = cbind(subjectTest, yTest, xTest)

#Merge train and test data
mergedData = rbind(trainData, testData)

#Get column names of merged data set
colNames  = colnames(mergedData);

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 

#Extract column names
selectedColumns = (grepl("Activity..",colNames) | grepl("Subject..",colNames) | grepl("-mean..",colNames) & !grepl("-meanFreq..",colNames) & !grepl("mean..-",colNames) | grepl("-std..",colNames) & !grepl("-std()..-",colNames));

#Subset merged data based on selected columns to extract required measurements
extractedMeasurements = mergedData[selectedColumns == TRUE]

#3. Use descriptive activity names to name the activities in the data set
extractedMeasurements = join(extractedMeasurements, activityLabels)

#Extract column names - will find an additional column - Activity Type
colNames  = colnames(extractedMeasurements);

#Extract all measurement columns, subject ID, and activity type - leave out activity id
selectedColumns = (grepl("ActivityType",colNames) | grepl("Subject..",colNames) | grepl("-mean..",colNames) & !grepl("-meanFreq..",colNames) & !grepl("mean..-",colNames) | grepl("-std..",colNames) & !grepl("-std()..-",colNames));

#Subset data - Activity ID will not be in the dataset, will find Activity Type instead
finalData = extractedMeasurements[selectedColumns == TRUE]

#Reorder dataset, Activity Type will be in position 2, where Activity ID used to be
finalData = finalData[, c(1, 20, 2:19)]

#Get column names of final data
colNames = colnames(finalData)


#4. Appropriately labels the data set with descriptive variable names. 
#Skipping this step as the data is appropriately labeled

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidyData = aggregate(select(finalData, -(SubjectID:ActivityType)),by=list(ActivityType=finalData$ActivityType, SubjectID=finalData$SubjectID),mean);

# Export the tidyData set 
write.table(tidyData, './tidyData.txt',row.names=FALSE,sep='\t');
