# name: Coursera Getting and Cleaning Data Project
# type independent script
# script purpose: import and shape data as described in course directions
#   (see class assignment)
# created: 1/24/15
# updated: 1/25/15

#--------------------------------------------------------------------------#
## LOAD RELEVANT LIBRARIES ##
# The user needs to have installed the libraries themselves. However,
# attempts to stop the script if the user is missing a library. Only works
# if the script is executed with the source() function.
message("Loading reshape2 library...")
ifelse(library(reshape2, logical.return = T),
      message("reshape2 library loaded."),
      stop("Please install reshape2 library before sourcing this script.",
           silent = T)
)

#--------------------------------------------------------------------------#
## SCRIPT BODY ##
# TEST FOR DATA FILE AND UNZIP

# Assumes appropriate .zip file is in working directory. Attempts to stop
# script execution and report if .zip is missing but this only works if
# script is executed with source() function.

# If file is present, it is unzipped into unique directory and 
# the current working directory is adjusted.
ifelse(
  file.exists("./getdata-projectfiles-UCI HAR Dataset.zip"),
  unzip("./getdata-projectfiles-UCI HAR Dataset.zip", exdir = "./class_project_data"),
  stop("Please place the correct .zip file in the current working directory.", 
       call. = F)
)

setwd(".//class_project_data//UCI HAR Dataset")

# IMPORT AND COMBINE THE TRAINING DATA
message("Importing and combining data...")

subject_ID <- read.table("./train/subject_train.txt", header = F)
condition_ID <- rep("training", nrow(subject_ID))
activity_ID <- read.table("./train/y_train.txt", header = F)
measures <- read.table("./train/X_train.txt", header = F)

train_data <- cbind(subject_ID, condition_ID, activity_ID, measures)
rm(subject_ID, condition_ID, activity_ID, measures)

# IMPORT AND COMBINE THE TEST DATA
subject_ID <- read.table("./test/subject_test.txt", header = F)
condition_ID <- rep("test", nrow(subject_ID))
activity_ID <- read.table("./test/y_test.txt", header = F)
measures <- read.table("./test/X_test.txt", header = F)

test_data <- cbind(subject_ID, condition_ID, activity_ID, measures)
rm(subject_ID, condition_ID, activity_ID, measures)

# COMBINE THE TRAINING AND TEST DATA AND ASSIGN BASIC LABELS
merged_data <- rbind(test_data, train_data)
rm(test_data, train_data)

features <- read.table("./features.txt", header = F)
data_labels <- c("subject_ID", "condition_ID", "activity_ID", as.character(features$V2))

names(merged_data) <- data_labels
rm(data_labels)

# INDEX THE MEAN AND SD MEASUREMENTS FROM THE FEATURES AND
# CREATE A NEW DATA SET WITH ONLY THESE COLUMNS
mean_index <- grep("mean()", features$V2, fixed = T) + 3 # +3 for the leading col names I made
std_index <- grep("std()", features$V2, fixed = T) + 3 # +3 for the leading col names I made
selection_index <- sort(c(1, 2, 3, mean_index, std_index))

merged_data <- merged_data[, selection_index]
rm(mean_index, std_index, selection_index, features)

# GET ACTIVITY LABELS FOR activity ID
# MAKE subject_ID AND activity_ID FACTORS
activity_labels <- read.table("./activity_labels.txt", header = F)

merged_data$subject_ID <- factor(merged_data$subject_ID)
merged_data$activity_ID <- factor(merged_data$activity_ID, levels = c(1:6), 
                                  labels = c(as.character(activity_labels$V2))
                                  )

rm(activity_labels)

message("Data merged, extracted, and labeled. Creating tidy dataset...")

# FINALIZE REQUESTED TIDY DATA SET
# "average of each variable for each activity and each subject"
melted_data <- melt(merged_data)
tidy_data <- dcast(melted_data, subject_ID + condition_ID + activity_ID ~ variable, mean)

# OUTPUT TIDY DATA AND CLEAN UP EXTRACTED FILES
# adjust working directory back to starting point
setwd("../")
setwd("../")

# write the new data
write.table(tidy_data, "./tidy_wearable_data.txt", row.names = F)

# clean up workspace
rm(melted_data, merged_data)

message("Tidy data set created in workspace as tidy_data and output as tidy_data.txt.")