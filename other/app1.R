#library(mlbench)
#glm(Class ~ . , binomial, Sonar)
library(shiny)
trainModel <- function(x, y) {
  Sys.sleep(5)
  mtcars
}

ui <- basicPage(
  h2("Synchronous training"),
  actionButton("train", "Train"),
  verbatimTextOutput("summary"),
  plotOutput("plot")
)
server <- function(input, output, session) {
  model <- eventReactive(input$train, {
    trainModel(Sonar, "Class") # Super slow!
  })
  output$summary <- renderPrint({
    print(model())
  })
  output$plot <- renderPlot({
    plot(model())
  }) 
}

shinyApp(ui = ui, server = server)
