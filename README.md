ClearData-CourseProject
=======================

Required data:
 1. "x_test.txt", "x_train.txt"
 2. "y_test.txt", "y_train.txt"
 3. "subject_test.txt", "subject_train.txt"
 4. "activity_labels.txt"
 5. "features.txt"

The code in run_analysis.R works in the following way:
 1. Read necessary data files into memory.
 2. Add "Subject" and "Activity" columns ("subject_t*" and "y_t*" files) to "test" and "train" data ("x_t*" files).
 3. Merge horizontally "test" and "train" data sets.
 4. Set column names by "features" file and label "Activity" column according to "activity_labels" file.
 5. Delete columns which do not represent means or ctandart deviation.
 6. Find means values of all variables (columns) by subject and activity. Write the result in separate file called "tidy.txt".
