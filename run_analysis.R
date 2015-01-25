# This file analyses "Human Activity Recognition Using Smartphones" dataset present at " https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".
# This file should be run in a folder called "UCI_HAR_Dataset"
require(dplyr)
require(reshape2)

run_analysis <- function(){
	#Assuming this program is run inside the UCI_HAR_Dataset with train & test as folders

	#Step 1.1 Read Features & Activity_Label files

		#Step 1.1.1 Read Features
		features <- read.table("features.txt")
		#Step 1.1.1.2 Change "-" to "_". This is needed as "-" is a special character and creates problem in comparision functions later
		features <- mutate(features,V2=gsub("(-)+","_",V2))
		#Step 1.1.2 Read activity labels
		activities <- read.table("activity_labels.txt")
		#Step 1.1.2.1 Renaming activity column names which would be useful later on
		colnames(activities) <- c("activity","activityName")
	#Step Read Training Set
	#Step 1.2 Read Training data
		message("STEP 1: Reading Training data will take time .... Please be patient ...\n",appendLF=FALSE)
  		flush.console()
		x_train <- read.table("train/X_train.txt")
		y_train <- read.table("train/y_train.txt")
		subject_train <- read.table("train/subject_train.txt")

	#Step 1.3 Merge x,y,subject Training data
		#Step 1.3.1 Sticking Features to x_train(Features == Column Names of x_train)
			#Step 1.3.1.1 Creating new variable to store the data
			feature_x_train <- x_train
			#Step 1.3.1.2 Assigning features as colnames
			colnames(feature_x_train) <- features$V2

		#Step 1.3.2 Sticking y_train to X_train
		feature_x_train_activity <- cbind(feature_x_train,activity=y_train$V1)
		#Step 1.3.3 Stick subject to feature_x_train_activity
		feature_x_train_activity_subject <- cbind(feature_x_train_activity,subject=subject_train$V1)
		

	#Step 1.4 Read Test data
		message("STEP 2: Reading Test data will take time .... Please be patient ...\n",appendLF=FALSE)
		flush.console()
		y_test <- read.table("test/y_test.txt")
		x_test <- read.table("test/X_test.txt")
		subject_test <- read.table("test/subject_test.txt")

	#Step 1.5 Merge x,y,subject Training data
		#1.5.1 Sticking Features to x_train(Features == Column Names of x_train)
			#1.5.1.1 Creating new variable to store the data
			feature_x_test <- x_test
			#1.5.1.2 Assigning features as colnames
			colnames(feature_x_test) <- features$V2

		#1.5.2 Sticking y_test to X_test
		feature_x_test_activity <- cbind(feature_x_test,activity=y_test$V1)

		#1.5.3 Stick subject to feature_x_test_activity
		feature_x_test_activity_subject <- cbind(feature_x_test_activity,subject=subject_test$V1)

	#Step 1.6 Stick Train & Test data
		feature_train_test_activity_subject <- rbind(feature_x_train_activity_subject,feature_x_test_activity_subject)

	#Step 1.7 Merging activities data to complete train/test data
		mfeature_train_test_activity_subject <- suppressWarnings(merge(feature_train_test_activity_subject,activities))

	#Step 2.1 Search and find all column indexs contain mean or std & activityName+subject.
		meanStdIndxVec <- grep("(mean|std|activityName|subject)+",names(mfeature_train_test_activity_subject))

	#Step 2.2 Extract columns containing mean or std to create a new data frame
		mean_std_df <- mfeature_train_test_activity_subject[,meanStdIndxVec]

	#Step 3 & 4 already was achived at Step 1.3.3/1.5.3 & 1.3.4/1.5.4 above where we renamed activity & subject columns

	#Step 5 Reshaping data
	#Step 5.1 Melting to reshape data. Now each activity & subject has only one variable and its corresponding value
	message("FINAL STEP: Tidying up data .... Please be patient ...\n",appendLF=FALSE)
	flush.console()
	melt_mean_std_df <- melt(mean_std_df,id.vars=c("activityName","subject"))

	#Step 5.2 Recasting to give averages for each subject and activity.
	sal <- dcast(melt_mean_std_df,subject+activityName~variable,mean)
	message("Your Tidy data is ready... Thank you for being patient ...\n",appendLF=FALSE)
	flush.console()
	sal
}