#Perceptron rule algorithm to do multiclass classification on Iris dataset

#making a function for implementing perceptron rule algorithm

#function takes input as inputs,target vector, learning rate and epochs
perceptronNet <- function(x,y,lr,epochs) 
{
  #initializing weights vector
  weights<-rep(0,dim(x)[2]+1) # a vector of length 5.As we have 4 variables
  
  #initialize empty error vector for each epoch
  errors<-rep(0,epochs)
  
  
}