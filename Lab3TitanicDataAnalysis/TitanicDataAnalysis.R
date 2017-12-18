workDir <- "./Documents/Lab3TitanicData"
setwd(workDir)
setwd("Lab3TitanicData")

train <- read.csv("train.csv")
test <- read.csv("test.csv")

library(RColorBrewer)
library(rpart)
library(rattle)
library(rpart.plot)
library(caret)

fit <- rpart(Survived ~ Sex, data=train, method="class")
fancyRpartPlot(fit)

fit <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, data=train, method="class") #rpart does repeatative partition
fancyRpartPlot(fit)

Prediction <- predict(fit, test, type = "class")
submit <- data.frame(PassengerId = test$PassengerId, Survived = Prediction)
write.csv(submit, file = "myfirstdtree.csv", row.names = FALSE)

fit <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, data=train, method="class", control=rpart.control(minsplit=2, cp=0))
fancyRpartPlot(fit)

Prediction <- predict(fit, test, type = "class")
submit <- data.frame(PassengerId = test$PassengerId, Survived = Prediction)
write.csv(submit, file = "myfullgrowntree.csv", row.names = FALSE)
genderModel <- read.csv("gender_submission.csv")
confusionMatrix(submit$Survived,genderModel$Survived)

