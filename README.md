# GettingAndCleaningDataAssignment

##Assignment from Coursera Getting and Cleaning Data.

The run_analsys.R script requires that the "UCI HAR Dataset" has been uncompressed
and loaded into the working directory.

Our resulting observations are the 30 participants each doing six activiites so
we end up with a 180 row (observation) data frame in the wide form

The question splits the code natually into 5 parts:

## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names. 
## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The code is extendsively commented in-line so I will reproduce that here,
in short it follows the first 4 stages to create data frame temp_df
* check that data set is present in the working directory
* check that plr and dplyr libraries are present
* read in the activity labels
* read in the features.txt of column names in the 'X' tables 
* create a selection vector using grep that matches only the elements containing std or mean
* create a names_vec to use later
* read the subject
* read the 'y' data , giving it a meaningful name by joining it to the activities table
* read the 'X' data 
* row bind test and training sets to create the full set 
* reduce X to just the columns containing mean and std in the descriptio
* bind together subject activity and 'X' data for our temp data set
* this is then melted to reduce it to 4 columns as melted_df
* which are then summarised as the tidy_df 
* which is output to file tidy.txt

