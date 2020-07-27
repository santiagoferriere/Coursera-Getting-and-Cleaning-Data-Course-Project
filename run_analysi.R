#reading features and activity data  #Acordarse que la carpeta esta un nivel abajo del wd
library(dplyr)
features <- read.table("./UCI HAR Dataset/features.txt")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
train <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt") 
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt") 
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
   ####################
feat <- as.character(features[, 2])
colnames(test) <- feat
colnames(train) <- feat
colnames(ytrain) <- "activity"
colnames(ytest) <- "activity"
colnames(subjecttest) <- "subject"
colnames(subjecttrain) <- "subject"
# Cambiar nombres a las columnas de acuerdo a un vector
test <- cbind(test, ytest)
train <- cbind(train, ytrain)
test <- cbind(test, subjecttest)
train <- cbind(train, subjecttrain)
# uno columnas a los data sets existentes
tate <- rbind(test, train)
# uno los data sets
  mn_sd <-  tate[, grep("mean()|std()|subject|activity", colnames(tate)) ]
#selecciono las columnas que contengan las palabras "mean()", "std()", "subject" o "activity"
description <- factor(mn_sd$activity, levels = activities[, 1], labels = activities[, 2])
#remplazo las actividades (que eran numericas) por su valor en palabras
mn_sd <- mutate(mn_sd,  description )
# añado la col description al data.frame existente
       #####################################

for_act <- mn_sd
for_act <- split(for_act, for_act$activity)
# separar el data.frame por activity

prev <- for_act[[1]] 
prev <- sapply(prev, mean)
prev <- as.data.frame(prev)
prev <- rotate_df(prev) 
# crear un data.frame llamado prev

for(i in 2:6) { 
        fr <- for_subj[[i]] 
        mn <- sapply(fr, mean)
        dmn <- as.data.frame(mn)
        dmn <- rotate_df(dmn) 
        #esta saliendo volteado el data.frame
        prev <- rbind( prev, dmn)
}
mean_act <- setattr(prev, "row.names", activities[ , 2])
## cambiar nombre de las rows!