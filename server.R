library(shiny)
library(rsconnect)

shinyServer(function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    mtcars[, c(input$xcol, 'mpg')]
  })
  
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  
  output$myplot <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    # selectedData must be called as a function, otherwise it'll report an error
    # cannot coerce type 'closure' to vector of type 'double', notice on the reactive
    # part it's called selectedData or clusters
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  })
  
})
