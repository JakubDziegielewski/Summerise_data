library(dplyr)

subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/Y_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/Y_test.txt")

names <- read.table("features.txt", col.names = c("number", "feature"))

train_dataset <- cbind(subject_train, x_train, y_train)
test_dataset <- cbind(subject_test, x_test, y_test)

dataset <- rbind(train_dataset, test_dataset)


colnames(dataset) <- c("subject", names$feature, "activity")

mean_and_std_vec <- grep("subject|mean\\(\\)|std\\(\\)|activity", colnames(dataset))


result_dataset <- dataset[, mean_and_std_vec]
colnames(result_dataset) <- gsub("\\(\\)", "", colnames(result_dataset))
colnames(result_dataset) <- gsub("\\-", "", colnames(result_dataset))

colnames(result_dataset) <- gsub("mean", "_mean", colnames(result_dataset))
colnames(result_dataset) <- gsub("std", "_std", colnames(result_dataset))


activity_dataframe <- read.table("activity_labels.txt", col.names = c("label", "description"))
result_table <- tbl_df(result_dataset)
result_table <- result_table %>%
                mutate(activity = activity_dataframe$description[activity])

grouped <- group_by(result_table, activity, subject)

write.table(summarise(grouped, across(1:66, mean)), "summarised.txt")


