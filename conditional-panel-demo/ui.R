library(shiny)

ui <- fluidPage(
  titlePanel("Creating Dynamic UIs with conditionalPanel()"),
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
      checkboxInput(
        inputId = "check",
        label = "Add Facet?"
      ),
      conditionalPanel(
        condition = "input.check",
        selectInput(
          inputId = "facet",
          label = "Facet",
          choices = c("vs", "am", "cyl")
        )
      ),
      actionButton(
        inputId = "button",
        label = "Update Plot"
      )
    ),
    mainPanel(
      shinycustomloader::withLoader(
        ui_element = plotly::plotlyOutput(outputId = "plot"),
        loader = "pacman"
      )
    )
  )
)
