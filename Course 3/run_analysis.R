## Initiate dplyr

library(dplyr)

## Read required data

Description <- read.table(“~/UCI HAR Dataset/features.txt”)
Activity <- read.table(“~/UCI HAR Dataset/activity_labels.txt”)
Xtest <- read.table(“~/UCI HAR Dataset/test/X_test.txt”)
Ytest <- read.table(“~/UCI HAR Dataset/test/y_test.txt”)
Subjtest <- read.table(“~/UCI HAR Dataset/test/subject_test.txt”)
Xtrain <- read.table(“~/UCI HAR Dataset/train/X_train.txt”)
Ytrain <- read.table(“~/UCI HAR Dataset/train/y_train.txt”)
Subjtrain <- read.table(“~/UCI HAR Dataset/train/subject_train.txt”)

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

## Assign activity descriptions

Y[Y==1] <- “Walking”
Y[Y==2] <- "Walking Up Stairs”
Y[Y==3] <- "Walking Down Stairs”
Y[Y==4] <- "Sitting"
Y[Y==5] <- "Standing"
Y[Y==6] <- "Laying"

## Extract data with Mean and StDev

X <- X[,c(grep(“.mean", names(X)), grep(“.sub", names(X)))]

## Create Tidy Data Set

TidyDS <- cbind(SUBJ, Y, X)

## Summarize Tidy Data Set by Activity & Subject

SummTidyDS <- TidyDS %>% group_by(Activity, Subj.)
SummTidyDS <- SummTidyDS %>% summarize_each(funs(mean))

