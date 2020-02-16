library(shiny)
library(ggcharts)
library(gapminder)
library(dplyr)
data("gapminder")

countries <- gapminder %>%
  filter(year == 2007) %>%
  mutate(
    continent = as.character(continent),
    country = as.character(country),
    pop = pop / 1e9
  )

continents <- countries %>%
  group_by(continent) %>%
  summarise(pop = sum(pop))

ui <- fluidPage(
  plotly::plotlyOutput("continent_plot"),
  plotly::plotlyOutput("country_plot")
)

server <- function(input, output, session) {

  click <- reactive({
    # The event_data() function returns a one line data.frame like this
    #   curveNumber pointNumber        x y
    # 1           0           4 3.811954 5
    plotly::event_data("plotly_click")
  })

  highlight <- reactive({
    # Find the right continent by matching the x value which represents
    # the bar length
    continents$continent[continents$pop == click()$x]
  })

  output$continent_plot <- plotly::renderPlotly({
    # If no bar has been clicked yet, highlight() is charater(0)
    if (length(highlight()) == 0) {
      hghl <- NULL
    } else {
      hghl <- highlight()
    }
    bar_chart(continents, continent, pop, highlight = hghl)
  })

  output$country_plot <- plotly::renderPlotly({
    # This will ensure that this plot only shows up after a bar has been
    # highlighted in the plot above
    req(highlight())
    countries %>%
      filter(continent == highlight()) %>%
      bar_chart(country, pop, limit = 10)
  })

}

shinyApp(ui, server)
