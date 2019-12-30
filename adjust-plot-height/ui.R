library(shiny)

ui <- fluidPage(
  titlePanel("Let Your Users Decided on the Plot Height"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "x",
        label = "X Variable",
        choices = c("mpg", "disp", "hp", "drat", "wt", "qsec")
      ),
      selectInput(
        inputId = "y",
        label = "Y Variable",
        choices = rev(c("mpg", "disp", "hp", "drat", "wt", "qsec"))
      ),
      sliderInput(
        inputId = "plot_height",
        label = "Adjust Plot Height",
        min = 200,
        max = 1000,
        value = 400,
        ticks = FALSE,
        post = "px"
      )
    ),
    mainPanel(
      uiOutput("plot_placeholder")
    )
  )
)
