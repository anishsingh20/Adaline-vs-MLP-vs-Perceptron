#Adaline vs MLP on Iris dataset


#MAKING A MLP

require(keras)

#separating test an training data
head(iris)
nrow(iris)#150 rows
dim(iris)

iris<-as.matrix(iris)
iris.trainX<-iris[,1:4]
iris.trainY<-iris[,5]