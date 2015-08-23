# check that data set is present in the working directory
if (!file.exists("UCI HAR Dataset")){stop("No data - UCI HAR Dataset must be in the workign directory ")}

# will need to check that plr and dplyr and reshape2 libraries are present
library(plyr)
library(dplyr)
library(reshape2)

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

# row bind test and training sets to create the full set 
subject <- rbind(subject_test, subject_train)
activity <- c(activity_test ,activity_train)
X <- rbind(X_test, X_train)


# reduce X to just the mean and std columns
X <- X[,select_vec]
names(X) <- names_vec
# cbind them together for our temp data set
temp_df <- cbind(subject, activity, X)

# clear the intermediates 
rm(X_test, X_train,
   subject_test, subject_train,
   y_test, y_train,
   ans1_train, ans1_test,
   activity_train, activity_test,
   activitylbls, activity,
   features, subject,
   names_vec,
   select_vec, 
   X
   )
# now melt this large blob of data to a "narrow" form that we can summarise
melted_df <- melt(temp_df, id = c("subject", "activity"))

# what we want is the 30 subjects 6 activities summarised - i.e. 180 rows of "wide form"
tidy_df <- dcast(melted_df, subject + activity ~ variable, mean)

# now melt that in turn to produce the cleaner "long" form on the basis that each metric
# is an observation in it own right (which could be debated !) easier to use though
# and is directly equivalent and reversible as no data altered
tidiest_df <- melt(tidy_df, id = c("subject", "activity"))

# write that tidied data frame out to a file 
write.table(tidiest_df, file = "tidy_data.txt", row.names = FALSE)