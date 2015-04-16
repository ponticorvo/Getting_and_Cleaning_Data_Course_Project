The script run_analysis.R will read in a set of data, manipulate it, and then output a text file with the new manipulated data.

The script assumes the data is unzipped in the working directory in a folder named UCI HAR Dataset

The script also relys on the dplyr library which must be installed.

First it reads the raw data from the test and training set and combines them into one variable, x

It then reads the list of features from the appropriate file and saves them as the column names for x

It reads the feature list searching for features that include the word mean or std and uppdates the variable x to only include those features

It reads in the activity list for the training and test data into a variable called y and replaces the numbers in y with the activity they represent

It reads in the subject list for the training and test data into a variable called subject and updates the variable x to include the subject data and the activity data

It uses the dplyr library to create the variable tidyx from x using the group_by and summarise_each function. The variable tidyx represents the average of each activity for every subject

Finally it writes the the tidyx variable to a file called tidyx.txt
