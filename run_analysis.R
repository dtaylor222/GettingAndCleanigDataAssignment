# check that data set is present in the working directory
if (!file.exists("UCI HAR Dataset")){stop("No data - UCI HAR Dataset must be in the workign directory ")}

# will need to check that plr and dplyr libraries are present
library(plyr)
library(dplyr)

# read in the activity labels
activitylbls <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)

# read in the features.txt of column names in the 'X' tables 
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
# create a selection vector using grep that matches only the elements containing std() or mean()
select_vec = grep("std()|mean()", features[,2], perl = TRUE)
# create a names_vec to use later
names_vec <- features[select_vec, 2]

# first go-around is the test data

# read the subject
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",stringsAsFactors = FALSE)
names(subject_test) <- "subject"
# read the y_test, give it a meaningful name by joining it to the activities table
y_test <- read.table("UCI HAR Dataset/test/y_test.txt",stringsAsFactors = FALSE)
ans1_test <- join(y_test, activitylbls)
activity_test <- ans1_test[,2]

# read the X_test
X_test<- read.table("UCI HAR Dataset/test/X_test.txt")
#names(X_test)<- activitylbls
# reduce it to just the mean and std columns
#X_test <- X_test[,select_vec]

# second go-around is the train data

# read the subject
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",stringsAsFactors = FALSE)
names(subject_train) <- "subject"
# read the y_test, give it a meaningful name by joining it ti the activities table
y_train <- read.table("UCI HAR Dataset/train/y_train.txt",stringsAsFactors = FALSE)
ans1_train <- join(y_train, activitylbls)
activity_train <- ans1_train[,2]

# read the X_train
X_train<- read.table("UCI HAR Dataset/train/X_train.txt")
#names(X_train)<- activitylbls

# bow bind test and training sets to create the full set 
subject <- rbind(subject_test, subject_train)
activity <- c(activity_test ,activity_train)
X <- rbind(X_test, X_train)
# clear the intermdiates 
rm(X_test, X_train,  
   subject_test, subject_train, y_test, y_train,
   ans1_train, ans1_test)

# reduce X to just the mean and std columns
X <- X[,select_vec]
names(X) <- names_vec
# cbind them together for our tidy data set
tidy_df <- cbind(subject, activity, X)
