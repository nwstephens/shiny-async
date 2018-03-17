library(dplyr)
library(DBI)
library(promises)
library(future)
plan(multiprocess)

con <- dbConnect(odbc::odbc(), "SQL Server (DSN)")
query_db <- function() {
  tbl(con, "flights") %>%
    collect
}


# Synchronous
query_db() %>%
  filter(carrier == "UA") %>%
  head(10) %>%
  View()


# Asynchronous
future(query_db()) %...>%
  filter(cyl > 4) %...>%
  head(10) %...>%
  View()











