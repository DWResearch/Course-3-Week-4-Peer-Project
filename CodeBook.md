The following is a description of output file called "fitness_mean_tidy_data.txt"
The file contains 180 observations.
The 180 observations are of 30 participants or subjects, each of whom participated in 6 activities.
The activities include: walking, walking upstairs, walking downstairs, sitting, standing, and laying.
The columns are average/mean of measurements taken.

The variables in the text fileinclude (names in parentheses): experiment (test or experiment), ID (subject), act (activity), mean of 9 measurement variables). 
The 9 measurement variables include:
mean of linear acceleration along the x-axis(M_alx)
mean of linear acceleration along the y-axis(M_aly)
mean of linear acceleration along the y-axis(M_alz)
mean of total acceleration along the x-axis(M_atx)
mean of total acceleration along the y-axis(M_aty)
mean of total acceleration along the z-axis(M_atz)
mean of body gyroscope measurement along the x-axis(M_gx)
mean of body gyroscope measurement along the y-axis(M_gy)
mean of body gyroscope measurement along the z-axis(M_gz)

The output file was created as an output file from the following scripts. 
Markdown include a description of the steps.
##Coursera JHU Data Specialization Course 3 Week 4 Peer Project
##Prepare R Studio
remove(list=ls())
getwd()
setwd("C:/Users/Dana/Documents/Coursera-R/R Data/dataC3W4Peer")
##Task 1: Merge the training and test sets to create one data set.
##I manually downloaded the zip folder and imported the folder to the above.
##I did try doing the above in R but had no success. Instructions from TA did not resolve problem.
##
##I took the opportunity in the the process of importing the datasets
##to carry out Task 4 and labeled the data set with descriptive variable names.
##
##1st step: Importing from Train Folder
##For each raw data set, check the dim of the file, and first three rows.
##The rows in the dimension of each imported file should match in number.
##
##create table from raw data on id and act 
tr_id_dat = read.table("subject_train.txt")
tr_act_dat = read.table("y_train.txt")
dim(tr_id_dat); dim(tr_act_dat)
head(tr_id_dat,3)
##rename column and confirm change
names(tr_id_dat) = "subject"; head(tr_id_dat, 3)
names(tr_act_dat) = "act"; head(tr_act_dat, 3)
## create tables from raw data
##tr_x_dat = read.table("X_train.txt") Not clear what this is so not used.
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
##names(tr_x_dat) <- gsub("X", "x ", names(tr_x_dat)) Not used
names(tr_alx_dat) <- gsub("V", "body_a_x ", names(tr_alx_dat))
names(tr_aly_dat) <- gsub("V", "body_a_y ", names(tr_aly_dat))
names(tr_alz_dat) <- gsub("V", "body_a_z ", names(tr_alz_dat))
names(tr_atx_dat) <- gsub("V", "totacc_x ", names(tr_atx_dat))
names(tr_aty_dat) <- gsub("V", "totacc_y ", names(tr_aty_dat))
names(tr_atz_dat) <- gsub("V", "totacc_z ", names(tr_atz_dat))
names(tr_gx_dat) <- gsub("V", "body_g_x ", names(tr_gx_dat))
names(tr_gy_dat) <- gsub("V", "body_g_y ", names(tr_gy_dat))
names(tr_gz_dat) <- gsub("V", "body_g_z ", names(tr_gz_dat))
##
##Step 2: Importing from Test Folder. 
##Replicated the previous with content of test folder and relabelled.
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
training_dat$exp <- "tr"
dim(training_dat)
testing_dat <- cbind(te_id_dat, te_act_dat, te_alx_dat, te_aly_dat, te_alz_dat, te_atx_dat, te_aty_dat, te_atz_dat, te_gx_dat, te_gy_dat, te_gz_dat)
dim(testing_dat)
testing_dat$exp <- "te"
dim(testing_dat)
dat <- rbind(training_dat, testing_dat)
dim(dat)
dat <-dat[, c(ncol(dat), 1:(ncol(dat)-1))]
dat[1:5,1:5]
##
##Task 2: extract only the measurements on the mean and standard deviation of each measurement
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
dat3 <- dat
dat3$act <- recode(dat3$act, "1" = "walking", "2" = "walking_upstairs", "3" = "walking_downstairs", "4" = "sitting", 
                "5" = "standing", "6" = "laying")
##Check after recoding. Since there are 7352 rows, check only first 3 and last 3 rows.
dat3[1:3, 1:10]; dat3[(nrow(dat)-3): nrow(dat), 1:10]
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
##Right now the combined data set is 10299 observations x 1155 variables
##Number of rows need to be collapsed down to possibly 180 for 30 subjects with 6 activities.
library(reshape2)
##Find the mean of 128 pieces of data for each measurement and create its own file to later merge.
names(te_id_dat) = "subject"; head(te_id_dat, 3)
##te_x_dat = read.table("X_test.txt") not clear what this is, so not used.
tr_alx_dat = read.table("body_acc_x_train.txt")
tr_alx_dat$M_alx <- rowMeans(tr_alx_dat)
Mtr_alx_dat <- tr_alx_dat["M_alx"]
tr_aly_dat = read.table("body_acc_y_train.txt")
tr_aly_dat$M_aly <- rowMeans(tr_aly_dat)
Mtr_aly_dat <- tr_aly_dat["M_aly"]
tr_alz_dat = read.table("body_acc_z_train.txt")
tr_alz_dat$M_alz <- rowMeans(tr_alz_dat)
Mtr_alz_dat <- tr_alz_dat["M_alz"]
##check number of rows before preceding
dim(Mtr_alx_dat); dim(Mtr_aly_dat); dim(Mtr_alz_dat) 
tr_atx_dat = read.table("total_acc_x_train.txt")
tr_atx_dat$M_atx <- rowMeans(tr_atx_dat)
Mtr_atx_dat <- tr_atx_dat["M_atx"]
tr_aty_dat = read.table("total_acc_y_train.txt")
tr_aty_dat$M_aty <- rowMeans(tr_aty_dat)
Mtr_aty_dat <- tr_aty_dat["M_aty"]
tr_atz_dat = read.table("total_acc_z_train.txt")
tr_atz_dat$M_atz <- rowMeans(tr_atz_dat)
Mtr_atz_dat <- tr_atz_dat["M_atz"]
##check number of rows before preceding
dim(Mtr_atx_dat); dim(Mtr_aty_dat); dim(Mtr_atz_dat) 
tr_gx_dat = read.table("body_gyro_x_train.txt")
tr_gx_dat$M_gx <- rowMeans(tr_gx_dat)
Mtr_gx_dat <- tr_gx_dat["M_gx"]
tr_gy_dat = read.table("body_gyro_y_train.txt")
tr_gy_dat$M_gy <- rowMeans(tr_gy_dat)
Mtr_gy_dat <- tr_gy_dat["M_gy"]
tr_gz_dat = read.table("body_gyro_z_train.txt")
tr_gz_dat$M_gz <- rowMeans(tr_gz_dat)
Mtr_gz_dat <- tr_gz_dat["M_gz"]
##check number of rows
dim(Mtr_gx_dat); dim(Mtr_gy_dat); dim(Mtr_gz_dat)
##confirmed: all tables have 1 column
##te_x_dat = read.table("X_test.txt") not clear what this is, so not used.
te_alx_dat = read.table("body_acc_x_test.txt")
te_alx_dat$M_alx <- rowMeans(te_alx_dat)
Mte_alx_dat <- te_alx_dat["M_alx"]
te_aly_dat = read.table("body_acc_y_test.txt")
te_aly_dat$M_aly <- rowMeans(te_aly_dat)
Mte_aly_dat <- te_aly_dat["M_aly"]
te_alz_dat = read.table("body_acc_z_test.txt")
te_alz_dat$M_alz <- rowMeans(te_alz_dat)
Mte_alz_dat <- te_alz_dat["M_alz"]
##check number of rows before preceding
dim(Mte_alx_dat); dim(Mte_aly_dat); dim(Mte_alz_dat) 
te_atx_dat = read.table("total_acc_x_test.txt")
te_atx_dat$M_atx <- rowMeans(te_atx_dat)
Mte_atx_dat <- te_atx_dat["M_atx"]
te_aty_dat = read.table("total_acc_y_test.txt")
te_aty_dat$M_aty <- rowMeans(te_aty_dat)
Mte_aty_dat <- te_aty_dat["M_aty"]
te_atz_dat = read.table("total_acc_z_test.txt")
te_atz_dat$M_atz <- rowMeans(te_atz_dat)
Mte_atz_dat <- te_atz_dat["M_atz"]
##check number of rows before preceding
dim(Mtr_atx_dat); dim(Mte_aty_dat); dim(Mte_atz_dat) 
te_gx_dat = read.table("body_gyro_x_test.txt")
te_gx_dat$M_gx <- rowMeans(te_gx_dat)
Mte_gx_dat <- te_gx_dat["M_gx"]
te_gy_dat = read.table("body_gyro_y_test.txt")
te_gy_dat$M_gy <- rowMeans(te_gy_dat)
Mte_gy_dat <- te_gy_dat["M_gy"]
te_gz_dat = read.table("body_gyro_z_test.txt")
te_gz_dat$M_gz <- rowMeans(te_gz_dat)
Mte_gz_dat <- te_gz_dat["M_gz"]
##check number of rows
dim(Mte_gx_dat); dim(Mte_gy_dat); dim(Mte_gz_dat)
##confirmed: all tables have 1 column
##Merge all the mean data for training and then for testing. Create and add column for experiment: "tr" for train and "te" for test.
M_training_dat <- cbind(tr_id_dat, tr_act_dat, Mtr_alx_dat, Mtr_aly_dat, Mtr_alz_dat, Mtr_atx_dat, Mtr_aty_dat, Mtr_atz_dat, Mtr_gx_dat, Mtr_gy_dat, Mtr_gz_dat)
dim(M_training_dat)
M_training_dat$exp <- "tr"
dim(M_training_dat)
M_testing_dat <- cbind(te_id_dat, te_act_dat, Mte_alx_dat, Mte_aly_dat, Mte_alz_dat, Mte_atx_dat, Mte_aty_dat, Mte_atz_dat, Mte_gx_dat, Mte_gy_dat, Mte_gz_dat)
dim(M_testing_dat)
M_testing_dat$exp <- "te"
dim(M_testing_dat)
M_dat <- rbind(M_training_dat, M_testing_dat)
dim(M_dat)
##Move experiment variable to the first column
M_dat <-M_dat[, c(ncol(M_dat), 1:(ncol(M_dat)-1))]
dim(M_dat)
M_dat[1:5,1:5]
M_by_group <- group_by(M_dat, exp, subject, act)
output <- summarize_all(M_by_group, mean)
dim(output)
head(output, 20); tail(output, 20)
str(output)
##The number of rows should be 2 types of experiment x 30 subjects x 6 motions = 360.
##Check subject because there are missing subjects.
##Some appear to be missing.
output$subject
##Recode activities from numeric to character.
output$act <- recode(output$act, "1" = "walking", "2" = "walking_upstairs", "3" = "walking_downstairs", "4" = "sitting", 
                     "5" = "standing", "6" = "laying")
##Sort by subject followed by actvity.
output<- arrange(output, exp, subject, act)
##Check labels
output[1:10, 1:5]
##Round the measurements to four digits
##tried to round measurements to 4 significant figures but don't know why this didn't work
##profile <-output[, 1:3]
##M_rounded <- signif(output[, 4:12], 4)
##output2 <- cbind(profile, M_rounded)
##
##Export tidy data as tidy_fitness_data.txt into folder
write.table(output, "fitness_mean_tidy_data.txt", row.name=FALSE, sep="\t")
##END



