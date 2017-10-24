#Adaline vs MLP on Iris dataset


#MAKING A MLP

require(keras)

#separating test an training data
head(iris)
nrow(iris)#150 rows
dim(iris)

#random sampling of data without replacement
data(iris)

iris.train<-sample_n(iris,120)
iris.test<-sample_n(iris,30)
iris.train<-as.matrix(iris.train)
iris.test<-as.matrix(iris.test)

iris.testX<-iris.test[,1:4]
iris.trainX<-iris.train[,1:4]


iris.trainY<-iris.train[,5]
iris.testY<-iris.test[,5]


