 library(readr)
 library(ggfortify)
 library(ggplot2)
 library(Amelia)
 library(nnet)
 install.packages("Metrics")
 library(Metrics)
 test <- read_csv("Documents/Homework-workspace/Applied-AI-HW/Applied-AI-HW5/test.csv")
 train <- read_csv("Documents/Homework-workspace/Applied-AI-HW/Applied-AI-HW5/train.csv")
 View(test)
 View(train)
 y <- subset(train, select = c("target"))
 x <- train[,-95]
 x_withoutID <- x[,-1]
 summary(x)
 
 # pca_X = princomp(x,cor=TRUE,score=TRUE)
 # summary(pca_X)
 # plot(pca_X, type="l")
 # biplot(pca_X)
 # loadings <- pca_X$loadings
 # autoplot(prcomp(x))
 # Conclusion: PCA is pointless as there is barely any linear dependence
 
 
 # missmap(x)
 logr_model <- multinom(target ~.,data=train)
 predicted_logr <- predict(logr_model, newdata = test, "probs")
 mse(test$, predicted_logr)
 mean((test$ - predicted_2017) ^ 2)
 
 # linear_model = lm.fit(as.matrix(x) , as.matrix(y)) Take note of parameteres/algo Try GAM..
 
 #LOGISTIC REGRESSION - Take note of parameters
 
 
 # Python try out
 #XGBOOST - with different parameters (Save models) gridsearch
 
 #CATBOOST
 
 #LIGHTBOOST
 
 #Neural networks: a) change sampling seeds? 
 
 # Ensemble it all together!!!
 
 