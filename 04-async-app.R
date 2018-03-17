library(shiny)
options(shiny.port = 8100)
library(mlbench)
data(Sonar)

library(future)
plan(multicore)
library(promises)

source("train.R")

ui <- fluidPage(
  h2("Asynchronous training"),
  actionButton("train", "Train"),
  verbatimTextOutput("summary"),
  plotOutput("plot")
)

server <- function(input, output, session) {
  model <- eventReactive(input$train, {
    p <- Progress$new()
    p$set(message = "Training, please wait...")
    future(trainModel(Sonar, "Class")) %>%
      finally(~p$close())
  })
  
  output$summary <- renderPrint({
    model() %...>% 
      print()
  })
  
  output$plot <- renderPlot({
    model() %...>%
      plot()
  })
}

shinyApp(ui, server)
