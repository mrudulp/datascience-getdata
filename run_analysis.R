# doDf <- function(df,x){
# 	retDf <- NA
# 	for(n in meanStdIndxVec){ 
# 		if (is.na(retDf))
# 			retDf <- select(df,n)
# 		else

# 	}
# }
run_analysis <- function(){
	#Assuming this program is run inside the UCI_HAR_Dataset with train & test as folders

	#Step 1.1 Read Features & Activity_Label files

		#Step 1.1.1 Read Features
		features <- read.table("features.txt")
		#Step 1.1.1.2 Change "-" to "_". This is needed as "-" is a special character and creates problem in comparision functions later
		features <- mutate(features,V2=gsub("(-)+","_",V2))
		#Step 1.1.2 Read activity labels
		activities <- read.table("activity_labels.txt")
	
	#Step Read Training Set
	#Step 1.2 Read Training data
		x_train <- read.table("train/X_train.txt")
		y_train <- read.table("train/y_train.txt")
		subject_train <- read.table("train/subject_train.txt")

	#Step 1.3 Merge x,y,subject Training data with activities

		#Step 1.3.1 Merge to Stick up y_train to activities
		y_train_activity <- merge(y_train,activities)
		
		#Step 1.3.2 Sticking Features to x_train(Features == Column Names of x_train)
			#Step 1.3.2.1 Creating new variable to store the data
			feature_x_train <- x_train
			#Step 1.3.2.2 Assigning features as colnames
			colnames(feature_x_train) <- features$V2

		#Step 1.3.3 Sticking activity to X_train
		feature_x_train_activity <- cbind(feature_x_train,activity=y_train_activity$V2) #Renaming column to Activity

		#Step 1.3.4 Stick subject to feature_x_train_activity
		feature_x_train_activity_subject <- cbind(feature_x_train_activity,subject=subject_train$V1)

	#Step 1.4 Read Test data
		y_test <- read.table("test/y_test.txt")
		x_test <- read.table("test/X_test.txt")
		subject_test <- read.table("test/subject_test.txt")

	#Step 1.5 Merge x,y,subject Training data with activities
		#1.5.1 Merge to Stick up y_train to activities
		y_test_activity <- merge(y_test,activities)

		#1.5.2 Sticking Features to x_train(Features == Column Names of x_train)
			#1.5.2.1 Creating new variable to store the data
			feature_x_test <- x_test
			#1.5.2.2 Assigning features as colnames
			colnames(feature_x_test) <- features$V2

		#1.5.3 Sticking activity to X_train
		feature_x_test_activity <- cbind(feature_x_test,activity=y_test_activity$V2) #Renaming column to Activity

		#1.5.4 Stick subject to feature_x_test_activity
		feature_x_test_activity_subject <- cbind(feature_x_test_activity,subject=subject_test$V1)

	#Step 1.6 Stick Train & Test data
		feature_train_test_activity_subject <- rbind(feature_x_train_activity_subject,feature_x_test_activity_subject)

	#Step 2.1 Search and find all column indexs contain mean or std.
		meanStdIndxVec <- grep("(mean|std|activity|subject)+",names(feature_train_test_activity_subject))

	#Step 2.2 Extract columns containing mean or std to create a new data frame
		mean_std_df <- feature_train_test_activity_subject[,meanStdIndxVec]

	#Step 3 & 4 already was achived at Step 1.3.3/1.5.3 & 1.3.4/1.5.4 above where we renamed activity & subject columns

	#Step 5 Reshaping data
	#Step 5.1 Melting to reshape data. Now each activity & subject has only one variable and its corresponding value
	melt_mean_std_df <- melt(mean_std_df,id.vars=c("activity","subject"))

	#Step 5.2 Recasting to give averages for each subject and activity.
	sal <- dcast(melt_mean_std_df,subject+activity~variable,mean)
	sal


}