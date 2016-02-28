# Prediction function with Shiny

# Original source sample taken from: Kmeans example  by  Joe Cheng <joe@rstudio.com>
# with modifications by Luis Botero lfboterow@gmail.com 2/26/2016

library(shiny)
# Reads variables from mtcars, excluding mpg, which will have no meaning for this example
lab<-names(mtcars)[2:11]
#ycol<-"mpg"
shinyUI(pageWithSidebar(
  headerPanel('mtcars k-means clustering'),
  sidebarPanel(
    selectInput('xcol', 'X Variable', lab),
    #            selected=names(mtcars)[[2]]),
    sliderInput('clusters', 'Cluster count', 3,
                min = 1, max = 9)
    
  ),
  mainPanel(
    plotOutput('myplot'),
    p('Y = mpg from mtcars'),
    a('http://github.com/lfboterow/shinyapptest.git')
    )
))
