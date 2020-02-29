library(shiny)
library(magrittr)
library(ggcharts)
data(biomedicalrevenue)
biomedicalrevenue$label <- paste0("$", biomedicalrevenue$revenue, "B.")

ui <- fluidPage(
  titlePanel("Highlight on Hover"),
  sidebarLayout(
    sidebarPanel(
      shinyWidgets::pickerInput(
        inputId = "company",
        label = "Company",
        choices = unique(biomedicalrevenue$company)
      )
    ),
    mainPanel(
      plotly::plotlyOutput("plot")
    )
  )
)

server <- function(input, output, session) {
  company <- reactive({
    biomedicalrevenue[biomedicalrevenue$company == input$company, ]
  })

  output$plot <- plotly::renderPlotly({
    company %>%
      plotly::highlight_key(~year) %>%
      ggcharts::column_chart(year, revenue, text = label, sort = FALSE) %>%
      plotly::ggplotly(tooltip = "label") %>%
      plotly::highlight(on = "plotly_hover", off = "plotly_doubleclick")
  })
}

shinyApp(ui, server, options = list(display.mode = "showcase"))
