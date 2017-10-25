#Perceptron rule algorithm to do multiclass classification on Iris dataset

#making a function for implementing perceptron rule algorithm-It is a linear
#classifier which uses a linear activation function.

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
          z=sum(weight[2:length(weight)] * 
                as.numeric(x[j, ])) + weight[1]
          if(z < 0) {
            yout <- -1
          } else {
            yout <- 1
          }
          #updating weights if target value and fitted value is not same
          weight_diff <- lr * (y[j] - yout) * 
            c(1, as.numeric(x[j, ]))
          weight <- weight + weight_diff
          
          #updating error function,if error is not 0
          if(( y[j] - yout) != 0.0) {
            errors[i]<- errors[i] + 1
          }
          
          
          
        }#end loop j
    
    }#end loop i
  
  
    print(weight)
    return(errors)
    

}

#let's train the algorithm to predict the classes

# making training data
x <- iris[, 1:4] 
names(x) <- tolower(names(x))

# create species labels
y <- rep(-1, dim(x)[1])
y[iris[, 5] == "virginica"] <- 1



err<-perceptronNet(x,y,0.001,200)

df<-as.data.frame(cbind(1:200,err))
names(df)<-c("Epochs","Loss")


#plotting epochs vs error value on training data set
hchart(df,"line",hcaes(x=Epochs,y=Loss),color="red") %>%
  hc_title(text="Epochs Vs Error") %>%
  hc_add_theme(hc_theme_elementary()) 

which.max(err)

#making a comparative plot
hc <- highchart() %>% 
  hc_xAxis(categories=df$Epochs) %>% 
  hc_add_series(name = "MLP", data = dfMLP$Loss) %>% 
  hc_add_series(name = "perceptron", data = df$Loss) %>%
  #to add colors
  hc_colors(c("red","blue")) %>%
  hc_add_theme(hc_theme_elementary()) %>%
  

hc