#ADALINE in R

#Adaline - Stochastic Gradient Descent

require(nnet)
?nnet

#training data for Adaline network
trainAda<-cbind(iris.trainX,iris.trainY)

adaline <- nnet(iris.trainY ~ ., data = trainAda,
                size = 8, rang = 0.1,
               decay = 5e-4, maxit = 200)