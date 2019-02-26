## Getting and Cleaning Data Project

The R script does the following:

1. Train data.

	1.1 Sets the working directory for the train data and reads the following tables:
	
		*Subject data
		*Activity data
		*Sensors data
		
	1.2 Sets the working directory to read the features table.
	
	1.3 Extracts the names of the features and assigns it to a vector called "features".
	
	1.4 Change the name of the columns of the sensors data to the features names.
	
	1.5 The sensors data is filtered and only the mean and std for each measurement using the grepl() function
	
	1.6 Merges the datasets using the cbind() function.	

2. Test data.

		*Repeats the same steps for the train data but using the test folder

3. Binding the test and train datasets.

	3.1 Using the rbind() function the train and test data its merged into a dataset called completeData.


4. Changing the activity labels to a descriptive name of the completeData dataset.

	4.1 The activity labels 1,2,3,4,5 adn 6 are changed using the "activity_labels.txt" file as a reference.


5. Second Data Set

	5.1 A copy of completeData is made and it's called completeData_2. This second dataset is arranged by subject.
	
	5.2 A third dataset called summary_Data is created which contains the average value for each activity for each subject.

6. Removing unnecessary data

	6.1 At the end of the script the following datasets are removed:
	
		*activity_test
		*activity_train
		*completeData_2
		*subject_test
		*subject_train
		*testComplete
		*trainComplete
		*data_test
		*data_train
