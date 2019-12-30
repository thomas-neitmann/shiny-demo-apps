library(shiny)
library(magrittr)
library(ggplot2)

server <- function(input, output, session) {
  stock <- reactive({
    lapply(input$company, function(company) {
      file <- paste0("data/", company, "_data.csv")
      data <- read.csv(file, stringsAsFactors = FALSE)
      data$date <- as.Date(data$date)
      data
    }) %>% do.call(rbind, .)
  })
  
  plot <- reactive({
    ggplot(stock()) +
      aes_string("date", input$var, color = "Name") +
      geom_line(size = 1) +
      theme_minimal()
  })
  
  output$main <- renderPlot({
    if (!is.null(input$brush)) {
      range <- as.Date(
        c(input$brush$xmin, input$brush$xmax),
        origin = "1970-01-01"
      )
      return(plot() + xlim(range))
    }
    plot()
  })
  
  output$helper <- renderPlot({
    plot()
  })
  
}
