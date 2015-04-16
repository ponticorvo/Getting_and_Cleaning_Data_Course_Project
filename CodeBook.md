The data examined is the accelerometer data from a Samsung Galaxy S II smartphone from 30 patients doing 6 different activities. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here is a link to the raw data:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. In total, 561 variables were collected. The name of the variables are given in the file 'features.txt', while a further description of how they were calculated is gvien in 'features_info.txt'. The dataset was divided into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data. 

The following files were provided for the training data

'train/X_train.txt': A data matrix of 7352 x 561 representing the 561 variables that were collected for each experiment.

'train/subject_train.txt': A set of 7352 variables representing which subject performed each experiment.

'train/y_train.txt': A set of 7352 variables representing which activity was performed for each experiment.


Similiarly, the following files were provided for the test data

'test/X_test.txt': A data matrix of 2947 x 561 representing the 561 different variables that were collected for each experiment.

'test/subject_test.txt': A set of 2947 variables representing which subject performed each experiment.

'test/y_test.txt': A set of 2947 variables representing which activity was performed for each experiment.

The first step of data manipulation was to combine the test and training data into one variable. The size of this new variable was 10299 x 561. The next step was to take the feature names from the features.txt file and label all 561 columns. Any variable that had no mention of the word mean or std was then removed from the data matrix. The resulting size was 10299 x 86. The next step was to add two columns of data to the matrix. The first column would represent the subject number for each set of data. The second column would represent the activity the subject was performing. The size of this data was 10299 x 88. To tidy up the data, for each subject (n=30) the average value was taken for each activity (n=6). This left a matrix size of 180 x 88 averaged values that were written out to the file tidyx.txt