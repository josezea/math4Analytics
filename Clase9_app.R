#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)



estaturas <- c(170, 165, 178, 169, 172, 180, 180, 167, 182, 174, 166, 176, 169, 168, 175)
length(estaturas)

prom <- mean(estaturas)
desvest <- sd(estaturas)

set.seed(12345)
est_bog <- rnorm(n = 4000000, mean = prom, sd = desvest)

# hist(est_bog, probability  = T, breaks = 20)
# pnorm(q = 170, mean = prom, sd = desvest)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Jugar con la normal"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("num_clases",
                        "Número de clases del histograma",
                        min = 10,
                        max = 1000,
                        value = 50),
            textInput("valorprobabajo", 
                      "Coloque el valor para el cual quiere calcular
                      la probabilidad acumulada"),
        ),
        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("histEst"),
           textOutput("ProbAcum")
           
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$histEst <- renderPlot({
        hist(est_bog, probability  = T, breaks = input$num_clases)
    })
    
    output$ProbAcum <- renderText({
    paste("La probabilidad de ser menos a", input$valorprobabajo, "es del:",
          round(100*pnorm(q = as.numeric(input$valorprobabajo),
                          mean = prom, sd = desvest), 2), "%")
        })
    
    
    
}

# Run the application 
shinyApp(ui = ui, server = server)
