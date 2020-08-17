The run_analysis.R script performs the data leaning and transformation

#Dataset used:
Dataset downloaded and extracted under the folder called UCI HAR Dataset

#Assign each data to variables
*features <- features.txt : 561 rows, 2 columns
*activities <- activity_labels.txt : 6 rows, 2 columns
List of activities performed when the corresponding measurements were taken and its codes (labels)
*subject_test <- test/subject_test.txt : 2947 rows, 1 column
contains test data of 9/30 volunteer test subjects being observed
*x_test <- test/X_test.txt : 2947 rows, 561 columns
*y_test <- test/y_test.txt : 2947 rows, 1 columns
*subject_train <- test/subject_train.txt : 7352 rows, 1 column
*x_train <- test/X_train.txt : 7352 rows, 561 columns
*y_train <- test/y_train.txt : 7352 rows, 1 columns


#Merges the training and the test sets to create one data set
*X (10299 rows, 561 columns) is created by merging x_train and x_test using rbind() function
*Y (10299 rows, 1 column) is created by merging y_train and y_test using rbind() function
*Subject (10299 rows, 1 column) is created by merging subject_train and subject_test using rbind() function

#Extracts only the measurements on the mean and standard deviation for each measurement

*Data X is subseted, selecting only columns containing mean and standard deviation. The result is stored in x_mean_std

#Uses descriptive activity names to name the activities in the data set
*Entire numbers in code column of the TidyData replaced with corresponding activity taken from second column of the activities variable
*Merge x_mean_std, subject and activity and create new data table

#Appropriately labels the data set with descriptive variable names
*All Acc in column’s name replaced by Accelerometer
*All Gyro in column’s name replaced by AngularSpeed
*All Mag in column’s name replaced by Magnitude
*All start with character f in column’s name replaced by Frequency
*All start with character t in column’s name replaced by Time
*All mean in column’s name replaced by Mean
*All std in column’s name replaced by StandardDeviation


#Create independent data set (data2) with the average of each variable for each activity and each subject
#Data2 is created by sumarizing the data by taking means of each variable for each activity and each subject, after groupped by subject and activity
#Export Data2 into FinalData.txt file
