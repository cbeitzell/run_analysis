# run_analysis
 
<p>The run_analysis project contains four files.</p>

1. README.md - file to describe the overall project.
2. run_analysis.R - the R script used in the project to create a tidy data set
3. CodeBook.md - the document contain a description of the data, the variables created and how the data was created.
4. RunAnalysis.txt - the output from the run_analysis.R script, placed as a bakup repository.

<p>Before running the run_analysis script, the data needs to be download from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip </p>

<p>In addition, this script will require the following libraries:</p>
* plyr
* dplyr
* data.table

<p>After the data is unzipped, the script should be run from top level of the filder, not within "UCI HAR Dataset" folder. Running the script will create the RunAnalysis.txt file into the "UCI HAR Dataset" directory.</p>

<p>The run_analysis function first changes the directory to "UCI HAR Dataset".  It the reads in the features.txt file, which contains the listing of column vector and raw variable descriptions.</p>
```
featureDef <- read.table("features.txt")
```
<p> Next it creates a data frame from the feature variable name, filtering all but the mean() and std() variables.  This will be used later to filter out the data sets needed. The filtering is done by the use of the grepl function, and regex expressions.</p>
```
meanStdList <- featureDef[grepl("^.*mean..$|^.*std..$|^.*mean..-[XYZ]$|^.*std..-[XYZ]$",featureDef$V2, perl = TRUE),]
```
<p>Continuing with a setup of data and labels the code replaces the existing raw variable names with some more readable names.  This is done with the gsub command.  It was the most forward method, without editing every single variable.  Essentially the idea was to expand the smaller names to the larger.  There was no rearranging</p>
```
featureDef$V2 <- gsub("^f","Frequency.",gsub("^t","Time.",gsub("[:():]","",featureDef$V2)))
featureDef$V2 <- gsub("std","Standard.Deviation",gsub("mean","Mean",gsub("[:():]","",featureDef$V2)))
featureDef$V2 <- gsub("Acc",".Accelerometer",featureDef$V2)
featureDef$V2 <- gsub("Gyro",".Gyroscope",featureDef$V2)
featureDef$V2 <- gsub("Jerk",".Jerk",featureDef$V2)
featureDef$V2 <- gsub("Mag",".Mag",featureDef$V2)
```
<p>The last portion of the label collecting is for the activities.  The activity_label file is read in and placed into a variable.</p>
```
activityDef <- read.table("activity_labels.txt")
```

<p>Now that the labels have been gathered and modified, the datasets for training and test can be created.  This is done using the getData function, which will be explained further on.  For now it returns the data set for either the training or test, containing the subject id, activity translated to a description, and the std() and mean() data with description variable names.  The data has not been modified at this point to find the averaged.</p>
```
trainDF <- getData("train",featureDef$V2,activityDef,meanStdList)
testDF <- getData("test",featureDef$V2,activityDef,meanStdList)
```
<p>The data now needs to be combined into one set and ordered.  This is done using the rbind to unionize the data, and arrange the order it by SUbject and Activity.</p>
```
totalDF <- arrange(rbind(trainDF,testDF), Subject, Activity)
```
<p>The first data set is created, but it is not the intended end result.  The data needs to be averaged.  This is easily accomplished using a data table.  The data frame is converted into a data table, and the lapply function is used to loop through the data (except Subject and Activity) and apply the mean function.</p>
```
totalDT <- as.data.table(totalDF)[,lapply(.SD,mean), by=list(Subject,Activity)]
```
<p>Lastly the data is written out to a text file, and the data table is returned for local verification.</p>
```
write.table(totalDT, file = "RunAnalysis.txt", row.names = FALSE )
setwd("..")
return(totalDT)
```

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
<p>It then reads in the data set setting the column names.  The column names are those which had been pulled from the features.txt file and modified.</p>
```
X <- read.table(paste(c("X_",dirTT,".txt"), collapse = ""), col.names = colN)
```        
<p>Next it reads in the activity for the corresponding dataset, and uses the join function to merge the activity reference number with a description.  This gives us the description for each row of the data set.</p>
```
y <- read.table(paste(c("y_",dirTT,".txt"), collapse = ""))
joinY <- join(y,actDef)
```
<p>In addition the subject id for each row is palced into a vector.</p>
```
subject <- read.table(paste(c("subject_",dirTT,".txt"), collapse = ""))
```
<p>The working directory is set back to the root, as so the next data set can be processed.</p>
```
setwd("..")
```
<p>Here the std() and mean() variables are filtered out using the select function.  msList$V1 contains a numeric vector of the columns for those variables.  It was calculated in the run_analysis function.</p>
```
X <- select(X,msList$V1)
```
<p>Finally that all of the data has been gathered, it is time to bind them together.  This is done using the cbind, making the Subject the first column, Activity the second, and the data set the rest.  The data is returned to the parent function.</p>        
```
returnDF <- cbind(Subject = subject$V1, Activity = joinY$V2, X)
return(returnDF)
```

<p>Lastly to understand better the variables, please examine the CodeBook.md.  The code book will better explain the variables and measurements within the data.</p>
