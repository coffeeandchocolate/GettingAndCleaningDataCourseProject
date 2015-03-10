# Getting and Cleaning Data Course Project: Code Book
**Data set:** ```getdata_courseproject_tidydataset.txt```  
**By:** coffeeandchocolate

## Overview of tidy data structure

This data set is derived from the raw training and test data available at:
```
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
```

This data set contains data from 30 volunteers, each of whom performed six 
different activities while wearing a Samsung Galaxy S II smartphone. This 
represents a completely crossed design.

Each row of this data set represents a set of 66 variables corresponding to a 
single subject-activity pair and is thus tidy. The dimensions of this data set 
are 180 (30 subjects x 6 activities each) rows and 68 columns.

This tall form was chosen to make it easier to compare results across different 
subjects as well as different activity types.

## Description of variables

Variables are listed in their column order.

### Fixed variables (columns 1-2)

The first two variables are fixed variables describing the subject-activity 
pair for the observation.

**subject (character):** Unique ID number for each subject. Numbers are from 
1-30. ID numbers are treated as characters rather than as numeric because they 
are categorical variables (i.e., it is nonsensical to calculate with them)

**activity (factor):** Activity type. The six levels of this factor are:

* laying
* sitting
* standing
* walking
* walkingdownstairs
* walkingupstairs
    
### Feature variables (columns 3-68)

#### Overall description and organization
The remaining 66 variables correspond to the mean value for 66 features derived 
from the smartphone's sensors. These are all numeric variables bounded within
[-1, 1].

Variable names follow this general convention:
```"mean" + type + signal details + statistic```

All variables begin with ```mean``` to indicate that they are average values
for that feature and that particular subject-activity pair.

```Type``` indicates either a *time* or *frequency* variable. Columns 3-42
contain *time* variables while columns 43-68 contain *frequency* variables.

```Signal details``` describe the signal (e.g., *body acceleration*, *body 
angular momentum*, *gravity accleration*) and may also include information 
about the *XYZ direction* or the *magnitude*. Within each type, all direction 
variables appear before magnitude variables.

```Statistic``` indicates whether the original variable was a mean or a standard
deviation. In other words, the variables in this data set represent either a
grand mean (mean of means) or a mean standard deviation. Within each signal, 
all mean columns appear first and then all standard deviation columns.

The below lists should make the overall organization of the columns clearer:

##### Time variables

###### Signals with XYZ directions
* Body linear acceleration in XYZ directions (columns 3-8)
* Gravity acceleration in XYZ directions (columns 9-14)
* Body linear acceleration jerk in XYZ directions (columns 15-20)
* Body angular velocity in XYZ directions (columns 21-26)
* Body angular velocity jerk in XYZ directions (columns 27-32)

###### Signals with magnitudes
* Body linear acceleration magnitude (columns 33-34)
* Gravity acceleration magnitude (columns 35-36)
* Body linear acceleration jerk magnitude (columns 37-38)
* Body angular velocity magnitude (columns 39-40)
* Body angular velocity jerk magnitude (columns 41-42)

##### Frequency variables

###### Signals with XYZ directions
* Body linear acceleration in XYZ directions (columns 43-48)
* Body linear acceleration jerk in XYZ directions (columns 49-54)
* Body angular velocity in XYZ directions (columns 55-61)

###### Signals with magnitudes
* Body linear acceleration magnitude (columns 61-62)
* Body linear acceleration jerk magnitude (columns 63-64)
* Body angular velocity magnitude (columns 65-66)
* Body angular velocity jerk magnitude (columns 67-68)

#### Column numbers and variable names for all 68 variables

1.  subject
2.  activity
3.  meanTimeBodyLinearAccelerationXDirectionMean
4.  meanTimeBodyLinearAccelerationYDirectionMean
5.	meanTimeBodyLinearAccelerationZDirectionMean
6.	meanTimeBodyLinearAccelerationXDirectionStandardDeviation
7.	meanTimeBodyLinearAccelerationYDirectionStandardDeviation
8.	meanTimeBodyLinearAccelerationZDirectionStandardDeviation
9.	meanTimeGravityAccelerationXDirectionMean
10.	meanTimeGravityAccelerationYDirectionMean
11.	meanTimeGravityAccelerationZDirectionMean
12.	meanTimeGravityAccelerationXDirectionStandardDeviation
13.	meanTimeGravityAccelerationYDirectionStandardDeviation
14.	meanTimeGravityAccelerationZDirectionStandardDeviation
15.	meanTimeBodyLinearAccelerationJerkXDirectionMean
16.	meanTimeBodyLinearAccelerationJerkYDirectionMean
17.	meanTimeBodyLinearAccelerationJerkZDirectionMean
18.	meanTimeBodyLinearAccelerationJerkXDirectionStandardDeviation
19.	meanTimeBodyLinearAccelerationJerkYDirectionStandardDeviation
20.	meanTimeBodyLinearAccelerationJerkZDirectionStandardDeviation
21.	meanTimeBodyAngularVelocityXDirectionMean
22.	meanTimeBodyAngularVelocityYDirectionMean
23.	meanTimeBodyAngularVelocityZDirectionMean
24.	meanTimeBodyAngularVelocityXDirectionStandardDeviation
25.	meanTimeBodyAngularVelocityYDirectionStandardDeviation
26.	meanTimeBodyAngularVelocityZDirectionStandardDeviation
27.	meanTimeBodyAngularVelocityJerkXDirectionMean
28.	meanTimeBodyAngularVelocityJerkYDirectionMean
29.	meanTimeBodyAngularVelocityJerkZDirectionMean
30.	meanTimeBodyAngularVelocityJerkXDirectionStandardDeviation
31.	meanTimeBodyAngularVelocityJerkYDirectionStandardDeviation
32.	meanTimeBodyAngularVelocityJerkZDirectionStandardDeviation
33.	meanTimeBodyLinearAccelerationMagnitudeMean
34.	meanTimeBodyLinearAccelerationMagnitudeStandardDeviation
35.	meanTimeGravityAccelerationMagnitudeMean
36.	meanTimeGravityAccelerationMagnitudeStandardDeviation
37.	meanTimeBodyLinearAccelerationJerkMagnitudeMean
38.	meanTimeBodyLinearAccelerationJerkMagnitudeStandardDeviation
39.	meanTimeBodyAngularVelocityMagnitudeMean
40.	meanTimeBodyAngularVelocityMagnitudeStandardDeviation
41.	meanTimeBodyAngularVelocityJerkMagnitudeMean
42.	meanTimeBodyAngularVelocityJerkMagnitudeStandardDeviation
43.	meanFrequencyBodyLinearAccelerationXDirectionMean
44.	meanFrequencyBodyLinearAccelerationYDirectionMean
45.	meanFrequencyBodyLinearAccelerationZDirectionMean
46.	meanFrequencyBodyLinearAccelerationXDirectionStandardDeviation
47.	meanFrequencyBodyLinearAccelerationYDirectionStandardDeviation
48.	meanFrequencyBodyLinearAccelerationZDirectionStandardDeviation
49.	meanFrequencyBodyLinearAccelerationJerkXDirectionMean
50.	meanFrequencyBodyLinearAccelerationJerkYDirectionMean
51.	meanFrequencyBodyLinearAccelerationJerkZDirectionMean
52.	meanFrequencyBodyLinearAccelerationJerkXDirectionStandardDeviation
53.	meanFrequencyBodyLinearAccelerationJerkYDirectionStandardDeviation
54.	meanFrequencyBodyLinearAccelerationJerkZDirectionStandardDeviation
55.	meanFrequencyBodyAngularVelocityXDirectionMean
56.	meanFrequencyBodyAngularVelocityYDirectionMean
57.	meanFrequencyBodyAngularVelocityZDirectionMean
58.	meanFrequencyBodyAngularVelocityXDirectionStandardDeviation
59.	meanFrequencyBodyAngularVelocityYDirectionStandardDeviation
60.	meanFrequencyBodyAngularVelocityZDirectionStandardDeviation
61.	meanFrequencyBodyLinearAccelerationMagnitudeMean
62.	meanFrequencyBodyLinearAccelerationMagnitudeStandardDeviation
63.	meanFrequencyBodyLinearAccelerationJerkMagnitudeMean
64.	meanFrequencyBodyLinearAccelerationJerkMagnitudeStandardDeviation
65.	meanFrequencyBodyAngularVelocityMagnitudeMean
66.	meanFrequencyBodyAngularVelocityMagnitudeStandardDeviation
67.	meanFrequencyBodyAngularVelocityJerkMagnitudeMean
68.	meanFrequencyBodyAngularVelocityJerkMagnitudeStandardDeviation