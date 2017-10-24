#Adaline vs MLP on Iris dataset


#MAKING A MLP

require(keras)

#separating test an training data
head(iris)
nrow(iris)#150 rows
dim(iris)

#random sampling of data without replacement
iris<-as.matrix(iris)
iris.train<-sample(iris[,1:5],100,replace=F)
iris.test<-sample(iris[,1:5],40,replace = F)


iris.trainX<-iris[120,1:4]
iris.trainY<-iris[30,5]