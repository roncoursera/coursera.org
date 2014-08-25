# ===========================
# Q4 Q1
# ===========================
'
library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)

TotalIntenCh2
newdata=data.frame(list of variables) 
predict(model, newdata)
summary(segmentationOriginal$Case)

1. Do not split data into training and testing - instead use the labels in Case variable to split data
2. Outcome variable is class
3. The model should not have Case in it ( will not appear as a variable however if split based as in 1 above)

If dframe is your data frame, then pick a row, for example the second row:
dframenew<-dframe[2,]
If you want to specify the values of variables v1, v2, and v3 to be a1, a2, and a3, respectively, then you need to write
dframenew$v1<-a1
dframenew$v2<-a2
dframenew$v3<-a3
Then you should be able to get the correct predictions, using dframenew.


inTrain <- createDataPartition(segmentationOriginal$Case, p=0.7, list=FALSE)
training <- segmentationOriginal[inTrain,]
modFit <- train(Case ~ ., data=training, method="rpart")
modFit$finalModel



The data is ALREADY labelled according to whether its training or test - that is the "Case" variable.  

The question doesnt make it explicit but your output variable isnt "Case" but "Class" (have a look at the variables and then compare with the question answers). 

train( subset = "logical").
rpart rpart predict(obj, type = "prob")

library(rpart)
rpart1<-rpart(Class~.,data=training,control=rpart.control(maxdepth=2))
rpart1
'

# 1. Subset the data to a training set and testing set based on the Case variable in the data set. 

inTrain <- createDataPartition(segmentationOriginal$Case, p=0.7, list=FALSE)
train=segmentationOriginal[segmentationOriginal$Case=="Train",3:ncol(segmentationOriginal)]
test=segmentationOriginal[segmentationOriginal$Case=="Test",3:ncol(segmentationOriginal)]
traindata = train[,4:ncol(train)]
trainlabels = train$Class
set.seed(125)
inTraining <- createDataPartition(train$Class, p = 0.75, list = FALSE)
training <- train[inTraining,]
testing <- train[-inTraining,]
rpart1<-rpart(Class~.,data=training)
rpart1

# ===========================
# Q4 Q2
# ===========================
# http://stats.stackexchange.com/questions/27730/choice-of-k-in-k-fold-cross-validation

# ===========================
# Q4 Q3
# ===========================
library(pgmm)
data(olive)
olive = olive[,-1]
newdata = as.data.frame(t(colMeans(olive)))
rpart2<-rpart(Area~.,data=olive)
dim(olive)
newdata[,2:ncol(newdata)]
predict(rpart2,newdata[,2:ncol(newdata)])

# ===========================
# Q4 Q4
# ===========================
library(ElemStatLearn)
data(SAheart)
set.seed(8484)
train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]
set.seed(13234)
# logistic regression model (method="glm", be sure to specify family="binomial")
# Coronary Heart Disease (chd) as the outcome and 
# age at onset, current alcohol consumption, obesity levels, cumulative tabacco,
# type-A behavior, and low density lipoprotein cholesterol as predictors.
training=trainSA[,c(10,9,8,7,2,6,3)]
testing=testSA[,c(10,9,8,7,2,6,3)]
mdl <- train(chd ~ .,  method='glm', data=training, family='binomial')

missClass <- function(values,prediction){sum(((prediction > 0.5)*1) != values)/length(values)}

pred.training=predict(mdl,training[,2:7])
pred.testing=predict(mdl,testing[,2:7])

missClass(training[,1],pred.training)
missClass(testing[,1],pred.testing)

# ===========================
# Q4 Q5
# ===========================
library(ElemStatLearn)
data(vowel.train)
data(vowel.test) 
library(randomForest)
set.seed(33833)
rfc=randomForest(y ~ ., data=vowel.train, importance=TRUE)
varImp(rfc)
#      Overall
#x.1  50.22620
#x.2  47.11891
#x.6  36.55462
#x.8  29.54103
#x.5  26.51910
#x.3  23.19261
#x.9  21.94000
#x.10 20.56382
#x.4  20.35494
#x.7  19.67717
