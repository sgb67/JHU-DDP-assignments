library(shiny)
library(moments)
shinyServer(function(input, output) {
    output$distPlot <- renderPlot({
        set.seed(125356)
        data <- rnorm(500, mean=input$mu, sd=input$sd)
        h<-hist(data, col = "skyblue", border = "darkgray", 
             main = 'Histogram of random normals', breaks = 20, ylab = "Frequency",
             xlim = c(-6.5, 6.5))
        h
        if(input$showmu){
          abline(v=input$mu, col="darkblue", lwd=3)
        }
        if(input$drawnormal){
          x_val <- seq(min(data), max(data), length = 10000)
          y_val <- dnorm(x_val, mean = input$mu, sd = input$sd) 
          y_val <- y_val * diff(h$mids[1:2]) * length(data) 
          lines(x_val, y_val, lwd = 2.5, col="darkgreen")
        }
        if(input$showci){
          abline(v=qnorm(c(0.025,0.975), mean=input$mu, sd=input$sd), col="red", lwd=2, lty=3)
        }
    })
    output$CI <- renderText(
      round(qnorm(c(0.025,0.975), mean=input$mu, sd=input$sd), 4)
    )
})
