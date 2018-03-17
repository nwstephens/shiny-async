library(mlbench)
source("train.R")

t1 <- Sys.time()

trainModel(Sonar, "Class")

t2 <- Sys.time()
t2-t1
