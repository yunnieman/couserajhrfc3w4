## install.packages("dplyr")
library(dplyr)

#####
## Downloading the data and preparing the data
## Use the directory ".data' as working directory
classdir <- "./data"
if(!dir.exists("./data")) dir.create("./data")
setwd(classdir)

downloadurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile <- "UCI HAR Dataset.zip"
download.file(downloadurl, zipfile)

if(file.exists(zipfile)) unzip(zipfile)

####
## Files are downloaded and the following files exist
##
basedir <- "UCI HAR Dataset"
main_file <- paste(basedir, "features.txt", sep="/")
activitylabelsfile <- paste(basedir, "activity_labels.txt", sep="/")
testvariablesfile <- paste(basedir, "test/X_test.txt", sep="/")
testactivityfile <- paste(basedir, "test/y_test.txt", sep="/")
testsubjectfile <- paste(basedir, "test/subject_test.txt", sep="/")
trainvariablesfile <- paste(basedir, "train/X_train.txt", sep="/")
trainactivityfile <- paste(basedir, "train/y_train.txt", sep="/")
trainsubjectfile <- paste(basedir, "train/subject_train.txt", sep="/")

pull_files <- c(main_file,
                 activitylabelsfile,
                 testvariablesfile,
                 testactivityfile,
                 testsubjectfile,
                 trainvariablesfile,
                 trainactivityfile,
                 trainsubjectfile
)

sapply(pull_files, function(f) if(!file.exists(f)) stop(paste("Needed file ", f, " does not exist. Exiting ...", sep="")))

## Read main working file
features <- read.table(main_file, col.names=c("rownumber","variablename"))

####

####
## Fix the issue with duplicate names (e.g.) 516. fBodyBodyAccJerkMag-mean()
####

allvars <- 
  mutate(features, variablename = gsub("BodyBody", "Body", variablename))

####
## Filter the 66 variables - mean() and std()
####

pulledvars <- filter(allvars, grepl("mean\\(\\)|std\\(\\)", variablename))

####
## Make the allvariables readable
##    Remove special characters, Convert to lower case
####

allvars <- mutate(allvars, variablename = gsub("-", "", variablename),
                       variablename = gsub("\\(", "", variablename),
                       variablename = gsub("\\)", "", variablename),
                       variablename = tolower(variablename))

####
## Make the neededvariables readable
##    Remove special characters, Convert to lower case
####

pulledvars <- mutate(pulledvars, variablename = gsub("-", "", variablename),
                          variablename = gsub("\\(", "", variablename),
                          variablename = gsub("\\)", "", variablename),
                          variablename = tolower(variablename))

####
## Read activitylabelsfile

act_labels <- read.table(activitylabelsfile, col.names=c("activity", "description"))

####

####
## Read in test data stats
####

testvalues <- read.table(testvariablesfile, col.names = allvars$variablename)

testneededvalues <- testvalues[ , pulledvars$variablename]

testactivities <- read.table(testactivityfile, col.names=c("activity"))

####

####
## Read in test subjects
####

testsubjects <- read.table(testsubjectfile, col.names=c("subject"))
####

####
## Add a description
####

testactivitieswithdescr <- merge(testactivities, act_labels)

####
## Finish with test data
####

combined_test <- cbind(testactivitieswithdescr, testsubjects, testneededvalues)


####
## Read in train variables
####

trainvalues <- read.table(trainvariablesfile, col.names = allvars$variablename)

trainneededvalues <- trainvalues[ , pulledvars$variablename]

trainactivities <- read.table(trainactivityfile, col.names=c("activity"))

trainsubjects <- read.table(trainsubjectfile, col.names=c("subject"))


####
## Add a description
####
trainactivitieswithdescr <- merge(trainactivities, act_labels)
####

####
## Finish train data
####

combined_train <- cbind(trainactivitieswithdescr, trainsubjects, trainneededvalues)




####
## Combine the testdata and traindata
####

comb_data <- rbind(combined_test, combined_train) %>% select( -activity )


####
## Make subject a factor
####

comb_data <- mutate(comb_data, subject = as.factor(comb_data$subject))


write.table(comb_data, "Mean_And_StandardDev.txt")

write.csv(comb_data, "tidydata.csv")

View(comb_data)
