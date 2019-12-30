library(shiny)

ui <- fluidPage(
  titlePanel("Using Spinners"),
  
  actionButton("update", "Update Plots"),
  
  fluidRow(
    column(6, h4("Without Spinner")),
    column(6, h4("With Spinner"))
  ),
  
  fluidRow(
    column(
      width = 6, 
      wellPanel(
        plotOutput("plot_without_spinner")
      )
    ),
    column(
      width = 6,
      wellPanel(
        shinycustomloader::withLoader(plotOutput("plot_with_spinner"))
      )
    )
  )
  
)
