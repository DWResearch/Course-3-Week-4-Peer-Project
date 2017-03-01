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
For the training ("tr") and testing ("te") dataset, I created  data file for the ID of the 30 subjects.  I relabelled the one column "subject."
I then created a data file for each of 9 measurement data sets (body acceleration, total acceleration, body gyroscope of the x,y, and z axis). 
Each of the 2 x 9 =18 data files contained 128 variables that R labelled V1...V128.
I replaced the V in each of these with an abbreviated description of the measurement, using gsub. 
 "body_a" stands for body acceleration. "totalacc" stands for total acceleration. "body_g" stands for body gyrope.
"x", "y", and "z" stands for the x-y-z axis.
For example, the file titled gz_dat contains testing body measurements using gyroscope along the z-axis. The 128 measurements were body_g_z 1...body_g_z 128.
The training and testing measurement sets had 7352 and 2947 observations, respectively. 

After initiating the dplyer library, I then merged all the training measurements together and then added a column experiment for training. I did the same for the testing measurements. The final file was called "dat" file.

Task #2 called for extracting the mean and standard deviation of each measurement.
I created a table called "MeanStd_dat". I first created a column with the names of the measurements. I then calculated the mean of each column, followed by the standard deviation. For the latter, I used apply.
Because there are 1150 measurements (sum of testing and measurement), I checked the first 10 means and the first 10 standard deviations.
Once the table was constructed, I checked the first and last ten rows.

Task #3 called for using descriptive activity names to name the activites in the dataset.
I used the dplyer package to create recode "dat" from Task 1. I recoded the column "act", spefically 1 for walking, 2 for walking_upstairs, 3 for walking downstairs, 4 for sitting, 5 for standing, and 6 for laying.
Because there were 10299 observations, I checked only the first and last 3 rows.

Task #4 called for appropriately labelling the dataset with descriptive variable names.
I did so in Task #1.

Task #5 called for creating a second, independent tidy dataset with the average of each variable for each activity and subject.
I created a wide tidy data set, "tidy_dat".
I then used the reshape tool to group by experiment, subject, and activity before calculating the mean of the remaining columns.
I then checked the dimensions and format of the first 20 rows and first 5 columns.
I also checked the dimensons and format of the last 10 rows and the first 5 columns.
I resorted by experiment, subject and, then activity.
Lastly, I exported the tidy dataset in a file called "tidy_fitness_data.txt".

