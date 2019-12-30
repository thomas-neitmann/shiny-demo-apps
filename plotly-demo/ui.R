library(shiny)
library(plotly)

ui <- fluidPage(
  
  titlePanel("Using plotly in Shiny Apps"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "x",
        label = "X Variable",
        choices = c("cyl", "vs", "am", "gear", "carb")
      ),
      selectInput(
        inputId = "y",
        label = "Y Variable",
        choices = c("mpg", "disp", "hp", "wt", "qsec")
      ),
      selectInput(
        inputId = "color",
        label = "Group by Variable",
        choices = rev(c("cyl", "vs", "am"))
      )
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel(
          "Vanilla plot using ggplot2",
          plotOutput("vanilla_ggplot")
        ),
        tabPanel(
          "Interactive Plot using plotly",
          plotlyOutput("interactive_ggplotly")
        )
      )
    )
  )
)
