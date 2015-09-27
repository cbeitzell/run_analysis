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

<p>The run_analysis function first changes the directory to "UCI HAR Dataset".  It the reads in the features.txt filw, which contains the listing of column vector and raw variable decriptions.</p>
```
featureDef <- read.table("features.txt")
```
<p> Next it creates a data frame from the feature varaible name, filtering all but the mean() and std() variables.  This will be used later to filter out the data sets needed. The filtering is done by the use of the grepl function, and regex expressions.</p>
```
meanStdList <- featureDef[grepl("^.*mean..$|^.*std..$|^.*mean..-[XYZ]$|^.*std..-[XYZ]$",featureDef$V2, perl = TRUE),]
```


<p>The code book willl better explain the variables and measurements within the data.</p>

