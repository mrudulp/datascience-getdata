# datascience-getdata
This repository contains coursera's datascience track GetData modules files

There are three files in this repository

* run_analysis.R -- This file analyses "Human Activity Recognition Using Smartphones" dataset present at " https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".
    - It combines training and test data and maps it to subjects and their activities. It returns an independent tidy data set with the average of each variable for each activity and each subject.
* Codebook.md -- This contains information about all the columns of the final dataset that is returned.
* README.md -- This file contains details about all the files in this folder. This is the file you are currently reading.

# How to use the files

## Using run_analysis.R
* Download & extract data in a folder called "UCI_HAR_Dataset". Location of data is "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
* git clone https://github.com/mrudulp/datascience-getdata.git on your local disk.
* copy run_analysis.R in "UCI_HAR_Dataset" folder.
* Set working directory to UCI_HAR_Dataset.
* Now load run_analysis.R by calling source("run_analysis.R")
* Run command "sal <- run_analysis()" on your R command prompt.
* You now have tidy data set stored in "sal".
* You can now refer to Codebook.md which came along in when you clone git repo.

## Using Codebook.md
* Codebook.md contains information about all the columns of the final dataset that is returned.
* In order to use this you need dataset which was created by "using run_analysis.R"