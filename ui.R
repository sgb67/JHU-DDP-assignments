library(shiny)
shinyUI(fluidPage(
    titlePanel("Exploring a custom-made normal distribution"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("mu",
                        "Enter the mean:",
                        min = -5,
                        max = 5,
                        value = 0),
            sliderInput("sd",
                        "Enter the standard deviation:",
                        min = 0.1,
                        max = 2,
                        value = 1),
            checkboxInput("showmu", "Plot mean", value = TRUE),
            checkboxInput("drawnormal", "Plot probability density curve", value = FALSE),
            checkboxInput("showci", "Plot 95% confidence interval", value = FALSE)
        ),
        mainPanel(
            plotOutput("distPlot"),
            h3("95% Confidence Interval:"),
            textOutput("CI")
        )
    )
))
