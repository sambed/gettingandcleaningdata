## ======Reading Data and Renaming Columns ===============

subject_test<-read.table('subject_test.txt')
subject_train<-read.table('subject_train.txt')
x_test<-read.table('x_test.txt')
y_test<-read.table('y_test.txt')
y_train<-read.table('y_train.txt')
x_train<-read.table('x_train.txt')
feat<-read.table('features.txt')
features<-feat[,2]

## ==================Mergin Data =========================

subject <- rbind(subject_train, subject_test)
y <- rbind(y_train, y_test)
x <- rbind(x_train, x_test)
colnames(x) <- features
names(y)<-list(c('ActivityId'))
names(subject)<-list(c('subject'))

## ======Isolating mean and s.d using grep function=======

mymean <- grep("-mean\\(\\)", features, value=TRUE)
mysd <- grep("-std\\(\\)", features, value=TRUE)
xfinal<-x[,c(mymean,mysd)]

## ===========Reading activity descriptions===============
myactivity<-read.table('activity_labels.txt')
colnames(myactivity)<-c('ActivityId','ActivityType')

## ==Performing multiple joins using labels,activity and measurements==

draft <- cbind(xfinal, merge(y,myactivity)["ActivityType"])

## ======Combining ActivityType and ActivityID

draft2 <- cbind(draft, subject)

## ====Avg of each variable for each subject and activity===

draft3 <- melt(draft2, id=c("subject", "activity"))
final <- dcast(draft3, activity + subject ~ variable, mean)

## =========Exporting Tidy Data Set====================

write.table(final,'ActivityType_Subject_Avg.txt',sep='\t')




