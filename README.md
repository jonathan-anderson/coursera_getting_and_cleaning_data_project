Coursera's "Getting and Cleaning Data" Class Project: Human Activity Recognition Using Smart Phones
===========

This guide explains the goal of the class project and provides explicit, step-by-step instructions for the reader to obtain and duplicate the results. 


Overview of Project
===========

["Getting and Cleaning Data"](https://class.coursera.org/getdata-002) is a ["Coursera"](https://www.coursera.org/) course designed to familiarize students with the methods and tools used to obtain and pre-process raw data for analysis from different sources and of different formats. 

Our class project requires we combine the skills learned to extract and process information from a study on ["recognizing human activity from smart phone data"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  Additionally, we've been asked to provide clear documentation using ["Github"](https://github.com/) and its standards of practice for colloboration and reproducible research, which were also components of our course. 


Data and Objective
===========

## Data
The data set is described by the authors as consisting of:

Source: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

## Objective
Our projects requires that we: 

> You should create one R script called run_analysis.R that does the following. 
> 1. Merges the training and the test sets to create one data set.
> 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
> 3. Uses descriptive activity names to name the activities in the data set
> 4. Appropriately labels the data set with descriptive activity names. 
> 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Additionally, we are required to prepare a README.md file explaining how to follow along to obtain and duplicate the results if necessary and a CodeBook.md that supplements that README.md by explaining the variables and detailing the step-by-step procedure used to produce the final tidy data set required in 5. above. 


Scripts
===========

