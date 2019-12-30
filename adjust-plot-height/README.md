# Let Your Users Decided on the Plot Height

When you create a `shiny` app you rarely know the size of the screen on which your users will use the app. It could be a small 12'' laptop or a desktop with a 20'' screen. Thus, the single default value that you can provide for the height of your `plotOutput()` will inevitably be a bad choice for somer users.

How to tackle this issue? A solution is to enable your users to adjust the plot height dynamically. To do so first add a `sliderInput()` to your UI. Make sure to set the post argument to `"px"` as `plotOutput()` expects a string like `"200px"` for its height argument. Next, instead of your usual `plotOutput(inputId = "plot")` place `uiOutput(inputId = "plot_placeholder")` inside `ui.R`.

Now comes the more difficult part. Here's a worked example from my demo app's `server.R` file:

```r
output$plot <- renderPlot({
  ggplot(mtcars) +
    aes_string(input$x, input$y) +
    geom_point() +
    geom_smooth(method = "lm")
})
 
output$plot_placeholder <- renderUI({
  plotOutput("plot", height = input$plot_height)
})
```

As you can see from this example you need to first render your plot and then call `plotOutput()` - which you would usually place in `ui.R` - inside of `renderUI()`. Basically `uiOutput()` in `ui.R` serves as a container for an output you define inside `server.R`.

To see this in action run the following commands in your `R` console:

```r
required_pkgs <- c("shiny", "ggplot2")
installed_pkgs <- installed.packages()
for (pkg in required_pkgs) {
  if (!pkg %in% installed_pkgs) install.packages(pkg)
}
shiny::runGitHub("shiny-demo-apps", "thomas-neitmann", subdir = "adjust-plot-height")
```
