# Dataclearning
## Getting and Cleaning Data Course Project

This project is to merge datasets of UCI HAR Dataset and the product a summarized tidy 
data set of average of feature measured data of each activity and each subject. Among those datasets of 
UCI HAR Dataset, x_train.txt and x_test.txt hols the measuring data of features, y_train.txt 
and y_test.txt hold the activities information. subjects_test.txt and subject_train hold the subject 
information which are volunteers(1-30), features_info.txt has the function name of each feature, 
and activity_labels.txt has the correspond activity names. Please refer to the Cook Book for
the detail descriptions about features, activity and subjects.
Following are steps to achieve this goal. 

1. loading x_test.txt, y_test.txt, x_train.txt, y_train.txt, subject_train.txt, subject_test.txt, activity_labels.txt, 
	and features.txt files into R
2. merge x_train.txt and x_test.txt into complete set of measurements called comb_x
3. merge y_train.txt and y_test.txt into complete set of subjects called comb_y
4. merge subject_train and subject_test into complete set of subject
5. assign variable name to each feature in comb_x 
6. select mean and standard deviation features from comb_x to new data frame called dtms
7. merge dtms with subjects
8. merge dtms with comb_y which is the activities
9. replace activities with its name corresponding to activity_labels.txt
10. summarize/analyze step 9 data frame for each activity and subject
11. replace feature names by appending "Avg of" up front
12.  output the final result of step 11 into a csv file

 

