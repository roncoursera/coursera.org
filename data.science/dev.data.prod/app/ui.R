
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

# shinyUI(pageWithSidebar(
shinyUI(fluidPage(
    
  tags$head(
    # tags$link(rel = "stylesheet", type = "text/css", href = "boe.css")
  ),
  
  # Application title
  headerPanel("Climate Outcomes"),
  
  # Sidebar with a slider input for number of bins
  sidebarPanel(
    sliderInput("oil.proved",
                "Proven Oil in Billions of Barrels:",
                min = 0,
                max = 2000,
                value = 1700),
    sliderInput("oil.undiscovered",
                "Undiscovered Oil in Billions of Barrels:",
                min = 250,
                max = 2000,
                value = 1100),
    sliderInput("oil.consumed",
                "Percentage of Oil Consumed",
                format="#%",
                min = 0.0,
                max = 1.,
                value = 1.0),
    sliderInput("gas.proved",
                "Proven Natural Gas in Trillions of Cubic Meters:",
                min = 0,
                max = 350,
                value = 185),
    sliderInput("gas.undiscovered",
                "Undiscovered Natural Gas in Trillions of Cubic Meters:",
                min = 55,
                max = 350,
                value = 200),
    sliderInput("gas.consumed",
                "Percentage of Natural Gas Consumed",
                format="#%",
                min = 0.0,
                max = 1.,
                value = 1.0),
    sliderInput("coal.proved",
                "Proven Coal in Millions of Tonnes",
                min = 0,
                max = 3600000,
                value = 900000),
    sliderInput("coal.undiscovered",
                "Undiscovered Coal in Millions of Tonne:",
                min = 0,
                max = 3600000,
                value = 1800000),
    sliderInput("coal.consumed",
                "Percentage of Coal Consumed",
                format="#%",
                min = 0.0,
                max = 1.,
                value = 1.0),
    sliderInput("ocean.absorption",
                "Percentage of CO2 absorbed by Oceans",
                format="#%",
                min = 0.0,
                max = 1.,
                value = .50),
    sliderInput("ecs",
                "Equilbrium Climate Sensitivity:",
                min = 0.0,
                max = 10.0,
                value = 3.0)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    tabsetPanel(
      tabPanel("Plot",plotOutput("plot2"),
        helpText("In the left hand panel, you will find multiple slide controls."),
        helpText("These can be used to set various inputs into a temperature response model."),
        helpText("Key among these are the amount of oil, natural gas, and coal yet to be discovered,"),
        helpText("and the percentage of the proven and yet-to-be discovered fuels that will be consumed."),
        helpText("Roughly 50% of the CO2 emissions are absorbed by the ocean. You can modify this if you like."),
        helpText("The long-term Equilibrium Climate Sensitivity is estimated to be between 1.5 and 4.5 C per doubling of CO2."),
        helpText("The ECS, too, can be modified")),
  tabPanel("Sources",plotOutput("noPlot"))
      #plotOutput("distPlot2")
    )
  )

))
