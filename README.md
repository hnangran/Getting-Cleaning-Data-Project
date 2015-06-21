# Getting-Cleaning-Data-Project
Repository for project in Coursera course "Getting and Cleaning Data"


The code file “run_analysis.R” assumes that the data files have been downloaded in the working directory. The first line of code sets the working directory.

1. Merge the training and test sets to create one data set
- Read the feature names and activity labels into data sets using read.table(). 
- Read the subject_train , X_train, and Y_train text files into data sets using read.table(). 
- Assign column names to each data set retrieved above
- Merge the subject_train, X_train, Y_train into a consolidated data set trainData using cbind()
- Repeat this procedure to create a consolidated data set testData and assign column names to testData
- merge trainData and testData using rbind()
- Get the column names of this merged data set

2. Extracts only the measurements on the mean and standard deviation for each measurement. 
- Extract the columns needed - Activity ID, Subject ID, mean, std. dev. using grep1 and regex. 
- Subset the merged data using the extracted columns into new dataset extractedMeasurements

3. Use descriptive activity names to name the activities in the data set
- Join the extractedMeasurements dataset with activityLables dataset using join(). This will join the two datasets on ActivityID and add a new column ActivityType.
- I want to replace ActivityID with ActivityType. To do this I extract the columns as in step 2 - extract ActivityType instead of ActivityID, keep the rest of the columns as is, and subset the extractedMeasurements data set using this new list of selected columns, this will give me finalData that contains Subject ID, Activity Type, and the data on measurements.
- Activity Type is the last column in this list, I want it to be column 2 after Subject ID, so I rearrange finalData to be Subject ID, Activity Type, and measurements
- I get the column names of this finalData set using colNames()

4. Appropriately labels the data set with descriptive variable names.
- Skipped this step because at this point the data set is appropriately ordered and labeled.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- use the aggregate() and select() functions to aggregate the measurements ignoring Subject ID and Activity Type
- write this tidyData set into a text file using write.table() row.names=FALSE

—Codebook—

Variables —> Description

featureNames —> contains all the feature names
activityLables —> contains all activity labels
subjectTrain —> contains dataset of file subject_train.txt
xTrain —> contains dataset of file X_train.txt
yTrain —> contains dataset of file Y_train.txt
trainData —> contains merger of subjectTrain, xTrain, yTrain
subjectTest —> contains dataset of subject_test.txt
xTest —> contains dataset of file X_test.txt
yTest —> contains dataset of file Y_text.txt
testData —> contains merger of subjectTest, xTest, yTest
mergedData -> contains merger of trainData and testData
colNames —> contains column names of dataset. This variable is reused throughout the program to store column names of the relevant dataset at that stage.
extractedMeasurements —> contains dataset for Subject ID, Activity ID, and the mean and standard deviation measurements
finalData —> contains Subject ID, Activity Type, and the mean and standard deviation measurements
tidyData —> contains Subject ID, Activity Type, and aggregate of the mean and standard deviation measurements
