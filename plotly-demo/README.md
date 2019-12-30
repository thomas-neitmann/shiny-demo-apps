# Using plotly in Shiny Apps

Shiny is a powerful tool for creating interactive web applications using R.
Combined with ggplot2 you can create visualizations that change based on user inputs.
Yet, even though your app may allow your user to change plots in an interactive way the plot itself is still a static image.

Enter plotly. Plotly is an open-source JavaScript library for creating interactive web graphics.
The R package [plotly](https://plot.ly/r/) provides an awesome function called `ggplotly()` that automatically converts your vanilla ggplots into interactive visualizations.

```r
library(ggplot2)
data(mtcars)
plotly::ggplotly({
  ggplot(mtcars, aes(wt, hp)) +
  geom_point()
})
```

To embed plotly graphics in your Shiny app, in `ui.R` use `plotly::plotlyOutput()` instead of `plotOutput()` and in `server.R` use `plotly::renderPlotly()` instead of `renderPlot()`.

That's it! You have to do nothing more. For minimal effort you get a great improvement of your Shiny app.
Not convinced, yet? Check out my demo app by running this command from within `R`:

```r
pkgs <- c("shiny", "ggplot2", "plotly")
for (pkg in pkgs) {
  if (!pkg %in% installed.packages()) install.packages(pkg)
}
shiny::runGitHub("shiny-demo-apps", "thomas-neitmann", subdir = "plotly-demo")
```
