
library(shiny)
library(engsoccerdata)
library(plotly)
library(dplyr)

# Define server logic required to draw a plot
shinyServer(function(input, output) {
   
  output$plot <- renderPlotly({
    
    # generate data from ui.R parameters
    ds_germany = as.data.frame(germany)
    test = ds_germany %>% 
      select(Season,home, hgoal) %>% 
      filter(as.Date(as.character(Season), "%Y") >=  input$dateRange[1] &
               as.Date(as.character(Season), "%Y") <=  input$dateRange[2]  &  
               home %in% input$Team) %>% 
      group_by(home, Season) %>% 
      summarize(SumOfHomeGoals=sum(hgoal))
      
    
    p <- plot_ly(test, x = ~Season, y = ~SumOfHomeGoals, color = ~home, 
                 type = 'scatter', mode = 'lines') 
    p
    
  })
  
})
