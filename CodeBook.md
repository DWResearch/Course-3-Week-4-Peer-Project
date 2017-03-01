##I was not able to create a script for downloading the zip files.
##I spent a long time looking onlne and asked for help on the forum.
##Despite following Len's advice, I was not able to get the script to work.
##Instead I pulled the raw data and moved it into a folder on my computer.                                                                                     
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
##Recode activity variable
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
##The UCI website and the instructor's directions were unclear about the treatment of experiment (training versus test).
##As I researcher, I typically treat them separately, so that's what I did.
library(reshape2)
dim(dat)
##Group by experiment type and subject followed by activity, then calculate mean of measurements.
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
