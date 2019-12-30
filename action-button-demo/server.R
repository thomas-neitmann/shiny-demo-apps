library(shiny)
library(ggplot2)

data(mtcars)
mtcars$cyl <- as.factor(mtcars$cyl)
mtcars$vs <- as.factor(mtcars$vs)
mtcars$am <- as.factor(mtcars$am)

server <- function(input, output) {

  output$no <- renderPlot({
    ggplot(mtcars) +
      aes_string(input$x, input$y, color = input$color) +
      geom_point() +
      facet_wrap(input$facet)
  })

  output$yes <- renderPlot({
    input$button

    x <- isolate(input$x)
    y <- isolate(input$y)
    color <- isolate(input$color)
    facet <- isolate(input$facet)

    ggplot(mtcars) +
      aes_string(x, y, color = color) +
      geom_point() +
      facet_wrap(facet)
  })

}
