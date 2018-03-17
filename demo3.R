library(future)
plan(multiprocess)
library(promises)
library(dplyr)

query_db <- function() {
  Sys.sleep(5)
  mtcars
}

# Synchronous
query_db() %>%
  filter(cyl > 4) %>%
  head(10) %>%
  View()

NULL












# Asynchronous
future(query_db()) %...>%
  filter(cyl > 4) %...>%
  head(10) %...>%
  View()











