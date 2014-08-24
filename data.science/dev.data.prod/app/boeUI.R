
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Old Faithful Geyser Data"),
  
  # Sidebar with a slider input for number of bins
  sidebarPanel(
    sliderInput("gtco2",
                "GigaTonnes of Fossil Fuels:",
                min = 0,
                max = 12500,
                value = 6100)
    sliderInput("ecs",
                "Equilbrium Climate Sensitivity:",
                min = 0.1,
                max = 9.9,
                value = 3.0),
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("distPlot")
  )
))
