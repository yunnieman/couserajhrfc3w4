## Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. Details of project can be found here: [Coursera Week 4 Peer Assignment](https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project)

## Required to submit: 
  1) a tidy data set as described below
  2) a link to a Github repository with your script for performing the analysis
  3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
  4) You should also include a `README.md` in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

## To do:

1. Retrieve dataset from ["Human Activity Recognition Using Smartphones" data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. Unzip the file.
3. Move *all* of the following files to the *same directory* as the R script:
	* `features.txt`
	* `subject_train.txt`
	* `subject_test.txt`
	* `X_train.txt`
	* `X_test.txt`
	* `y_train.txt`
	* `y_test.txt`
4. Install [reshape2 package](http://cran.r-project.org/web/packages/reshape2/index.html) from CRAN.
5. create `run_analysis.R`
	+ Merges the training and the test sets to create one data set.
	+ Extracts only the measurements on the mean and standard deviation for each measurement. 
	+ Uses descriptive activity names to name the activities in the data set
	+ Appropriately labels the data set with descriptive variable names. 
	+ From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
6. output a tidy dataset, titled `tidyassignment.csv`
