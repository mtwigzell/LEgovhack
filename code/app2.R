#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Industry"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("demo",
                        "Demographic:",
                        choices = unique(abs_flat$desc_level))
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("indplot")

        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    output$indplot <- renderPlot({
        d1 <- abs_flat[abs_flat$desc_level == input$demo,]
        ggplot(d1,aes(x=industry, y = jobs_COVID)) +
            geom_bar(aes(fill = industry),stat="identity") +
            facet_grid(desc ~.)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
