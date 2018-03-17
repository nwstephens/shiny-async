options(
  warnPartialMatchArgs = FALSE,
  warnPartialMatchAttr = FALSE,
  warnPartialMatchDollar = FALSE
)

trainModel <- function(df, outcome) {
  # https://topepo.github.io/caret/model-training-and-tuning.html#example
  library(caret)
  set.seed(998)
  inTraining <- createDataPartition(df[[outcome]], p = .75, list = FALSE)
  training <- df[ inTraining,]
  testing  <- df[-inTraining,]
  
  fitControl <- trainControl(method = "repeatedcv", number = 10, repeats = 10)
  
  set.seed(825)
  form <- eval(substitute(y ~ ., list(y = as.symbol(outcome))))
  gbmFit1 <- train(form, data = training,
    method = "gbm", trControl = fitControl, verbose = FALSE)
  gbmFit1
}

# library(mlbench)
# data(Sonar)
# trainModel(Sonar, "Class")
