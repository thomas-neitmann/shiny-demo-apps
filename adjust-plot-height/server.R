library(shiny)
library(ggplot2)
data(mtcars)

server <- function(input, output, session) {
  
  output$plot <- renderPlot({
    ggplot(mtcars) +
      aes_string(input$x, input$y) +
      geom_point() +
      geom_smooth(method = "lm")
  })
  
  output$plot_placeholder <- renderUI({
    plotOutput("plot", height = input$plot_height)
  })
  
}
