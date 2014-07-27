library(caret)
library(randomForest)
library(MASS)
library(forecast)
initdata = read.csv('pml-training.csv')
dataR = initdata[,c("total_accel_belt",
                   "max_roll_belt","max_picth_belt",
                   "min_roll_belt","min_pitch_belt",
                   "avg_roll_belt","avg_pitch_belt","avg_yaw_belt",
                   "total_accel_arm",
                   "avg_roll_arm","avg_pitch_arm","avg_yaw_arm",
                   "max_roll_arm","max_picth_arm","max_yaw_arm",
                   "min_roll_arm","min_pitch_arm","min_yaw_arm",
                   "max_roll_dumbbell","max_picth_dumbbell",
                   "min_roll_dumbbell","min_pitch_dumbbell",
                   "total_accel_dumbbell",
                   "avg_roll_forearm","avg_pitch_forearm","avg_yaw_forearm",
                   "max_roll_forearm","max_picth_forearm","max_yaw_forearm",
                   "min_roll_forearm","min_pitch_forearm","min_yaw_forearm",
                   "total_accel_forearm",
                   "classe"
)]


#testing = read.csv('pml-testing.csv')
datapart = createDataPartition(dataR$classe, p = 3/4,list=FALSE)
training = dataR[datapart,]
cross = dataR[-datapart,]
#training = training[complete.cases(training),]

fitrf = randomForest(classe~.,data=training,na.action=na.omit)
pred = predict(fitrf)
accuracy(pred,training$class)
