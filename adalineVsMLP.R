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

iris.trainY<-as.factor(iris.trainY)
iris.testY<-as.factor(iris.testY)



#converting to 1 hot encoding

iris.trainYcat<-to_categorical(iris.trainY)
iris.testYcat<-to_categorical(iris.testY)
#making the architecture

model<-keras_model_sequential()

model %>% layer_dense(units=8,activation="relu",input_shape=c(4)) %>%
          #output layer
          layer_dense(units=4,activation = "softmax")

model %>% compile(loss="categorical_crossentropy",
               optimizer = "sgd",metrics="accuracy")

summary(model)

history<- model %>% fit(iris.trainX,iris.trainYcat,epochs = 200,
                        batch_size = 32,verbose = 2)
#loss of 0.21 and accuracy=0.9667

#evaluating the MLP on test data
pred.class<-predict_classes(model,iris.testX,batch_size=32,verbose=1)
head(pred.class)

#confusion matrix
iris.testY<-unclass(iris.testY)
table(actual=iris.testY,pred=pred.class)
#misclassification error of 0.033 and accuracy of 0.9667 on test set
mean(iris.testY!=pred.class)

score<-model %>% evaluate(iris.testX,iris.testYcat,batch_size = 2)
score



plot(history)

