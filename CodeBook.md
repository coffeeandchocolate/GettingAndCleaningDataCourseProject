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

## Variables

### Fixed variables (columns 1-2)

The first two variables are fixed variables describing the subject-activity 
pair for the observation.

**subject (factor):** Unique ID number for each subject. ID numbers are from 
1-30. ID numbers are treated as factors rather than as numeric because they 
are categorical variables (i.e., it is nonsensical to calculate with them but
you may want to use them to disaggregate analyses).

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
from the smartphone's sensors. **These are all numeric variables bounded within
[-1, 1].**

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

### Column numbers and variable names for all 68 variables

1.  subject (factor: 30 levels)
2.  activity (factor: 6 levels)
3.  meanTimeBodyLinearAccelerationXDirectionMean (numeric: [-1, 1])
4.  meanTimeBodyLinearAccelerationYDirectionMean (numeric: [-1, 1])
5.	meanTimeBodyLinearAccelerationZDirectionMean (numeric: [-1, 1])
6.	meanTimeBodyLinearAccelerationXDirectionStandardDeviation (numeric: [-1, 1])
7.	meanTimeBodyLinearAccelerationYDirectionStandardDeviation (numeric: [-1, 1])
8.	meanTimeBodyLinearAccelerationZDirectionStandardDeviation (numeric: [-1, 1])
9.	meanTimeGravityAccelerationXDirectionMean (numeric: [-1, 1])
10.	meanTimeGravityAccelerationYDirectionMean (numeric: [-1, 1])
11.	meanTimeGravityAccelerationZDirectionMean (numeric: [-1, 1])
12.	meanTimeGravityAccelerationXDirectionStandardDeviation (numeric: [-1, 1])
13.	meanTimeGravityAccelerationYDirectionStandardDeviation (numeric: [-1, 1])
14.	meanTimeGravityAccelerationZDirectionStandardDeviation (numeric: [-1, 1])
15.	meanTimeBodyLinearAccelerationJerkXDirectionMean (numeric: [-1, 1])
16.	meanTimeBodyLinearAccelerationJerkYDirectionMean (numeric: [-1, 1])
17.	meanTimeBodyLinearAccelerationJerkZDirectionMean (numeric: [-1, 1])
18.	meanTimeBodyLinearAccelerationJerkXDirectionStandardDeviation (numeric: [-1, 1])
19.	meanTimeBodyLinearAccelerationJerkYDirectionStandardDeviation (numeric: [-1, 1])
20.	meanTimeBodyLinearAccelerationJerkZDirectionStandardDeviation (numeric: [-1, 1])
21.	meanTimeBodyAngularVelocityXDirectionMean (numeric: [-1, 1])
22.	meanTimeBodyAngularVelocityYDirectionMean (numeric: [-1, 1])
23.	meanTimeBodyAngularVelocityZDirectionMean (numeric: [-1, 1])
24.	meanTimeBodyAngularVelocityXDirectionStandardDeviation (numeric: [-1, 1])
25.	meanTimeBodyAngularVelocityYDirectionStandardDeviation (numeric: [-1, 1])
26.	meanTimeBodyAngularVelocityZDirectionStandardDeviation (numeric: [-1, 1])
27.	meanTimeBodyAngularVelocityJerkXDirectionMean (numeric: [-1, 1])
28.	meanTimeBodyAngularVelocityJerkYDirectionMean (numeric: [-1, 1])
29.	meanTimeBodyAngularVelocityJerkZDirectionMean (numeric: [-1, 1])
30.	meanTimeBodyAngularVelocityJerkXDirectionStandardDeviation (numeric: [-1, 1])
31.	meanTimeBodyAngularVelocityJerkYDirectionStandardDeviation (numeric: [-1, 1])
32.	meanTimeBodyAngularVelocityJerkZDirectionStandardDeviation (numeric: [-1, 1])
33.	meanTimeBodyLinearAccelerationMagnitudeMean (numeric: [-1, 1])
34.	meanTimeBodyLinearAccelerationMagnitudeStandardDeviation (numeric: [-1, 1])
35.	meanTimeGravityAccelerationMagnitudeMean (numeric: [-1, 1])
36.	meanTimeGravityAccelerationMagnitudeStandardDeviation (numeric: [-1, 1])
37.	meanTimeBodyLinearAccelerationJerkMagnitudeMean (numeric: [-1, 1])
38.	meanTimeBodyLinearAccelerationJerkMagnitudeStandardDeviation (numeric: [-1, 1])
39.	meanTimeBodyAngularVelocityMagnitudeMean (numeric: [-1, 1])
40.	meanTimeBodyAngularVelocityMagnitudeStandardDeviation (numeric: [-1, 1])
41.	meanTimeBodyAngularVelocityJerkMagnitudeMean (numeric: [-1, 1])
42.	meanTimeBodyAngularVelocityJerkMagnitudeStandardDeviation (numeric: [-1, 1])
43.	meanFrequencyBodyLinearAccelerationXDirectionMean (numeric: [-1, 1])
44.	meanFrequencyBodyLinearAccelerationYDirectionMean (numeric: [-1, 1])
45.	meanFrequencyBodyLinearAccelerationZDirectionMean (numeric: [-1, 1])
46.	meanFrequencyBodyLinearAccelerationXDirectionStandardDeviation (numeric: [-1, 1])
47.	meanFrequencyBodyLinearAccelerationYDirectionStandardDeviation (numeric: [-1, 1])
48.	meanFrequencyBodyLinearAccelerationZDirectionStandardDeviation (numeric: [-1, 1])
49.	meanFrequencyBodyLinearAccelerationJerkXDirectionMean (numeric: [-1, 1])
50.	meanFrequencyBodyLinearAccelerationJerkYDirectionMean (numeric: [-1, 1])
51.	meanFrequencyBodyLinearAccelerationJerkZDirectionMean (numeric: [-1, 1])
52.	meanFrequencyBodyLinearAccelerationJerkXDirectionStandardDeviation (numeric: [-1, 1])
53.	meanFrequencyBodyLinearAccelerationJerkYDirectionStandardDeviation (numeric: [-1, 1])
54.	meanFrequencyBodyLinearAccelerationJerkZDirectionStandardDeviation (numeric: [-1, 1])
55.	meanFrequencyBodyAngularVelocityXDirectionMean (numeric: [-1, 1])
56.	meanFrequencyBodyAngularVelocityYDirectionMean (numeric: [-1, 1])
57.	meanFrequencyBodyAngularVelocityZDirectionMean (numeric: [-1, 1])
58.	meanFrequencyBodyAngularVelocityXDirectionStandardDeviation (numeric: [-1, 1])
59.	meanFrequencyBodyAngularVelocityYDirectionStandardDeviation (numeric: [-1, 1])
60.	meanFrequencyBodyAngularVelocityZDirectionStandardDeviation (numeric: [-1, 1])
61.	meanFrequencyBodyLinearAccelerationMagnitudeMean (numeric: [-1, 1])
62.	meanFrequencyBodyLinearAccelerationMagnitudeStandardDeviation (numeric: [-1, 1])
63.	meanFrequencyBodyLinearAccelerationJerkMagnitudeMean (numeric: [-1, 1])
64.	meanFrequencyBodyLinearAccelerationJerkMagnitudeStandardDeviation (numeric: [-1, 1])
65.	meanFrequencyBodyAngularVelocityMagnitudeMean (numeric: [-1, 1])
66.	meanFrequencyBodyAngularVelocityMagnitudeStandardDeviation (numeric: [-1, 1])
67.	meanFrequencyBodyAngularVelocityJerkMagnitudeMean (numeric: [-1, 1])
68.	meanFrequencyBodyAngularVelocityJerkMagnitudeStandardDeviation (numeric: [-1, 1])