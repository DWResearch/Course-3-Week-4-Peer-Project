# Course-3-Week-4-Peer-Project
This is a tidy data project for Course 3 Week 4, a peer-graded assignment.
The raw dataset came from UC Irvine's Machine Learning Repository. A description of the repository can be found in this link:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The following zipfile was downloaded from the following website and decompressed. 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Directions were provided by the instructors and followed.

How the script works:
There were five tasks in this assignment. I carried out Task #4 in Task #1.

Task #1 called for merging the training and test sets to create one merged data set.
The contents of the zipfile was downloaded onto my computer. 
I created a data file for the data set on the ID of the 30 subjects.  I relabelled the one column "subject."
I then created a data file for each of 9 measurement data sets (linear acceleration, total acceleration, angular velocity/gyroscope along the x,y, and z axis) for training and then for testing. 
Each of the 2 x 9 =18 data files contained 128 variables that R labelled V1...V128.
I replaced the V in each of these with an abbreviated description of the measurement, using gsub. 
"tr" stands for train. "te" stands for testing. 
"al" stands for linear acceleration. "at" stands for total acceleration. "g" stands for gyroscope.
"x", "y", and "z" stands for the x-y-axis.
For example, the file titled te_gz_dat contains testing measurements for the gyroscope along the z-axis. The 128 measurements were te_gz 1...te_gz 128.
All of these files, the ID and measurements, contained 7352 observations. I assumed that they all corresponded in order to the same ID and activity. (It would have been preferable if the UCI website stated this.) The exception was testing, linear acceleration along the x axis which contained 2497 variables, so I decided to exclude it because there was no ID attached to the measurements for me to match to the other data sets. 
After initiating the dplyer library, I then merged all the training measurements together and then added the testing measurements. The final file is called "dat" file.

Task #2 called for extracting the mean and standard deviation of each measurement.
I created a table called "MeanStd_dat". I first created a column with the names of the measurements. I then calculated the mean of each column, followed by the standard deviation. For the latter, I used apply.
Because there are 2176 measurements, I checked the first 10 means and the first 10 standard deviations.
Once the table was constructed, I checked the first and last ten rows.

Task #3 called for using descriptive activity names to name the activites in the dataset.
I used the dplyer package. I created a list of activities from the raw file "y_train.txt."
I renamed the column "act." Because the variables were numeric, I recoded the variables 1 for walking, 2 for walking_upstairs, 3 for walking downstairs, 4 for sitting, 5 for standing, and 6 for laying.
Because there were 7352 rows, I checked only the first and last 3 rows.

Task #4 called for appropriately labelling the dataset with descriptive variable names.
I did so in Task #1.

Task #5 called for creating a second, independent tidy dataset with the average of each variable for each activity and subject.
Prior to this, the merged data set was a 7352  x2177 table. The number of rows need to be collapsed down to possibly 180 for the 30 subjects with 6 activities.
I created a wide tidy data set.
I used the reshape 2 package and then merged the activity table with the merged data set. I then rearranged the columns so that the first column is subject, followed by activities, and then the measurements.
I then used the reshape tool to group by subject and activity before calculating the mean of the remaining columns.
I then checked the dimensions and format of the first 20 rows and the first five columns.
I resorted by subject and followed by activity.
Lastly, I exported the tidy dataset in a file called "tidy_fitness_data.txt"





