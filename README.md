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

—Variables Used—

Variables —> Description

- featureNames —> contains all the feature names
- activityLables —> contains all activity labels
- subjectTrain —> contains dataset of file subject_train.txt
- xTrain —> contains dataset of file X_train.txt
- yTrain —> contains dataset of file Y_train.txt
- trainData —> contains merger of subjectTrain, xTrain, yTrain
- subjectTest —> contains dataset of subject_test.txt
- xTest —> contains dataset of file X_test.txt
- yTest —> contains dataset of file Y_text.txt
- testData —> contains merger of subjectTest, xTest, yTest
- mergedData -> contains merger of trainData and testData
- colNames —> contains column names of dataset. This variable is reused throughout the program to store column names of the relevant dataset at that stage
- extractedMeasurements —> contains dataset for Subject ID, Activity ID, and the mean and standard deviation measurements
- finalData —> contains Subject ID, Activity Type, and the mean and standard deviation measurements
- tidyData —> contains Subject ID, Activity Type, and aggregate of the mean and standard deviation measurements


—Codebook—
=============================================================================================================

   tidyData.ActivityType

-------------------------------------------------------------------------------------------------------------

   Storage mode: integer
   Measurement: nominal

          Values and labels    N    Percent 
                                            
   1   'LAYING'               30   16.7 16.7
   2   'SITTING'              30   16.7 16.7
   3   'STANDING'             30   16.7 16.7
   4   'WALKING'              30   16.7 16.7
   5   'WALKING_DOWNSTAIRS'   30   16.7 16.7
   6   'WALKING_UPSTAIRS'     30   16.7 16.7

=============================================================================================================

   tidyData.SubjectID

-------------------------------------------------------------------------------------------------------------

   Storage mode: integer
   Measurement: interval

            Min:   1.000
            Max:  30.000
           Mean:  15.500
       Std.Dev.:   8.655
       Skewness:   0.000
       Kurtosis:  -1.203

=============================================================================================================

   tidyData.tBodyAccMag.mean..

-------------------------------------------------------------------------------------------------------------

   Storage mode: double
   Measurement: interval

            Min:  -0.986
            Max:   0.645
           Mean:  -0.497
       Std.Dev.:   0.472
       Skewness:   0.231
       Kurtosis:  -1.587

=============================================================================================================

   tidyData.tBodyAccMag.std..

-------------------------------------------------------------------------------------------------------------

   Storage mode: double
   Measurement: interval

            Min:  -0.986
            Max:   0.428
           Mean:  -0.544
       Std.Dev.:   0.430
       Skewness:   0.464
       Kurtosis:  -1.194

=============================================================================================================

   tidyData.tGravityAccMag.mean..

-------------------------------------------------------------------------------------------------------------

   Storage mode: double
   Measurement: interval

            Min:  -0.986
            Max:   0.645
           Mean:  -0.497
       Std.Dev.:   0.472
       Skewness:   0.231
       Kurtosis:  -1.587

=============================================================================================================

   tidyData.tGravityAccMag.std..

-------------------------------------------------------------------------------------------------------------

   Storage mode: double
   Measurement: interval

            Min:  -0.986
            Max:   0.428
           Mean:  -0.544
       Std.Dev.:   0.430
       Skewness:   0.464
       Kurtosis:  -1.194

=============================================================================================================

   tidyData.tBodyAccJerkMag.mean..

-------------------------------------------------------------------------------------------------------------

   Storage mode: double
   Measurement: interval

            Min:  -0.993
            Max:   0.434
           Mean:  -0.608
       Std.Dev.:   0.395
       Skewness:   0.360
       Kurtosis:  -1.388

=============================================================================================================

   tidyData.tBodyAccJerkMag.std..

-------------------------------------------------------------------------------------------------------------

   Storage mode: double
   Measurement: interval

            Min:  -0.995
            Max:   0.451
           Mean:  -0.584
       Std.Dev.:   0.422
       Skewness:   0.425
       Kurtosis:  -1.319

=============================================================================================================

   tidyData.tBodyGyroMag.mean..

-------------------------------------------------------------------------------------------------------------

   Storage mode: double
   Measurement: interval

            Min:  -0.981
            Max:   0.418
           Mean:  -0.565
       Std.Dev.:   0.397
       Skewness:   0.313
       Kurtosis:  -1.422

=============================================================================================================

   tidyData.tBodyGyroMag.std..

-------------------------------------------------------------------------------------------------------------

   Storage mode: double
   Measurement: interval

            Min:  -0.981
            Max:   0.300
           Mean:  -0.630
       Std.Dev.:   0.336
       Skewness:   0.482
       Kurtosis:  -1.027

=============================================================================================================

   tidyData.tBodyGyroJerkMag.mean..

-------------------------------------------------------------------------------------------------------------

   Storage mode: double
   Measurement: interval

            Min:  -0.997
            Max:   0.088
           Mean:  -0.736
       Std.Dev.:   0.276
       Skewness:   0.660
       Kurtosis:  -0.646

=============================================================================================================

   tidyData.tBodyGyroJerkMag.std..

-------------------------------------------------------------------------------------------------------------

   Storage mode: double
   Measurement: interval

            Min:  -0.998
            Max:   0.250
           Mean:  -0.755
       Std.Dev.:   0.265
       Skewness:   1.016
       Kurtosis:   0.546

=============================================================================================================

   tidyData.fBodyAccMag.mean..

-------------------------------------------------------------------------------------------------------------

   Storage mode: double
   Measurement: interval

            Min:  -0.987
            Max:   0.587
           Mean:  -0.537
       Std.Dev.:   0.450
       Skewness:   0.464
       Kurtosis:  -1.197

=============================================================================================================

   tidyData.fBodyAccMag.std..

-------------------------------------------------------------------------------------------------------------

   Storage mode: double
   Measurement: interval

            Min:  -0.988
            Max:   0.179
           Mean:  -0.621
       Std.Dev.:   0.352
       Skewness:   0.493
       Kurtosis:  -1.134

=============================================================================================================

   tidyData.fBodyBodyAccJerkMag.mean..

-------------------------------------------------------------------------------------------------------------

   Storage mode: double
   Measurement: interval

            Min:  -0.994
            Max:   0.538
           Mean:  -0.576
       Std.Dev.:   0.430
       Skewness:   0.424
       Kurtosis:  -1.293

=============================================================================================================

   tidyData.fBodyBodyAccJerkMag.std..

-------------------------------------------------------------------------------------------------------------

   Storage mode: double
   Measurement: interval

            Min:  -0.994
            Max:   0.316
           Mean:  -0.599
       Std.Dev.:   0.408
       Skewness:   0.453
       Kurtosis:  -1.301

=============================================================================================================

   tidyData.fBodyBodyGyroMag.mean..

-------------------------------------------------------------------------------------------------------------

   Storage mode: double
   Measurement: interval

            Min:  -0.987
            Max:   0.204
           Mean:  -0.667
       Std.Dev.:   0.317
       Skewness:   0.582
       Kurtosis:  -0.793

=============================================================================================================

   tidyData.fBodyBodyGyroMag.std..

-------------------------------------------------------------------------------------------------------------

   Storage mode: double
   Measurement: interval

            Min:  -0.981
            Max:   0.237
           Mean:  -0.672
       Std.Dev.:   0.292
       Skewness:   0.493
       Kurtosis:  -0.955

=============================================================================================================

   tidyData.fBodyBodyGyroJerkMag.mean..

-------------------------------------------------------------------------------------------------------------

   Storage mode: double
   Measurement: interval

            Min:  -0.998
            Max:   0.147
           Mean:  -0.756
       Std.Dev.:   0.262
       Skewness:   0.957
       Kurtosis:   0.276

=============================================================================================================

   tidyData.fBodyBodyGyroJerkMag.std..

-------------------------------------------------------------------------------------------------------------

   Storage mode: double
   Measurement: interval

            Min:  -0.998
            Max:   0.288
           Mean:  -0.772
       Std.Dev.:   0.250
       Skewness:   1.137
       Kurtosis:   1.122