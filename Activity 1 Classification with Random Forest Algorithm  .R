# Lab 6 + Activity 1: Classification Methods
# Students:
# Jana Abdurhman    444820821
# Lima Al Sheban    445803902
# Raghad Ahmed Ali  445803851
# Lama AbdulAziz Ali 445803974


# Load Libraries
library(dplyr) 
library(tidyr) 
library(ggplot2) 
library(rpart) 
library(rpart.plot) 
library(caret) 
library(randomForest)


# Load Dataset
iris_df <- iris 


# Data Splitting (80% Train)
n <- nrow(iris_df) 
n_train <- round(0.80 * n) 

set.seed(123) 

train_indicise <- sample(1:n, n_train) 

iris_train <- iris_df[train_indicise, ] 
iris_test  <- iris_df[-train_indicise, ] 


# Decision Tree Model (Lab 6)

# Train Model
iris_model <- rpart(
  formula = Species ~ ., 
  data = iris_train, 
  method = "class", 
  control = rpart.control(cp = 0), 
  parms = list(split = "information")
)

# Prediction
iris_pred_dt <- predict(
  object = iris_model, 
  newdata = iris_test, 
  type = "class"
)

# Plot Tree
prp(
  iris_model, 
  extra = 1, 
  faclen = 0, 
  nn = TRUE, 
  box.col = c("green", "red")
)

# Results
cat("===== Decision Tree Results =====\n")
print(confusionMatrix(
  data = iris_pred_dt, 
  reference = iris_test$Species
))


# Random Forest Model (Activity 1)
# =========================================

# Train Model
rf_model <- randomForest(
  formula = Species ~ ., 
  data = iris_train, 
  ntree = 100
)

# Prediction
rf_pred <- predict(
  object = rf_model, 
  newdata = iris_test
)

# Results
cat("\n===== Random Forest Results =====\n")
print(confusionMatrix(
  data = rf_pred, 
  reference = iris_test$Species
))

# Feature Importance
cat("\n===== Feature Importance =====\n")
print(importance(rf_model))

# Plot Importance
varImpPlot(rf_model)

