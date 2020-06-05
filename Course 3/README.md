READ ME
================

# Assignment Instructions:

You should create one R script called run\_analysis.R that does the
following.

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation
    for each measurement.
3.  Uses descriptive activity names to name the activities in the data
    set
4.  Appropriately labels the data set with descriptive variable names.
5.  From the data set in step 4, creates a second, independent tidy data
    set with the average of each variable for each activity and each
    subject.

# Submission Requirements:

1.  A tidy data set as described above.
2.  A link to a Github repository with your script for performing the
    analysis.
3.  A code book that describes the variables, the data, and any
    transformations or work that you performed to clean up the data
    called CodeBook.md. You should also include a README.md in the repo
    with your scripts. This repo explains how all of the scripts work
    and how they are connected.

# Script
## Initiate dplyr

library(dplyr)

## Read required data

Description <- read.table(“UCI HAR Dataset/features.txt”)
Activity <- read.table(“UCI HAR Dataset/activity_labels.txt”)
Xtest <- read.table(“UCI HAR Dataset/test/X_test.txt”)
Ytest <- read.table(“UCI HAR Dataset/test/y_test.txt”)
Subjtest <- read.table(“UCI HAR Dataset/test/subject_test.txt”)
Xtrain <- read.table(“UCI HAR Dataset/train/X_train.txt”)
Ytrain <- read.table(“UCI HAR Dataset/train/y_train.txt”)
Subjtrain <- read.table(“UCI HAR Dataset/train/subject_train.txt”)

## Merge data

X <- rbind(Xtest, Xtrain)
Y <- rbind(Ytest, Ytrain)
SUBJ <- rbind(Subjtest, Subjtrain)

## Get and assign column names 
## Assumes vertical order in “features” matches horizontal in “test”

Head <- t(Description)
names(X) <- Head[2,]
names(Y) <- c(“Activity”)
names(SUBJ) <- c(“Subj.”)
Y[Y==1] <- “Walking”
Y[Y==2] <- "Walking Up Stairs”
Y[Y==3] <- "Walking Down Stairs”
Y[Y==4] <- "Sitting"
Y[Y==5] <- "Standing"
Y[Y==6] <- "Laying"

## Extract data with Mean and StDev

X <- X[,c(grep(“.mean", names(X)), grep(“.sub", names(X)))]
DS
## Create Tidy Data Set

TidyDS <- cbind(SUBJ, Y, X)

## Summarize Tidy Data Set by Activity & Subject

SummTidyDS <- TidyDS %>% group_by(Activity, Subj.)
SummTidyDS <- SummTidyDS %>% summarize_each(funs(mean))


