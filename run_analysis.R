# --------------------------
# Getting and Cleaning Data
# Course Project
# By: coffeeandchocolate
# --------------------------

# -------
# STEP 0:
# Set up
# -------
# Load the needed libraries
library(dplyr)

# Set output file name
outFile <- "getdata_courseproject_tidydataset.txt"

# Download the zip file and unzip it
# Comment out lines 19-22 if these files already exist in the working directory
dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "getdata_projectfiles_UCI_HAR_Dataset.zip"
download.file(url=dataURL, destfile=zipFile, method="curl", quiet=TRUE)
unzip(zipFile)

# ------
# STEP 1:
# Merge the training and the test sets to create one data set.
# ------

# Read in column labels from features.txt and create vector
features <- read.table("UCI HAR Dataset//features.txt", stringsAsFactors=FALSE)
features <- features[[2]]

# Define a function to read in the training or test data set and prepare it for 
# merging.
#
# Arguments:
# - dataset = "train" or "test"
# - features = vector of feature labels
#
# Returns:
# A data frame containing the specified data set, with subject ID as the first 
# column, activity code as the second column, and then the rest of the raw data
readDataSet <- function(dataset, features) {
  
  # error check arguments
  type = c("train", "test")
  if (!(dataset %in% type)) {
    stop("Please use \"train\" or \"test\" as the first argument.")
  }
  if (class(features) != "character" | length(features) != 561) {
    stop("Please make sure features is a character vector of length 561.")
  }
  
  # set file path relative to wd and create variables for file names
  path <- paste0("UCI HAR Dataset//", dataset, "//")
  dataFile <- paste0(path, "X_", dataset, ".txt")
  codeFile <- paste0(path, "y_", dataset, ".txt")
  subjFile <- paste0(path, "subject_", dataset, ".txt")
  
  # read in the raw data, activity codes, and subject IDs for the specified 
  # data set
  rawData <- read.table(dataFile, col.names=features, check.names=FALSE)
  rawCodes <- read.table(codeFile, col.names="actCode", colClasses="character")
  rawSubjID <- read.table(subjFile, col.names="subject", colClasses="factor")
  
  # bind the columns together and return the data frame
  return(cbind(rawSubjID, rawCodes, rawData))
}

# Combine the training and test data sets into one data frame
completeData <- rbind(readDataSet("train", features), 
                      readDataSet("test", features))

# -------
# STEP 2:
# Extract only the measurements on the mean and standard deviation for each 
# measurement. 
# -------

# Get column indices for all variables that include "-mean()" or "-std()" in 
# the feature name; also include the first two columns, which will be needed to 
# create the tidy data set.
meanStd <- c(1, 2, grep("-mean\\(\\)|-std\\(\\)", names(completeData)))

# Subset based on the indices and store in new data frame
meanStdData <- completeData[,meanStd]

# -------
# STEP 3:
# Use descriptive activity names to name the activities in the data set
# -------

# Read in the activity labels file and extract the labels only
# Fix labels so they are all lowercase, no underscores
actLabels <- read.table("UCI HAR Dataset//activity_labels.txt", 
                        stringsAsFactors=FALSE)
actLabels <- tolower(gsub("_", "", actLabels[[2]]))

# Replace all the numbers in the actCode column with their labels
for (i in 1:length(actLabels)) {
  meanStdData$actCode[meanStdData$actCode==as.character(i)] <- actLabels[i]
}

# rename the column to conform to best naming practices and convert to factor
meanStdData <- rename(meanStdData, activity=actCode)
meanStdData$activity <- as.factor(meanStdData$activity)

# -------
# STEP 4:
# Appropriately label the data set with descriptive variable names. 
# -------

# Get the current variable names and store them
newNames <- names(meanStdData)

# Fix the "BodyBody" error
newNames <- sub("BodyBody", "Body", newNames)

# Expand abbreviations
newNames <- sub("^t", "time", newNames)
newNames <- sub("^f", "frequency", newNames)
newNames <- sub("X$", "XDirection", newNames)
newNames <- sub("Y$", "YDirection", newNames)
newNames <- sub("Z$", "ZDirection", newNames)
newNames <- sub("Mag", "Magnitude", newNames)
newNames <- sub("BodyAcc", "BodyLinearAcceleration", newNames)
newNames <- sub("GravityAcc", "GravityAcceleration", newNames)
newNames <- sub("Gyro", "AngularVelocity", newNames)
newNames <- sub("std", "StandardDeviation", newNames)
newNames <- sub("mean", "Mean", newNames)

# Replace all special characters
newNames <- sub("\\(\\)", "", newNames)
newNames <- gsub("-", "", newNames)

# Move "Mean" and "StandardDeviation" to end of variable names
newNames <- sub("MeanXDirection", "XDirectionMean", newNames)
newNames <- sub("MeanYDirection", "YDirectionMean", newNames)
newNames <- sub("MeanZDirection", "ZDirectionMean", newNames)
newNames <- sub("StandardDeviationXDirection", "XDirectionStandardDeviation", 
                newNames)
newNames <- sub("StandardDeviationYDirection", "YDirectionStandardDeviation", 
                newNames)
newNames <- sub("StandardDeviationZDirection", "ZDirectionStandardDeviation", 
                newNames)

# Assign new variable names to meanStdData
colnames(meanStdData) <- newNames

# -------
# STEP 5:
# From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.
# -------

# Create variable to store tidy data set
tidyData <- meanStdData

# First group by subject and activity, calculate the means of all variables,
# sort by subject and then activity, and finally ungroup the data set
tidyData <- tidyData %>%
  group_by(subject, activity) %>%
  summarise_each(funs(mean)) %>%
  arrange(subject, activity) %>%
  ungroup()

# Update variable names
tidyNames <- names(tidyData)
tidyNames <- sub("^time", "meanTime", tidyNames)
tidyNames <- sub("^frequency", "meanFrequency", tidyNames)
colnames(tidyData) <- tidyNames

# Write the output file
write.table(tidyData, file=outFile, row.names=FALSE)

# Check output by reading the data back in
# tidyDataCheck <- read.table(outFile, header=TRUE, colClasses=c(rep("factor", 2), 
# rep("numeric", 66)))