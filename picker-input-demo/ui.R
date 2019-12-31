library(shiny)
library(shinyWidgets)
data(iris)
choices <- colnames(iris)[1:4]

ui <- fluidPage(
  titlePanel("selectInput vs. pickerInput"),
  fluidRow(
    column(
      width = 6,
      selectInput(
        "cols", "Select Variables (using selectInput)",
        choices = colnames(mtcars),
        selected = c("mpg", "hp", "cyl"),
        width = "100%", multiple = TRUE
      ),
    ),
    column(
      width = 6,
      pickerInput(
        "rows", "Select Models (using pickerInput)",
        choices = rownames(mtcars),
        selected = rownames(mtcars)[1:5],
        width = "100%", multiple = TRUE,
        options = pickerOptions(
          actionsBox = TRUE,
          liveSearch = TRUE,
          size = 10
        )
      ),
    )
  ),

  tableOutput("table")
)
