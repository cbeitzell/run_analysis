# Run Analysis
<p>This code book is for a tidy data set located in the RunAnalysis.txt file. It was created from a data set created in the Human Activity Recognition Using Smart phones experiement. (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) The data from the test was filtered for mean and standard deviation variables, and then averaged to create a new tidy data set.  This code book consists of a description of the tidy data, a definition of the variables in the new data set, and a description of the steps taken to transform the data into a tidier version. </p>
- [The Data](#The Data)
- [Code book](#Code book)
- [Study design](#Study design)

<hr>
<a name="The Data"/>
# The Data
<p>The original data was gained from an experiment consisting of 30 volunteers using the Samsung Galaxy S II. During the test volunteers were ask to wear the smart phone on their waste and perform 6 activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING).  Data was collected from the accelerometers and gyroscopes, by capturing the 3-axial linear acceleration and 3-axial angular velocity data at a constant rate of 50Hz. From the data 70% were placed into a training set and 30% in to a test set.</p>

<p>To get the data from the test, "the sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain." (README.txt,http://archive.ics.uci.edu/ml/machine-learning-databases/00341/HAPT Data Set.zip) This created a series of inertial data sets.</p>

<p>The units used for the "accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2). The gyroscope units are rad/seg." (Notes, http://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions#)  The data in the inertial data sets were then compiled into the train and test sets.  The values in the train and test sets are were normalized and bounded into a -1 to 1 range.  For the RunAnalysis.txt tidy data the normalized data from the test and train sets were merged and averaged by the subject ID and activity .</p>

<p>To create the tidy data in RunAnalysis.txt, the mean and standard deviation variables were extracted from the two sets.  The sets were then correlated to the subject id and activity for that vector of data. Next the two sets were joined and the average for each variable by subject and activity was measured, and finally ordered and properly labelled.  The methods used are discussed further in the Study design.</p>
* NOTE: This assignment called for the filtering out of the mean and standard variation variables.  This was interpreted to be strictly mean() and std() variables.  The frequency mean (meanFreq) variable was not included as one of the mean variables, because it is a measurement used to find the center/mean of a frequency, not the mean on the data collected. In addition the angle(..gravityMean) were also excluded, as the angle variables would be a measurement of angle between two vectors, and not strictly the mean of a the measured data.

<p>The data is in a wide format, consisting of 181 rows (1 row of header variables, and 180 rows of data) and 68 columns.  It is order by the Subject, and then Activity columns.  This data set follows the tidy data principles :</p>
1. Each variable is in a column.
2. Every row is for a different observation, I.e. the subject and activity combination is unique.
3. There is one table for the overall averaging of the data set.
4. The first row of the RunAnalysis.txt is the list of variable names.
5. The variable names have been converted from the experiment code names to something more readable.
	* tBodyAcc-mean()-X to Time.Body.Accelerometer.Average.X

<hr>
<a name="Code book"/>
# Code book
<p>The Code book contains definitions about the variables.  All Accelerometer variables are normalized values ranging from -1 to 1, and representing 'g's (gravity of earth -> 9.80665 m/seg2).  All Gyroscope variables are normalized values ranging from -1 to 1, and representing rad/seg.</p>

<p>The variable definitions are formatted as such:</p>

```
Variable Name   (number of characters in each variable)
  * Definition of the variable
    * value and meaning of the variable
```

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

3. Time.Body.Accelerometer.Mean.X (14)
  * The Mean of the body linear acceleration derived in time for the X axis from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

4. Time.Body.Accelerometer.Mean.Y (14)
  * The Mean of the body linear acceleration derived in time for the Y axis from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

5. Time.Body.Accelerometer.Mean.Z (14)
  * The Mean of the body linear acceleration derived in time for the X axis from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

6. Time.Body.Accelerometer.Standard.Deviation.X (14)
  * The Standard Deviation of the body linear acceleration derived in time for the X axis from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

7. Time.Body.Accelerometer.Standard.Deviation.Y (14)
  * The Standard Deviation of the body linear acceleration derived in time for the Y axis from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

8. Time.Body.Accelerometer.Standard.Deviation.Z (14)
  * The Standard Deviation of the body linear acceleration derived in time for the Z axis from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

9. Time.Gravity.Accelerometer.Mean.X (14)
  * The Mean of the gravity acceleration derived in time for the X axis from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

10. Time.Gravity.Accelerometer.Mean.Y (14)
  * The Mean of the gravity acceleration derived in time for the Y axis from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

11. Time.Gravity.Accelerometer.Mean.Z (14)
  * The Mean of the gravity acceleration derived in time for the Z axis from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

12. Time.Gravity.Accelerometer.Standard.Deviation.X (14)
  * The Standard Deviation of the gravity acceleration derived in time for the X axis from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

13. Time.Gravity.Accelerometer.Standard.Deviation.Y (14)
  * The Standard Deviation of the gravity acceleration derived in time for the Y axis from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

14. Time.Gravity.Accelerometer.Standard.Deviation.Z (14)
  * The Standard Deviation of the gravity acceleration derived in time for the Z axis from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

15. Time.Body.Accelerometer.Jerk.Mean.X (14)
  * The Mean of the jerk signals obtained from the body linear acceleration derived in time for the X axis of the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

16. Time.Body.Accelerometer.Jerk.Mean.Y (14)
  * The Mean of the jerk signals obtained from the body linear acceleration derived in time for the Y axis of the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

17. Time.Body.Accelerometer.Jerk.Mean.Z (14)
  * The Mean of the jerk signals obtained from the body linear acceleration derived in time for the Z axis of the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

18. Time.Body.Accelerometer.Jerk.Standard.Deviation.X (14)
  * The Standard Deviation of the jerk signals obtained from the body linear acceleration derived in time for the X axis of the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

19. Time.Body.Accelerometer.Jerk.Standard.Deviation.Y (14)
  * The Standard Deviation of the jerk signals obtained from the body linear acceleration derived in time for the Y axis of the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

20. Time.Body.Accelerometer.Jerk.Standard.Deviation.Z (14)
  * The Standard Deviation of the jerk signals obtained from the body linear acceleration derived in time for the Z axis of the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

21. Time.Body.Gyroscope.Mean.X (14)
  * The Mean of the body angular velocity derived in time for the X axis from the gyroscope.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from rad/seg

22. Time.Body.Gyroscope.Mean.Y (14)
  * The Mean of the body angular velocity derived in time for the Y axis from the gyroscope.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from rad/seg

23. Time.Body.Gyroscope.Mean.Z (14)
  * The Mean of the body angular velocity derived in time for the Z axis from the gyroscope.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from rad/seg

24. Time.Body.Gyroscope.Standard.Deviation.X (14)
  * The Standard Deviation of the body angular velocity derived in time for the X axis from the gyroscope.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from rad/seg

25. Time.Body.Gyroscope.Standard.Deviation.Y (14)
  * The Standard Deviation of the body angular velocity derived in time for the Y axis from the gyroscope.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from rad/seg

26. Time.Body.Gyroscope.Standard.Deviation.Z (14)
  * The Standard Deviation of the body angular velocity derived in time for the Z axis from the gyroscope.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from rad/seg

27. Time.Body.Gyroscope.Jerk.Mean.X (14)
  * The Mean of the jerk signals obtained from the body angular velocity derived in time for the X axis of the gyroscope.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from rad/seg

28. Time.Body.Gyroscope.Jerk.Mean.Y (14)
  * The Mean of the jerk signals obtained from the body angular velocity derived in time for the Y axis of the gyroscope.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from rad/seg

29. Time.Body.Gyroscope.Jerk.Mean.Z (14)
  * The Mean of the jerk signals obtained from the body angular velocity derived in time for the Z axis of the gyroscope.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from rad/seg

30. Time.Body.Gyroscope.Jerk.Standard.Deviation.X (14)
  * The Standard Deviation of the jerk signals obtained from the body angular velocity derived in time for the X axis of the gyroscope.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from rad/seg

31. Time.Body.Gyroscope.Jerk.Standard.Deviation.Y (14)
  * The Standard Deviation of the jerk signals obtained from the body angular velocity derived in time for the Y axis of the gyroscope.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from rad/seg

32. Time.Body.Gyroscope.Jerk.Standard.Deviation.Z (14)
  * The Standard Deviation of the jerk signals obtained from the body angular velocity derived in time for the Z axis of the gyroscope.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from rad/seg

33. Time.Body.Accelerometer.Mag.Mean (14)
  * The Mean for the magnitude of the body linear acceleration derived in time for the X,Y,Z axis from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

34. Time.Body.Accelerometer.Mag.Standard.Deviation (14)
  * The Standard Deviation for the magnitude of the body linear acceleration derived in time for the X,Y,Z axis from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

35. Time.Gravity.Accelerometer.Mag.Mean (14)
  * The Mean for the magnitude of the gravity acceleration derived in time for the X,Y,Z axis from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

36. Time.Gravity.Accelerometer.Mag.Standard.Deviation (14)
  * The Standard Deviation for the magnitude of the gravity acceleration derived in time from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

37. Time.Body.Accelerometer.Jerk.Mag.Mean (14)
  * The Mean for the magnitude of the jerk signals obtained from the body linear acceleration derived in time from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

38. Time.Body.Accelerometer.Jerk.Mag.Standard.Deviation (14)
  * The Standard Deviation for the magnitude of the jerk signals obtained from the body linear acceleration derived in time from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

39. Time.Body.Gyroscope.Mag.Mean (14)
  * The Mean for the magnitude obtained from the body angular velocity derived in time from the gyroscope.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from rad/seg

40. Time.Body.Gyroscope.Mag.Standard.Deviation (14)
  * The Standard Deviation for the magnitude obtained from the body angular velocity derived in time from the gyroscope.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from rad/seg

41. Time.Body.Gyroscope.Jerk.Mag.Mean (14)
  * The Mean for the magnitude of the jerk signals obtained from the body angular velocity derived in time from the gyroscope.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from rad/seg

42. Time.Body.Gyroscope.Jerk.Mag.Standard.Deviation (14)
  * The Standard Deviation for the magnitude of the jerk signals obtained from the body angular velocity derived in time from the gyroscope.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from rad/seg

43. Frequency.Body.Accelerometer.Mean.X (14)
  * Fast Fourier Transform applied to the Mean of the body linear acceleration derived in time for the X axis from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

44. Frequency.Body.Accelerometer.Mean.Y (14)
  * Fast Fourier Transform applied to the Mean of the body linear acceleration derived in time for the Y axis from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

45. Frequency.Body.Accelerometer.Mean.Z (14)
  * Fast Fourier Transform applied to the Mean of the body linear acceleration derived in time for the X axis from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

46. Frequency.Body.Accelerometer.Standard.Deviation.X (14)
  * Fast Fourier Transform applied to the Standard Deviation of the body linear acceleration derived in time for the X axis from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

47. Frequency.Body.Accelerometer.Standard.Deviation.Y (14)
  * Fast Fourier Transform applied to the Standard Deviation of the body linear acceleration derived in time for the Y axis from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

48. Frequency.Body.Accelerometer.Standard.Deviation.Z (14)
  * Fast Fourier Transform applied to the Standard Deviation of the body linear acceleration derived in time for the Z axis from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

49. Frequency.Body.Accelerometer.Jerk.Mean.X (14)
  * Fast Fourier Transform applied to the Mean of the jerk signals obtained from the body linear acceleration derived in time for the X axis of the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

50. Frequency.Body.Accelerometer.Jerk.Mean.Y (14)
  * Fast Fourier Transform applied to the Mean of the jerk signals obtained from the body linear acceleration derived in time for the Y axis of the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

51. Frequency.Body.Accelerometer.Jerk.Mean.Z (14)
  * Fast Fourier Transform applied to the Mean of the jerk signals obtained from the body linear acceleration derived in time for the Z axis of the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

52. Frequency.Body.Accelerometer.Jerk.Standard.Deviation.X (14)
  * Fast Fourier Transform applied to the Standard Deviation of the jerk signals obtained from the body linear acceleration derived in time for the X axis of the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

53. Frequency.Body.Accelerometer.Jerk.Standard.Deviation.Y (14)
  * Fast Fourier Transform applied to the Standard Deviation of the jerk signals obtained from the body linear acceleration derived in time for the Y axis of the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

54. Frequency.Body.Accelerometer.Jerk.Standard.Deviation.Z (14)
  * Fast Fourier Transform applied to the Standard Deviation of the jerk signals obtained from the body linear acceleration derived in time for the Z axis of the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

55. Frequency.Body.Gyroscope.Mean.X (14)
  * Fast Fourier Transform applied to the Mean of the body angular velocity derived in time for the X axis from the gyroscope.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from rad/seg

56. Frequency.Body.Gyroscope.Mean.Y (14)
  * Fast Fourier Transform applied to the Mean of the body angular velocity derived in time for the Y axis from the gyroscope.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from rad/seg

57. Frequency.Body.Gyroscope.Mean.Z (14)
  * Fast Fourier Transform applied to the Mean of the body angular velocity derived in time for the Z axis from the gyroscope.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from rad/seg

58. Frequency.Body.Gyroscope.Standard.Deviation.X (14)
  * Fast Fourier Transform applied to the Standard Deviation of the body angular velocity derived in time for the X axis from the gyroscope.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from rad/seg

59. Frequency.Body.Gyroscope.Standard.Deviation.Y (14)
  * Fast Fourier Transform applied to the Standard Deviation of the body angular velocity derived in time for the Y axis from the gyroscope.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from rad/seg

60. Frequency.Body.Gyroscope.Standard.Deviation.Z (14)
  * Fast Fourier Transform applied to the Standard Deviation of the body angular velocity derived in time for the Z axis from the gyroscope.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from rad/seg

61. Frequency.Body.Accelerometer.Mag.Mean (14)
  * Fast Fourier Transform applied to the Mean for the magnitude of the body linear acceleration derived in time for the X,Y,Z axis from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

62. Frequency.Body.Accelerometer.Mag.Standard.Deviation (14)
  * Fast Fourier Transform applied to the Standard Deviation for the magnitude of the body linear acceleration derived in time for the X,Y,Z axis from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

63. Frequency.BodyBody.Accelerometer.Jerk.Mag.Mean (14)
  * Fast Fourier Transform applied to the Mean for the magnitude of the jerk signals obtained from the body linear acceleration derived in time from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

64. Frequency.BodyBody.Accelerometer.Jerk.Mag.Standard.Deviation (14)
  * Fast Fourier Transform applied to the Standard Deviation for the magnitude of the jerk signals obtained from the body linear acceleration derived in time from the accelerometer.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from 'g's (gravity of earth -> 9.80665 m/seg2)

65. Frequency.BodyBody.Gyroscope.Mag.Mean (14)
  * Fast Fourier Transform applied to the Mean for the magnitude obtained from the body angular velocity derived in time from the gyroscope.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from rad/seg

66. Frequency.BodyBody.Gyroscope.Mag.Standard.Deviation (14)
  * Fast Fourier Transform applied to the Standard Deviation for the magnitude obtained from the body angular velocity derived in time from the gyroscope.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from rad/seg

67. Frequency.BodyBody.Gyroscope.Jerk.Mag.Mean (14)
  * Fast Fourier Transform applied to the Mean for the magnitude of the jerk signals obtained from the body angular velocity derived in time from the gyroscope.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from rad/seg

68. Frequency.BodyBody.Gyroscope.Jerk.Mag.Standard.Deviation (14)
  * Fast Fourier Transform applied to the Standard Deviation for the magnitude of the jerk signals obtained from the body angular velocity derived in time from the gyroscope.
    * -1.00000000000 .. 1.00000000000 .Normalized values derived from rad/seg

<hr>
<a name="Study design"/>
# Study design

<p>Transforming the data required the joining of several pieces of data.  These files were as noted.</p>
* UCI HAR Dataset/features.txt
* UCI HAR Dataset/activity_labels.txt
* UCI HAR Dataset/train/subject_train.txt
* UCI HAR Dataset/train/X_train.txt
* UCI HAR Dataset/train/y_train.txt
* UCI HAR Dataset/test/subject_test.txt
* UCI HAR Dataset/test/X_test.txt
* UCI HAR Dataset/test/y_test.txt


<p>Before manipulating the actual data, it was necessary to create the labels and get column locations of the variables.</p>

<p>The first step was to read in the raw variable names.</p>
* featureDef <- read.table("features.txt")
<p>The features.txt file contained both the current variable names of the data sets, but also the index location.  This will be used later to pull out the std() and mean() variables.</p>
<p>Next it was useful to pull out the column numbers and names strictly for mean and standard deviation.</p>
* meanStdList <- featureDef[grepl("^.*mean..$|^.*std..$|^.*mean..-[XYZ]$|^.*std..-[XYZ]$",featureDef$V2, perl = TRUE),]
<p>Then convert the variable names into something more meaningful. To do this a simple replacement of key words was used.</p>
* featureDef$V2 <- gsub("^f","Frequency.",gsub("^t","Time.",gsub("[:():]","",featureDef$V2)))
* featureDef$V2 <- gsub("std","Standard.Deviation",gsub("mean","Mean",gsub("[:():]","",featureDef$V2)))
* featureDef$V2 <- gsub("Acc",".Accelerometer",featureDef$V2)
* featureDef$V2 <- gsub("Gyro",".Gyroscope",featureDef$V2)
* featureDef$V2 <- gsub("Jerk",".Jerk",featureDef$V2)
* featureDef$V2 <- gsub("Mag",".Mag",featureDef$V2)
<p>see the reference table for a listing of variable transformations.</p>
- [Variables](#Variables)
<p>Finally in the label creation step, was to get the list of activity list.  Again this file would be useful as it not only contained an English description of the activity, but the corresponding activity number to be correlated to the data sets.</p>
* activityDef <- read.table("activity_labels.txt")

<p>With all of the labels gained, the data sets could be created.  A set was created for both the training and test.</p>
* trainDF <- getData("train",featureDef$V2,activityDef,meanStdList)
* testDF <- getData("test",featureDef$V2,activityDef,meanStdList)

<p>The getData function joins the activities list and variable names to the data sets</p>
* getData <- function(dirTT, colN, actDef, msList) {
*        setwd(dirTT)
<p>Read in the data set and adds the variable names to all data.  The colN contains is the list of all modified variable names that was manipulated from the features.txt file.  In doing this the column names are preset, and only need to have the mean and std variables pulled out.  Using the read.table function was the easiest method for pulling the data into R.  Fread would have been faster and would have allowed the initial filtering of the columns.  However but speed was not a factor, and fread was causing some issues locally.</p>
*        X <- read.table(paste(c("X_",dirTT,".txt"), collapse = ""), col.names = colN)
<p>Next was to read in the activity list for that dataset and translate it to a descriptive name, by joining the activities used in the dataset with the activity names to create a list of names instead of numbers. </p>
*        y <- read.table(paste(c("y_",dirTT,".txt"), collapse = ""))
*        joinY <- join(y,actDef)
<p>Then read in the subject list for that data set.</p>
*        subject <- read.table(paste(c("subject_",dirTT,".txt"), collapse = ""))
*        setwd("..")
<p>Before binding the three sets of data together, we need to get only the mean and std variables from the dataset.</p>
        X <- select(X,msList$V1)
<p>Finally the data is bound so that Subject and Activity are the first columns.  It is here that the Subject and Activity variables are named.
*        returnDF <- cbind(Subject = subject$V1, Activity = joinY$V2, X)
*        return(returnDF)
* }
<p>With the new datasets for training and test, the data can be combined and ordered by Subject and Activity.</p>
* totalDF <- arrange(rbind(trainDF,testDF), Subject, Activity)
<p>Still this is the full data, not the averaged. The data needs to be averaged for every Subject and Activity.  To do that the lappy function is used to loop through the data applying the mean function across each variable except Subject and Activity.</p>
* totalDT <- as.data.table(totalDF)[,lapply(.SD,mean), by=list(Subject,Activity)]
<p>Lastly the data is written out.</p>
* write.table(totalDT, file = "RunAnalysis.txt", row.names = FALSE )
<hr>
<p></p>

<a name="Variables"/>
# Variables Transformation

<p>The variable names needed to be expanded to really become descriptive. Below is the table of the original variable names and the converted name.</p>

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
