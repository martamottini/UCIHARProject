#check if data is available, if not, get the data
if(!file.exists("UCI\ HAR\ Dataset")){
        print("the directory with the data needed for the project doesn't exists!")
        print("downloading and unzipping the required data in the current directory...")
        fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileurl, destfile="getdata.zip", method="curl")
        unzip("getdata.zip", unzip="unzip")
}

#read all necessary files into data frames
Xtest <- read.table("./UCI\ HAR\ Dataset/test/X_test.txt",as.is=TRUE)
ytest <- read.table("./UCI\ HAR\ Dataset/test/y_test.txt",as.is=TRUE)
subjtest <- read.table("./UCI\ HAR\ Dataset/test/subject_test.txt",as.is=TRUE)
Xtrain <- read.table("./UCI\ HAR\ Dataset/train/X_train.txt",as.is=TRUE)
ytrain <- read.table("./UCI\ HAR\ Dataset/train/y_train.txt",as.is=TRUE)
subjtrain <- read.table("./UCI\ HAR\ Dataset/train/subject_train.txt",as.is=TRUE)
features <- read.table("./UCI\ HAR\ Dataset/features.txt",as.is=TRUE)
activities <- read.table("./UCI\ HAR\ Dataset/activity_labels.txt",as.is=TRUE)

#bind the subject id and the activitiy code to the test and 
#train data frames as additional columns
test1 <- cbind(Xtest,subjtest)
test2 <- cbind(test1,ytest)
train1 <- cbind(Xtrain,subjtrain)
train2 <- cbind(train1,ytrain)


#create one data frames with both sets of data 
data1 <- rbind(train2,test2)


#subset the data frame just obtained, selecting only the colums 
#that report a mean or a standard deviation of the measured feature
list <- grep("-mean|-std",features[,2],value=TRUE)
bad <- grepl("Freq()",list)
list2 <- list[!bad]
filter <- match(list2,features[,2])
data2 <- data1[,c(filter,562,563)]

#assign descriptive activity names to the values in the 
#Activity column of the data frame 
for(i in 1:nrow(data2)){
        ind <- match(data2[i,68],activities[,1])
        data2[i,68] <- activities[ind,2]
}
#assign descriptive variable names to the 563 columns with generic names 
colnames(data2)[1:66] <- gsub("[^[:alnum:][:blank:]+\\-]", "", list2)
colnames(data2)[67] <- "Subject_Id"
colnames(data2)[68] <- "Activity"

#extract tidy data set with the average of each feature grouped by activity and subject
tidydata <- aggregate(. ~ Activity + Subject_Id, data=data2,FUN=mean)
colnames(tidydata)[3:68] <- paste("ave(",names(tidydata)[3:68],")",sep="")

#data3 <- split(data2,list(data2$Activity,data2$Subject_Id))
#data4 <- sapply(data3,function(x) colMeans(x[,1:66]))
#tidydata <- as.data.frame(t(data4))



