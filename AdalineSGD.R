#ADALINE in R

#Adaline - Stochastic Gradient Descent

require(nnet)
?nnet

#training data for adaline network
trainAda<-cbind(iris.trainX,iris.trainY)

adaline <- nnet(iris.trainY ~ ., data = trainAda,
                size = 1, rang = 0.1,
                maxit = 200,trace=TRUE)

#picking out the weights
adaline$wts
adaline$nunits#127 units-neurons
adaline$nconn
adaline$conn
adaline$softmax
adaline$convergence
adaline$fitted.values
adaline$residuals

pred=predict(adaline,newdata=iris.testX,type="class")
#predicting on test set
#confusion matrix
table(actual=iris.testY, predicted=pred)
mean(iris.testY==pred)
#hence adaline network with 1 hidden unit is also achieving same accuracy as
#that of MLP


