library(plyr)
library(dplyr)
library(data.table)

runAnalysis <- function() {
        
        setwd("UCI HAR Dataset")
        
        featureDef <- read.table("features.txt")
        meanStdList <- featureDef[grepl("^.*mean..$|^.*std..$|^.*mean..-[XYZ]$|^.*std..-[XYZ]$",featureDef$V2, perl = TRUE),]
        
        featureDef$V2 <- gsub("^f","Frequency.",gsub("^t","Time.",gsub("[:():]","",featureDef$V2)))
        featureDef$V2 <- gsub("std","Standard.Deviation",gsub("mean","Average",gsub("[:():]","",featureDef$V2)))
        featureDef$V2 <- gsub("Acc",".Accelerometer",featureDef$V2)
        featureDef$V2 <- gsub("Gyro",".Gyroscope",featureDef$V2)
        featureDef$V2 <- gsub("Jerk",".Jerk",featureDef$V2)
        featureDef$V2 <- gsub("Mag",".Mag",featureDef$V2)
        
        activityDef <- read.table("activity_labels.txt")
        
        trainDF <- getData("train",featureDef$V2,activityDef,meanStdList)
        testDF <- getData("test",featureDef$V2,activityDef,meanStdList)
        
        totalDF <- arrange(rbind(trainDF,testDF), Subject, Activity)
        totalDT <- as.data.table(totalDF)[,lapply(.SD,mean), by=list(Subject,Activity)]
        
        write.table(totalDT, file = "secondRunAnalysis.txt", row.names = FALSE )
        
        setwd("..")
        
        return(totalDT)
}


getData <- function(dirTT, colN, actDef, msList) {
        setwd(dirTT)
        X <- read.table(paste(c("X_",dirTT,".txt"), collapse = ""), col.names = colN)
        y <- read.table(paste(c("y_",dirTT,".txt"), collapse = ""))
        joinY <- join(y,actDef)
        subject <- read.table(paste(c("subject_",dirTT,".txt"), collapse = ""))
        setwd("..")
        X <- select(X,msList$V1)
        returnDF <- cbind(Subject = subject$V1, Activity = joinY$V2, X)
        return(returnDF)
}

