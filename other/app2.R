options(shiny.trace = TRUE)
library(shiny)
library(promises)
library(future)
plan(multiprocess)

trainModel <- function(x, y) {
  Sys.sleep(5)
  mtcars
}

ui <- basicPage(
  h2("Asynchronous training"),
  actionButton("train", "Train"),
  verbatimTextOutput("summary")
)
server <- function(input, output, session) {
  model <- eventReactive(input$train, {
    future(trainModel(Sonar, "Class")) # So fast!
  })
  output$summary <- renderPrint({
    model() %...>% print()
  })
}

shinyApp(ui = ui, server = server)
