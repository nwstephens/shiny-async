library(promises)
library(future)
plan(multiprocess)
trainModel <- function(x, y) {
  Sys.sleep(5)
  mtcars
}

# time = 0:00.000
trainModel(Sonar, "Class")
# time = 0:15.553, ouch!

library(future)
plan(multiprocess)
# time = 0:00.000
f <- future(trainModel(Sonar, "Class"))
# time = 0:00.062

library(future)
plan(multiprocess)
# time = 0:00.000
f <- future(trainModel(Sonar, "Class"))
# time = 0:00.062
value(f)
# time = 0:15.673

query_db() %>%  filter(cyl > 4) %>%  head(10) %>% 
  View()

future(query_db()) %...>%  filter(cyl > 4) %...>%  head(10) %...>% 
  View()

# time = 0:00.000
future(trainModel(Sonar, "Class")) %...>%
  print() # time = 0:15.673
# time = 0:00.062

