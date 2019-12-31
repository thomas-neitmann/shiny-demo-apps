library(shiny)

server <- function(input, output, session) {
  
  output$table <- renderTable({
    mtcars[row.names(mtcars) %in% input$rows,
           colnames(mtcars) %in% input$cols]
  }, rownames = TRUE, striped = TRUE, hover = TRUE, width = "100%")
  
}
