## Code for Yuxuan's Gaussian Copula model

# Set working directory
setwd("~/Desktop/mimic3-research/code")

# Download GC model
library(devtools)
install_github("udellgroup/mixedgcImp")

# Import the GC package and other packages
library(mixedgcImp)
library(tibble)
library(dplyr)
library(MASS)
library(tree)
library(randomForest)
library(Metrics)

# Import the dataset
pat <- read.csv("../data/Diabetes_Numerical.csv")
pat

# Check data types
sapply(pat, class)
age_ordinal <- ordered(pat$ORDINAL_AGE, levels = 1:10, 
                       labels = c(1:10))
class(age_ordinal)
pat$ORDINAL_AGE <- age_ordinal

# Generate training data
X_origin <- pat[, -c(1, 2)]
X_predictors <- pat[, -c(1, 2, 3, 920)]
los <- X_origin$LOS
dim(X_origin)
for (d in c(1:dim(X_origin)[2])) {
  if(length(unique(X_origin[, d]))==1){
    cat(d, "+")
  }
}
sum(X_origin[, 920])
dim(X_origin)
X_origin <- X_origin[, -c(920)]
X_origin[, 919]
for (d in dim(X_origin)[2]) {
  if(sum(X_origin[, d])==0){
    cat(d)
  }
}

# Fit the GC model
X_data <- X_origin[, -c(166, 909, 915, 920)]
X_fit <- impute_mixedgc_ppca(X_data, early.stop = TRUE, verbose = TRUE, rank = 5)
X_fit2 <- impute_mixedgc_ppca(X_predictors, early.stop = TRUE, verbose = TRUE)


## Change to categorical
colnames(X_origin)[-c(1, 2, 3)]
c1 <- colnames(X_origin)[4]
c1
X_origin[, c1] <- as.factor(X_origin[, c1])
class(X_origin$ELECTIVE)

for (cname in colnames(X_origin)[-c(1, 2, 3)]) {
  X_origin[, cname] <- as.factor(X_origin[, cname])
  cat("Colunm ", cname, ": ", class(X_origin[, cname]), '\n')
}
as.tibble(X_origin)

## Decision Tree
dt_data <- X_origin[, -c(2)]
as_tibble(dt_data)
tree1 <- tree(LOS~., data = dt_data)
cv1 = cv.tree(tree1)
plot(cv1$size, cv1$dev, type='b')
tree2 = prune.tree(tree1, best = 6)
plot(tree2)
text(tree2)
pred2 = predict(tree2, newdata = dt_data)
MSE <- mse(actual = X_origin$LOS, predicted = pred2)
MSE
sqrt(MSE)
plot(X_origin$LOS, type = "b", col = "blue")
lines(pred2, col = "red")

## Random Forest
rf1 = randomForest(LOS~., data=dt_data, mtry=10, importance=TRUE)


