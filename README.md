## Future Promises with Shiny

Shiny async is a paradigm that offers a way to offload certain classes of long-running operations from the main R thread, such that Shiny apps can remain responsive. This repo covers:

* The new promises packages which increases stability and responsiveness
* How to use promises with Shiny in a way that looks like idiomatic R
* Show how the payoff can be huge if your app has a significant bottleneck

## Getting started

You will need to install the following packages to use Shiny async.

```
install.packages("future")
devtools::install_github("rstudio/promise")
```

You will also need to update your Shiny package to the latest version on Github.

```
devtools::install_github("rstudio/shiny")
```

To reproduce the examples in this repos, you will also need the following packages:

```
install.packages(c("mlbench", "caret", "dplyr", "e1071", "gbm"))
```

## References

Shiny Async is an advanced topic. I recommend that you read through the documentation and watch the video before getting started.

* [Package - promises](https://rstudio.github.io/promises/)
* [Video - rstudio::conf 2019](https://www.rstudio.com/resources/videos/scaling-shiny-apps-with-async-programming/)
