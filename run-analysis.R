## Step 0: Download relevant packages

library(dplyr)

## Step 1: Merge the datasets

  # 1.1 Read data from "test" folder

    path1 <- "./UCI HAR Dataset/test"
    ff1 <- unlist(lapply(path1, "/", list.files(path1), FUN = paste0))
    sub1 <- read.table(ff1[2]) # Subjects
    X1 <- read.table(ff1[3]) # Observations
    Y1 <- read.table(ff1[4]) # Activities
  
  # 1.2 Read data from "train" folder

    path2 <- "./UCI HAR Dataset/train"
    ff2 <- unlist(lapply(path2, "/", list.files(path2), FUN = paste0))
    sub2 <- read.table(ff2[2]) # Subjects
    X2 <- read.table(ff2[3]) # Observations
    Y2 <- read.table(ff2[4]) # Activities
  
  # 1.3 Join "test" and "train" datasets
  
    subtot <- rbind(sub1, sub2)
    Xtot <- rbind(X1, X2)
    Ytot <- rbind(Y1, Y2)
    
  # 1.4 Assign proper names
  
    names(Ytot) <- "activity"
    names(subtot) <- "subject"
    
    vars <- read.table("./UCI HAR Dataset/features.txt")
    colnames(Xtot) <- vars$V2
  
  # 1.5 Create full dataset
    
    datamerged <- cbind(subtot, Ytot, Xtot)

## Step 2: Extract mean and standard deviation for each measurement
    
  # 2.1 Identify relevant variables
    
    mean_std_index <- grep("mean\\(|std\\(", vars$V2)
    mean_std_vars <- vars[mean_std_index,]
    
  # 2.2 Filter data keeping only relevant variables
    
    relev_vars <- c("subject","activity",mean_std_vars$V2)
    relev_data <- datamerged[,relev_vars]

## Step 3: Rename activities with descriptive names
    
    act_lab <- read.table("./UCI HAR Dataset/activity_labels.txt")
    relev_data$activity <- act_lab[relev_data$activity, 2]

## Step 4: Label dataset with descriptive variable names
    
    colnames(relev_data)[-(1:2)] <- paste0("avg.", names(relev_data)[-(1:2)])
    
## Step 5: Create a dataset with the average of each variable for each activity and each subject
    
    final_tidy_data <- relev_data %>%
      arrange(subject, activity) %>%
      group_by(subject, activity) %>%
      summarise(across(everything(), list(mean)))
    
    final_tidy_data
 
    write.table(final_tidy_data, "FinalTidyData.txt", row.name=FALSE)
    