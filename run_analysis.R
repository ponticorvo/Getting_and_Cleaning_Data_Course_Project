# Reads the raw data from the test and training set and combines them into one variable, x
x_train<-read.table("./UCI HAR Dataset/train/X_train.txt", sep = "")
x_test<-read.table("./UCI HAR Dataset/test/X_test.txt", sep = "")
x<-rbind(x_train,x_test)

# Reads the list of features from the appropriate file and saves them as the column names for x
features<-read.table("./UCI HAR Dataset/features.txt")
features <- t(features[2])
colnames(x) <- features

# Reads the feature list searching for features that include the word mean or std
# Update the variable x to only include those features
test<-grepl("mean|std", features, ignore.case = T)
x<-x[,test]

# Read in the activity list for the training and test data into a variable called y
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
y<-rbind(y_train,y_test)
colnames(y) <- "Activity"

# Replace the numbers in y with the activity they represent
y<-replace(y,y==1,"WALKING")
y<-replace(y,y==2,"WALKING_UPSTAIRS")
y<-replace(y,y==3,"WALKING_DOWNSTAIRS")
y<-replace(y,y==4,"SITTING")
y<-replace(y,y==5,"STANDING")
y<-replace(y,y==6,"LAYING")

# Read in the subject list for the training and test data into a variable called subject
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
subject<-rbind(subject_train,subject_test)
colnames(subject) <- "Subject"

# Update the variable x to include the subject data and the activity data
x<-cbind(subject,y,x)

# Use the dplyr library to create the variable tidyx from x using the group_by and summarise_each function
# The variable tidyx represents the average of each activity for every subject
tidyx <- x %>% group_by(Subject,Activity) %>% summarise_each(funs(mean))

# Write the the tidyx variable to a file called tidyx.txt
write.table(tidyx, file="tidyx.txt" ,row.name=F)