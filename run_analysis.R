# Coursera's "Getting and Cleaning Data" Project
# Author: Jonathan Anderson
# Date Created: 4/26/2014


###########################################################################################################
## Part 1:  Merges the training and the test sets to create one data set. 
##          Final Output: dt.dat
###########################################################################################################
  
  ### Create temp file
  tmp <- tempfile()
  ### Download file and save to temp; add "...method = 'curl'..." if OS is Mac 
  download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
              destfile = tmp,
              if (length(grep("mac", Sys.info()["sysname"], ignore.case = TRUE)) >= 1) {
                method = "curl"
              } else {
                method = NULL
              }
  )
  ### Unzip file to current working directory
  unzip(tmp, exdir = getwd())
  unlink(tmp)
  remove(method, tmp)
  ### Read-in data
    #### Install package "data.table" if not already installed in order to make use of fread()
    if ("data.table" %in% rownames(installed.packages()) == FALSE)
      install.packages("data.table")
    library(data.table)
    #### Read-in with fread()
    dt.subject.test <- fread("./UCI HAR Dataset/test/subject_test.txt")
      ##### dt.X.test <- fread("./UCI HAR Dataset/test/X_test.txt") 
      ##### fread() throws error with missing first value (unresolved)
      ##### link on SO: http://stackoverflow.com/questions/22344161/fread-unable-to-read-csv-files-with-first-column-empty
    dt.X.test <- data.table(read.table("./UCI HAR Dataset/test/X_test.txt")) 
    dt.y.test <- fread("./UCI HAR Dataset/test/y_test.txt")
    dt.subject.train <- fread("./UCI HAR Dataset/train/subject_train.txt")
    dt.X.train <- data.table(read.table("./UCI HAR Dataset/train/X_train.txt")) 
    dt.y.train <- fread("./UCI HAR Dataset/train/y_train.txt")
    #### Column-bind test data then train data, then row-bind test with train data
    dt.test <- cbind(dt.subject.test, dt.y.test, dt.X.test)
    remove(dt.subject.test, dt.y.test, dt.X.test)
    dt.test[, set := "test"] # Add a field to identify data as test
    dt.train <- cbind(dt.subject.train, dt.y.train, dt.X.train)
    remove(dt.subject.train, dt.y.train, dt.X.train)
    dt.train[, set := "train"]  # Add a field to identify data as train
    dt.dat <- rbind(dt.test, dt.train)
    remove(dt.test, dt.train)    

  ### Final Output: dt.dat

###########################################################################################################
## Part 2:  Extracts only the measurements on the mean and standard deviation for each measurement.
##          Final Output: dt.dat
###########################################################################################################

  ### Create table of dt.dat feature names from features.txt
  dat.names <- rbind("subject_id", "activity_id", fread("./UCI HAR Dataset/features.txt")[, 2, with = FALSE])
  ### Set names of dt.dat
  for (j in seq(ncol(dt.dat))) {
    setnames(dt.dat, j, as.character(dat.names[j]))
  }
  remove(dat.names, j)
  ### Select only columns that contain "mean" or "std" in their description, excluding two index fields
  dt.dat <- dt.dat[, c(1, 2, grep(".*mean.*|.*std.*", names(dt.dat))), with = FALSE]

  ### Final Output: dt.dat

###########################################################################################################
## Part 3 & 4:  Uses descriptive activity names to name the activities in the data set.
##              Appropriately labels the data set with descriptive activity names. 
##              Final Output: dt.dat
###########################################################################################################

  ### Read-in activity lables
  dt.act <- fread("./UCI HAR Dataset/activity_labels.txt")
  setnames(dt.act, c("activity_id", "activity_desc"))
  ### Set index keys to improve join performance
  setkeyv(dt.act, "activity_id")
  setkeyv(dt.dat, "subject_id")
  setkeyv(dt.dat, "activity_id")
  ### Merge activity labels with dt.dat
  dt.dat <- merge(dt.dat, dt.act, by = "activity_id")
  remove(dt.act)

  ### Final Output: dt.dat

###########################################################################################################
## Part 5:  Creates a second, independent tidy data set with the average of each variable for each activity 
##          and each subject. 
##          Final Output: dts.dat
###########################################################################################################

  ### Create summarized data.table and write it to current dir
  dts.dat <- dt.dat[, lapply(.SD, mean), by = list(activity_id, subject_id, activity_desc)]
  write.table(dts.dat, "./tidy_data.txt", sep = ",", row.names = FALSE)

  ### Final Output: dts.dat


