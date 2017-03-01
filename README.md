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

Codebook.MD
It was not clear whether this is deposited in GitHub, so I am putting this here.
Data files for 
Task #1
Training Data Set: 
tr_alx_dat = read.table("body_acc_x_train.txt") 
tr_aly_dat = read.table("body_acc_y_train.txt")
tr_alz_dat = read.table("body_acc_z_train.txt")
##renameed columns of identity and activity column and confirm change
names(tr_id_dat) = "subject"; head(tr_id_dat, 3)
names(tr_act_dat) = "act"; head(tr_act_dat, 3)
## created tables from raw data files in zip folder
##tr_x_dat = read.table("X_train.txt") It was not clear on the UCI site what this measured, so I excluded it.
tr_alx_dat = read.table("body_acc_x_train.txt") 
tr_aly_dat = read.table("body_acc_y_train.txt")
tr_alz_dat = read.table("body_acc_z_train.txt")
##check number of rows before preceding further
dim(tr_alx_dat); dim(tr_aly_dat); dim(tr_alz_dat) 
tr_atx_dat = read.table("total_acc_x_train.txt")
tr_aty_dat = read.table("total_acc_y_train.txt")
tr_atz_dat = read.table("total_acc_z_train.txt")
## check number of rows before preceding
dim(tr_atx_dat); dim(tr_aty_dat); dim(tr_atz_dat) 
tr_gx_dat = read.table("body_gyro_x_train.txt")
tr_gy_dat = read.table("body_gyro_y_train.txt")
tr_gz_dat = read.table("body_gyro_z_train.txt")
##check number of rows
dim(tr_gx_dat); dim(tr_gy_dat); dim(tr_gz_dat)
##confirmed: all tables have 128 rows
##change labels of columns to descriptive and confirm, before preceding
names(tr_x_dat) <- gsub("X", "x ", names(tr_x_dat))
names(tr_alx_dat) <- gsub("V", "body_a_x ", names(tr_alx_dat))
names(tr_aly_dat) <- gsub("V", "body_a_y ", names(tr_aly_dat))
names(tr_alz_dat) <- gsub("V", "body_a_z ", names(tr_alz_dat))
names(tr_atx_dat) <- gsub("V", "totacc-x ", names(tr_atx_dat))
names(tr_aty_dat) <- gsub("V", "totacc-y ", names(tr_aty_dat))
names(tr_atz_dat) <- gsub("V", "totacc-z ", names(tr_atz_dat))
names(tr_gx_dat) <- gsub("V", "body_g_x ", names(tr_gx_dat))
names(tr_gy_dat) <- gsub("V", "body_g_y ", names(tr_gy_dat))
names(tr_gz_dat) <- gsub("V", "body_g_z ", names(tr_gz_dat))
##I repeated the same steps above for the test folder.
##create table from raw data on id
te_id_dat = read.table("subject_test.txt")
te_act_dat = read.table("y_test.txt")
dim(te_id_dat); dim(te_act_dat)
head(te_id_dat,3)
##rename column and confirm change
names(te_id_dat) = "subject"; head(te_id_dat, 3)
names(te_act_dat) = "act"; head(te_act_dat, 3)
##rename column and confirm change
names(te_id_dat) = "subject"; head(te_id_dat, 3)
##te_x_dat = read.table("X_test.txt") not clear what this is, so not used.
te_alx_dat = read.table("body_acc_x_test.txt")
te_aly_dat = read.table("body_acc_y_test.txt")
te_alz_dat = read.table("body_acc_z_test.txt")
##check number of rows before preceding
dim(te_alx_dat); dim(te_aly_dat); dim(te_alz_dat) 
te_atx_dat = read.table("total_acc_x_test.txt")
te_aty_dat = read.table("total_acc_y_test.txt")
te_atz_dat = read.table("total_acc_z_test.txt")
##check number of rows before preceding
dim(tr_atx_dat); dim(te_aty_dat); dim(te_atz_dat) 
te_gx_dat = read.table("body_gyro_x_test.txt")
te_gy_dat = read.table("body_gyro_y_test.txt")
te_gz_dat = read.table("body_gyro_z_test.txt")
##check number of rows
dim(te_gx_dat); dim(te_gy_dat); dim(te_gz_dat)
##confirmed: all tables have 128 rows
##change labels of columns to descriptive and confirm changes made
names(te_alx_dat) <- gsub("V", "body_a_x ", names(te_alx_dat)); head(te_alx_dat,3)
## relabel rest of files
##names(te_x_dat) <- gsub("V", "x ", names(te_x_dat)) Not used
names(te_aly_dat) <- gsub("V", "body_a_y ", names(te_aly_dat))
names(te_alz_dat) <- gsub("V", "body_a_z ", names(te_alz_dat))
names(te_atx_dat) <- gsub("V", "totacc_x ", names(te_atx_dat))
names(te_aty_dat) <- gsub("V", "totacc_y ", names(te_aty_dat))
names(te_atz_dat) <- gsub("V", "totacc_z ", names(te_atz_dat))
names(te_gx_dat) <- gsub("V", "body_g_x ", names(te_gx_dat))
names(te_gy_dat) <- gsub("V", "body_g_y ", names(te_gy_dat))
names(te_gz_dat) <- gsub("V", "body_g_z ", names(te_gz_dat))
##Merge the Test and Train dataset by joining.
library(dplyr)
##Binding id data to training data set
training_dat <- cbind(tr_id_dat, tr_act_dat, tr_alx_dat, tr_aly_dat, tr_alz_dat, tr_atx_dat, tr_aty_dat, tr_atz_dat, tr_gx_dat, tr_gy_dat, tr_gz_dat)
dim(training_dat)
##adding experiment type - tr for training
training_dat$exp <- "tr"
dim(training_dat)
testing_dat <- cbind(te_id_dat, te_act_dat, te_alx_dat, te_aly_dat, te_alz_dat, te_atx_dat, te_aty_dat, te_atz_dat, te_gx_dat, te_gy_dat, te_gz_dat)
dim(testing_dat)
##adding experiment type - te for testing
testing_dat$exp <- "te"
dim(testing_dat)
dat <- rbind(training_dat, testing_dat)
dim(dat)
dat <-dat[, c(ncol(dat), 1:(ncol(dat)-1))]
dat[1:5,1:5]
##
##Task 2: extract only the measurements on the mean and standard deviation of each measurement
##I modified the "dat" from Task 1 and removed the headers so they didn't interfere with calculatons.
dat2 <- dat[, c(3:(ncol(dat)-1))]
variable_names <- names(dat2) ; mean_dat <-colMeans(dat2); sd_dat <- apply(dat2, 2, sd)
stat_table <- cbind(variable_names, mean_dat, sd_dat)
names(stat_table) <- c("variable name", "mean", "standard deviation")
##alternative to preceding two lines, stat_table < cbind(names(dat), colMeans(dat), sd(dat))
##remove first line which contans means and std on subject id
MeanStd_dat <- stat_table[3:nrow(stat_table), ]
dim(MeanStd_dat)
##Considering there are 2176 measurements, 
##print only the mean and standard deviation of the first 10 and last 10 measurements
head(MeanStd_dat, 10); tail(MeanStd_dat,10)
##
##Task 3: Use descriptive activity names to name the activites in the dataset.
##create table from raw data on activity
library(dplyr)
##Recode variables
dat$act <- recode(dat$act, "1" = "walking", "2" = "walking_upstairs", "3" = "walking_downstairs", "4" = "sitting", 
                "5" = "standing", "6" = "laying")
##Check after recoding. Since there are 7352 rows, check only first 3 and last 3 rows.
dat[1:3, 1:10]; dat[(nrow(dat)-3): nrow(dat), 1:10]
##
##Task 4: Appropriately labels the dataset with descriptive variable names.
##This was done in Task 1.
print("The measurement dataset is large.")
dim(dat)
##Dimension of the measurement table is 7352 x 2177.
##Below are sample subsets of first five columns and first three rows).
print("Below are the first five columns and first five rows."); dat[1:5, 1:5]
print("Below are first five rows and last 5 columns."); dat[1:5, (ncol(dat)-5):ncol(dat)]
##
##Task 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject.
##Right now the combined data set is 7352 x 2177.
##Number of rows need to be collapsed down to possibly 180 for 30 subjects with 6 activities.
##Add Activity List to measurement data set.
library(reshape2)
dim(dat)
##Group by subject followed by activity, then calculate mean of measurements.
tidy_dat <- dat %>% group_by(exp, subject, act) %>% summarize_all(mean)
##Sort by subject followed by actvity.
tidy_dat<- arrange(dat, exp, subject, act)
##check dimension and the format of tidy_dat
dim(tidy_dat); tidy_dat[1:20, 1:5]; tidy_dat[(nrow(tidy_dat)-10):nrow(tidy_dat), 1:5]
##Export tidy data as tidy_fitness_data.txt into folder
write.table(tidy_dat, "fitness_mean_data.txt", row.name=FALSE, sep="\t")
##Clean up memory and close
rm(list=ls())
##END
