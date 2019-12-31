# pickerInput() vs. selectInput()

The default method for adding a dropdown menu to your `R` `shiny` app is to use the `selectInput()` function. But if you want to upgrade your UI I'd highly suggest you use the `pickerInput()` function from the `shinyWidgets` package.

If you use the default settings of `pickerInput()` you won't see much of a difference between the two. The power of this function lies in its `options` argument. For this demo app I used the following `options`:

```r
options = pickerOptions(
  liveSearch = TRUE,
  actionsBox = TRUE,
  size = 10
)
```

The `liveSearch` option adds a search field to the drop down menu that makes it obvious to the user that you can search the inputs (unlike `selectInput()`: you can search but I think it's not obvious at all). The `actionsBox` option adds the Select All and Deselect All buttons which are super handy if you have a long list of possible selections. Finally, the `size` argument allows you to limit the number of values you can see before you need to scroll down.

As with so many things in `shiny` for a bit of effort you can get a great improvement in your UI. For me, `pickerInput()` is the default by now.

To see `pickerInput()` in action have a look at my demo app by running the following commands in your `R` console:

```r
required_pkgs <- c("shiny", "shinyWidgets")
installed_pkgs <- installed.packages()
for (pkg in required_pkgs) {
  if (!pkg %in% installed_pkgs) install.packages(pkg)
}
shiny::runGitHub("shiny-demo-apps", "thomas-neitmann", subdir = "picker-input-demo")
```
