# run_analysis
 
<p>The run_analysis project contains four files.</p>

1. README.md - file to describe the overall project.
2. run_analysis.R - the R script used in the project to create a tidy data set
3. CodeBook.md - the document contain a description of the data, the variables created and how the data was created.
4. RunAnalysis.txt - the output from the run_analysis.R script, placed there for bakup purposes.

<p>Before running the run_analysis function, the data needs to be download from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip </p>

<p>In addition, this R script will require the following libraries:</p>
* plyr
* dplyr
* data.table

<p>The data should be unzipped, and the script should be run from "UCI HAR Dataset" directory or the directory above, but not within "UCI HAR Dataset" folder. Doing so will return and error.  Running the script will create the RunAnalysis.txt file into the "UCI HAR Dataset" directory.</p>
<p> Contained within the "UCI HAR Dataset" directory are the files necessary to create the tidy data set.  At the top level of the directory are the features.txt and activity_labels.txt files.  These contain the label and index numbers for the variables in the original data sets, and the activity definitions.  Also residing within the directory are the train and test directories. </p>
<p>Under the train directory is the X_train.txt file, which contains the normalized data training set.  The y_train.txt provides the activity, and the subject_train.txt contains the Subject ID for each vector for the X_train txt file.</p>
<p>Under the test directory is the X_test.txt file, which contains the normalized data testing set.  The y_test.txt provides the activity, and the subject_test.txt contains the Subject ID for each vector for the X_test txt file.</p>

* UCI HAR Dataset/features.txt - contains the variable labels and column indexes
* UCI HAR Dataset/activity_labels.txt - contains the activities and reference numbers.
* UCI HAR Dataset/train/subject_train.txt - contains the subject id number for each vector in X_train.txt
* UCI HAR Dataset/train/X_train.txt - contains the normalized data set from the experiment.
* UCI HAR Dataset/train/y_train.txt - contains the activity reference number for each vector in X_train.txt
* UCI HAR Dataset/test/subject_test.txt - contains the subject id number for each vector in X_test.txt
* UCI HAR Dataset/test/X_test.txt - contains the normalized data set from the experiment.
* UCI HAR Dataset/test/y_test.txt - contains the activity reference number for each vector in X_test.txt
### run_analysis function
<p>The run_analysis function first changes the directory to "UCI HAR Dataset", if needed.  The script should be run from the UCI HAR Dataset" directory or the directory above it.</p>

```
        if (!(identical(basename(getwd()),"UCI HAR Dataset"))) {
                if (length(list.files(".",pattern = "^UCI HAR Dataset$")) > 0) {
                        setwd("UCI HAR Dataset")
                } else {
                        stop("The run_analysis function must be run from the \"UCI HAR Dataset\" directory or the directory above it.")
                }             
        }
```


<o>It the reads in the features.txt file, creating a two column data frame.  The first column in the data frame are the column indexes of the datasets, and the second column is the variable names.</p>
```
featureDef <- read.table("features.txt")
```
<p> Next it creates a data frame from the feature variable name, getting the mean() and std() variables.  This will be used later to filter out the desired variables from the X_test and X_train data sets. The filtering is done by the use of the grepl function, and regex expressions.</p>
<p>This assignment called for the filtering out of the mean and standard variation variables.  This was interrupted to be strictly mean() and std() variables.  The frequency mean (meanFreq) variable was not included as one of the mean variables, because it is a measurement used to find the center/mean of a frequency, not the mean on the data collected. In addition the angle(..gravityMean) were also excluded, as the angle variables would be a measurement of angle between two vectors, and not strictly the mean of a the measured data.</p> 
```
meanStdList <- featureDef[grepl("^.*mean..$|^.*std..$|^.*mean..-[XYZ]$|^.*std..-[XYZ]$",featureDef$V2, perl = TRUE),]
```
<p>Continuing with the setup of data and labels the code replaces the existing raw variable names with some more readable names.  This is done with the gsub command.  It was easier to change all 561 variable names, then to create the 66 variable names later.  This will be used later to name the variables in the X_train and X_test data sets.</p>
```
featureDef$V2 <- gsub("^f","Frequency.",gsub("^t","Time.",gsub("[:():]","",featureDef$V2)))
featureDef$V2 <- gsub("std","Standard.Deviation",gsub("mean","Mean",gsub("[:():]","",featureDef$V2)))
featureDef$V2 <- gsub("Acc",".Accelerometer",featureDef$V2)
featureDef$V2 <- gsub("Gyro",".Gyroscope",featureDef$V2)
featureDef$V2 <- gsub("Jerk",".Jerk",featureDef$V2)
featureDef$V2 <- gsub("Mag",".Mag",featureDef$V2)
```
<p>The last portion of the label gathering is for the activites.  The activity_label.txt file is read in and placed into a data fram.  The first column contains the activity reference number, and the second column the activity names. </p>
```
activityDef <- read.table("activity_labels.txt")
```

<p>Now that the labels have been gathered and modified, the datasets for training and test can be created.  This is done using the getData function, which will be explained further on.  It returns a data frame containing the subject id, activity name, and the std() and mean() data with description variable names. </p>
```
trainDF <- getData("train",featureDef$V2,activityDef,meanStdList)
testDF <- getData("test",featureDef$V2,activityDef,meanStdList)
```
<p>The data now needs to be combined into one set and ordered.  This is done using the rbind to unionize the rows, and arrange it in order by Subject and Activity.</p>
```
totalDF <- arrange(rbind(trainDF,testDF), Subject, Activity)
```
<p>The first data set is created, but needs to be furthered proceeds to get an average on the variables.  This is easily accomplished using a data table.  The data frame is converted into a data table, and the lapply function is used to loop through the data (except on Subject and Activity) and apply the mean function.</p>
```
totalDT <- as.data.table(totalDF)[,lapply(.SD,mean), by=list(Subject,Activity)]
```
<p>Lastly the data is written out to a text file, and the data table is returned for local verification.</p>
```
write.table(totalDT, file = "RunAnalysis.txt", row.names = FALSE )
setwd("..")
return(totalDT)
```
<p>At this point the data written out should be tidy.  The data is in a wide format, consisting of 181 rows (1 header row, and 180 rows of data)  and 68 columns.  It is order by the Subject, and then Activity columns.   This data set follows the tidy data principles :</p>
1. Each variable is in a column.
2. Every row is for a different observation, I.e. the subject and activity combination is unique.
3. There is one table for the overall averaging of the data set.
4. The first row of the RunAnalysis.txt is the list of variable names.
5. The variable names have been converted from the experiment code names to something more readable.
	* tBodyAcc-mean()-X to Time.Body.Accelerometer.Average.X
### getData function
<p>The getData function creates the merged data for the training or test sets. It takes 4 variables.</p>
* dirTT = directory of Training or Test
* colN = Column Names
* actDef = activity definitions
* msList = Vector of the means and std variable

```
getData <- function(dirTT, colN, actDef, msList) {
```
<p> It starts out by changing the working directory to the test or train.</p>
```
setwd(dirTT)
```
<p> The script then reads in the data set (X_train.txt or X_test.txt),  setting the column names.  The column names are those which had been pulled from the features.txt file and modified.  In this case the read.table was used and all of the columns were named.  Later the mean and std variables are filtered out.  The fread was a considered alternative as it is faster and the select option is available.  This would allowed the variables to have been filtered and named ahead of time.  However using the function was causing some issues, and the read table provided a more reliable path.</p>
```
X <- read.table(paste(c("X_",dirTT,".txt"), collapse = ""), col.names = colN)
```        
<p>Next it reads in the activity (from either the y_train.txt or the y_test.txt files) for the corresponding dataset, and uses the join function to merge the activity reference number with a description (found in the activity.txt file).  This gives the data a description for each row.</p>
```
y <- read.table(paste(c("y_",dirTT,".txt"), collapse = ""))
joinY <- join(y,actDef)
```
<p>In addition the subject id (from either subject_train.txt or subject_test.txt for each row is placed into a vector.</p>
```
subject <- read.table(paste(c("subject_",dirTT,".txt"), collapse = ""))
```
<p>The working directory is set back to the root, as so the next data set can be processed.</p>
```
setwd("..")
```
<p>A select function is then used to get the std() and mean() variables, which had previously  been created.  msList$V1 contains a numeric vector of the column indexes for those variables</p>
```
X <- select(X,msList$V1)
```
<p>After all of the data has been gathered, it is time to bind them together.  This is done using the cbind, making the Subject the first column, Activity the second, and the data set the rest.  The data is returned to the parent function.</p>        
```
returnDF <- cbind(Subject = subject$V1, Activity = joinY$V2, X)
return(returnDF)
```

<p>To better understand better the variables, please examine the CodeBook.md.</p>
