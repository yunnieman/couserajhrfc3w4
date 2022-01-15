#### 
## install.packages("dplyr")
####

library(dplyr)

####
## Downloading and prepping the data
####

classdir <- "./data"
if(!dir.exists("./data")) dir.create("./data")
setwd(classdir)

downloadurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile <- "UCI HAR Dataset.zip"
download.file(downloadurl, zipfile)

if(file.exists(zipfile)) unzip(zipfile)

####
## Review, check, convert
####

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

  
####
## Read main working file
####
  
features <- read.table(main_file, col.names=c("rownumber","variablename"))

####
## Add variablename for later
####

allvars <- 
  mutate(features, variablename = gsub("BodyBody", "Body", variablename))

####
## Filter variables for mean() and std()
####

pulledvars <- filter(allvars, grepl("mean\\(\\)|std\\(\\)", variablename))

####
## Fix variable names
####

allvars <- mutate(allvars, variablename = gsub("-", "", variablename),
                       variablename = gsub("\\(", "", variablename),
                       variablename = gsub("\\)", "", variablename),
                       variablename = tolower(variablename))

pulledvars <- mutate(pulledvars, variablename = gsub("-", "", variablename),
                          variablename = gsub("\\(", "", variablename),
                          variablename = gsub("\\)", "", variablename),
                          variablename = tolower(variablename))

####
## Pull the activitylabelsfile
####

act_labels <- read.table(activitylabelsfile, col.names=c("activity", "description"))

####
## Done with Step 1-2
####
       
       
       

####
## Read in test data files
####

testvalues <- read.table(testvariablesfile, col.names = allvars$variablename)

testneededvalues <- testvalues[ , pulledvars$variablename]

testactivities <- read.table(testactivityfile, col.names=c("activity"))

testsubjects <- read.table(testsubjectfile, col.names=c("subject"))

####
## Add a description to test
####

testactivitieswithdescr <- merge(testactivities, act_labels)

####
## Finish with test data
####

combined_test <- cbind(testactivitieswithdescr, testsubjects, testneededvalues)

####
## Done with test data
####
       
 
       
       
####
## Read in train data files
####

trainvalues <- read.table(trainvariablesfile, col.names = allvars$variablename)

trainneededvalues <- trainvalues[ , pulledvars$variablename]

trainactivities <- read.table(trainactivityfile, col.names=c("activity"))

trainsubjects <- read.table(trainsubjectfile, col.names=c("subject"))

####
## Add a description to train
####
trainactivitieswithdescr <- merge(trainactivities, act_labels)

####
## Finish with train data
####

combined_train <- cbind(trainactivitieswithdescr, trainsubjects, trainneededvalues)

####
## Done with train data
####
       
       


####
## Combine the testdata and traindata
####

comb_data <- rbind(combined_test, combined_train) %>% select( -activity )


####
## Make subject a factor
####

comb_data <- mutate(comb_data, subject = as.factor(comb_data$subject))


####
## Write tidy final data in CSV
####

write.csv(comb_data, "tidydata.csv")

View(comb_data)


####
## Time for coffee
####
