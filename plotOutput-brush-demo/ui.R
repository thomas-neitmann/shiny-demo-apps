library(shiny)

files <- list.files("data", "csv$", full.names = TRUE)
companies <- gsub("_data.csv", "", basename(files))

ui <- fluidPage(
  titlePanel("Making Plots Interactive"),
  fluidRow(
    column(
      width = 6,
      selectInput(
        inputId = "company",
        label = "Company",
        choices = companies,
        selected = c("AAPL", "XL"),
        width = "100%",
        multiple = TRUE
      )
    ),
    column(
      width = 6,
      selectInput(
        inputId = "var",
        label = "Variable to Plot",
        choices = c("open", "close", "low", "high"),
        width = "100%"
      )
    )
  ),
  plotOutput("main"),
  plotOutput(
    outputId = "helper",
    height = "200px",
    brush = brushOpts("brush", direction = "x")
  )
  
)
