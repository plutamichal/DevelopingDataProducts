library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Bundesliga home goals scored by team"),
  
  # Sidebar with a multiple select input for team name 
  sidebarLayout(
    sidebarPanel(
      selectInput("Team", label=h4("Select Teams (multiple choice):"),
                  c("Bayern Munchen" = "Bayern Munchen",
                    "Hertha BSC" = "Hertha BSC",
                    "1. FC Koln" = "1. FC Koln",
                    "FC Schalke 04"= "FC Schalke 04"),
                  multiple = TRUE,
                  selected = c("Bayern Munchen", "FC Schalke 04")),
      sliderInput("dateRange", label = h4("Select Seasons"), min = as.Date("1980", "%Y"), 
                  max =as.Date("2015","%Y") ,
                  value = c(as.Date("2005","%Y"), 
                            as.Date("2010","%Y")), timeFormat = "%Y")
    ),
    # Show a plot
    mainPanel(
      plotlyOutput("plot")
    )
  )
))
