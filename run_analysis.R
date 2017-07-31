##
## Download UCI HAR Datasest
## set working directory to UCI HAR Dataset
## 

runAnalysis <- function() {
##
## loading datasets
##
## load test
## x, y, feature

x_test <-read.table("test/X_test.txt")
y_test <-read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

## train
## x, y, feature
## x, y, feature
x_train <-read.table("train/X_train.txt")
y_train <-read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

## 
## read label
##
features <- read.table("features.txt")
activity <- read.table("activity_labels.txt")

##
## merging x_train and x_test; y_train and y_test
comb_x <- rbind(x_train, x_test)
comb_y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

## giving variables names
namelist=features$V2

colnames(comb_x) <- features$V2


## extract mean and standart deviation data
mtch <- (features[ grep("std|mean[^F]" , features$V2), ])$V2
dtms <- comb_x[, as.character(mtch)]


## merge with activity data, and replaced with decriptive activity name
dtms$Subject <- subject$V1
dtms$Activity <- comb_y$V1
dtms$Activity <- activity[dtms$Activity, "V2"] ##replace the number with descriptive activity names

##
## summarize/analyze data set for each factor activity and subject
avgDB=aggregate(.~ Activity+Subject, data=dtms, mean)

## modified the feature name of avgDB with "Avg of " in front.
names<-colnames(avgDB)
names[3:length(names)]<- paste("Avg of", names[3:length(names)])
colnames(avgDB)<-names


## write to a csv file
write.csv(avgDB, "AverageMeanStdDataset.csv")

}