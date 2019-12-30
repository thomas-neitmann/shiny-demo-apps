# Creating Dynamic UIs with conditionalPanel()

A great feature of `shiny` is the ability to create a dynamic UI that changes in response to user input.

Imagine the following scenario: You want to enable your app user to create a scatterplot with the option to add facets for the levels of a categorical variable. This can be achieve with a little bit of effort in `ui.R`. First, you need to add a check box to your UI, e.g. `checkboxInput(inputId = "check", label = "Add facet?")`. To display a dropdown menu for selecting the facet variable wrap `selectInput()` inside of `conditionalPanel()`. The first argument of `conditionalPanel()` is a JavaScript expression that must evaluate to a boolean. If this expression evaluates to `TRUE` the UI element inside `conditionalPanel()` is displayed otherwise it's not visible.

Here's a worked example:

```r
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
)
```

The condition `"input.check"` evaluates to `TRUE` if the check box is checked and to `FALSE` if it's not.

To see this in action run my example app by pasting these commands into you `R` console:

```r
required_pkgs <- c("shiny", "ggplot2", "plotly", "shinycustomloader")
installed_pkgs <- installed.packages()
for (pkg in required_pkgs) {
  if (!pkg %in% installed_pkgs) install.packages(pkg)
}
shiny::runGitHub("shiny-demo-apps", "thomas-neitmann", subdir = "conditional-panel-demo")
```
