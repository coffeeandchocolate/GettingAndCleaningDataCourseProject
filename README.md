# Getting and Cleaning Data Course Project: README
**By:** coffeeandchocolate

## How it works
There is only one script that does everything for this project:
```run_analysis.R```

Running this script in its entirety will download the zip file that contains 
the data for this project, unzip it, and complete all the steps of the 
assignment:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each 
measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set 
with the average of each variable for each activity and each subject.

The tidy data set generated in Step 5 is named: 
```getdata_courseproject_tidydataset.txt```

This file will be written into your working directory.

To read the tidy data set back into R, use the following code:
```
read.table(outFile, header=TRUE, colClasses=c(rep("factor", 2), rep("numeric", 66)))
```

## Assumptions

1. You have the ```dplyr``` package installed.
2. Your R working directory is already set to the folder where you want the 
zip file to be downloaded. Unzipping the file will create a folder called 
```UCI HAR Dataset``` inside your working directory that contains all the data 
files. If the ```UCI HAR Dataset``` folder already exists inside your working 
directory, this script will overwrite it unless you comment out lines 19-22.

## Overview of raw data structure
The raw data is contained in the files ```X_train.txt``` and ```X_test.txt```. 
The raw data for both the training and the test data sets contain 561 
variables. The file ```features.txt``` contains the names of these variables. 
The ```y_train.txt``` and ```y_test.txt``` files contain numerical codes to 
indicate the activity type for each observation. The ```subject_train.txt``` 
and ```subject_test.txt``` files contain the subject ID numbers for each 
activity.

There are 7,352 observations in the training set and 2,947 observations in the 
test set.

## Step 1: Merge training and test sets

### Constructing a data frame for the training/test data

The training and test data sets have parallel structure, so there is one 
function that can handle both.

The function ```readDataSet``` takes two arguments:

* ```dataset```: use "train" or "test" to indicate which data set to read in
* ```features```: the feature names from ```features.txt```

The function then reads in the following for the indicated data set:

* raw data, assigning the values from features.txt as column names 
(```check.names=FALSE``` to preserve all the special characters, as they will 
be used in Step 2--note that this also means part of Step 4 is happening in 
Step 1)
* the activity codes
* subject ID numbers

The ```cbind``` command is used to combine the subject ID numbers, the activity 
codes, and the rest of the raw data, in that order (for a total of 563 
variables) and return this combined data set.

### Combining the training and test data

The ```rbind``` command is used to combine the training and test data frames 
together. The result is a single data frame that contains 10,299 observations 
and 563 variables.

## Step 2: Extract mean and standard deviation for each measurement

The ```grep``` command is used to find the column indices for all variables in 
the combined data set which contain ```-mean()``` or ```-std()``` in the 
variable name, including those that end in ```-X```, ```-Y```, or ```-Z```. 
There are 66 such variables.

Mean measures without an accompanying standard deviation are not extracted 
(e.g., ```-meanFreq()``` variables, ```gravityMean```, ```tBodyAccMean```).

Columns 1 (subject ID) and 2 (activity code) are appended to the list of column 
indices for mean/standard deviation variables, as these columns will be needed 
in Step 3 and beyond.

The combined training/test dataset is then subsetted based on these column 
indices. The result is a new data frame that contains 10,299 observations and 
68 variables.

## Step 3: Use descriptive activity names to name the activities in the data 
set

The goal for this step is to replace the numbers in the activity code column 
(column 2) with the corresponding labels in the ```activity_labels.txt``` file. 
In doing this, the labels are also manipulated so they conform to best 
practices for text variables:

* Make all characters lowercase
* Remove the underscores
* Column is renamed as ```activity``` and converted into factors

## Step 4: Appropriately label the data set with descriptive variable names

The first part of this was already completed as part of Step 1: applying the 
labels from the file ```features.txt``` as column labels.

The variable names are further modified to make them more descriptive and 
conform to best practices for text variables:

* Fix the "BodyBody" error in several variable names ("Body" should only appear 
once, according to ```features_info.txt```)
* Expand the abbreviations in the existing variable names based on 
```features_info.txt```
    + Replace the ```t``` prefix with ```time```
    + Replace the ```f``` prefix with ```frequency```
    + Replace the ```-XYZ``` postfixes with ```XDirection```, ```YDirection```, 
    and ```ZDirection```, respectively
    + Replace ```Mag``` with ```Magnitude```
    + Replace ```BodyAcc``` with ```BodyLinearAcceleration```
    + Replace ```GravityAcc``` with ```GravityAcceleration```
    + Replace ```Gyro``` with ```AngularVelocity```
    + Replace ```std``` with ```StandardDeviation```
* Remove all special characters
* Move ```Mean``` and ```StandardDeviation``` to the end of all variable names 
for consistency--this way all variable names conform to the convention 
```type + signal details + statistic```

Things that are purposely not done:

* Decomposing the variable names (see forum thread: 
https://class.coursera.org/getdata-012/forum/thread?thread_id=9)
* Making the entire variable name lowercase--the variable names are incredibly 
long and mixed case makes them easier to read

## Step 5: Create a tidy data set with the average of each variable for each 
activity and each subject

The data set created in Step 4 is grouped by subject and activity, then the 
mean is calculated for all remaining variables (which are all numeric) using 
the ```summarise_each``` function in ```dplyr```. The results are then sorted 
by subject and activity and ungrouped. Each row of this data set represents the 
set of 66 features extracted in Step 2 that correspond to a single 
subject-activity pair and is thus tidy. This tall form was chosen to make it 
easier to compare results across different subjects as well as different 
activity types.

The dimensions of the resulting tidy data set are 180 (30 subjects x 6 
activities each) rows and 68 columns (66 features + subject and activity 
columns).

The tidy data set is written to the working directory using ```write.table()``` 
with ```row.names=FALSE```.
