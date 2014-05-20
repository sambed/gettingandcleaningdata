# CodeBook for run_analysis.R

The raw data for the course project was obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

## Following steps were implemented. 

1. Train and Test data sets were read for X,Y and subject.
2. Features were read.
3. Necessary X,Y and subject were merged appropriately from test/train dataset
4. Columns were renamed.
5. Mean and standard deviation were isolated from the feature using grep function.
6. Activity descriptions were read.
7. Multiple joins using labels,activity and measurements was carried out.
8. ActivityType and ActivityID were combined.
9. Avg of each variable for each subject and activity was computed using melt and dcast function from reshape2 package.
10. Tidy dataset was written as a text file and named ActivityType_Subject_Avg.txt.

## Final File Description

1. File name features_info describes the measurements taken.
2. ActivityType is descriptive label of activity
3. And subject is id for people testing
