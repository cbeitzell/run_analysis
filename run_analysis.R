library(plyr)
library(dplyr)
library(data.table)

# The run_analysis function will start will read the data created from the
# Smart phone activity recognition test, and return an averaged tidy data set.
run_analysis <- function() {
        
        # change directory to the data set directory if needed.
        
        if (!(identical(basename(getwd()),"UCI HAR Dataset"))) {
                if (length(list.files(".",pattern = "^UCI HAR Dataset$")) > 0) {
                        setwd("UCI HAR Dataset")
                } else {
                        stop("The run_analysis function must be run from the \"UCI HAR Dataset\" directory or the directory above it.")
                }             
        }
        
        
        # read in the features file to gain the raw variable names
        featureDef <- read.table("features.txt")
        
        # from the features data frame create second data frame of only the std() and mean() variables
        meanStdList <- featureDef[grepl("^.*mean..$|^.*std..$|^.*mean..-[XYZ]$|^.*std..-[XYZ]$",featureDef$V2, perl = TRUE),]
        
        # modify the existing raw variable names into something more readable.
        featureDef$V2 <- gsub("^f","Frequency.",gsub("^t","Time.",gsub("[:():]","",featureDef$V2)))
        featureDef$V2 <- gsub("std","Standard.Deviation",gsub("mean","Mean",gsub("[:():]","",featureDef$V2)))
        featureDef$V2 <- gsub("Acc",".Accelerometer",featureDef$V2)
        featureDef$V2 <- gsub("Gyro",".Gyroscope",featureDef$V2)
        featureDef$V2 <- gsub("Jerk",".Jerk",featureDef$V2)
        featureDef$V2 <- gsub("Mag",".Mag",featureDef$V2)
        
        # read in the activity data frame. This will contain numbers which can be correlated
        # to the data sets.
        activityDef <- read.table("activity_labels.txt")
        
        # create the merged data sets for the training and test sets.
        trainDF <- getData("train",featureDef$V2,activityDef,meanStdList)
        testDF <- getData("test",featureDef$V2,activityDef,meanStdList)
        
        # combine the two new datasets and order by Subject and Activity.
        totalDF <- arrange(rbind(trainDF,testDF), Subject, Activity)
        
        # loop through the new data frame and apply the mean to all variables
        # except the Subject and Activity.
        totalDT <- as.data.table(totalDF)[,lapply(.SD,mean), by=list(Subject,Activity)]
        
        # write out the table to a file.
        write.table(totalDT, file = "RunAnalysis.txt", row.names = FALSE )
        
        setwd("..")
        
        # return the data for local evaluation.
        return(totalDT)
}

# The getData function creates the merged data for the training or test sets.
# dirTT = directory of Training or Test
# colN = Column Names
# actDef = activity definitions
# msList = Vector of the means and std variable
getData <- function(dirTT, colN, actDef, msList) {
        
        # change directory to the training or test
        setwd(dirTT)
        
        # read the data set setting the column names
        X <- read.table(paste(c("X_",dirTT,".txt"), collapse = ""), col.names = colN)
        
        # read in the activity for the corresponding dataset
        y <- read.table(paste(c("y_",dirTT,".txt"), collapse = ""))
        
        # translate the activity to a label
        joinY <- join(y,actDef)
        
        # read in the subject id for the dataset
        subject <- read.table(paste(c("subject_",dirTT,".txt"), collapse = ""))
        
        # return the directory to previous
        setwd("..")
        
        # select only the mean and std varibles, which are contained in the first variable of msList.
        X <- select(X,msList$V1)
        
        # bind the subject, activity, and dataset together.
        returnDF <- cbind(Subject = subject$V1, Activity = joinY$V2, X)
        
        # return the new dataset/
        return(returnDF)
}

