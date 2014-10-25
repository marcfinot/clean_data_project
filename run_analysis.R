library(plyr)

directory <- 'C:/Sandbox/coursera/R/cleaning-wk3/UCI HAR Dataset'
setwd(directory)

#read activity label file
activity_label <- read.table("activity_labels.txt",header = FALSE)
names(activity_label) <- c("key_activity","activity")

feature <- read.table("features.txt",header = FALSE)
names(feature) <- c("key_feature","feature")

#reading files
test_subject <- read.table("./test/subject_test.txt",header = FALSE)
test_set <- read.table("./test/X_test.txt",header = FALSE)
test_labels <- read.table("./test/y_test.txt",header = FALSE)

train_subject <- read.table("./train/subject_train.txt",header = FALSE)
train_set <- read.table("./train/X_train.txt",header = FALSE)
train_labels <- read.table("./train/y_train.txt",header = FALSE)

#merging the two sets of data (training and test sets)
full_set <- rbind(test_set,train_set)
full_labels <- rbind(test_labels,train_labels)
full_subject <- rbind(test_subject,train_subject)

#adding column names
names(full_subject) <- "subject"
names(full_set) <- feature[,2]
names(full_labels) <- "labels"

#mergin data
merge_label <- merge(full_labels, activity_label,by.x = "labels",by.y = "key_activity")

meancol <- grep("mean",feature[,2])
stdcol <- grep("std",feature[,2])

subset <- c(meancol,stdcol)
final_table <- cbind(full_subject,merge_label,full_set[,subset])

#computing mean while splitting according to subject and activity
summary_mean <- aggregate(final_table[,-(1:3)], by = list(Subject = final_table$subject, Activity = final_table$activity), mean)

#writing file in a 
write.table(summary_mean,"summary_mean.txt",row.name=FALSE)
