library(dplyr)

# creating data file in case it does not exist
if (!file.exists("data")){
  dir.create("data")
}

# Downloading the zip file
file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(file_url, destfile ="./data/Dataset.zip")

#unzip the data file 
unzip(zipfile = "./data./Dataset.zip", exdir = "./data")

#reading test files
test_data_x <- read.table("./data./UCI HAR Dataset./test./X_test.txt")
test_data_y <- read.table("./data./UCI HAR Dataset./test./Y_test.txt", col.names = ("Value"))
subject_test <- read.table("./data./UCI HAR Dataset./test./subject_test.txt", col.names = ("subject"))

# reading training files
train_data_x <- read.table("./data./UCI HAR Dataset./train./X_train.txt")
train_data_y <- read.table("./data./UCI HAR Dataset./train./Y_train.txt" , col.names = ("Value"))
subject_train <- read.table("./data./UCI HAR Dataset./train./subject_train.txt", col.names = ("subject"))

#read activity labels
activity_labels <- read.table("./data./UCI HAR Dataset./activity_labels.txt")

colnames(activity_labels) <- c("Value", "Activity")
# read features
features <- read.table("./data./UCI HAR Dataset./features.txt")

# combine x and y data
combine_X_labels <- rbind(train_data_x, test_data_x)
combine_Y_labels <- rbind(train_data_y, test_data_y)
colnames(combine_X_labels) <- features[,2]
combine_subject <- rbind(subject_train, subject_test)
merge_comp <- cbind(combine_subject, combine_X_labels, combine_Y_labels) # all data combined

# Extract measurements on mean and standard deviation  
coln <- grepl("mean\\(\\)|std\\(\\)", colnames(merge_comp))
coln[1] = TRUE
coln[ncol(merge_comp)] = TRUE
msd <- merge_comp[, coln == TRUE] #mean and SD columns

# descriptive activity names
#msd$Value <- activity_labels[merge_comp$Value,2]
msd$Value <- activity_labels[msd$Value, 2]

# descriptive variable names
names(msd) <- gsub("Acc", "Accelerometer", names(msd))
names(msd) <- gsub("tBody", "TimeBody", names(msd))
names(msd) <- gsub("tBody", "TimeBody", names(msd))
names(msd) <- gsub("Gyro", "Gyroscope", names(msd))
names(msd) <- gsub("Mag", "Magnitude", names(msd))
names(msd) <- gsub("fBody", "ForceBody", names(msd))

# average of for each activity and subject
msd2 <- group_by(msd, subject, Value)
msd2 <- summarise_all(msd2, funs(mean)) # final tidy data set

# write tidy data to text file 
write.table(msd2, file ="./data./TidyData.txt", row.names = FALSE)