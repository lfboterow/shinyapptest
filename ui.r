# Prediction function with Shiny

# Original source sample taken from: Kmeans example  by  Joe Cheng <joe@rstudio.com>
# with modifications by Luis Botero lfboterow@gmail.com 2/26/2016

library(shiny)

shinyUI(pageWithSidebar(
  headerPanel('mtcars k-means clustering'),
    sidebarPanel(
    selectInput('xcol', 'X Variable', names(mtcars)),
    selectInput('ycol', 'Y Variable', names(mtcars),
                selected=names(mtcars)[[2]]),
    sliderInput('clusters', 'Cluster count', 3,
                 min = 1, max = 9)
  ),
  mainPanel(
    plotOutput('myplot')
  )
))