setwd("C:\\Users\\user\\Desktop\\datasciencecoursera")

#Download the data
filename <- "Assignment3_Data.zip"

# Checking if archieve already exists.
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename)
}  

# Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

#Read train data
subjectTrain<- read.table("UCI HAR Dataset/train/subject_train.txt",header=FALSE)
xTrain<- read.table("UCI HAR Dataset/train/x_train.txt",header=FALSE)
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt",header=FALSE)

#Read test data
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt",header=FALSE)
xTest <- read.table("UCI HAR Dataset/test/x_test.txt",header=FALSE)
yTest <- read.table("UCI HAR Dataset/test/y_test.txt",header=FALSE)


# Combine xTrain and xTest
x<-rbind(xTrain,xTest)
y<-rbind(yTrain,yTest)

#Combine Subject train and test data
subject<-rbind(subjectTest,subjectTrain)

#Extract columns containg mean and standard deciation
feature<- read.table('UCI HAR Dataset//features.txt',header=FALSE)
names(x)<-feature$V2
col<-grep("(mean|std)",feature$V2)
x_mean_std <- x[, col]

#Use descriptive activity names to name the activities in the data set
activity<-read.table("UCI HAR Dataset//activity_labels.txt", header = FALSE)
names(y)<-"Activity"
y[,1]<-activity[5,2]

#Appropriately labels the data set with descriptive variable names
names(subject)<-"Subject"
summary(subject)
data<-cbind(x_mean_std,subject,y)

names(data)<-gsub("Acc","Acceleration", names(data))
names(data) <- gsub('GyroJerk',"AngularAcceleration",names(data))
names(data) <- gsub('Gyro',"AngularSpeed",names(data))
names(data) <- gsub('Mag',"Magnitude",names(data))
names(data) <- gsub('^t',"TimeDomain.",names(data))
names(data) <- gsub('^f',"FrequencyDomain.",names(data))
names(data) <- gsub('mean',"Mean",names(data))
names(data) <- gsub('std',"StandardDeviation",names(data))
names(data) <- gsub('Freq',"Frequency",names(data))
names(data)<-gsub("\\()","",names(data))
names(data)

# create independent tidy data set with the average of each variable for each activity and each subject
Data2<-aggregate(. ~Subject + Activity, data, mean)
write.table(Data2, "FinalData.txt", row.name=FALSE)
