library(shiny)
options(shiny.port = 8100)
library(mlbench)
data(Sonar)

source("train.R")

ui <- basicPage(
  h2("Synchronous training"),
  actionButton("train", "Train"),
  verbatimTextOutput("summary"),
  plotOutput("plot")
)

server <- function(input, output, session) {
  model <- eventReactive(input$train, {
    withProgress(value = NULL, message = "Training, please wait...",
      
      trainModel(Sonar, "Class")

    )
  })
  
  output$summary <- renderPrint({
    print(model())
  })
  
  output$plot <- renderPlot({
    plot(model())
  })
}

shinyApp(ui, server)