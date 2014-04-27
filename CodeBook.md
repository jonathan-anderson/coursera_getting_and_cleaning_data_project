Coursera's *Getting and Cleaning Data* Class Project
===========
The project objective is to obtain a final tidy data set by following the steps 1-5 detailed in ["README.md"](https://github.com/jonathan-anderson/coursera_getting_and_cleaning_data_project/blob/master/README.md).  This codebook describes the variables, the data, and all transformations performed to clean up the data before producing the final tidy data set. 


Part 0: Preliminary
===========

#### Required Software

Before proceeding, please make sure you have installed R and are familiar enough with saving, opening, and executing a .R script. To download or if you need help with R-specific questions, please consult ["The Official R Website"](http://www.r-project.org/). 


#### Description of Data



Part 1: Save and Run "run_analysis.R"
===========
Running the script will do the following: 

#### 1. Unzip and save the data to a new folder titled _"UCI HAR Dataset"_ in your current working directory
please note I tried to make the download OS-agnostic by recognizing your current system, but if you are having trouble downloading the data please type `?download.file` on the command line to read about the function, particularly the parameter *method*.

#### 2. Read-in the required data to R environment
Here the script will check to see if you have installed the ["`data.table`"](http://cran.r-project.org/web/packages/data.table/index.html) package and install it if you do not.  If you aren't familiar with it, I would encourage to read about this package since it dramatically improves performance for many common tasks within R. Depending on your installation, you may be prompted to install other packages that are required run the script.  These can be easily installed using the command `install.packages("name_of_package")`.

#### 3. Combine data, select desired fields, and add descriptive values to index field
Here we first aggregate the data as required in Step 1.  Then we filter the fields for only those fields containing measurements of *mean* or *standard deviation* as required in Step 2.  This is achieved with something similiar to a match search for the strings *mean* and *std* within the data's field names.  Formally, `grep(".\*mean.\*|.\*std.\*", ...)`.  Lastly we add a descriptive field to the `activity_id` to include the name of the activity as requested in Steps 3-4. 


#### 4. Aggregate data to create tidy data set and save it
Lastly we aggregate the transformed data set by the subject and activity type to create the final tidy data set per Step 5 then save it to the current working directory. 









