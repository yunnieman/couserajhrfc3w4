## Class Project for "Getting and Cleaning Data"

### The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

## Required to submit: 
  * 1) a tidy data set as described below
  * 2) a link to a Github repository with your script for performing the analysis
  * 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
  * 4) You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

The class project for [Getting and Cleaning Data](https://www.coursera.org/course/getdata) was to read in the ["Human Activity Recognition Using Smartphones" data set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), perform an analysis on the data set, and output a tidy data set.

**Here are the steps that must be performed before running the R script:**

1. Download the zip file from [this URL](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. Unzip the file.
3. Move ALL of the following files to the SAME DIRECTORY as the R script:
	* `features.txt`
	* `subject_train.txt`
	* `subject_test.txt`
	* `X_train.txt`
	* `X_test.txt`
	* `y_train.txt`
	* `y_test.txt`

**Once those steps are complete, you can run the R script ([run_analysis.R](run_analysis.R)).** Note that it requires the [reshape2 package](http://cran.r-project.org/web/packages/reshape2/index.html), which can be downloaded from CRAN.

**The output of the R script is a tidy data set, [tidy.csv](tidy.csv).**

You can read more about the data and the analysis in the [code book](CodeBook.md).
