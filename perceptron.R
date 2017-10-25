#Perceptron rule algorithm to do multiclass classification on Iris dataset

#making a function for implementing perceptron rule algorithm

#function takes input as inputs,target vector, learning rate and epochs
perceptronNet <- function(x,y,lr,epochs) 

{ 
  #initializing weights vector with dimension equal to the number of input variables
  weight<-rep(0,dim(x)[2]+1) # a vector of length 5.As we have 4 variables
  
  #initialize empty error vector for each epoch
  errors<-rep(0,epochs)
  
  
  #looping over number of epochs
  for(i in 1:epochs)
    {
       #looping through entire dataset
        for(j in 1:length(y))
          
        {
          #sum of product of weights and inputs added with bias
          z=sum( weight[2:length(weight)]*as.numeric(x[j,] ) ) + weight[1]#bias
          
          #applying activation function(unit step function)
          if(z>0){
            y_out<- 1
          } else {
            y_out <- -1
          }
          
        }
    
    }
  

}