READ ME
================

# Assignment Instructions & Code Performance:

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

# Script Overview & Output

Please see run_analysis.R for script and function of each piece of code.

1. Data files from test and training groups are imported; these include:
    a. Measurements (X)
    b. Activity Codes (y)
    c. Descriptions of Activity
    d. Participant / subject Info
2. Data from test and training groups are merged.
3. Appropriate activities performed are identified based on activity code; Appropriate headers are assigned to measurements.
4. Information of interest is extracted.
5. Extracted information is summarized. Output is included as .txt file.
