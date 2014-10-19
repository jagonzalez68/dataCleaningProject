library(data.table)
library(reshape2)
getwd()

# Run this only the first time to download the file
#url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(url,destfile="..\\data\\mydata.zip")
#date()
# [1] "Thu Oct 09 22:19:22 2014"

# Assume that the UCIHARDataset directory is contained in a data directory going one 
directory back (../data/)
# Reading the three train files into data tables
subject_train <- read.table("..\\data\\UCIHARDataset\\train\\subject_train.txt")
X_train <- read.table("..\\data\\UCIHARDataset\\train\\X_train.txt")
y_train <- read.table("..\\data\\UCIHARDataset\\train\\y_train.txt")

# Reading the three test files into data tables
subject_test <- read.table("..\\data\\UCIHARDataset\\test\\subject_test.txt")
X_test <- read.table("..\\data\\UCIHARDataset\\test\\X_test.txt")
y_test <- read.table("..\\data\\UCIHARDataset\\test\\y_test.txt")

# Reading the feature names
fnames <- read.table("..\\data\\UCIHARDataset\\features.txt")
fnames <- data.frame(lapply(fnames, as.character), stringsAsFactors=FALSE)

# Creating the train set as a data.table and adding to it the activity and
# subject columns
train_set <- data.table(X_train)
train_set <- train_set[, activity := y_train]
train_set <- train_set[, subject := subject_train]

# Creating the test set as a data.table and adding to it the activity and
# subject columns
test_set <- data.table(X_test)
test_set <- test_set[, activity := y_test]
test_set <- test_set[, subject := subject_test]


# Merging the training and testing subsets
data_set <- rbind(train_set,test_set)

# Obtain the mean and standar deviation for each measure
means <- sapply(data_set,mean)
stdev <- sapply(data_set,sd)
means
stdev

# Giving understandable names to the data
data_set$activity[data_set$activity == 1] <- "Walking"
data_set$activity[data_set$activity == 2] <- "Walking_Upstairs"
data_set$activity[data_set$activity == 3] <- "Waking_Downstairs"
data_set$activity[data_set$activity == 4] <- "Sitting"
data_set$activity[data_set$activity == 5] <- "Standing"
data_set$activity[data_set$activity == 6] <- "Laying"

# Giving understandable names to the features
# These names are originally stored in a file
# which was previously read and stored in the
# fnames data frame.
for(i in seq(1,nrow(fnames)))
{
  setnames(data_set,i,fnames[i,2])
}

# Creating the new table with the AVERAGE for each VARIABLE
# for each ACTIVITY and each SUBJECT
# First, get the long table using melt with subject and activity as id's
data_set_long <- melt(data_set, id.vars = c("subject", "activity"))

# Now, aggregate by subject and activity for each variable and get the mean value
# This is the final dataset for step 5
data_set_wide <- dcast(data_set_long, subject + activity ~ variable, fun.aggregate = mean)

# Giving an understandable name to the final dataset
activity_data_set <- data_set_wide

# Printing the final tidy dataset
activity_data_set
