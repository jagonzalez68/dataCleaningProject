dataCleaningProject
===================

Data cleaning project for the Data Science Track

This project contains 3 files:

1. This README.md file
2. The run_analysis.R file
3. The code_book.md file

# README.md
This file

# run_analysis.R
This section describes how the run_analysis.R script works.
- Lines 1 and 2 load the data.table and reshape2 libraries, respectively
- Line 3 gets the current working directory, wich assumes it is where the  
  program code is, the run_analysis.R script.
- Lines 4 - 5 are used to download the dataset for the first time
- Lines 6 - 7 are used to obtain the date and time the file was downloaded
- Lines 10 - 12 are used to read the training data  
  subject_train, contains the subject_train.txt file   
  X_train, contains the X_train.txt file  
  y_train, contains the y_train.txt file  
- Lines 15 - 17 are used to read the testing data
  subject_test, contains the subject_test.txt file   
  X_test, contains the X_test.txt file  
  y_test, contains the y_test.txt file  
- Lines 20 - 21 are used to read the feature names in fnames
- Lines 25 - 27 create the whole training set as a data table, and adds  
  the subject data and the activity data to the observations. This data  
  is stored in the train_data variable
- Lines 31 - 33 create the whole testing set as a data table, and add  
  the subject data and the activity data to the observations. This data  
  is stored in the test_set variable
- Line 37 merges the train_set and the test_set into the data_set variable
- Lines 40 - 43 obtain and print the mean and standard deviation of the  
  observations in the means and stdev variables respectively and prints them
- Lines 46 - 51 assign understandable names to the different activity values  
  as Walking, Walking_Upstairs, Walking_Downstairs, Sitting, Standing,  
  and Laying.
- Lines 57 - 60 assign understandable names to the variables from the  
  previously read values in variable fname. The file with the variables  
  names was manually modified because there were repeated variable names
- Line 65 was used to set the data_set into its long way using as id's the  
  subject + activity variables and expanding the values of all other variables.  
  This was done with the melt function of the reshape2 library and stored in  
  the data_set_long variable.
- Line 69 returns the data_set into its wide form using as the left side of the  
  formula the subject + activity variables and all other variables on the right  
  side. At the same time, the mean function is applied to the aggregated variables  
  by subject and activit and stored in the data_set_wide variable.
- Line 70 only changes the name of the dataset from data_set_wide to  
  activity_data_set, as the final dataset

# code_book.md
This file contains a description of the variables used in the activity_data_set
dataset.
