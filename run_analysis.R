# check that data set is present in the working directory
if (!file.exists("UCI HAR Dataset")){stop("No data - UCI HAR Dataset must be in the workign directory ")}

# will need to check that plr and dplyr libraries are present
library(plyr)
library(dplyr)
# read in the activity labels
activitylbls <- read.table("UCI HAR Dataset/activity_labels.txt")

# first go-around is the test data

# read the subject
subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(subject) <- "subject"
# read the y_test, give it a meaningful name by joining it ti the activities table
y <- read.table("UCI HAR Dataset/test/y_test.txt")
ans1 <- join(y, activitylbls)
activity <- ans1[,2]

# read the X_test
X<- read.table("UCI HAR Dataset/test/X_test.txt")
# now create mean and sd from X
X_mean <- rowMeans(X)
X_sd <- apply(X, 1, sd)

# read the body_acc_x_test
body_acc_x <- read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
# now create mean and sd from body_acc_x
body_acc_x_mean <- rowMeans(body_acc_x)
body_acc_x_sd <- apply(body_acc_x, 1, sd)
# read the body_acc_y_test
body_acc_y <- read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
# now create mean and sd from body_acc_y
body_acc_y_mean <- rowMeans(body_acc_y)
body_acc_y_sd <- apply(body_acc_y, 1, sd)
# read the body_acc_z_test
body_acc_z <- read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")
# now create mean and sd from body_acc_z
body_acc_z_mean <- rowMeans(body_acc_z)
body_acc_z_sd <- apply(body_acc_z, 1, sd)

# read the body_gyro_x_test
body_gyro_x <- read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
# now create mean and sd from body_gyro_x
body_gyro_x_mean <- rowMeans(body_gyro_x)
body_gyro_x_sd <- apply(body_gyro_x, 1, sd)
# read the body_gyro_y_test
body_gyro_y <- read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
# now create mean and sd from body_gyro_y
body_gyro_y_mean <- rowMeans(body_gyro_y)
body_gyro_y_sd <- apply(body_gyro_y, 1, sd)
# read the body_gyro_z_test
body_gyro_z<- read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")
# now create mean and sd from body_gyro_z
body_gyro_z_mean <- rowMeans(body_gyro_z)
body_gyro_z_sd <- apply(body_gyro_z, 1, sd)

# read the total_acc_x_test
total_acc_x <- read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
# now create mean and sd from total_acc_x
total_acc_x_mean <- rowMeans(total_acc_x)
total_acc_x_sd <- apply(total_acc_x, 1, sd)
# read the total_acc_y_test
total_acc_y <- read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
# now create mean and sd from total_acc_y
total_acc_y_mean <- rowMeans(total_acc_y)
total_acc_y_sd <- apply(total_acc_y, 1, sd)
# read the total_acc_z_test
total_acc_z <- read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")
# now create mean and sd from total_acc_z
total_acc_z_mean <- rowMeans(total_acc_z)
total_acc_z_sd <- apply(total_acc_z, 1, sd)

#bind these together to form the tidy data frame 'tidydf_test'
tidydf_test <- cbind(subject, activity,
                X_mean, X_sd,
                body_acc_x_mean, body_acc_x_sd, 
                body_acc_y_mean, body_acc_y_sd,
                body_acc_z_mean, body_acc_z_sd,
                body_gyro_x_mean, body_gyro_x_sd, 
                body_gyro_y_mean, body_gyro_y_sd,
                body_gyro_z_mean, body_gyro_z_sd,
                total_acc_x_mean, total_acc_x_sd, 
                total_acc_y_mean, total_acc_y_sd,
                total_acc_z_mean, total_acc_z_sd
                )

# second go-around is the train data

# read the subject
subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(subject) <- "subject"
# read the y_test, give it a meaningful name by joining it ti the activities table
y <- read.table("UCI HAR Dataset/train/y_train.txt")
ans1 <- join(y, activitylbls)
activity <- ans1[,2]

# read the X_test
X<- read.table("UCI HAR Dataset/train/X_train.txt")
# now create mean and sd from X
X_mean <- rowMeans(X)
X_sd <- apply(X, 1, sd)

# read the body_acc_x_train
body_acc_x <- read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
# now create mean and sd from body_acc_x
body_acc_x_mean <- rowMeans(body_acc_x)
body_acc_x_sd <- apply(body_acc_x, 1, sd)
# read the body_acc_y_train
body_acc_y <- read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
# now create mean and sd from body_acc_y
body_acc_y_mean <- rowMeans(body_acc_y)
body_acc_y_sd <- apply(body_acc_y, 1, sd)
# read the body_acc_z_train
body_acc_z <- read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")
# now create mean and sd from body_acc_z
body_acc_z_mean <- rowMeans(body_acc_z)
body_acc_z_sd <- apply(body_acc_z, 1, sd)

# read the body_gyro_x_train
body_gyro_x <- read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
# now create mean and sd from body_gyro_x
body_gyro_x_mean <- rowMeans(body_gyro_x)
body_gyro_x_sd <- apply(body_gyro_x, 1, sd)
# read the body_gyro_y_train
body_gyro_y <- read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
# now create mean and sd from body_gyro_y
body_gyro_y_mean <- rowMeans(body_gyro_y)
body_gyro_y_sd <- apply(body_gyro_y, 1, sd)
# read the body_gyro_z_train
body_gyro_z<- read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")
# now create mean and sd from body_gyro_z
body_gyro_z_mean <- rowMeans(body_gyro_z)
body_gyro_z_sd <- apply(body_gyro_z, 1, sd)

# read the total_acc_x_train
total_acc_x <- read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
# now create mean and sd from total_acc_x
total_acc_x_mean <- rowMeans(total_acc_x)
total_acc_x_sd <- apply(total_acc_x, 1, sd)
# read the total_acc_y_train
total_acc_y <- read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
# now create mean and sd from total_acc_y
total_acc_y_mean <- rowMeans(total_acc_y)
total_acc_y_sd <- apply(total_acc_y, 1, sd)
# read the total_acc_z_train
total_acc_z <- read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")
# now create mean and sd from total_acc_z
total_acc_z_mean <- rowMeans(total_acc_z)
total_acc_z_sd <- apply(total_acc_z, 1, sd)

#bind these together to form the tidy data frame 'tidydf_train'
tidydf_train <- cbind(subject, activity,
                     X_mean, X_sd,
                     body_acc_x_mean, body_acc_x_sd, 
                     body_acc_y_mean, body_acc_y_sd,
                     body_acc_z_mean, body_acc_z_sd,
                     body_gyro_x_mean, body_gyro_x_sd, 
                     body_gyro_y_mean, body_gyro_y_sd,
                     body_gyro_z_mean, body_gyro_z_sd,
                     total_acc_x_mean, total_acc_x_sd, 
                     total_acc_y_mean, total_acc_y_sd,
                     total_acc_z_mean, total_acc_z_sd
)
