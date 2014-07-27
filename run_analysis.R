# load the data
path <- paste(getwd(),"/UCI HAR Dataset/train/X_train.txt", sep = "")
x_train <- read.table(path)
path <- paste(getwd(),"/UCI HAR Dataset/test/X_test.txt", sep = "")
x_test <- read.table(path)
path <- paste(getwd(),"/UCI HAR Dataset/features.txt", sep = "")
features <- read.table(path)
features <- features[,-1]
path <- paste(getwd(),"/UCI HAR Dataset/test/subject_test.txt", sep = "")
subj_test <- read.table(path)
path <- paste(getwd(),"/UCI HAR Dataset/train/subject_train.txt", sep = "")
subj_train <- read.table(path)
path <- paste(getwd(),"/UCI HAR Dataset/test/y_test.txt", sep = "")
y_test <- read.table(path)
path <- paste(getwd(),"/UCI HAR Dataset/train/y_train.txt", sep = "")
y_train <- read.table(path)
path <- paste(getwd(),"/UCI HAR Dataset/activity_labels.txt", sep = "")
activity_labels <- read.table(path)
# merge the data: add subject and activity columns, merge test and train data. set names
merged <- rbind(cbind(x_train,subj_train,y_train),cbind(x_test,subj_test,y_test))
# name variables
merged <- setNames(merged, c(levels(features)[features], "Subject", "Activity"))
# label activyty column
merged <- merge(x = merged, y = activity_labels, by.x = "Activity", by.y = "V1")
merged <- merged[,-1]
merged <- setNames(merged, c(levels(features)[features], "Subject", "Activity"))
# drop colmuns which are not "mean" and "std"
h <- grepl("mean\\(\\)|std\\(\\)|Activity|Subject",names(merged))
merged1 <- merged[,h*(1:563)]
# find means of variables by "Activity" and "Subject"
aggregated <- aggregate(merged1, by = list(merged1$Activity, merged1$Subject), FUN = mean)
aggregated <- aggregated[,-c(69,70)]
names(aggregated) <- c("Activity","Subject", names(aggregated[3:68]))
write.table(aggregated, file = "tidy.txt", sep = ",", row.names = FALSE)
