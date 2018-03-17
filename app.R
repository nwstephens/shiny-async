library(mlbench)
trainModel <- function() glm(Class ~ . , binomial, Sonar)
Sys.sleep(5)

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