dataCleaningProject
===================

Data cleaning project for the Data Science Track

This project contains 3 files:

1. This README.md file
2. The run_analysis.R file
3. The code_book.md file

# README.md
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
