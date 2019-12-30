library(shiny)
library(ggplot2)

server <- function(input, output) {
  
  data <- eventReactive(input$update, {
    x <- rnorm(1e3, 100, 25)
    y <- x + rnorm(1e3, 0, 10)
    data.frame(x, y)
  }, ignoreNULL = FALSE)

  output$plot_without_spinner <- renderPlot({
    ggplot(data(), aes(x, y)) +
      geom_point(color = scales::alpha("steelblue", 0.3)) +
      geom_smooth(method = "lm")
  })
  
  output$plot_with_spinner <- renderPlot({
    ggplot(data(), aes(x, y)) +
      geom_point(color = scales::alpha("steelblue", 0.3)) +
      geom_smooth(method = "lm")
  })
  
}
