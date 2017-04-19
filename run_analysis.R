# The name of a file in the raw data -- if called with first argument
# "y" and second argument "train", return the character vector "UCI HAR
# Dataset/train/y_train.txt".
file <- function (y_or_subject_or_X, train_or_test) {
  paste0("UCI HAR Dataset/", train_or_test, "/", y_or_subject_or_X, "_",
         train_or_test, ".txt")
}

# Read and concatenate raw data -- if called as read("X"), return all
# the rows from "UCI HAR Dataset/train/X_train.txt" and "UCI HAR
# Dataset/test/X_test.txt", concatenated together. It's a slim wrapper
# around read.tables(), and all arguments except for the first are
# passed along to read.tables().
read <- function (y_or_subject_or_X, ...) {
  rbind(read.table(file(y_or_subject_or_X, "train"), ...),
        read.table(file(y_or_subject_or_X, "test"), ...))
}

# Read the activity for each row of raw data. The activities come from
# the "y_train.txt" and "y_test.txt" files, while the activity labels
# come from "activity_labels.txt".
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity <- factor(read("y")[[1]], labels = activity_labels[[2]])

# Read the subject for each row of raw data -- the integer corresponding
# to the volunteer who produced the data.
subject <- read("subject")[[1]]

# Read and select the raw variables. Step one is to get the variable
# names from "features.txt" ...
features <- read.table("UCI HAR Dataset/features.txt")
# ... then read the data from "X_train.txt" and "X_test.txt" ...
X <- read("X", col.names = features[[2]], check.names = FALSE)
# Select only the mean and standard deviation raw variables -- the ones
# whose names contain either "mean()" or "std()" ...
X <- X[grep("mean\\()|std\\()", names(X), value = TRUE)]
# Give descriptive names to the tidy data -- so "tGravityAcc-mean()-X"
# -> "gravitymeanx", "tBodyGyroJerkMag-std()" ->
# "gyroscopejerkmagnitudestandarddeviation", "fBodyAcc-mean()-X" ->
# "bodyfrequencymeanx", etc. See the code book for details ...
names(X) <- sub("BodyBody", "Body", names(X))
names(X) <- sub("Acc", "", names(X))
names(X) <- sub("BodyGyro", "gyroscope", names(X))
names(X) <- sub("Mag", "magnitude", names(X))
names(X) <- sub("std\\()", "standarddeviation", names(X))
names(X) <- sub("^f(.*?)-", "\\1frequency", names(X))
names(X) <- sub("^t", "", names(X))
names(X) <- tolower(names(X))
names(X) <- gsub("[^a-z]", "", names(X))

# Combine the activities, subjects, and selected variables: For each
# activity and subject pair, get the average of each selected variable.
tidy_data <- aggregate(X, list(activity = activity, subject = subject), mean)
# Write the resulting tidy data to a new "tidy_data.txt" file ...
write.table(tidy_data, "tidy_data.txt", row.name = FALSE)

# All done!
