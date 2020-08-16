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
    titlePanel("Job Advertisements by Occupation"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("occ",
                        "Occ:",
                        choices = unique(IVI_sai_1$Title[IVI_sai_1$Level ==2]))
            
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("occplot")
            
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
   
    
    
    
    output$occplot <- renderPlot({
        gr <- grepocc[grepocc$Title == input$occ,"gr"]
        
        d2 <- IVI_sai_1 %>% filter(Level == 3,
                                   date > as.Date("2018-01-01"),
                                   State == "AUST",
                                   grepl(gr,ANZSCO_CODE))
        ggplot(d2,aes(x = date, y = value)) + 
            geom_line(aes(colour = Title),stat="identity") 
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
