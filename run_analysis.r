library(plyr)
trainingX <- read.table("UCI HAR Dataset/train/X_train.txt")
trainingY <- read.table("UCI HAR Dataset/train/y_train.txt")
trainingSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
testX <- read.table("UCI HAR Dataset/test/X_test.txt")
testY <- read.table("UCI HAR Dataset/test/y_test.txt")
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
d <-  list(x=rbind(trainingX, testX), y=rbind(trainingY, testY), subject=rbind(trainingSubject, testSubject))
features <- read.table("UCI HAR Dataset/features.txt")
mean <- sapply(features[,2], function(x) grepl("mean()", x, fixed=T))
stddev <- sapply(features[,2], function(x) grepl("std()", x, fixed=T))
d2 <- d$x[, (mean | stddev)]
colnames(d2) <- features[(mean | stddev), 2]
colnames(d$y) <- "activity"
labels <- read.table("UCI HAR Dataset/activity_labels.txt", sep=" ")
for (i in 1:6 ) {
  d$y$activity[d$y$activity == i] = as.character(labels$V2[i])
}
d3 <- d$y
colnames(d$subject) <- c("subject")
d4 <- cbind(d2, d3, d$subject)
tidy <- ddply(d4, .(subject, activity), function(x) colMeans(x[,1:60]))
write.csv(tidy, "tidy.csv", row.names=FALSE)