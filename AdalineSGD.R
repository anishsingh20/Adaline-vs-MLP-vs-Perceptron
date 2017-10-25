#ADALINE in R

#Adaline - Stochastic Gradient Descent

require(nnet)
?nnet

#training data for multiple Adaline network-MADALINE
trainAda<-cbind(iris.trainX,iris.trainY)

adaline <- nnet(iris.trainY ~ ., data = trainAda,
                size = 8, rang = 0.1,
               decay = 5e-4, maxit = 200)

#picking out the weights
adaline$wts
adaline$nunits#127 units-neurons
adaline$nconn
adaline$conn
adaline$softmax
adaline$convergence
adaline$fitted.values
adaline$residuals
#predicting on test set
table(ird$species[-samp], predict(ir.nn2, ird[-samp,], type = "class"))
