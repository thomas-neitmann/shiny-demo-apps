library(shiny)
data(mtcars)

ui <- fluidPage(
  titlePanel("Using Action Buttons"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "x",
        "X Variable",
        c("mpg","disp", "hp", "drat", "wt", "qsec")
      ),
      selectInput(
        "y",
        "Y Variable",
        c("mpg","disp", "hp", "drat", "wt", "qsec"),
        "disp"
      ),
      selectInput(
        "color",
        "Color Variable",
        colnames(mtcars),
        "hp"
      ),
      selectInput(
        "facet",
        "Facet Variable",
        c("am", "vs", "cyl")
      ),
      conditionalPanel(
        "input.tab == 'yes'",
        actionButton(
          "button",
          "Update Plot"
        )
      )
    ),
    
    mainPanel(
      tabsetPanel(
        id = "tab",
        tabPanel(
          title = "Without Action Button",
          br(),
          p("This plot updates whenever you change an input on the left."),
          plotOutput("no"),
          value = "no"
        ),
        tabPanel(
          title = "With Action Button",
          br(),
          p("This plot updates only when you click the action button."),
          plotOutput("yes"),
          value = "yes"
        )
      )
    )
    
  )
)
