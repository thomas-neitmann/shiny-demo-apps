library(shiny)
library(ggplot2)
data(mtcars)

server <- function(input, output, session) {
  output$plot <- plotly::renderPlotly({
    input$button
    
    x <- isolate(input$x)
    y <- isolate(input$y)
    add_facet <- isolate(input$check)
    facet <- isolate(input$facet)
    
    plot <- ggplot(mtcars) +
      aes_string(x, y) +
      geom_point() +
      geom_smooth(method = "lm")
    if (add_facet) {
      plot <- plot + facet_wrap(facet)
    }
    plotly::ggplotly(plot)
  })
}
