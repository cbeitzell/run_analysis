# Run Analysis
<p>This code book is for a tidy data set located in RunAnalysis.txt, which was created from the Human Activity Recognition Using Smartphones test. (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) The data from the original test was derived by measuring activies using smartphones. This code book will describe the averaging of the mean and standard deviation variables of the original data set.  It consists of a description of the data, a definition of the variables in the new data set, and a description of the steps taken to transform the data into a tidy version. </p>
- [The Data](#The Data)
- [Code book](#Code book)
- [Study design](#Study design)

<hr>
<a name="The Data"/>
# The Data
<p>The original data was gained from an experiment consiting of 30 volunteers using the Samsung Galaxy S II. During the test the volunteers were ask to wear the smartphone on their waste and perform 6 activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING).  Data was collected from the accelerometers and gyroscopes, capturing the 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. From the data 70% were placed into a training set and 30% in to a test set.</p>

<p>A further explained method of the data collection. "The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain." (README.txt,http://archive.ics.uci.edu/ml/machine-learning-databases/00341/HAPT Data Set.zip) </p>

<p>A set of raw inertial signal data was compiled from the different sensor signals, and movement.  "The unitsused for the "accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2). The gyroscope units are rad/seg." (Notes, http://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions#)  The data in the inertial data sets was then compiled into the train and test sets.  The values in those set files are the normalized and bounded values of the interial data into a -1 to 1 range.</p>

<p>To create the tidy data in RunAnalysis.txt, the mean and standard deviation variables extracted from the two sets.  The sets were then correlated to the subject id and activity for that vector of data. The two sets were joined and the average for each variable by subject and activity was measured.</p>
* NOTE: The frequency mean was not included as one of the mean variables as is a measurement used to find the mean of a frequency. The other mean variables dealt with the mean of the particular sensor signal meansurement in question.

<p>The data is in wide format, consisting of 181 rows (1 row of header variables, and 180 rows of data) and 68 columns.  It is order by the Subject, and then Activity columns.  The Averaged mean and standard deviation variables then follow.  This data set follows the tidy data princples:</p>
1. Each variable is in a column.
2. Every row is for a different observation, I.e. the the subject and activity combination is unique.
3. There is one table for the overall averaging of the data set.
4. The first row of the RunAnalysis.txt is the list of variable names.
5. The variable names have been converted from the experiment code names to something more readable.
	* tBodyAcc-mean()-X to Time.Body.Accelerometer.Average.X

<hr>
<a name="Code book"/>
# Code book
<p>The variable definitions are formatted as such:</p>
#### Variable Name   (number of characters in value)
  *Definition of the variable
    *value and meaning of the variable
 
1. Subject (2) 						
  * Test Volunteer subject number
    * 1..30 .Unique identifier assigned to test subject

2. Activity (18)
  * Activity performed during tests
    * WALKING
    * WALKING_UPSTAIRS
    * WALKING_DOWNSTAIRS
    * SITTING
    * STANDING
    * LAYING

> #### Time.Body.Accelerometer.Mean.X (14)
>> The Mean of the body linear acceleration derived in time for the X axis from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Accelerometer.Mean.Y (14)
>> The Mean of the body linear acceleration derived in time for the Y axis from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Accelerometer.Mean.Z (14)
>> The Mean of the body linear acceleration derived in time for the X axis from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Accelerometer.Standard.Deviation.X (14)
>> The Standard Deviation of the body linear acceleration derived in time for the X axis from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Accelerometer.Standard.Deviation.Y (14)
>> The Standard Deviation of the body linear acceleration derived in time for the Y axis from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Accelerometer.Standard.Deviation.Z (14)
>> The Standard Deviation of the body linear acceleration derived in time for the Z axis from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Gravity.Accelerometer.Mean.X (14)
>> The Mean of the gravity acceleration derived in time for the X axis from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Gravity.Accelerometer.Mean.Y (14)
>> The Mean of the gravity acceleration derived in time for the Y axis from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Gravity.Accelerometer.Mean.Z (14)
>> The Mean of the gravity acceleration derived in time for the Z axis from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Gravity.Accelerometer.Standard.Deviation.X (14)
>> The Standard Deviation of the gravity acceleration derived in time for the X axis from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Gravity.Accelerometer.Standard.Deviation.Y (14)
>> The Standard Deviation of the gravity acceleration derived in time for the Y axis from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Gravity.Accelerometer.Standard.Deviation.Z (14)
>> The Standard Deviation of the gravity acceleration derived in time for the Z axis from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Accelerometer.Jerk.Mean.X (14)
>> The Mean of the jerk signals obtained from the body linear acceleration derived in time for the X axis of the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Accelerometer.Jerk.Mean.Y (14)
>> The Mean of the jerk signals obtained from the body linear acceleration derived in time for the Y axis of the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Accelerometer.Jerk.Mean.Z (14)
>> The Mean of the jerk signals obtained from the body linear acceleration derived in time for the Z axis of the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Accelerometer.Jerk.Standard.Deviation.X (14)
>> The Standard Deviation of the jerk signals obtained from the body linear acceleration derived in time for the X axis of the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Accelerometer.Jerk.Standard.Deviation.Y (14)
>> The Standard Deviation of the jerk signals obtained from the body linear acceleration derived in time for the Y axis of the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Accelerometer.Jerk.Standard.Deviation.Z (14)
>> The Standard Deviation of the jerk signals obtained from the body linear acceleration derived in time for the Z axis of the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Gyroscope.Mean.X (14)
>> The Mean of the body angular velocity derived in time for the X axis from the gyroscope.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Gyroscope.Mean.Y (14)
>> The Mean of the body angular velocity derived in time for the Y axis from the gyroscope.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Gyroscope.Mean.Z (14)
>> The Mean of the body angular velocity derived in time for the Z axis from the gyroscope.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Gyroscope.Standard.Deviation.X (14)
>> The Standard Deviation of the body angular velocity derived in time for the X axis from the gyroscope.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Gyroscope.Standard.Deviation.Y (14)
>> The Standard Deviation of the body angular velocity derived in time for the Y axis from the gyroscope.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Gyroscope.Standard.Deviation.Z (14)
>> The Standard Deviation of the body angular velocity derived in time for the Z axis from the gyroscope.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Gyroscope.Jerk.Mean.X (14)
>> The Mean of the jerk signals obtained from the body angular velocity derived in time for the X axis of the gyroscope.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Gyroscope.Jerk.Mean.Y (14)
>> The Mean of the jerk signals obtained from the body angular velocity derived in time for the Y axis of the gyroscope.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Gyroscope.Jerk.Mean.Z (14)
>> The Mean of the jerk signals obtained from the body angular velocity derived in time for the Z axis of the gyroscope.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Gyroscope.Jerk.Standard.Deviation.X (14)
>> The Standard Deviation of the jerk signals obtained from the body angular velocity derived in time for the X axis of the gyroscope.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Gyroscope.Jerk.Standard.Deviation.Y (14)
>> The Standard Deviation of the jerk signals obtained from the body angular velocity derived in time for the Y axis of the gyroscope.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Gyroscope.Jerk.Standard.Deviation.Z (14)
>> The Standard Deviation of the jerk signals obtained from the body angular velocity derived in time for the Z axis of the gyroscope.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Accelerometer.Mag.Mean (14)
>> The Mean for the magnitude of the body linear acceleration derived in time for the X,Y,Z axis from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Accelerometer.Mag.Standard.Deviation (14)
>> The Standard Deviation for the magnitude of the body linear acceleration derived in time for the X,Y,Z axis from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Gravity.Accelerometer.Mag.Mean (14)
>> The Mean for the magnitude of the gravity acceleration derived in time for the X,Y,Z axis from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Gravity.Accelerometer.Mag.Standard.Deviation (14)
>> The Standard Deviation for the magnitude of the gravity acceleration derived in time from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Accelerometer.Jerk.Mag.Mean (14)
>> The Mean for the magnitude of the jerk signals obtained from the body linear acceleration derived in time from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Accelerometer.Jerk.Mag.Standard.Deviation (14)
>> The Standard Deviation for the magnitude of the jerk signals obtained from the body linear acceleration derived in time from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Gyroscope.Mag.Mean (14)
>> The Mean for the magnitude obtained from the body angular velocity derived in time from the gyroscope.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Gyroscope.Mag.Standard.Deviation (14)
>> The Standard Deviation for the magnitude obtained from the body angular velocity derived in time from the gyroscope.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Gyroscope.Jerk.Mag.Mean (14)
>> The Mean for the magnitude of the jerk signals obtained from the body angular velocity derived in time from the gyroscope.
>>> * -1.00000000000 .. 1.00000000000

> #### Time.Body.Gyroscope.Jerk.Mag.Standard.Deviation (14)
>> The Standard Deviation for the magnitude of the jerk signals obtained from the body angular velocity derived in time from the gyroscope.
>>> * -1.00000000000 .. 1.00000000000

> #### Frequency.Body.Accelerometer.Mean.X (14)
>> Fast Fourier Transform applied to the Mean of the body linear acceleration derived in time for the X axis from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Frequency.Body.Accelerometer.Mean.Y (14)
>> Fast Fourier Transform applied to the Mean of the body linear acceleration derived in time for the Y axis from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Frequency.Body.Accelerometer.Mean.Z (14)
>> Fast Fourier Transform applied to the Mean of the body linear acceleration derived in time for the X axis from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Frequency.Body.Accelerometer.Standard.Deviation.X (14)
>> Fast Fourier Transform applied to the Standard Deviation of the body linear acceleration derived in time for the X axis from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Frequency.Body.Accelerometer.Standard.Deviation.Y (14)
>> Fast Fourier Transform applied to the Standard Deviation of the body linear acceleration derived in time for the Y axis from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Frequency.Body.Accelerometer.Standard.Deviation.Z (14)
>> Fast Fourier Transform applied to the Standard Deviation of the body linear acceleration derived in time for the Z axis from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Frequency.Body.Accelerometer.Jerk.Mean.X (14)
>> Fast Fourier Transform applied to the Mean of the jerk signals obtained from the body linear acceleration derived in time for the X axis of the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Frequency.Body.Accelerometer.Jerk.Mean.Y (14)
>> Fast Fourier Transform applied to the Mean of the jerk signals obtained from the body linear acceleration derived in time for the Y axis of the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Frequency.Body.Accelerometer.Jerk.Mean.Z (14)
>> Fast Fourier Transform applied to the Mean of the jerk signals obtained from the body linear acceleration derived in time for the Z axis of the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Frequency.Body.Accelerometer.Jerk.Standard.Deviation.X (14)
>> Fast Fourier Transform applied to the Standard Deviation of the jerk signals obtained from the body linear acceleration derived in time for the X axis of the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Frequency.Body.Accelerometer.Jerk.Standard.Deviation.Y (14)
>> Fast Fourier Transform applied to the Standard Deviation of the jerk signals obtained from the body linear acceleration derived in time for the Y axis of the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Frequency.Body.Accelerometer.Jerk.Standard.Deviation.Z (14)
>> Fast Fourier Transform applied to the Standard Deviation of the jerk signals obtained from the body linear acceleration derived in time for the Z axis of the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Frequency.Body.Gyroscope.Mean.X (14)
>> Fast Fourier Transform applied to the Mean of the body angular velocity derived in time for the X axis from the gyroscope.
>>> * -1.00000000000 .. 1.00000000000

> #### Frequency.Body.Gyroscope.Mean.Y (14)
>> Fast Fourier Transform applied to the Mean of the body angular velocity derived in time for the Y axis from the gyroscope.
>>> * -1.00000000000 .. 1.00000000000

> #### Frequency.Body.Gyroscope.Mean.Z (14)
>> Fast Fourier Transform applied to the Mean of the body angular velocity derived in time for the Z axis from the gyroscope.
>>> * -1.00000000000 .. 1.00000000000

> #### Frequency.Body.Gyroscope.Standard.Deviation.X (14)
>> Fast Fourier Transform applied to the Standard Deviation of the body angular velocity derived in time for the X axis from the gyroscope.
>>> * -1.00000000000 .. 1.00000000000

> #### Frequency.Body.Gyroscope.Standard.Deviation.Y (14)
>> Fast Fourier Transform applied to the Standard Deviation of the body angular velocity derived in time for the Y axis from the gyroscope.
>>> * -1.00000000000 .. 1.00000000000

> #### Frequency.Body.Gyroscope.Standard.Deviation.Z (14)
>> Fast Fourier Transform applied to the Standard Deviation of the body angular velocity derived in time for the Z axis from the gyroscope.
>>> * -1.00000000000 .. 1.00000000000

> #### Frequency.Body.Accelerometer.Mag.Mean (14)
>> Fast Fourier Transform applied to the Mean for the magnitude of the body linear acceleration derived in time for the X,Y,Z axis from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Frequency.Body.Accelerometer.Mag.Standard.Deviation (14)
>> Fast Fourier Transform applied to the Standard Deviation for the magnitude of the body linear acceleration derived in time for the X,Y,Z axis from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Frequency.BodyBody.Accelerometer.Jerk.Mag.Mean (14)
>> Fast Fourier Transform applied to the Mean for the magnitude of the jerk signals obtained from the body linear acceleration derived in time from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Frequency.BodyBody.Accelerometer.Jerk.Mag.Standard.Deviation (14)
>> Fast Fourier Transform applied to the Standard Deviation for the magnitude of the jerk signals obtained from the body linear acceleration derived in time from the accelerometer.
>>> * -1.00000000000 .. 1.00000000000

> #### Frequency.BodyBody.Gyroscope.Mag.Mean (14)
>> Fast Fourier Transform applied to the Mean for the magnitude obtained from the body angular velocity derived in time from the gyroscope.
>>> * -1.00000000000 .. 1.00000000000

> #### Frequency.BodyBody.Gyroscope.Mag.Standard.Deviation (14)
>> Fast Fourier Transform applied to the Standard Deviation for the magnitude obtained from the body angular velocity derived in time from the gyroscope.
>>> * -1.00000000000 .. 1.00000000000

> #### Frequency.BodyBody.Gyroscope.Jerk.Mag.Mean (14)
>> Fast Fourier Transform applied to the Mean for the magnitude of the jerk signals obtained from the body angular velocity derived in time from the gyroscope.
>>> * -1.00000000000 .. 1.00000000000

> #### Frequency.BodyBody.Gyroscope.Jerk.Mag.Standard.Deviation (14)
>> Fast Fourier Transform applied to the Standard Deviation for the magnitude of the jerk signals obtained from the body angular velocity derived in time from the gyroscope.
>>> * -1.00000000000 .. 1.00000000000

<hr>
<a name="Study design"/>
# Study design

<p>Transforming the data required the joining of several pieces of data.  Before joining the necessary labels and columns needed to be gained.</p>

<p>Read in the raw variable names.</p>
* featureDef <- read.table("features.txt")
<p>Pull out the coulmns numbers and names strictly for mean and standard deviation.</p>
* meanStdList <- featureDef[grepl("^.*mean..$|^.*std..$|^.*mean..-[XYZ]$|^.*std..-[XYZ]$",featureDef$V2, perl = TRUE),]
<p>Convert the variable names into something more meaningful. To do this a simple replacement of key words was used.</p>
* featureDef$V2 <- gsub("^f","Frequency.",gsub("^t","Time.",gsub("[:():]","",featureDef$V2)))
* featureDef$V2 <- gsub("std","Standard.Deviation",gsub("mean","Mean",gsub("[:():]","",featureDef$V2)))
* featureDef$V2 <- gsub("Acc",".Accelerometer",featureDef$V2)
* featureDef$V2 <- gsub("Gyro",".Gyroscope",featureDef$V2)
* featureDef$V2 <- gsub("Jerk",".Jerk",featureDef$V2)
* featureDef$V2 <- gsub("Mag",".Mag",featureDef$V2)
<p>see the reference table for a listing of variable transformations.</p>
- [Variables](#Variables)
<p>next read the list of activity list.</p>
* activityDef <- read.table("activity_labels.txt")
<p>With all of the labels gained, the data sets can be created through the use of a getData function.</p>
* trainDF <- getData("train",featureDef$V2,activityDef,meanStdList)
* testDF <- getData("test",featureDef$V2,activityDef,meanStdList)

<p>The getData function joins the activities list and variable names to the data sets</p>
* getData <- function(dirTT, colN, actDef, msList) {
*        setwd(dirTT)
<p>Read in the data set and add the variable names to all data. using the read.table function was the easiest method for pulling the data into R.  Fread would have been faster, but speed was not a factor, and fread was causing some issues locally.</p>
*        X <- read.table(paste(c("X_",dirTT,".txt"), collapse = ""), col.names = colN)
<p>Read in the activity list for that dataset and translate it to a descriptive name.</p>
*        y <- read.table(paste(c("y_",dirTT,".txt"), collapse = ""))
*        joinY <- join(y,actDef)
<p>Read in the subject list for that data set</p>
*        subject <- read.table(paste(c("subject_",dirTT,".txt"), collapse = ""))
*        setwd("..")
<p>Pull out the mean and std variables from the dataset.</p>
        X <- select(X,msList$V1)
<p>Finally create the new mini tidy data set and return it.
*        returnDF <- cbind(Subject = subject$V1, Activity = joinY$V2, X)
*        return(returnDF)
* }
<p>With the new datasets for training and test, the data can be merged into one set and ordered.</p>
* totalDF <- arrange(rbind(trainDF,testDF), Subject, Activity)
<p>Still this is the full data for every Subject and Activity and needs to be averaged.  To do that the lappy function is used to apply the mean function accross the entire data frame.</p>
* totalDT <- as.data.table(totalDF)[,lapply(.SD,mean), by=list(Subject,Activity)]
* write.table(totalDT, file = "RunAnalysis.txt", row.names = FALSE )
<hr>
<p></p>

<a name="Variables"/>
# Variables Transformation

<p>The variable names needed to be expaneded to really become descritpive. Below is the table of the original variable names and the converetd name.</p>

<table>
	<tr>
		<td>tBodyAcc-mean()-X</td>
		<td>Time.Body.Accelerometer.Average.X</td>
	</tr>
	<tr>
		<td>tBodyAcc-mean()-Y</td>
		<td>Time.Body.Accelerometer.Average.Y</td>
	</tr>
	<tr>
		<td>tBodyAcc-mean()-Z</td>
		<td>Time.Body.Accelerometer.Average.Z</td>
	</tr>
	<tr>
		<td>tBodyAcc-std()-X</td>
		<td>Time.Body.Accelerometer.Standard.Deviation.X</td>
	</tr>
	<tr>
		<td>tBodyAcc-std()-Y</td>
		<td>Time.Body.Accelerometer.Standard.Deviation.Y</td>
	</tr>
	<tr>
		<td>tBodyAcc-std()-Z</td>
		<td>Time.Body.Accelerometer.Standard.Deviation.Z</td>
	</tr>
	<tr>
		<td>tGravityAcc-mean()-X</td>
		<td>Time.Gravity.Accelerometer.Average.X</td>
	</tr>
	<tr>
		<td>tGravityAcc-mean()-Y</td>
		<td>Time.Gravity.Accelerometer.Average.Y</td>
	</tr>
	<tr>
		<td>tGravityAcc-mean()-Z</td>
		<td>Time.Gravity.Accelerometer.Average.Z</td>
	</tr>
	<tr>
		<td>tGravityAcc-std()-X</td>
		<td>Time.Gravity.Accelerometer.Standard.Deviation.X</td>
	</tr>
	<tr>
		<td>tGravityAcc-std()-Y</td>
		<td>Time.Gravity.Accelerometer.Standard.Deviation.Y</td>
	</tr>
	<tr>
		<td>tGravityAcc-std()-Z</td>
		<td>Time.Gravity.Accelerometer.Standard.Deviation.Z</td>
	</tr>
	<tr>
		<td>tBodyAccJerk-mean()-X</td>
		<td>Time.Body.Accelerometer.Jerk.Average.X</td>
	</tr>
	<tr>
		<td>tBodyAccJerk-mean()-Y</td>
		<td>Time.Body.Accelerometer.Jerk.Average.Y</td>
	</tr>
	<tr>
		<td>tBodyAccJerk-mean()-Z</td>
		<td>Time.Body.Accelerometer.Jerk.Average.Z</td>
	</tr>
	<tr>
		<td>tBodyAccJerk-std()-X</td>
		<td>Time.Body.Accelerometer.Jerk.Standard.Deviation.X</td>
	</tr>
	<tr>
		<td>tBodyAccJerk-std()-Y</td>
		<td>Time.Body.Accelerometer.Jerk.Standard.Deviation.Y</td>
	</tr>
	<tr>
		<td>tBodyAccJerk-std()-Z</td>
		<td>Time.Body.Accelerometer.Jerk.Standard.Deviation.Z</td>
	</tr>
	<tr>
		<td>tBodyGyro-mean()-X</td>
		<td>Time.Body.Gyroscope.Average.X</td>
	</tr>
	<tr>
		<td>tBodyGyro-mean()-Y</td>
		<td>Time.Body.Gyroscope.Average.Y</td>
	</tr>
	<tr>
		<td>tBodyGyro-mean()-Z</td>
		<td>Time.Body.Gyroscope.Average.Z</td>
	</tr>
	<tr>
		<td>tBodyGyro-std()-X</td>
		<td>Time.Body.Gyroscope.Standard.Deviation.X</td>
	</tr>
	<tr>
		<td>tBodyGyro-std()-Y</td>
		<td>Time.Body.Gyroscope.Standard.Deviation.Y</td>
	</tr>
	<tr>
		<td>tBodyGyro-std()-Z</td>
		<td>Time.Body.Gyroscope.Standard.Deviation.Z</td>
	</tr>
	<tr>
		<td>tBodyGyroJerk-mean()-X</td>
		<td>Time.Body.Gyroscope.Jerk.Average.X</td>
	</tr>
	<tr>
		<td>tBodyGyroJerk-mean()-Y</td>
		<td>Time.Body.Gyroscope.Jerk.Average.Y</td>
	</tr>
	<tr>
		<td>tBodyGyroJerk-mean()-Z</td>
		<td>Time.Body.Gyroscope.Jerk.Average.Z</td>
	</tr>
	<tr>
		<td>tBodyGyroJerk-std()-X</td>
		<td>Time.Body.Gyroscope.Jerk.Standard.Deviation.X</td>
	</tr>
	<tr>
		<td>tBodyGyroJerk-std()-Y</td>
		<td>Time.Body.Gyroscope.Jerk.Standard.Deviation.Y</td>
	</tr>
	<tr>
		<td>tBodyGyroJerk-std()-Z</td>
		<td>Time.Body.Gyroscope.Jerk.Standard.Deviation.Z</td>
	</tr>
	<tr>
		<td>tBodyAccMag-mean()</td>
		<td>Time.Body.Accelerometer.Mag.Average</td>
	</tr>
	<tr>
		<td>tBodyAccMag-std()</td>
		<td>Time.Body.Accelerometer.Mag.Standard.Deviation</td>
	</tr>
	<tr>
		<td>tGravityAccMag-mean()</td>
		<td>Time.Gravity.Accelerometer.Mag.Average</td>
	</tr>
	<tr>
		<td>tGravityAccMag-std()</td>
		<td>Time.Gravity.Accelerometer.Mag.Standard.Deviation</td>
	</tr>
	<tr>
		<td>tBodyAccJerkMag-mean()</td>
		<td>Time.Body.Accelerometer.Jerk.Mag.Average</td>
	</tr>
	<tr>
		<td>tBodyAccJerkMag-std()</td>
		<td>Time.Body.Accelerometer.Jerk.Mag.Standard.Deviation</td>
	</tr>
	<tr>
		<td>tBodyGyroMag-mean()</td>
		<td>Time.Body.Gyroscope.Mag.Average</td>
	</tr>
	<tr>
		<td>tBodyGyroMag-std()</td>
		<td>Time.Body.Gyroscope.Mag.Standard.Deviation</td>
	</tr>
	<tr>
		<td>tBodyGyroJerkMag-mean()</td>
		<td>Time.Body.Gyroscope.Jerk.Mag.Average</td>
	</tr>
	<tr>
		<td>tBodyGyroJerkMag-std()</td>
		<td>Time.Body.Gyroscope.Jerk.Mag.Standard.Deviation</td>
	</tr>
	<tr>
		<td>fBodyAcc-mean()-X</td>
		<td>Frequency.Body.Accelerometer.Average.X</td>
	</tr>
	<tr>
		<td>fBodyAcc-mean()-Y</td>
		<td>Frequency.Body.Accelerometer.Average.Y</td>
	</tr>
	<tr>
		<td>fBodyAcc-mean()-Z</td>
		<td>Frequency.Body.Accelerometer.Average.Z</td>
	</tr>
	<tr>
		<td>fBodyAcc-std()-X</td>
		<td>Frequency.Body.Accelerometer.Standard.Deviation.X</td>
	</tr>
	<tr>
		<td>fBodyAcc-std()-Y</td>
		<td>Frequency.Body.Accelerometer.Standard.Deviation.Y</td>
	</tr>
	<tr>
		<td>fBodyAcc-std()-Z</td>
		<td>Frequency.Body.Accelerometer.Standard.Deviation.Z</td>
	</tr>
	<tr>
		<td>fBodyAccJerk-mean()-X</td>
		<td>Frequency.Body.Accelerometer.Jerk.Average.X</td>
	</tr>
	<tr>
		<td>fBodyAccJerk-mean()-Y</td>
		<td>Frequency.Body.Accelerometer.Jerk.Average.Y</td>
	</tr>
	<tr>
		<td>fBodyAccJerk-mean()-Z</td>
		<td>Frequency.Body.Accelerometer.Jerk.Average.Z</td>
	</tr>
	<tr>
		<td>fBodyAccJerk-std()-X</td>
		<td>Frequency.Body.Accelerometer.Jerk.Standard.Deviation.X</td>
	</tr>
	<tr>
		<td>fBodyAccJerk-std()-Y</td>
		<td>Frequency.Body.Accelerometer.Jerk.Standard.Deviation.Y</td>
	</tr>
	<tr>
		<td>fBodyAccJerk-std()-Z</td>
		<td>Frequency.Body.Accelerometer.Jerk.Standard.Deviation.Z</td>
	</tr>
	<tr>
		<td>fBodyGyro-mean()-X</td>
		<td>Frequency.Body.Gyroscope.Average.X</td>
	</tr>
	<tr>
		<td>fBodyGyro-mean()-Y</td>
		<td>Frequency.Body.Gyroscope.Average.Y</td>
	</tr>
	<tr>
		<td>fBodyGyro-mean()-Z</td>
		<td>Frequency.Body.Gyroscope.Average.Z</td>
	</tr>
	<tr>
		<td>fBodyGyro-std()-X</td>
		<td>Frequency.Body.Gyroscope.Standard.Deviation.X</td>
	</tr>
	<tr>
		<td>fBodyGyro-std()-Y</td>
		<td>Frequency.Body.Gyroscope.Standard.Deviation.Y</td>
	</tr>
	<tr>
		<td>fBodyGyro-std()-Z</td>
		<td>Frequency.Body.Gyroscope.Standard.Deviation.Z</td>
	</tr>
	<tr>
		<td>fBodyAccMag-mean()</td>
		<td>Frequency.Body.Accelerometer.Mag.Average</td>
	</tr>
	<tr>
		<td>fBodyAccMag-std()</td>
		<td>Frequency.Body.Accelerometer.Mag.Standard.Deviation</td>
	</tr>
	<tr>
		<td>fBodyBodyAccJerkMag-mean()</td>
		<td>Frequency.BodyBody.Accelerometer.Jerk.Mag.Average</td>
	</tr>
	<tr>
		<td>fBodyBodyAccJerkMag-std()</td>
		<td>Frequency.BodyBody.Accelerometer.Jerk.Mag.Standard.Deviation</td>
	</tr>
	<tr>
		<td>fBodyBodyGyroMag-mean()</td>
		<td>Frequency.BodyBody.Gyroscope.Mag.Average</td>
	</tr>
	<tr>
		<td>fBodyBodyGyroMag-std()</td>
		<td>Frequency.BodyBody.Gyroscope.Mag.Standard.Deviation</td>
	</tr>
	<tr>
		<td>fBodyBodyGyroJerkMag-mean()</td>
		<td>Frequency.BodyBody.Gyroscope.Jerk.Mag.Average</td>
	</tr>
	<tr>
		<td>fBodyBodyGyroJerkMag-std()</td>
		<td>Frequency.BodyBody.Gyroscope.Jerk.Mag.Standard.Deviation</td>
	</tr>
</table>

