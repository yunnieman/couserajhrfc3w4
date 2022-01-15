## Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. Details of project can be found here: (https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project)

## Required to submit: 
  * 1) a tidy data set as described below
  * 2) a link to a Github repository with your script for performing the analysis
  * 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
  * 4) You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

### Link to datasets ["Human Activity Recognition Using Smartphones" data set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), perform an analysis on the data set, and output a tidy data set.

**To do:**

1. Retrieve dataset from (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. Unzip the file.
3. Move ALL of the following files to the SAME DIRECTORY as the R script:
	* `features.txt`
	* `subject_train.txt`
	* `subject_test.txt`
	* `X_train.txt`
	* `X_test.txt`
	* `y_train.txt`
	* `y_test.txt`
4. Install the reshape2 package from (http://cran.r-project.org/web/packages/reshape2/index.html), which can be downloaded from CRAN.
5. create run_analysis.R
6. output a tidy dataset, titled tidy.csv

**  run_analysis.R **

The function needs to do the following:
* 1. Merges the training and the test sets to create one data set.
* 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
* 3. Uses descriptive activity names to name the activities in the data set
* 4. Appropriately labels the data set with descriptive variable names. 
* 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


