##Coursera JHU Data Specialization Course 3 Week 4 Peer Project
##Prepare R Studio
remove(list=ls())
getwd()
setwd("C:/Users/Dana/Documents/Coursera-R/R Data/dataC3W4Peer")
##Task 1: Merge the training and test sets to create one data set.
##I manually downloaded the zip folder and imported the folder to the above.
##I did try doing the above in R but had no success. Instructions from TA did not resolve problem.
##
#Importing from Train Folder
##For each raw data set, check the dim of the file, and first three rows.
##The rows in the dimension of each imported file should match in number.
##I took the opportunity in the the process of importing the datasets
##to carry out Task 4 and labeled the data set with descriptive variable names.
##create table from raw data on id 
tr_id_dat = read.table("subject_train.txt")
dim(tr_id_dat)
head(tr_id_dat,3)
##rename column and confirm change
names(tr_id_dat) = "subject"; head(tr_id_dat, 3)
## create tables from raw data
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
names(tr_alx_dat) <- gsub("V", "tr_alx ", names(tr_alx_dat)); head(tr_alx_dat,3)
names(tr_aly_dat) <- gsub("V", "tr_aly ", names(tr_aly_dat))
names(tr_alz_dat) <- gsub("V", "tr_alz ", names(tr_alz_dat))
names(tr_atx_dat) <- gsub("V", "tr_atx ", names(tr_atx_dat))
names(tr_aty_dat) <- gsub("V", "tr_aty ", names(tr_aty_dat))
names(tr_atz_dat) <- gsub("V", "tr_atz ", names(tr_atz_dat))
names(tr_gx_dat) <- gsub("V", "tr_gx ", names(tr_gx_dat))
names(tr_gy_dat) <- gsub("V", "tr_gy ", names(tr_gy_dat))
names(tr_gz_dat) <- gsub("V", "tr_gz ", names(tr_gz_dat))
##Importing from Test Folder
te_alx_dat = read.table("body_acc_x_test.txt")
te_aly_dat = read.table("body_acc_y_train.txt")
te_alz_dat = read.table("body_acc_z_train.txt")
##check number of rows before preceding
dim(te_alx_dat); dim(te_aly_dat); dim(te_alz_dat) 
te_atx_dat = read.table("total_acc_x_train.txt")
te_aty_dat = read.table("total_acc_y_train.txt")
te_atz_dat = read.table("total_acc_z_train.txt")
##check number of rows before preceding
dim(tr_atx_dat); dim(te_aty_dat); dim(te_atz_dat) 
te_gx_dat = read.table("body_gyro_x_train.txt")
te_gy_dat = read.table("body_gyro_y_train.txt")
te_gz_dat = read.table("body_gyro_z_train.txt")
##check number of rows
dim(te_gx_dat); dim(te_gy_dat); dim(te_gz_dat)
##confirmed: all tables have 128 rows
##change labels of columns to descriptive and confirm changes made
names(te_alx_dat) <- gsub("V", "te_alx ", names(te_alx_dat))
## relabel rest of files
names(te_aly_dat) <- gsub("V", "te_aly ", names(te_aly_dat))
names(te_alz_dat) <- gsub("V", "te_alz ", names(te_alz_dat))
names(te_atx_dat) <- sub("V", "te_atx ", names(te_atx_dat))
names(te_aty_dat) <- gsub("V", "te_aty ", names(te_aty_dat))
names(te_atz_dat) <- gsub("V", "te_atz ", names(te_atz_dat))
names(te_gx_dat) <- gsub("V", "te_gx ", names(te_gx_dat))
names(te_gy_dat) <- gsub("V", "te_gy ", names(te_gy_dat))
names(te_gz_dat) <- gsub("V", "te_gz ", names(te_gz_dat))
##Merge the Test and Train dataset by joining.
library(dplyr)
##Binding id data to training data set
dat <- bind_cols(tr_id_dat, tr_alx_dat, tr_aly_dat, tr_alz_dat, tr_atx_dat, tr_aty_dat, tr_atz_dat, tr_gx_dat, tr_gy_dat, tr_gz_dat)
dim(dat)
dat <- bind_cols(dat, te_aly_dat, te_alz_dat, te_atx_dat, te_aty_dat, te_atz_dat, te_gx_dat, te_gy_dat, te_gz_dat)
dim(dat)
##removed te_alx_dat data set because it is the only dataset whose rows do not match.
##I deleted the original dataset and reloaded it. Same result.
##Its dimension is 2497x128. The others are 7352x128. The dimensions of the data sets should match.
##
##Task 2: extract only the measurements on the mean and standard deviation of each measurement
variable_names <- names(dat) ; mean_dat <-colMeans(dat); sd_dat <- apply(dat, 2, sd)
stat_table <- cbind(variable_names, mean_dat, sd_dat)
names(stat_table) <- c("variable name", "mean", "standard deviation")
##alternative to preceding two lines, stat_table < cbind(names(dat), colMeans(dat), sd(dat))
##remove first line which contans means and std on subject id
MeanStd_dat <- stat_table[2:nrow(stat_table), ]
dim(MeanStd_dat)
##Considering there are 2176 measurements, 
##print only the mean and standard deviation of the first 10 and last 10 measurements
head(MeanStd_dat, 10); tail(MeanStd_dat,10)
##
##Task 3: Use descriptive activity names to name the activites in the dataset.
##create table from raw data on activity
library(dplyr)
tr_act_dat =read.table("y_train.txt") 
##check dimension of file
dim(tr_act_dat) 
##Add column name "act" for "Activity" and check
names(tr_act_dat) = "act"; head(tr_act_dat, 3)
##Recode variables
tr_act_dat$act <- recode(tr_act_dat$act, "1" = "walking", "2" = "walking_upstairs", "3" = "walking_downstairs", "4" = "sitting", 
                "5" = "standing", "6" = "laying")
##Check after recoding. Since there are 7352 rows, check only first and last 3.
head(tr_act_dat, 3); tail(tr_act_dat, 3)
##
##Task 4: Appropriately labels the dataset with descriptive variable names.
##This was done in Task 1.
print("The measurement dataset is large.")
dim(dat)
##Dimension of the measurement table is 7352 x 2177.
##Below are sample subsets of first five columns and first three rows).
print("Below are the first five columns and first five rows."); dat[1:5, 1:5]
print("Below are columns and first five rows."); dat[1:5, (ncol(dat)-5):ncol(dat)]
##
##Task 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject.
##Right now the combined data set is 7352 x 2177.
##Number of rows need to be collapsed down to possibly 180 for 30 subjects with 6 activities.
##Add Activity List to measurement data set.
library(reshape2)
dim(dat)
##Merge activity list with measurement dataset. Check dimension and format.
dat <- cbind(tr_act_dat, dat); dim(dat); dat[1:5, 1:5]
##Sort by subject and then activty and check
dat <-dat [, c(2, 1, 3:ncol(dat))]
dat[1:5, 1:5]
##Group by subject followed by activity, then calculate mean of measurements.
tidy_dat <- dat %>% group_by(subject, act) %>% summarize_all(mean)
##check dimension and the format of tidy_dat
dim(tidy_dat); tidy_dat[1:20, 1:5]
##Sort by subject followed by actvity.
arrange(dat, subject, act)
tidy_dat[100:126, 1:5]
##Export tidy data as tidy_fitness_data.txt into folder
write.table(tidy_dat, "fitness_mean_data.txt", row.name=FALSE, sep="\t")
##Clean up memory and close
rm(list=ls())
##END