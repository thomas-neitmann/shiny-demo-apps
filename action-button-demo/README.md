# Using Actions Buttons

Action Buttons are a great way to let users decide when a plot inside your Shiny app should update. Usually plots are updated whenever an input parameter changes. This is fine if you have only one or two input parameters (e.g. x and y variable on a scatterplot) but becomes somewhat annoying otherwise. I will show you how to update a chart if and only if your user presses an action button.

To do so, in `ui.R` add an action button by using `actionButton(id = "my_action_button", label = "My Label")`. In `server.R` you have to do two things. First, add the following line inside `renderPlot()`: `input$my_action_button`. This will ensure that the plot is updated whenever the user presses the action button. Second, wrap *any* other input parameter inside `isolate()`. This on the other hand will ensure that the plot is not automatically updated when another input parameter changes.

Here's a worked example:

```r
output$my_plot <- renderPlot({
  input$my_action_button

  x <- isolate(input$x)
  y <- isolate(input$y)
  color <- isolate(input$color)
  facet <- isolate(input$facet)

  ggplot(mtcars) +
    aes_string(x, y, color = color) +
    geom_point() +
    facet_wrap(facet)
})
```

That's it. Not too complicated, isn't it?

To see this in action, have a look at my demo app by running these commands in your `R` console:

```r
required_pkgs <- c("shiny", "ggplot2")
installed_pkgs <- installed.packages()
for (pkg in required_pkgs) {
  if (!pkg %in% installed_pkgs) install.packages(pkg)
}
shiny::runGitHub("shiny-demo-apps", "thomas-neitmann", subdir = "action-button-demo")
```
