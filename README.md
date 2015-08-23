# GettingAndCleaningDataAssignment

##Assignment from Coursera Getting and Cleaning Data.

The run_analsys.R script requires that the "UCI HAR Dataset" has been uncompressed
and loaded into the working directory.

The question splits the code natually into 5 parts:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The code is extendsively commented in-line so I wont reproduce that too much here,
in short it follos the first 4 stages to create data frame temp_df

That is then melted to reduce it to 4 columns as melted_df which are then
summarised as the tidy_df 

Our resumtiubg observations are the 30 participants each doing six activiites so
we end up with a 180 row data frame